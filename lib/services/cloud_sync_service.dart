import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/tremor_record.dart';
import '../models/movement_training_record.dart';
import '../models/medication_reminder.dart';
import '../models/medication_check_in.dart';

/// 云端同步服务
/// 负责将本地数据同步到 Firestore，并支持跨设备数据同步
class CloudSyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 单次网络操作上限（断网/飞行模式时避免永久挂起）。
  static const Duration networkTimeout = Duration(seconds: 20);

  /// 获取当前用户 ID
  String? get _userId => _auth.currentUser?.uid;

  /// 检查用户是否已登录
  bool get isUserLoggedIn => _userId != null;

  /// 钳制到 Firestore rules 允许范围，避免峰值噪声导致 permission-denied。
  @visibleForTesting
  static double clampFinite(double value, double min, double max) {
    if (value.isNaN || value.isInfinite) return min;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  /// Firestore 拒绝 NaN/Infinity；清掉非法采样点。
  @visibleForTesting
  static List<double> sanitizeAccelerometerData(List<double> raw) {
    return [
      for (final v in raw)
        if (v.isFinite) v,
    ];
  }

  /// Firestore / Console 对文档 ID 中的 `:` 不友好（ISO8601 会踩坑）。
  static String recordDocId(DateTime timestamp) =>
      't_${timestamp.toUtc().millisecondsSinceEpoch}';

  /// 用药提醒跨设备稳定 ID（本地 SQLite + Firestore doc id）。
  static String newMedicationCloudId() {
    final r = Random.secure();
    final bytes = List<int>.generate(16, (_) => r.nextInt(256));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  /// 用药打卡文档 ID（避免 `:`）。
  @visibleForTesting
  static String medicationCheckInDocId({
    required String reminderCloudId,
    required String scheduledDate,
    required String scheduledTime,
  }) {
    final timeKey = scheduledTime.replaceAll(':', '');
    return '${reminderCloudId}_${scheduledDate}_$timeKey';
  }

  /// 确保写入到达服务端（避免离线缓存「假成功」）。
  /// 整体限时，防止飞行模式下 enableNetwork / set / get 永久挂起。
  Future<void> _commitToServer({
    required DocumentReference<Map<String, dynamic>> docRef,
    required Map<String, dynamic> data,
    required String label,
  }) async {
    try {
      await Future(() async {
        await _firestore.enableNetwork();
        await docRef.set(data, SetOptions(merge: true));
        await _firestore.waitForPendingWrites();

        final snap = await docRef.get(const GetOptions(source: Source.server));
        if (!snap.exists) {
          throw StateError('服务端回读不到文档: ${docRef.path}');
        }
        debugPrint('$label（已确认服务端）: ${docRef.path}');
      }).timeout(networkTimeout);
    } on TimeoutException {
      throw TimeoutException(
        '同步超时（可能离线）: ${docRef.path}',
        networkTimeout,
      );
    }
  }

  /// 从服务端列出子集合文档 ID，便于对照 Console。
  Future<void> _logServerCollectionDocIds({
    required String uid,
    required String collectionId,
  }) async {
    try {
      final snap = await _firestore
          .collection('users')
          .doc(uid)
          .collection(collectionId)
          .limit(20)
          .get(const GetOptions(source: Source.server))
          .timeout(networkTimeout);
      final ids = snap.docs.map((d) => d.id).join(', ');
      debugPrint(
        '服务端 $collectionId 共 ${snap.docs.length} 条'
        '${ids.isEmpty ? '' : ': $ids'}',
      );
    } catch (e) {
      debugPrint('列出服务端 $collectionId 失败: $e');
    }
  }

  // ========== 震颤测试记录同步 ==========

  /// 上传震颤测试记录到云端。
  /// 返回 `true` 表示成功或主动跳过；`false` 表示网络/权限等失败。
  Future<bool> syncTremorRecordToCloud(TremorRecord record) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过云端同步');
      return true;
    }

    final localId = record.id;
    if (localId == null) {
      debugPrint('同步震颤测试记录跳过: localId 为空');
      return true;
    }

    final uid = _userId!;
    try {
      final rawFreq = record.averageFrequency;
      final rawMaxAmp = record.maxAmplitude;
      final rawAvgAmp = record.averageAmplitude;
      // 与当前线上 rules 兼容（frequency≤30、amplitude≤100）
      final frequency = clampFinite(rawFreq, 0, 30);
      final maxAmplitude = clampFinite(rawMaxAmp, 0, 100);
      final averageAmplitude = clampFinite(rawAvgAmp, 0, 100);
      if (frequency != rawFreq ||
          maxAmplitude != rawMaxAmp ||
          averageAmplitude != rawAvgAmp) {
        debugPrint(
          '震颤同步数值已钳制: '
          'freq $rawFreq→$frequency, '
          'maxAmp $rawMaxAmp→$maxAmplitude, '
          'avgAmp $rawAvgAmp→$averageAmplitude',
        );
      }

      final accelerometerData = sanitizeAccelerometerData(
        record.accelerometerData,
      );
      if (accelerometerData.isEmpty) {
        debugPrint('同步震颤测试记录跳过: accelerometerData 为空/非法');
        return true;
      }

      final recordData = {
        'timestamp': Timestamp.fromDate(record.timestamp),
        'averageFrequency': frequency,
        'maxAmplitude': maxAmplitude,
        'averageAmplitude': averageAmplitude,
        'duration': record.duration,
        'accelerometerData': accelerometerData,
        'syncedAt': FieldValue.serverTimestamp(),
        'localId': localId,
      };

      final docId = recordDocId(record.timestamp);
      final docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('tremor_records')
          .doc(docId);

      debugPrint('准备同步震颤: uid=$uid docId=$docId points=${accelerometerData.length}');
      await _commitToServer(
        docRef: docRef,
        data: recordData,
        label: '震颤测试记录已同步到云端',
      );
      return true;
    } catch (e) {
      debugPrint('同步震颤测试记录失败 (uid=$uid): $e');
      // 不抛出：本地存储仍可用；调用方根据 false 展示失败状态。
      return false;
    }
  }

  /// 从云端获取所有震颤测试记录（失败时抛出，便于上层展示）。
  Future<List<TremorRecord>> getTremorRecordsFromCloud() async {
    if (!isUserLoggedIn) {
      return [];
    }

    // Source.server：离线时尽快失败，避免默认 get 在无网时长时间挂起。
    final snapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('tremor_records')
        .orderBy('timestamp', descending: true)
        .get(const GetOptions(source: Source.server))
        .timeout(networkTimeout);

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return TremorRecord(
        id: data['localId'] as int?,
        timestamp: (data['timestamp'] as Timestamp).toDate(),
        averageFrequency: (data['averageFrequency'] as num).toDouble(),
        maxAmplitude: (data['maxAmplitude'] as num).toDouble(),
        averageAmplitude: (data['averageAmplitude'] as num).toDouble(),
        duration: data['duration'] as int,
        accelerometerData: (data['accelerometerData'] as List)
            .map((e) => (e as num).toDouble())
            .toList(),
      );
    }).toList();
  }

  /// 删除云端震颤测试记录
  Future<void> deleteTremorRecordFromCloud(DateTime timestamp) async {
    if (!isUserLoggedIn) return;

    try {
      final docId = recordDocId(timestamp);
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('tremor_records')
          .doc(docId)
          .delete();
      await _firestore.waitForPendingWrites().timeout(
        const Duration(seconds: 15),
      );

      debugPrint('云端震颤测试记录已删除: $docId');
    } catch (e) {
      debugPrint('删除云端震颤测试记录失败: $e');
    }
  }

  // ========== 肢体动作训练记录同步 ==========

  /// 上传肢体动作训练记录到云端。
  /// 返回 `true` 表示成功或主动跳过；`false` 表示失败。
  Future<bool> syncMovementTrainingRecordToCloud(
    MovementTrainingRecord record,
  ) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过云端同步');
      return true;
    }

    final localId = record.id;
    if (localId == null) {
      debugPrint('同步肢体动作训练记录跳过: localId 为空');
      return true;
    }

    final uid = _userId!;
    try {
      final recordData = {
        'timestamp': Timestamp.fromDate(record.timestamp),
        'duration': record.duration,
        'successCount': record.successCount,
        'targetCount': record.targetCount,
        'goalReached': record.goalReached,
        'syncedAt': FieldValue.serverTimestamp(),
        'localId': localId,
      };

      final docId = recordDocId(record.timestamp);
      final docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('movement_training_records')
          .doc(docId);

      await _commitToServer(
        docRef: docRef,
        data: recordData,
        label: '肢体动作训练记录已同步到云端',
      );
      return true;
    } catch (e) {
      debugPrint('同步肢体动作训练记录失败 (uid=$uid): $e');
      return false;
    }
  }

  /// 从云端获取所有肢体动作训练记录（失败时抛出）。
  Future<List<MovementTrainingRecord>>
  getMovementTrainingRecordsFromCloud() async {
    if (!isUserLoggedIn) {
      return [];
    }

    final snapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('movement_training_records')
        .orderBy('timestamp', descending: true)
        .get(const GetOptions(source: Source.server))
        .timeout(networkTimeout);

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return MovementTrainingRecord(
        id: data['localId'] as int?,
        timestamp: (data['timestamp'] as Timestamp).toDate(),
        duration: data['duration'] as int,
        successCount: data['successCount'] as int,
        targetCount: data['targetCount'] as int,
        goalReached: data['goalReached'] as bool,
      );
    }).toList();
  }

  /// 删除云端肢体动作训练记录
  Future<void> deleteMovementTrainingRecordFromCloud(DateTime timestamp) async {
    if (!isUserLoggedIn) return;

    try {
      final docId = recordDocId(timestamp);
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('movement_training_records')
          .doc(docId)
          .delete();
      await _firestore.waitForPendingWrites().timeout(
        const Duration(seconds: 15),
      );

      debugPrint('云端肢体动作训练记录已删除: $docId');
    } catch (e) {
      debugPrint('删除云端肢体动作训练记录失败: $e');
    }
  }

  // ========== 用药清单同步 ==========

  Future<bool> syncMedicationReminderToCloud(MedicationReminder reminder) async {
    if (!isUserLoggedIn) return true;
    final cloudId = reminder.cloudId;
    if (cloudId == null || cloudId.isEmpty) {
      debugPrint('同步用药提醒跳过: cloudId 为空');
      return true;
    }

    final uid = _userId!;
    try {
      final label = reminder.label.length > MedicationReminder.maxLabelLength
          ? reminder.label.substring(0, MedicationReminder.maxLabelLength)
          : reminder.label;
      final data = <String, dynamic>{
        'cloudId': cloudId,
        'label': label,
        'timeHhmm': reminder.timeHhmm,
        'enabled': reminder.enabled,
        'sortOrder': reminder.sortOrder,
        'createdAt': reminder.createdAt.toIso8601String(),
        'syncedAt': FieldValue.serverTimestamp(),
        if (reminder.id != null) 'localId': reminder.id,
      };
      final docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('medication_reminders')
          .doc(cloudId);
      await _commitToServer(
        docRef: docRef,
        data: data,
        label: '用药提醒已同步到云端',
      );
      return true;
    } catch (e) {
      debugPrint('同步用药提醒失败 (uid=$uid): $e');
      return false;
    }
  }

  Future<void> deleteMedicationReminderFromCloud(String cloudId) async {
    if (!isUserLoggedIn || cloudId.isEmpty) return;
    try {
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('medication_reminders')
          .doc(cloudId)
          .delete();
      await _firestore.waitForPendingWrites().timeout(
        const Duration(seconds: 15),
      );
      debugPrint('云端用药提醒已删除: $cloudId');
    } catch (e) {
      debugPrint('删除云端用药提醒失败: $e');
    }
  }

  Future<bool> syncMedicationCheckInToCloud({
    required String reminderCloudId,
    required String scheduledDate,
    required String scheduledTime,
    required DateTime checkedAt,
    String status = 'taken',
  }) async {
    if (!isUserLoggedIn) return true;
    final uid = _userId!;
    try {
      final docId = medicationCheckInDocId(
        reminderCloudId: reminderCloudId,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
      );
      final data = <String, dynamic>{
        'reminderCloudId': reminderCloudId,
        'scheduledDate': scheduledDate,
        'scheduledTime': scheduledTime,
        'checkedAt': checkedAt.toIso8601String(),
        'status': status,
        'syncedAt': FieldValue.serverTimestamp(),
      };
      final docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('medication_check_ins')
          .doc(docId);
      await _commitToServer(
        docRef: docRef,
        data: data,
        label: '用药打卡已同步到云端',
      );
      return true;
    } catch (e) {
      debugPrint('同步用药打卡失败 (uid=$uid): $e');
      return false;
    }
  }

  Future<void> deleteMedicationCheckInFromCloud({
    required String reminderCloudId,
    required String scheduledDate,
    required String scheduledTime,
  }) async {
    if (!isUserLoggedIn) return;
    try {
      final docId = medicationCheckInDocId(
        reminderCloudId: reminderCloudId,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
      );
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('medication_check_ins')
          .doc(docId)
          .delete();
      await _firestore.waitForPendingWrites().timeout(
        const Duration(seconds: 15),
      );
    } catch (e) {
      debugPrint('删除云端用药打卡失败: $e');
    }
  }

  Future<bool> syncMedicationSettingsToCloud(Map<String, dynamic> settings) async {
    if (!isUserLoggedIn) return true;
    final uid = _userId!;
    try {
      final data = <String, dynamic>{
        'featureEnabled': settings['featureEnabled'] == true,
        if (settings['disclaimerAcceptedAt'] is String)
          'disclaimerAcceptedAt': settings['disclaimerAcceptedAt'],
        'syncedAt': FieldValue.serverTimestamp(),
      };
      final docRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('settings')
          .doc('medication');
      await _commitToServer(
        docRef: docRef,
        data: data,
        label: '用药设置已同步到云端',
      );
      return true;
    } catch (e) {
      debugPrint('同步用药设置失败 (uid=$uid): $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> getMedicationSettingsFromCloud() async {
    if (!isUserLoggedIn) return null;
    try {
      final snap = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('settings')
          .doc('medication')
          .get(const GetOptions(source: Source.server))
          .timeout(networkTimeout);
      if (!snap.exists) return null;
      return snap.data();
    } catch (e) {
      debugPrint('拉取用药设置失败: $e');
      rethrow;
    }
  }

  Future<List<MedicationReminder>> getMedicationRemindersFromCloud() async {
    if (!isUserLoggedIn) return [];
    final snapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('medication_reminders')
        .get(const GetOptions(source: Source.server))
        .timeout(networkTimeout);

    return snapshot.docs.map((doc) {
      final data = doc.data();
      final createdRaw = data['createdAt'];
      DateTime createdAt;
      if (createdRaw is Timestamp) {
        createdAt = createdRaw.toDate();
      } else if (createdRaw is String) {
        createdAt = DateTime.parse(createdRaw);
      } else {
        createdAt = DateTime.now();
      }
      return MedicationReminder(
        cloudId: (data['cloudId'] as String?) ?? doc.id,
        label: data['label'] as String? ?? '',
        timeHhmm: data['timeHhmm'] as String? ?? '08:00',
        enabled: data['enabled'] as bool? ?? true,
        sortOrder: (data['sortOrder'] as num?)?.toInt() ?? 0,
        createdAt: createdAt,
      );
    }).toList();
  }

  Future<List<MedicationCheckInCloud>> getMedicationCheckInsFromCloud() async {
    if (!isUserLoggedIn) return [];
    final snapshot = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('medication_check_ins')
        .get(const GetOptions(source: Source.server))
        .timeout(networkTimeout);

    return snapshot.docs.map((doc) {
      final data = doc.data();
      final checkedRaw = data['checkedAt'];
      DateTime checkedAt;
      if (checkedRaw is Timestamp) {
        checkedAt = checkedRaw.toDate();
      } else if (checkedRaw is String) {
        checkedAt = DateTime.parse(checkedRaw);
      } else {
        checkedAt = DateTime.now();
      }
      return MedicationCheckInCloud(
        reminderCloudId: data['reminderCloudId'] as String? ?? '',
        scheduledDate: data['scheduledDate'] as String? ?? '',
        scheduledTime: data['scheduledTime'] as String? ?? '',
        checkedAt: checkedAt,
        status: data['status'] as String? ?? 'taken',
      );
    }).toList();
  }

  Future<void> deleteAllMedicationDataFromCloud() async {
    if (!isUserLoggedIn) return;
    final uid = _userId!;
    try {
      await _deleteCollectionDocs(
        _firestore.collection('users').doc(uid).collection('medication_reminders'),
      );
      await _deleteCollectionDocs(
        _firestore.collection('users').doc(uid).collection('medication_check_ins'),
      );
      await syncMedicationSettingsToCloud({
        'featureEnabled': false,
      });
    } catch (e) {
      debugPrint('清空云端用药数据失败: $e');
    }
  }

  Future<void> _deleteCollectionDocs(
    CollectionReference<Map<String, dynamic>> col,
  ) async {
    const batchSize = 400;
    QuerySnapshot<Map<String, dynamic>> snapshot;
    do {
      snapshot = await col.limit(batchSize).get();
      if (snapshot.docs.isEmpty) break;
      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
    } while (snapshot.docs.length == batchSize);
  }

  // ========== 批量同步操作 ==========

  /// 同步所有本地数据到云端。任一条失败则抛出 [StateError]。
  Future<void> syncAllDataToCloud({
    required List<TremorRecord> tremorRecords,
    required List<MovementTrainingRecord> movementRecords,
    List<MedicationReminder> medicationReminders = const [],
    List<MedicationCheckIn> medicationCheckIns = const [],
    Map<String, dynamic>? medicationSettings,
  }) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过批量同步');
      return;
    }

    debugPrint('开始批量同步数据到云端... uid=$_userId');

    var failed = 0;
    for (final record in tremorRecords) {
      if (!await syncTremorRecordToCloud(record)) failed++;
    }

    for (final record in movementRecords) {
      if (!await syncMovementTrainingRecordToCloud(record)) failed++;
    }

    final reminderByLocalId = <int, MedicationReminder>{};
    for (final reminder in medicationReminders) {
      if (!await syncMedicationReminderToCloud(reminder)) failed++;
      if (reminder.id != null) {
        reminderByLocalId[reminder.id!] = reminder;
      }
    }

    for (final checkIn in medicationCheckIns) {
      final reminder = reminderByLocalId[checkIn.reminderId];
      final cloudId = reminder?.cloudId;
      if (cloudId == null || cloudId.isEmpty) continue;
      if (!await syncMedicationCheckInToCloud(
        reminderCloudId: cloudId,
        scheduledDate: checkIn.scheduledDate,
        scheduledTime: checkIn.scheduledTime,
        checkedAt: checkIn.checkedAt,
        status: checkIn.status,
      )) {
        failed++;
      }
    }

    if (medicationSettings != null) {
      if (!await syncMedicationSettingsToCloud(medicationSettings)) failed++;
    }

    final uid = _userId;
    if (uid != null) {
      await _logServerCollectionDocIds(uid: uid, collectionId: 'tremor_records');
      await _logServerCollectionDocIds(
        uid: uid,
        collectionId: 'movement_training_records',
      );
      await _logServerCollectionDocIds(
        uid: uid,
        collectionId: 'medication_reminders',
      );
      await _logServerCollectionDocIds(
        uid: uid,
        collectionId: 'medication_check_ins',
      );
    }

    if (failed > 0) {
      throw StateError('有 $failed 条记录未能同步到云端');
    }

    debugPrint('批量同步完成');
  }

  /// 从云端拉取所有数据（失败时抛出）。
  Future<Map<String, dynamic>> pullAllDataFromCloud() async {
    if (!isUserLoggedIn) {
      return {
        'tremorRecords': <TremorRecord>[],
        'movementRecords': <MovementTrainingRecord>[],
        'medicationReminders': <MedicationReminder>[],
        'medicationCheckIns': <MedicationCheckInCloud>[],
        'medicationSettings': null,
      };
    }

    final tremorRecords = await getTremorRecordsFromCloud();
    final movementRecords = await getMovementTrainingRecordsFromCloud();
    final medicationReminders = await getMedicationRemindersFromCloud();
    final medicationCheckIns = await getMedicationCheckInsFromCloud();
    final medicationSettings = await getMedicationSettingsFromCloud();

    return {
      'tremorRecords': tremorRecords,
      'movementRecords': movementRecords,
      'medicationReminders': medicationReminders,
      'medicationCheckIns': medicationCheckIns,
      'medicationSettings': medicationSettings,
    };
  }
}
