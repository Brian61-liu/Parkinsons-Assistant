import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/models/movement_training_record.dart';
import 'package:parkinson_new/models/tremor_record.dart';

void main() {
  group('TremorRecord', () {
    test('toMap/fromMap round-trips sensor samples', () {
      final original = TremorRecord(
        id: 7,
        timestamp: DateTime.utc(2026, 8, 3, 10, 0),
        averageFrequency: 4.5,
        maxAmplitude: 0.8,
        averageAmplitude: 0.3,
        duration: 15,
        accelerometerData: [0.1, 0.2, 0.3],
      );

      final restored = TremorRecord.fromMap(original.toMap());
      expect(restored.id, original.id);
      expect(restored.timestamp, original.timestamp);
      expect(restored.averageFrequency, original.averageFrequency);
      expect(restored.maxAmplitude, original.maxAmplitude);
      expect(restored.averageAmplitude, original.averageAmplitude);
      expect(restored.duration, original.duration);
      expect(restored.accelerometerData, original.accelerometerData);
    });
  });

  group('MovementTrainingRecord', () {
    test('toMap/fromMap round-trips goal and type', () {
      final original = MovementTrainingRecord(
        id: 3,
        timestamp: DateTime.utc(2026, 8, 3, 11, 0),
        duration: 60,
        successCount: 8,
        targetCount: 10,
        goalReached: true,
        trainingType: TrainingType.legLift,
      );

      final restored = MovementTrainingRecord.fromMap(original.toMap());
      expect(restored.id, original.id);
      expect(restored.timestamp, original.timestamp);
      expect(restored.duration, original.duration);
      expect(restored.successCount, original.successCount);
      expect(restored.targetCount, original.targetCount);
      expect(restored.goalReached, isTrue);
      expect(restored.trainingType, TrainingType.legLift);
    });

    test('fromMap defaults trainingType when missing (legacy rows)', () {
      final restored = MovementTrainingRecord.fromMap({
        'id': 1,
        'timestamp': DateTime.utc(2026, 1, 1).toIso8601String(),
        'duration': 30,
        'successCount': 5,
        'targetCount': 10,
        'goalReached': 0,
      });
      expect(restored.goalReached, isFalse);
      expect(restored.trainingType, TrainingType.armsRaised);
    });
  });
}
