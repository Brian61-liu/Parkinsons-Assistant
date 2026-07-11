import '../models/training_item.dart';
import '../utils/constants.dart';
import 'training_analytics_service.dart';

/// 将单次训练结果映射为 0–100 分并写入 [training_records]。
/// 分数仅用于康复训练个性化参考，不是医学诊断。
class TrainingScoreService {
  TrainingScoreService({TrainingAnalyticsService? analytics})
      : _analytics = analytics ?? TrainingAnalyticsService();

  final TrainingAnalyticsService _analytics;

  /// 震颤测试成功后写入手部训练分数。
  Future<void> recordHandFromTremor({
    required double averageAmplitude,
    required double maxAmplitude,
    required int durationSeconds,
  }) async {
    final score = scoreHandFromAmplitude(
      averageAmplitude: averageAmplitude,
      maxAmplitude: maxAmplitude,
    );
    if (score == null) return;
    await _analytics.addScore(
      type: TrainingType.hand,
      score: score,
      duration: durationSeconds,
    );
  }

  /// 肢体训练结束后写入分数。
  Future<void> recordMotion({
    required int successCount,
    required int targetCount,
    required bool goalReached,
    required int durationSeconds,
  }) async {
    final score = scoreMotion(
      successCount: successCount,
      targetCount: targetCount,
      goalReached: goalReached,
    );
    await _analytics.addScore(
      type: TrainingType.motion,
      score: score,
      duration: durationSeconds,
    );
  }

  /// 语音跟练结束后写入分数；样本不足时不写入。
  Future<void> recordVoiceSession({
    required double baselineDb,
    required List<double> rawDbSamples,
    required int durationSeconds,
  }) async {
    final score = scoreVoice(
      baselineDb: baselineDb,
      rawDbSamples: rawDbSamples,
    );
    if (score == null) return;
    await _analytics.addScore(
      type: TrainingType.voice,
      score: score,
      duration: durationSeconds,
    );
  }

  /// 由震颤振幅估算手部稳定性分（0–100），振幅越小分数越高。
  static double? scoreHandFromAmplitude({
    required double averageAmplitude,
    required double maxAmplitude,
  }) {
    final amplitude = averageAmplitude;
    double base;
    if (amplitude < AppConstants.tremorThreshold) {
      base = 92;
    } else if (amplitude < AppConstants.mildTremorAmplitude) {
      base = 80;
    } else if (amplitude < AppConstants.moderateTremorAmplitude) {
      base = 65;
    } else if (amplitude < AppConstants.severeTremorAmplitude) {
      base = 50;
    } else if (amplitude < 1.0) {
      base = 38;
    } else if (amplitude < 2.0) {
      base = 25;
    } else {
      base = 15;
    }

    final spikeRatio = amplitude > 0 ? maxAmplitude / amplitude : 1.0;
    if (spikeRatio > 10) {
      base -= 10;
    } else if (spikeRatio > 5) {
      base -= 5;
    }

    return base.clamp(0.0, 100.0);
  }

  static double scoreMotion({
    required int successCount,
    required int targetCount,
    required bool goalReached,
  }) {
    final target = targetCount > 0 ? targetCount : 1;
    var score = (successCount / target * 100).clamp(0.0, 100.0);
    if (goalReached && score < 95) {
      score = (score + 5).clamp(0.0, 100.0);
    }
    return score;
  }

  static double? scoreVoice({
    required double baselineDb,
    required List<double> rawDbSamples,
    double effectiveDiffThreshold = 6.0,
    double targetEffectiveDiff = 18.0,
    int minSamples = 12,
  }) {
    if (baselineDb <= 0 || rawDbSamples.length < minSamples) return null;

    int activeCount = 0;
    double sumEffective = 0;
    for (final raw in rawDbSamples) {
      final diff = raw - baselineDb;
      if (diff >= effectiveDiffThreshold) {
        activeCount++;
        sumEffective += diff;
      }
    }

    final activeRatio = activeCount / rawDbSamples.length;
    final avgEffective =
        activeCount > 0 ? sumEffective / activeCount : 0.0;
    final volumeFactor =
        (avgEffective / targetEffectiveDiff).clamp(0.0, 1.0).toDouble();

    final score = activeRatio * 60 + volumeFactor * 40;
    return score.clamp(0.0, 100.0);
  }
}
