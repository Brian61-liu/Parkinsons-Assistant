import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/training_score_service.dart';
import 'package:parkinson_new/utils/constants.dart';

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

    test('band thresholds map to expected base scores', () {
      expect(
        TrainingScoreService.scoreHandFromAmplitude(
          averageAmplitude: AppConstants.tremorThreshold / 2,
          maxAmplitude: AppConstants.tremorThreshold / 2,
        ),
        92,
      );
      expect(
        TrainingScoreService.scoreHandFromAmplitude(
          averageAmplitude: AppConstants.mildTremorAmplitude - 0.001,
          maxAmplitude: AppConstants.mildTremorAmplitude - 0.001,
        ),
        80,
      );
      expect(
        TrainingScoreService.scoreHandFromAmplitude(
          averageAmplitude: AppConstants.moderateTremorAmplitude - 0.001,
          maxAmplitude: AppConstants.moderateTremorAmplitude - 0.001,
        ),
        65,
      );
    });

    test('large spike ratio reduces score', () {
      final mildSpike = TrainingScoreService.scoreHandFromAmplitude(
        averageAmplitude: 0.05,
        maxAmplitude: 0.2,
      )!;
      final largeSpike = TrainingScoreService.scoreHandFromAmplitude(
        averageAmplitude: 0.05,
        maxAmplitude: 0.6,
      )!;
      expect(largeSpike, lessThan(mildSpike));
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

    test('zero target avoids division by zero', () {
      final score = TrainingScoreService.scoreMotion(
        successCount: 0,
        targetCount: 0,
        goalReached: false,
      );
      expect(score, 0);
    });

    test('goalReached adds bonus when below 95', () {
      final without = TrainingScoreService.scoreMotion(
        successCount: 5,
        targetCount: 10,
        goalReached: false,
      );
      final withGoal = TrainingScoreService.scoreMotion(
        successCount: 5,
        targetCount: 10,
        goalReached: true,
      );
      expect(withGoal, without + 5);
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

    test('non-positive baseline returns null', () {
      final samples = List<double>.filled(20, 55);
      expect(
        TrainingScoreService.scoreVoice(
          baselineDb: 0,
          rawDbSamples: samples,
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
      expect(score, lessThanOrEqualTo(100));
    });
  });
}
