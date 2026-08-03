import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/utils/user_data_export_formatter.dart';

void main() {
  test('toCsv summarizes accelerometer samples and escapes commas', () {
    final csv = UserDataExportFormatter.toCsv({
      'exportedAt': '2026-08-04T00:00:00.000Z',
      'userId': 'uid-1',
      'email': 'a@b.com',
      'sources': {
        'tremorRecords': 'local',
        'movementTrainingRecords': 'local',
      },
      'note': 'hello, world',
      'profile': {'displayName': 'Ada'},
      'tremorRecords': [
        {
          'id': 1,
          'timestamp': '2026-08-03T10:00:00.000Z',
          'averageFrequency': 4.0,
          'maxAmplitude': 0.5,
          'averageAmplitude': 0.2,
          'duration': 10,
          'accelerometerData': '1,2,3,4',
        },
      ],
      'movementTrainingRecords': [
        {
          'id': 2,
          'timestamp': '2026-08-03T11:00:00.000Z',
          'duration': 60,
          'successCount': 10,
          'targetCount': 10,
          'goalReached': true,
          'trainingType': 0,
        },
      ],
    });

    expect(csv, contains('# Amplio Data Export - Meta'));
    expect(csv, contains('"hello, world"'));
    expect(csv, contains('sensorSampleCount'));
    expect(csv, contains(',4')); // sample count for 1,2,3,4
    expect(csv, isNot(contains('1,2,3,4\n'))); // raw series not dumped as data
    expect(csv, contains('Ada'));
    expect(csv, contains('true'));
  });
}
