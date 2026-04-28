import '../models/assessment_result.dart';
import '../models/report.dart';
import '../models/training_item.dart';
import '../models/training_record.dart';
import 'database_service.dart';
import 'goal_manager.dart';
import 'training_analytics_service.dart';

/// 康复报告服务：聚合评估、趋势与目标完成情况。
class ReportService {
  final DatabaseService _databaseService;
  final TrainingAnalyticsService _analyticsService;
  final GoalManager _goalManager;

  ReportService({
    DatabaseService? databaseService,
    TrainingAnalyticsService? analyticsService,
    GoalManager? goalManager,
  })  : _databaseService = databaseService ?? DatabaseService(),
        _analyticsService = analyticsService ?? TrainingAnalyticsService(),
        _goalManager = goalManager ?? GoalManager();

  /// 生成当前康复报告。
  Future<RehabReport> generateReport() async {
    final results = await Future.wait<dynamic>([
      _databaseService.getLatestAssessmentResult(),
      _analyticsService.getTrend(),
      _goalManager.getSnapshot(),
    ]);

    final assessment = results[0] as AssessmentResult?;
    final trends = results[1] as List<TrendResult>;
    final goalSnapshot = results[2] as GoalSnapshot;

    final reportScores = _buildScores(assessment);
    final reportTrends = _buildTrends(trends);
    final reportCompletion = _buildCompletion(goalSnapshot);
    final summary = _buildSummary(
      scores: reportScores,
      trends: reportTrends,
      completion: reportCompletion,
    );

    return RehabReport(
      summary: summary,
      scores: reportScores,
      trends: reportTrends,
      completion: reportCompletion,
      generatedAt: DateTime.now(),
    );
  }

  /// 生成报告并导出 JSON 字符串。
  Future<String> exportReportJson() async {
    final report = await generateReport();
    return report.toJson();
  }

  /// 示例报告（固定数据，方便开发联调）。
  static RehabReport exampleReport() {
    final trendMap = <String, TrendEntry>{
      TrainingType.hand.key: TrendEntry(
        currentWeekAvg: 72,
        previousWeekAvg: 67,
        changePercent: 7.46,
        direction: TrendDirection.up,
        description: '手部训练较上周提升 7%',
      ),
      TrainingType.voice.key: TrendEntry(
        currentWeekAvg: 64,
        previousWeekAvg: 65,
        changePercent: -1.54,
        direction: TrendDirection.stable,
        description: '语音训练与上周基本持平',
      ),
      TrainingType.motion.key: TrendEntry(
        currentWeekAvg: 58,
        previousWeekAvg: 61,
        changePercent: -4.92,
        direction: TrendDirection.down,
        description: '肢体动作较上周下降 5%',
      ),
    };

    return RehabReport(
      summary:
          '当前综合评分 65 分（中），本周手部训练提升明显；今日目标完成 67%，本周目标完成 53%，已连续训练 6 天。',
      scores: const ReportScores(
        hand: 70,
        voice: 64,
        motion: 60,
        overall: 65,
        level: '中',
      ),
      trends: ReportTrends(
        byType: trendMap,
        highlights: trendMap.values.map((e) => e.description).toList(),
      ),
      completion: const ReportCompletion(
        dailyCompleted: 2,
        dailyTarget: 3,
        dailyRate: 0.67,
        dailyDone: false,
        weeklyCompleted: 8,
        weeklyTarget: 15,
        weeklyRate: 0.53,
        weeklyDone: false,
        streakDays: 6,
      ),
      generatedAt: DateTime.now(),
    );
  }

  ReportScores _buildScores(AssessmentResult? assessment) {
    if (assessment == null) {
      return const ReportScores(
        hand: 0,
        voice: 0,
        motion: 0,
        overall: 0,
        level: '未评估',
      );
    }

    return ReportScores(
      hand: assessment.handScore,
      voice: assessment.voiceScore,
      motion: assessment.motionScore,
      overall: assessment.overallScore,
      level: assessment.level,
    );
  }

  ReportTrends _buildTrends(List<TrendResult> trendResults) {
    final byType = <String, TrendEntry>{};
    for (final t in trendResults) {
      byType[t.type.key] = TrendEntry.fromTrendResult(t);
    }

    final highlights = trendResults
        .where((t) => t.direction != TrendDirection.noData)
        .map((t) => t.description)
        .toList();

    if (highlights.isEmpty) {
      highlights.add('本周暂无足够训练数据用于趋势分析');
    }

    return ReportTrends(byType: byType, highlights: highlights);
  }

  ReportCompletion _buildCompletion(GoalSnapshot snapshot) {
    return ReportCompletion(
      dailyCompleted: snapshot.daily.completedCount,
      dailyTarget: snapshot.daily.targetCount,
      dailyRate: snapshot.daily.progress,
      dailyDone: snapshot.daily.isCompleted,
      weeklyCompleted: snapshot.weekly.completedCount,
      weeklyTarget: snapshot.weekly.targetCount,
      weeklyRate: snapshot.weekly.progress,
      weeklyDone: snapshot.weekly.isCompleted,
      streakDays: snapshot.streak.currentStreak,
    );
  }

  String _buildSummary({
    required ReportScores scores,
    required ReportTrends trends,
    required ReportCompletion completion,
  }) {
    final scorePart = scores.level == '未评估'
        ? '尚未完成初始评估'
        : '当前综合评分 ${scores.overall.toStringAsFixed(0)} 分（${scores.level}）';

    final trendPart = trends.highlights.isNotEmpty
        ? trends.highlights.first
        : '趋势数据不足';

    final dailyPct = (completion.dailyRate * 100).round();
    final weeklyPct = (completion.weeklyRate * 100).round();
    final completionPart =
        '今日目标完成 $dailyPct%，本周目标完成 $weeklyPct%，已连续训练 ${completion.streakDays} 天';

    return '$scorePart，$trendPart；$completionPart。';
  }
}
