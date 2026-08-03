import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/database_service.dart';
import 'package:parkinson_new/services/security_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    SecurityService.encryptionKeyOverride = SecurityService.generateSecureKey();
  });

  tearDown(() {
    SecurityService.encryptionKeyOverride = null;
  });

  test('upgrade from v1 adds later tables and encrypts sensitive fields',
      () async {
    final db = await databaseFactory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
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
        },
      ),
    );

    await db.insert('tremor_records', {
      'timestamp': DateTime.utc(2026, 8, 3).toIso8601String(),
      'averageFrequency': 4.0,
      'maxAmplitude': 0.5,
      'averageAmplitude': 0.2,
      'duration': 10,
      'accelerometerData': '0.1,0.2,0.3',
    });

    final service = DatabaseService();
    await service.applyUpgradeForTest(db, 1, DatabaseService.schemaVersion);

    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table'",
    );
    final names = tables.map((r) => r['name'] as String).toSet();
    expect(names, contains('movement_training_records'));
    expect(names, contains('training_records'));
    expect(names, contains('medication_reminders'));
    expect(names, contains('medication_check_ins'));
    expect(names, isNot(contains('assessment_results')));

    final rows = await db.query('tremor_records');
    expect(rows, hasLength(1));
    final accel = rows.first['accelerometerData'] as String;
    expect(SecurityService.isEncryptedField(accel), isTrue);
    expect(
      await SecurityService.decryptField(accel),
      '0.1,0.2,0.3',
    );

    await db.close();
  });

  test('createSchemaForTest builds current schema version tables', () async {
    final db = await databaseFactory.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(version: 1),
    );

    final service = DatabaseService();
    await service.createSchemaForTest(db, DatabaseService.schemaVersion);

    final tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table'",
    );
    final names = tables.map((r) => r['name'] as String).toSet();
    expect(names, containsAll([
      'tremor_records',
      'movement_training_records',
      'training_records',
      'medication_reminders',
      'medication_check_ins',
    ]));

    await db.close();
  });
}
