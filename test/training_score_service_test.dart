import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/training_score_service.dart';

void main() {
  group('TrainingScoreService.scoreHandFromAmplitude', () {
    test('low amplitude yields high score', () {
      final score = TrainingScoreService.scoreHandFromAmplitude(
        averageAmplitude: 0.01,
        maxAmplitude: 0.02,
      );
      expect(score, greaterThan(70));
    });

    test('high amplitude yields low score', () {
      final score = TrainingScoreService.scoreHandFromAmplitude(
        averageAmplitude: 1.5,
        maxAmplitude: 2.0,
      );
      expect(score, lessThan(40));
    });
  });

  group('TrainingScoreService.scoreMotion', () {
    test('full target completion scores high', () {
      final score = TrainingScoreService.scoreMotion(
        successCount: 10,
        targetCount: 10,
        goalReached: true,
      );
      expect(score, greaterThanOrEqualTo(95));
    });
  });

  group('TrainingScoreService.scoreVoice', () {
    test('insufficient samples returns null', () {
      expect(
        TrainingScoreService.scoreVoice(
          baselineDb: 40,
          rawDbSamples: [50, 51],
        ),
        isNull,
      );
    });

    test('active reading yields reasonable score', () {
      final samples = List<double>.generate(
        20,
        (i) => 55.0 + (i % 3) * 5,
      );
      final score = TrainingScoreService.scoreVoice(
        baselineDb: 40,
        rawDbSamples: samples,
      );
      expect(score, isNotNull);
      expect(score!, greaterThan(0));
    });
  });
}
