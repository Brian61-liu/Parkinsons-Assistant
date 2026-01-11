import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tremor_record.dart';
import '../models/gait_record.dart';

// 数据库服务类
class DatabaseService {
  static Database? _database;
  static const String _dbName = 'parkinson_rehab.db';
  static const int _dbVersion = 1;

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

    // 步态训练记录表
    await db.execute('''
      CREATE TABLE gait_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        timestamp TEXT NOT NULL,
        bpm INTEGER NOT NULL,
        duration INTEGER NOT NULL,
        notes TEXT
      )
    ''');
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

  // ========== 步态训练记录操作 ==========

  // 插入步态训练记录
  Future<int> insertGaitRecord(GaitRecord record) async {
    final db = await database;
    return await db.insert('gait_records', record.toMap());
  }

  // 获取所有步态训练记录
  Future<List<GaitRecord>> getAllGaitRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('gait_records', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) => GaitRecord.fromMap(maps[i]));
  }

  // 删除步态训练记录
  Future<int> deleteGaitRecord(int id) async {
    final db = await database;
    return await db.delete('gait_records', where: 'id = ?', whereArgs: [id]);
  }

  // 关闭数据库
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
