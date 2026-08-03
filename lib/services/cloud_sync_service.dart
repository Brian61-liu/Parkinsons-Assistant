import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/tremor_record.dart';
import '../models/movement_training_record.dart';

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
  static double _clampFinite(double value, double min, double max) {
    if (value.isNaN || value.isInfinite) return min;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  /// Firestore 拒绝 NaN/Infinity；清掉非法采样点。
  static List<double> _sanitizeAccelerometerData(List<double> raw) {
    return [
      for (final v in raw)
        if (v.isFinite) v,
    ];
  }

  /// Firestore / Console 对文档 ID 中的 `:` 不友好（ISO8601 会踩坑）。
  static String recordDocId(DateTime timestamp) =>
      't_${timestamp.toUtc().millisecondsSinceEpoch}';

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
      final frequency = _clampFinite(rawFreq, 0, 30);
      final maxAmplitude = _clampFinite(rawMaxAmp, 0, 100);
      final averageAmplitude = _clampFinite(rawAvgAmp, 0, 100);
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

      final accelerometerData = _sanitizeAccelerometerData(
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

  // ========== 批量同步操作 ==========

  /// 同步所有本地数据到云端。任一条失败则抛出 [StateError]。
  Future<void> syncAllDataToCloud({
    required List<TremorRecord> tremorRecords,
    required List<MovementTrainingRecord> movementRecords,
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

    final uid = _userId;
    if (uid != null) {
      await _logServerCollectionDocIds(uid: uid, collectionId: 'tremor_records');
      await _logServerCollectionDocIds(
        uid: uid,
        collectionId: 'movement_training_records',
      );
    }

    if (failed > 0) {
      throw StateError('有 $failed 条记录未能同步到云端');
    }

    debugPrint('批量同步完成');
  }

  /// 从云端拉取所有数据（失败时抛出）。
  Future<Map<String, List>> pullAllDataFromCloud() async {
    if (!isUserLoggedIn) {
      return {'tremorRecords': [], 'movementRecords': []};
    }

    final tremorRecords = await getTremorRecordsFromCloud();
    final movementRecords = await getMovementTrainingRecordsFromCloud();

    return {
      'tremorRecords': tremorRecords,
      'movementRecords': movementRecords,
    };
  }
}
