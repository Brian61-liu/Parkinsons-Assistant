import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tremor_record.dart';
import '../models/movement_training_record.dart';

// 数据库服务类
class DatabaseService {
  static Database? _database;
  static const String _dbName = 'parkinson_rehab.db';
  static const int _dbVersion = 2; // 更新版本号以支持新表

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
        goalReached INTEGER NOT NULL
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
          goalReached INTEGER NOT NULL
        )
      ''');
    }
  }

  // ========== 震颤测试记录操作 ==========

  // 插入震颤测试记录
  Future<int> insertTremorRecord(TremorRecord record) async {
    final db = await database;
    return await db.insert('tremor_records', record.toMap());
  }

  // 获取所有震颤测试记录
  Future<List<TremorRecord>> getAllTremorRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('tremor_records', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) => TremorRecord.fromMap(maps[i]));
  }

  // 删除震颤测试记录
  Future<int> deleteTremorRecord(int id) async {
    final db = await database;
    return await db.delete('tremor_records', where: 'id = ?', whereArgs: [id]);
  }

  // 删除所有震颤测试记录
  Future<int> deleteAllTremorRecords() async {
    final db = await database;
    return await db.delete('tremor_records');
  }

  // ========== 肢体动作训练记录操作 ==========

  // 插入肢体动作训练记录
  Future<int> insertMovementTrainingRecord(MovementTrainingRecord record) async {
    final db = await database;
    return await db.insert('movement_training_records', record.toMap());
  }

  // 获取所有肢体动作训练记录
  Future<List<MovementTrainingRecord>> getAllMovementTrainingRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('movement_training_records', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) => MovementTrainingRecord.fromMap(maps[i]));
  }

  // 删除肢体动作训练记录
  Future<int> deleteMovementTrainingRecord(int id) async {
    final db = await database;
    return await db.delete('movement_training_records', where: 'id = ?', whereArgs: [id]);
  }

  // 删除所有肢体动作训练记录
  Future<int> deleteAllMovementTrainingRecords() async {
    final db = await database;
    return await db.delete('movement_training_records');
  }

  // 关闭数据库
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
