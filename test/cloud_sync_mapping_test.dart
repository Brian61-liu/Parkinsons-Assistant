import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/cloud_sync_service.dart';

void main() {
  group('CloudSyncService.recordDocId', () {
    test('uses UTC millis and avoids ISO8601 colons', () {
      final ts = DateTime.utc(2026, 8, 3, 12, 30, 45);
      final id = CloudSyncService.recordDocId(ts);

      expect(id, startsWith('t_'));
      expect(id, isNot(contains(':')));
      expect(id, 't_${ts.millisecondsSinceEpoch}');
    });

    test('same instant in local/UTC yields same doc id', () {
      final utc = DateTime.utc(2026, 1, 1, 0, 0, 0);
      final local = utc.toLocal();
      expect(
        CloudSyncService.recordDocId(local),
        CloudSyncService.recordDocId(utc),
      );
    });
  });

  group('CloudSyncService.medicationCheckInDocId', () {
    test('avoids colon and includes reminder id + date + time', () {
      final id = CloudSyncService.medicationCheckInDocId(
        reminderCloudId: 'abc123',
        scheduledDate: '2026-08-07',
        scheduledTime: '08:30',
      );
      expect(id, 'abc123_2026-08-07_0830');
      expect(id, isNot(contains(':')));
    });
  });

  group('CloudSyncService.newMedicationCloudId', () {
    test('returns 32 hex chars', () {
      final id = CloudSyncService.newMedicationCloudId();
      expect(id.length, 32);
      expect(RegExp(r'^[0-9a-f]+$').hasMatch(id), isTrue);
    });
  });

  group('CloudSyncService.clampFinite', () {
    test('clamps to min/max', () {
      expect(CloudSyncService.clampFinite(-1, 0, 30), 0);
      expect(CloudSyncService.clampFinite(50, 0, 30), 30);
      expect(CloudSyncService.clampFinite(12.5, 0, 30), 12.5);
    });

    test('maps NaN and Infinity to min', () {
      expect(CloudSyncService.clampFinite(double.nan, 0, 100), 0);
      expect(CloudSyncService.clampFinite(double.infinity, 0, 100), 0);
      expect(CloudSyncService.clampFinite(double.negativeInfinity, 0, 100), 0);
    });
  });

  group('CloudSyncService.sanitizeAccelerometerData', () {
    test('drops non-finite samples', () {
      final cleaned = CloudSyncService.sanitizeAccelerometerData([
        1.0,
        double.nan,
        2.0,
        double.infinity,
        -3.0,
      ]);
      expect(cleaned, [1.0, 2.0, -3.0]);
    });

    test('empty when all illegal', () {
      expect(
        CloudSyncService.sanitizeAccelerometerData([
          double.nan,
          double.infinity,
        ]),
        isEmpty,
      );
    });
  });
}
