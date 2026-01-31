import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tremor_record.dart';
import '../models/movement_training_record.dart';
import 'cloud_sync_service.dart';

// 数据库服务类
class DatabaseService {
  static Database? _database;
  static const String _dbName = 'parkinson_rehab.db';
  static const int _dbVersion = 3; // 更新版本号以支持训练类型字段
  
  final CloudSyncService _cloudSyncService = CloudSyncService();

  // 获取数据库实例（单例模式）
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // 初始化数据库
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // 创建表
  Future<void> _onCreate(Database db, int version) async {
    // 震颤测试记录表
    await db.execute('''
      CREATE TABLE tremor_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        averageFrequency REAL NOT NULL,
        maxAmplitude REAL NOT NULL,
        averageAmplitude REAL NOT NULL,
        duration INTEGER NOT NULL,
        accelerometerData TEXT NOT NULL
      )
    ''');
    
    // 肢体动作训练记录表
    await db.execute('''
      CREATE TABLE movement_training_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        duration INTEGER NOT NULL,
        successCount INTEGER NOT NULL,
        targetCount INTEGER NOT NULL,
        goalReached INTEGER NOT NULL,
        trainingType INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // 数据库升级
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // 添加肢体动作训练记录表
      await db.execute('''
        CREATE TABLE movement_training_records (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          timestamp TEXT NOT NULL,
          duration INTEGER NOT NULL,
          successCount INTEGER NOT NULL,
          targetCount INTEGER NOT NULL,
          goalReached INTEGER NOT NULL,
          trainingType INTEGER NOT NULL DEFAULT 0
        )
      ''');
    }
    if (oldVersion < 3) {
      // 添加训练类型字段（兼容旧数据，默认为0=举手运动）
      try {
        await db.execute('''
          ALTER TABLE movement_training_records 
          ADD COLUMN trainingType INTEGER NOT NULL DEFAULT 0
        ''');
      } catch (e) {
        // 如果字段已存在，忽略错误
        debugPrint('添加训练类型字段时出错（可能已存在）: $e');
      }
    }
  }

  // ========== 震颤测试记录操作 ==========

  // 插入震颤测试记录（同时同步到云端）
  Future<int> insertTremorRecord(TremorRecord record) async {
    final db = await database;
    final localId = await db.insert('tremor_records', record.toMap());
    
    // 同步到云端（异步，不阻塞本地存储）
    final recordWithId = TremorRecord(
      id: localId,
      timestamp: record.timestamp,
      averageFrequency: record.averageFrequency,
      maxAmplitude: record.maxAmplitude,
      averageAmplitude: record.averageAmplitude,
      duration: record.duration,
      accelerometerData: record.accelerometerData,
    );
    _cloudSyncService.syncTremorRecordToCloud(recordWithId);
    
    return localId;
  }

  // 获取所有震颤测试记录
  Future<List<TremorRecord>> getAllTremorRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('tremor_records', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) => TremorRecord.fromMap(maps[i]));
  }

  // 删除震颤测试记录（同时从云端删除，仅登录用户）
  Future<int> deleteTremorRecord(int id) async {
    final db = await database;
    
    // 仅登录用户才删除云端数据
    if (_cloudSyncService.isUserLoggedIn) {
      // 先获取记录的时间戳，用于删除云端数据
      final records = await db.query('tremor_records', where: 'id = ?', whereArgs: [id]);
      if (records.isNotEmpty) {
        final timestamp = DateTime.parse(records.first['timestamp'] as String);
        _cloudSyncService.deleteTremorRecordFromCloud(timestamp);
      }
    }
    
    return await db.delete('tremor_records', where: 'id = ?', whereArgs: [id]);
  }

  // 删除所有震颤测试记录
  Future<int> deleteAllTremorRecords() async {
    final db = await database;
    return await db.delete('tremor_records');
  }

  // ========== 肢体动作训练记录操作 ==========

  // 插入肢体动作训练记录（同时同步到云端）
  Future<int> insertMovementTrainingRecord(MovementTrainingRecord record) async {
    final db = await database;
    final localId = await db.insert('movement_training_records', record.toMap());
    
    // 同步到云端（异步，不阻塞本地存储）
    final recordWithId = MovementTrainingRecord(
      id: localId,
      timestamp: record.timestamp,
      duration: record.duration,
      successCount: record.successCount,
      targetCount: record.targetCount,
      goalReached: record.goalReached,
    );
    _cloudSyncService.syncMovementTrainingRecordToCloud(recordWithId);
    
    return localId;
  }

  // 获取所有肢体动作训练记录
  Future<List<MovementTrainingRecord>> getAllMovementTrainingRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('movement_training_records', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) => MovementTrainingRecord.fromMap(maps[i]));
  }

  // 删除肢体动作训练记录（同时从云端删除，仅登录用户）
  Future<int> deleteMovementTrainingRecord(int id) async {
    final db = await database;
    
    // 仅登录用户才删除云端数据
    if (_cloudSyncService.isUserLoggedIn) {
      // 先获取记录的时间戳，用于删除云端数据
      final records = await db.query('movement_training_records', where: 'id = ?', whereArgs: [id]);
      if (records.isNotEmpty) {
        final timestamp = DateTime.parse(records.first['timestamp'] as String);
        _cloudSyncService.deleteMovementTrainingRecordFromCloud(timestamp);
      }
    }
    
    return await db.delete('movement_training_records', where: 'id = ?', whereArgs: [id]);
  }

  // 删除所有肢体动作训练记录
  Future<int> deleteAllMovementTrainingRecords() async {
    final db = await database;
    return await db.delete('movement_training_records');
  }

  // ========== 云端同步操作 ==========

  /// 从云端拉取数据并合并到本地（去重）
  Future<void> syncFromCloud() async {
    if (!_cloudSyncService.isUserLoggedIn) {
      return;
    }

    try {
      // 获取云端数据
      final cloudData = await _cloudSyncService.pullAllDataFromCloud();
      final cloudTremorRecords = cloudData['tremorRecords'] as List<TremorRecord>;
      final cloudMovementRecords = cloudData['movementRecords'] as List<MovementTrainingRecord>;

      final db = await database;

      // 获取本地数据
      final localTremorRecords = await getAllTremorRecords();
      final localMovementRecords = await getAllMovementTrainingRecords();

      // 合并震颤测试记录（使用时间戳去重）
      final localTimestamps = localTremorRecords
          .map((r) => r.timestamp.toIso8601String())
          .toSet();

      for (final cloudRecord in cloudTremorRecords) {
        final timestampStr = cloudRecord.timestamp.toIso8601String();
        if (!localTimestamps.contains(timestampStr)) {
          // 云端有但本地没有，插入本地
          await db.insert('tremor_records', cloudRecord.toMap());
        }
      }

      // 合并肢体动作训练记录（使用时间戳去重）
      final localMovementTimestamps = localMovementRecords
          .map((r) => r.timestamp.toIso8601String())
          .toSet();

      for (final cloudRecord in cloudMovementRecords) {
        final timestampStr = cloudRecord.timestamp.toIso8601String();
        if (!localMovementTimestamps.contains(timestampStr)) {
          // 云端有但本地没有，插入本地
          await db.insert('movement_training_records', cloudRecord.toMap());
        }
      }

      // 同步本地数据到云端（确保云端有最新的本地数据）
      await _cloudSyncService.syncAllDataToCloud(
        tremorRecords: localTremorRecords,
        movementRecords: localMovementRecords,
      );
    } catch (e) {
      debugPrint('从云端同步数据失败: $e');
    }
  }

  /// 同步所有本地数据到云端
  Future<void> syncToCloud() async {
    if (!_cloudSyncService.isUserLoggedIn) {
      return;
    }

    try {
      final tremorRecords = await getAllTremorRecords();
      final movementRecords = await getAllMovementTrainingRecords();

      await _cloudSyncService.syncAllDataToCloud(
        tremorRecords: tremorRecords,
        movementRecords: movementRecords,
      );
    } catch (e) {
      debugPrint('同步到云端失败: $e');
    }
  }

  // 关闭数据库
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
