import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tremor_record.dart';
import '../models/movement_training_record.dart';
import '../models/training_record.dart';
import '../models/medication_reminder.dart';
import '../models/medication_check_in.dart';
import 'cloud_sync_service.dart';
import 'cloud_sync_status_service.dart';
import 'security_service.dart';

// 数据库服务类
class DatabaseService {
  static Database? _database;
  static const String _dbName = 'parkinson_rehab.db';
  // v8：敏感 TEXT 字段 AES-GCM 落盘（accelerometerData、medication label）
  static const int _dbVersion = 8;

  @visibleForTesting
  static int get schemaVersion => _dbVersion;

  CloudSyncService? _cloudSync;
  CloudSyncService get _cloudSyncService =>
      _cloudSync ??= CloudSyncService();

  /// 测试用：在给定库上执行与生产相同的 onCreate。
  @visibleForTesting
  Future<void> createSchemaForTest(Database db, int version) =>
      _onCreate(db, version);

  /// 测试用：在给定库上执行与生产相同的 onUpgrade。
  @visibleForTesting
  Future<void> applyUpgradeForTest(
    Database db,
    int oldVersion,
    int newVersion,
  ) =>
      _onUpgrade(db, oldVersion, newVersion);

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

    // 训练记录表（用于趋势分析）
    await db.execute('''
      CREATE TABLE training_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        score REAL NOT NULL,
        date TEXT NOT NULL,
        timestamp TEXT NOT NULL,
        duration INTEGER
      )
    ''');
    await db.execute(
        'CREATE INDEX idx_training_records_date ON training_records(date)');
    await db.execute(
        'CREATE INDEX idx_training_records_type ON training_records(type)');

    await _createMedicationTables(db);
  }

  static Future<void> _createMedicationTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS medication_reminders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        label TEXT NOT NULL,
        time_hhmm TEXT NOT NULL,
        enabled INTEGER NOT NULL DEFAULT 1,
        sort_order INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS medication_check_ins (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        reminder_id INTEGER NOT NULL,
        scheduled_date TEXT NOT NULL,
        scheduled_time TEXT NOT NULL,
        checked_at TEXT NOT NULL,
        status TEXT NOT NULL DEFAULT 'taken',
        FOREIGN KEY (reminder_id) REFERENCES medication_reminders(id) ON DELETE CASCADE
      )
    ''');
    await db.execute('''
      CREATE UNIQUE INDEX IF NOT EXISTS idx_med_checkin_unique
        ON medication_check_ins(reminder_id, scheduled_date, scheduled_time)
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
    if (oldVersion < 5) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS training_records (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          type TEXT NOT NULL,
          score REAL NOT NULL,
          date TEXT NOT NULL,
          timestamp TEXT NOT NULL,
          duration INTEGER
        )
      ''');
      await db.execute(
          'CREATE INDEX IF NOT EXISTS idx_training_records_date ON training_records(date)');
      await db.execute(
          'CREATE INDEX IF NOT EXISTS idx_training_records_type ON training_records(type)');
    }
    if (oldVersion < 6) {
      await _createMedicationTables(db);
    }
    if (oldVersion < 7) {
      await db.execute('DROP TABLE IF EXISTS assessment_results');
    }
    if (oldVersion < 8) {
      await _migrateSensitiveFieldsToEncrypted(db);
    }
  }

  /// Encrypt sensitive TEXT columns that were stored as plaintext before v8.
  Future<void> _migrateSensitiveFieldsToEncrypted(Database db) async {
    final tremorRows = await db.query('tremor_records');
    for (final row in tremorRows) {
      final id = row['id'] as int?;
      if (id == null) continue;
      final raw = row['accelerometerData'] as String? ?? '';
      if (SecurityService.isEncryptedField(raw)) continue;
      final encrypted = await SecurityService.encryptField(raw);
      await db.update(
        'tremor_records',
        {'accelerometerData': encrypted},
        where: 'id = ?',
        whereArgs: [id],
      );
    }

    final reminderRows = await db.query('medication_reminders');
    for (final row in reminderRows) {
      final id = row['id'] as int?;
      if (id == null) continue;
      final raw = row['label'] as String? ?? '';
      if (SecurityService.isEncryptedField(raw)) continue;
      final encrypted = await SecurityService.encryptField(raw);
      await db.update(
        'medication_reminders',
        {'label': encrypted},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<Map<String, dynamic>> _encryptTremorStorageMap(
    Map<String, dynamic> map,
  ) async {
    final copy = Map<String, dynamic>.from(map);
    final raw = copy['accelerometerData'] as String? ?? '';
    copy['accelerometerData'] = await SecurityService.encryptField(raw);
    return copy;
  }

  Future<Map<String, dynamic>> _decryptTremorStorageMap(
    Map<String, dynamic> map,
  ) async {
    final copy = Map<String, dynamic>.from(map);
    final stored = copy['accelerometerData'] as String? ?? '';
    copy['accelerometerData'] = await SecurityService.decryptField(stored);
    return copy;
  }

  Future<Map<String, dynamic>> _encryptMedicationStorageMap(
    Map<String, dynamic> map,
  ) async {
    final copy = Map<String, dynamic>.from(map);
    final raw = copy['label'] as String? ?? '';
    copy['label'] = await SecurityService.encryptField(raw);
    return copy;
  }

  Future<Map<String, dynamic>> _decryptMedicationStorageMap(
    Map<String, dynamic> map,
  ) async {
    final copy = Map<String, dynamic>.from(map);
    final stored = copy['label'] as String? ?? '';
    copy['label'] = await SecurityService.decryptField(stored);
    return copy;
  }

  // ========== 震颤测试记录操作 ==========

  // 插入震颤测试记录（同时同步到云端）
  Future<int> insertTremorRecord(TremorRecord record) async {
    final db = await database;
    final storageMap = await _encryptTremorStorageMap(record.toMap());
    final localId = await db.insert('tremor_records', storageMap);

    // 同步到云端（异步，不阻塞本地存储）；云端保持明文载荷
    final recordWithId = TremorRecord(
      id: localId,
      timestamp: record.timestamp,
      averageFrequency: record.averageFrequency,
      maxAmplitude: record.maxAmplitude,
      averageAmplitude: record.averageAmplitude,
      duration: record.duration,
      accelerometerData: record.accelerometerData,
    );
    // ignore: discarded_futures
    _cloudSyncService.syncTremorRecordToCloud(recordWithId).then((ok) {
      if (!ok) {
        // ignore: discarded_futures
        CloudSyncStatusService.instance.markBackgroundFailure(
          'tremor record sync failed',
        );
      }
    });

    return localId;
  }

  // 获取所有震颤测试记录
  Future<List<TremorRecord>> getAllTremorRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'tremor_records',
      orderBy: 'timestamp DESC',
    );
    final records = <TremorRecord>[];
    for (final map in maps) {
      final decrypted = await _decryptTremorStorageMap(map);
      records.add(TremorRecord.fromMap(decrypted));
    }
    return records;
  }

  // 删除震颤测试记录（同时从云端删除，仅登录用户）
  Future<int> deleteTremorRecord(int id) async {
    final db = await database;

    // 仅登录用户才删除云端数据
    if (_cloudSyncService.isUserLoggedIn) {
      // 先获取记录的时间戳，用于删除云端数据
      final records = await db.query(
        'tremor_records',
        where: 'id = ?',
        whereArgs: [id],
      );
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
  Future<int> insertMovementTrainingRecord(
    MovementTrainingRecord record,
  ) async {
    final db = await database;
    final localId = await db.insert(
      'movement_training_records',
      record.toMap(),
    );

    // 同步到云端（异步，不阻塞本地存储）
    final recordWithId = MovementTrainingRecord(
      id: localId,
      timestamp: record.timestamp,
      duration: record.duration,
      successCount: record.successCount,
      targetCount: record.targetCount,
      goalReached: record.goalReached,
    );
    // ignore: discarded_futures
    _cloudSyncService.syncMovementTrainingRecordToCloud(recordWithId).then((ok) {
      if (!ok) {
        // ignore: discarded_futures
        CloudSyncStatusService.instance.markBackgroundFailure(
          'movement record sync failed',
        );
      }
    });

    return localId;
  }

  // 获取所有肢体动作训练记录
  Future<List<MovementTrainingRecord>> getAllMovementTrainingRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'movement_training_records',
      orderBy: 'timestamp DESC',
    );
    return List.generate(
      maps.length,
      (i) => MovementTrainingRecord.fromMap(maps[i]),
    );
  }

  // 删除肢体动作训练记录（同时从云端删除，仅登录用户）
  Future<int> deleteMovementTrainingRecord(int id) async {
    final db = await database;

    // 仅登录用户才删除云端数据
    if (_cloudSyncService.isUserLoggedIn) {
      // 先获取记录的时间戳，用于删除云端数据
      final records = await db.query(
        'movement_training_records',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (records.isNotEmpty) {
        final timestamp = DateTime.parse(records.first['timestamp'] as String);
        _cloudSyncService.deleteMovementTrainingRecordFromCloud(timestamp);
      }
    }

    return await db.delete(
      'movement_training_records',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // 删除所有肢体动作训练记录
  Future<int> deleteAllMovementTrainingRecords() async {
    final db = await database;
    return await db.delete('movement_training_records');
  }

  /// 清除所有本地健康数据（账户删除时调用）
  Future<void> clearAllLocalData() async {
    final db = await database;
    await db.delete('tremor_records');
    await db.delete('movement_training_records');
    await db.delete('training_records');
    await db.delete('medication_check_ins');
    await db.delete('medication_reminders');
  }

  // ========== 用药清单（仅本地，不同步云端）==========

  Future<int> insertMedicationReminder(MedicationReminder reminder) async {
    final db = await database;
    final storageMap = await _encryptMedicationStorageMap(reminder.toMap());
    return await db.insert('medication_reminders', storageMap);
  }

  Future<int> updateMedicationReminder(MedicationReminder reminder) async {
    final db = await database;
    if (reminder.id == null) {
      throw ArgumentError('reminder.id is required for update');
    }
    final storageMap = await _encryptMedicationStorageMap(reminder.toMap());
    return await db.update(
      'medication_reminders',
      storageMap,
      where: 'id = ?',
      whereArgs: [reminder.id],
    );
  }

  Future<int> deleteMedicationReminder(int id) async {
    final db = await database;
    return await db.delete(
      'medication_reminders',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<MedicationReminder>> getAllMedicationReminders() async {
    final db = await database;
    final maps = await db.query(
      'medication_reminders',
      orderBy: 'sort_order ASC, time_hhmm ASC',
    );
    final reminders = <MedicationReminder>[];
    for (final map in maps) {
      final decrypted = await _decryptMedicationStorageMap(map);
      reminders.add(MedicationReminder.fromMap(decrypted));
    }
    return reminders;
  }

  Future<List<MedicationReminder>> getEnabledMedicationReminders() async {
    final db = await database;
    final maps = await db.query(
      'medication_reminders',
      where: 'enabled = ?',
      whereArgs: [1],
      orderBy: 'time_hhmm ASC, sort_order ASC',
    );
    final reminders = <MedicationReminder>[];
    for (final map in maps) {
      final decrypted = await _decryptMedicationStorageMap(map);
      reminders.add(MedicationReminder.fromMap(decrypted));
    }
    return reminders;
  }

  Future<List<MedicationTodayItem>> getTodayMedicationItems({
    String? date,
  }) async {
    final scheduledDate = date ?? _medicationDateKey(DateTime.now());
    final reminders = await getEnabledMedicationReminders();
    if (reminders.isEmpty) return [];

    final db = await database;
    final checkInMaps = await db.query(
      'medication_check_ins',
      where: 'scheduled_date = ?',
      whereArgs: [scheduledDate],
    );
    final checkInsByKey = <String, MedicationCheckIn>{};
    for (final m in checkInMaps) {
      final c = MedicationCheckIn.fromMap(m);
      checkInsByKey['${c.reminderId}|${c.scheduledTime}'] = c;
    }

    return reminders.map((r) {
      final key = '${r.id}|${r.timeHhmm}';
      final checkIn = checkInsByKey[key];
      return MedicationTodayItem(
        reminder: r,
        isTaken: checkIn != null,
        checkedAt: checkIn?.checkedAt,
      );
    }).toList();
  }

  Future<void> checkInMedication({
    required int reminderId,
    required String scheduledDate,
    required String scheduledTime,
  }) async {
    final db = await database;
    await db.insert(
      'medication_check_ins',
      MedicationCheckIn(
        reminderId: reminderId,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
        checkedAt: DateTime.now(),
      ).toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> undoMedicationCheckIn({
    required int reminderId,
    required String scheduledDate,
    required String scheduledTime,
  }) async {
    final db = await database;
    return await db.delete(
      'medication_check_ins',
      where:
          'reminder_id = ? AND scheduled_date = ? AND scheduled_time = ?',
      whereArgs: [reminderId, scheduledDate, scheduledTime],
    );
  }

  Future<void> deleteAllMedicationData() async {
    final db = await database;
    await db.delete('medication_check_ins');
    await db.delete('medication_reminders');
  }

  Future<int> purgeMedicationCheckInsOlderThan(int days) async {
    final db = await database;
    final cutoff = DateTime.now().subtract(Duration(days: days));
    final cutoffKey = _medicationDateKey(cutoff);
    return await db.delete(
      'medication_check_ins',
      where: 'scheduled_date < ?',
      whereArgs: [cutoffKey],
    );
  }

  static String _medicationDateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  // ========== 云端同步操作 ==========

  /// 从云端拉取数据并合并到本地（去重）。失败时抛出，由 UI 展示。
  Future<void> syncFromCloud() async {
    if (!_cloudSyncService.isUserLoggedIn) {
      return;
    }

    // 获取云端数据
    final cloudData = await _cloudSyncService.pullAllDataFromCloud();
    final cloudTremorRecords =
        cloudData['tremorRecords'] as List<TremorRecord>;
    final cloudMovementRecords =
        cloudData['movementRecords'] as List<MovementTrainingRecord>;

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
        // 云端有但本地没有，插入本地（落盘前加密）
        final storageMap =
            await _encryptTremorStorageMap(cloudRecord.toMap());
        await db.insert('tremor_records', storageMap);
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
  }

  /// 同步所有本地数据到云端。失败时抛出，由 UI 展示。
  Future<void> syncToCloud() async {
    if (!_cloudSyncService.isUserLoggedIn) {
      return;
    }

    final tremorRecords = await getAllTremorRecords();
    final movementRecords = await getAllMovementTrainingRecords();

    await _cloudSyncService.syncAllDataToCloud(
      tremorRecords: tremorRecords,
      movementRecords: movementRecords,
    );
  }

  // ========== 训练记录操作（趋势分析用）==========

  /// 插入单次训练记录
  Future<int> insertTrainingRecord(TrainingRecord record) async {
    final db = await database;
    return await db.insert('training_records', record.toMap());
  }

  /// 按日期范围 + 可选类型查询训练记录（时间倒序）
  Future<List<TrainingRecord>> getTrainingRecords({
    String? type,
    String? startDate,
    String? endDate,
    int? limit,
  }) async {
    final db = await database;

    final where = <String>[];
    final args = <dynamic>[];

    if (type != null) {
      where.add('type = ?');
      args.add(type);
    }
    if (startDate != null) {
      where.add('date >= ?');
      args.add(startDate);
    }
    if (endDate != null) {
      where.add('date <= ?');
      args.add(endDate);
    }

    final maps = await db.query(
      'training_records',
      where: where.isEmpty ? null : where.join(' AND '),
      whereArgs: args.isEmpty ? null : args,
      orderBy: 'timestamp DESC',
      limit: limit,
    );
    return maps.map(TrainingRecord.fromMap).toList();
  }

  /// 按日期分组计算平均分（原生 SQL，效率高）
  Future<List<Map<String, dynamic>>> getTrainingDailyAverages({
    String? type,
    String? startDate,
    String? endDate,
  }) async {
    final db = await database;

    final where = <String>[];
    final args = <dynamic>[];

    if (type != null) {
      where.add('type = ?');
      args.add(type);
    }
    if (startDate != null) {
      where.add('date >= ?');
      args.add(startDate);
    }
    if (endDate != null) {
      where.add('date <= ?');
      args.add(endDate);
    }

    final whereClause =
        where.isEmpty ? '' : 'WHERE ${where.join(' AND ')}';

    return await db.rawQuery(
      '''
      SELECT type, date,
             AVG(score) AS average,
             COUNT(*) AS count
      FROM training_records
      $whereClause
      GROUP BY type, date
      ORDER BY date ASC
      ''',
      args.isEmpty ? null : args,
    );
  }

  /// 计算指定日期范围内各类型的平均分
  Future<Map<String, double>> getTrainingAverageByType({
    required String startDate,
    required String endDate,
  }) async {
    final db = await database;
    final rows = await db.rawQuery(
      '''
      SELECT type, AVG(score) AS average
      FROM training_records
      WHERE date >= ? AND date <= ?
      GROUP BY type
      ''',
      [startDate, endDate],
    );
    return {
      for (final r in rows)
        r['type'] as String: (r['average'] as num).toDouble()
    };
  }

  // 关闭数据库
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
