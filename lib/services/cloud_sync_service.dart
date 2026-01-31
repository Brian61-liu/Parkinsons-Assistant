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

  /// 获取当前用户 ID
  String? get _userId => _auth.currentUser?.uid;

  /// 检查用户是否已登录
  bool get isUserLoggedIn => _userId != null;

  // ========== 震颤测试记录同步 ==========

  /// 上传震颤测试记录到云端
  Future<void> syncTremorRecordToCloud(TremorRecord record) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过云端同步');
      return;
    }

    try {
      final recordData = {
        'timestamp': Timestamp.fromDate(record.timestamp),
        'averageFrequency': record.averageFrequency,
        'maxAmplitude': record.maxAmplitude,
        'averageAmplitude': record.averageAmplitude,
        'duration': record.duration,
        'accelerometerData': record.accelerometerData,
        'syncedAt': FieldValue.serverTimestamp(),
        'localId': record.id, // 保存本地 ID 用于关联
      };

      // 使用时间戳作为文档 ID，确保唯一性
      final docId = record.timestamp.toIso8601String();
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('tremor_records')
          .doc(docId)
          .set(recordData, SetOptions(merge: true));

      debugPrint('震颤测试记录已同步到云端: $docId');
    } catch (e) {
      debugPrint('同步震颤测试记录失败: $e');
      // 不抛出异常，允许本地存储继续工作
    }
  }

  /// 从云端获取所有震颤测试记录
  Future<List<TremorRecord>> getTremorRecordsFromCloud() async {
    if (!isUserLoggedIn) {
      return [];
    }

    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('tremor_records')
          .orderBy('timestamp', descending: true)
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        return TremorRecord(
          id: data['localId'] as int?,
          timestamp: (data['timestamp'] as Timestamp).toDate(),
          averageFrequency: data['averageFrequency'] as double,
          maxAmplitude: data['maxAmplitude'] as double,
          averageAmplitude: data['averageAmplitude'] as double,
          duration: data['duration'] as int,
          accelerometerData: (data['accelerometerData'] as List)
              .map((e) => (e as num).toDouble())
              .toList(),
        );
      }).toList();
    } catch (e) {
      debugPrint('从云端获取震颤测试记录失败: $e');
      return [];
    }
  }

  /// 删除云端震颤测试记录
  Future<void> deleteTremorRecordFromCloud(DateTime timestamp) async {
    if (!isUserLoggedIn) return;

    try {
      final docId = timestamp.toIso8601String();
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('tremor_records')
          .doc(docId)
          .delete();

      debugPrint('云端震颤测试记录已删除: $docId');
    } catch (e) {
      debugPrint('删除云端震颤测试记录失败: $e');
    }
  }

  // ========== 肢体动作训练记录同步 ==========

  /// 上传肢体动作训练记录到云端
  Future<void> syncMovementTrainingRecordToCloud(
      MovementTrainingRecord record) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过云端同步');
      return;
    }

    try {
      final recordData = {
        'timestamp': Timestamp.fromDate(record.timestamp),
        'duration': record.duration,
        'successCount': record.successCount,
        'targetCount': record.targetCount,
        'goalReached': record.goalReached,
        'syncedAt': FieldValue.serverTimestamp(),
        'localId': record.id, // 保存本地 ID 用于关联
      };

      // 使用时间戳作为文档 ID，确保唯一性
      final docId = record.timestamp.toIso8601String();
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('movement_training_records')
          .doc(docId)
          .set(recordData, SetOptions(merge: true));

      debugPrint('肢体动作训练记录已同步到云端: $docId');
    } catch (e) {
      debugPrint('同步肢体动作训练记录失败: $e');
      // 不抛出异常，允许本地存储继续工作
    }
  }

  /// 从云端获取所有肢体动作训练记录
  Future<List<MovementTrainingRecord>> getMovementTrainingRecordsFromCloud() async {
    if (!isUserLoggedIn) {
      return [];
    }

    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(_userId)
          .collection('movement_training_records')
          .orderBy('timestamp', descending: true)
          .get();

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
    } catch (e) {
      debugPrint('从云端获取肢体动作训练记录失败: $e');
      return [];
    }
  }

  /// 删除云端肢体动作训练记录
  Future<void> deleteMovementTrainingRecordFromCloud(DateTime timestamp) async {
    if (!isUserLoggedIn) return;

    try {
      final docId = timestamp.toIso8601String();
      await _firestore
          .collection('users')
          .doc(_userId)
          .collection('movement_training_records')
          .doc(docId)
          .delete();

      debugPrint('云端肢体动作训练记录已删除: $docId');
    } catch (e) {
      debugPrint('删除云端肢体动作训练记录失败: $e');
    }
  }

  // ========== 批量同步操作 ==========

  /// 同步所有本地数据到云端
  Future<void> syncAllDataToCloud({
    required List<TremorRecord> tremorRecords,
    required List<MovementTrainingRecord> movementRecords,
  }) async {
    if (!isUserLoggedIn) {
      debugPrint('用户未登录，跳过批量同步');
      return;
    }

    debugPrint('开始批量同步数据到云端...');
    
    // 同步震颤测试记录
    for (final record in tremorRecords) {
      await syncTremorRecordToCloud(record);
    }

    // 同步肢体动作训练记录
    for (final record in movementRecords) {
      await syncMovementTrainingRecordToCloud(record);
    }

    debugPrint('批量同步完成');
  }

  /// 从云端拉取所有数据并合并到本地
  Future<Map<String, List>> pullAllDataFromCloud() async {
    if (!isUserLoggedIn) {
      return {'tremorRecords': [], 'movementRecords': []};
    }

    try {
      final tremorRecords = await getTremorRecordsFromCloud();
      final movementRecords = await getMovementTrainingRecordsFromCloud();

      return {
        'tremorRecords': tremorRecords,
        'movementRecords': movementRecords,
      };
    } catch (e) {
      debugPrint('从云端拉取数据失败: $e');
      return {'tremorRecords': [], 'movementRecords': []};
    }
  }
}
