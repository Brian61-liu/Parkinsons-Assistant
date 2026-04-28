import 'package:flutter/foundation.dart';
import '../models/training_item.dart';
import '../models/training_record.dart';
import 'database_service.dart';

// ─────────────────────────────────────────────────────────────
//  TrainingAnalyticsService
// ─────────────────────────────────────────────────────────────

/// 训练记录写入 + 趋势分析服务。
///
/// 所有数据通过 [DatabaseService] 持久化到 SQLite。
class TrainingAnalyticsService {
  final DatabaseService _db;

  TrainingAnalyticsService({DatabaseService? db})
      : _db = db ?? DatabaseService();

  // ── 写入 ─────────────────────────────────

  /// 保存一次训练结果。
  /// 返回数据库自增 id。
  Future<int> addRecord(TrainingRecord record) async {
    final id = await _db.insertTrainingRecord(record);
    debugPrint('TrainingAnalytics: 记录已保存 '
        '[${record.type.key}] score=${record.score} date=${record.date}');
    return id;
  }

  /// 快捷方法：直接传入类型和分数，自动填充时间
  Future<int> addScore({
    required TrainingType type,
    required double score,
    int? duration,
  }) =>
      addRecord(
          TrainingRecord.now(type: type, score: score, duration: duration));

  // ── 历史查询 ─────────────────────────────

  /// 获取历史记录，可按类型 / 日期范围过滤，支持分页
  Future<List<TrainingRecord>> getHistory({
    TrainingType? type,
    String? startDate,
    String? endDate,
    int? limit,
  }) =>
      _db.getTrainingRecords(
        type: type?.key,
        startDate: startDate,
        endDate: endDate,
        limit: limit,
      );

  /// 获取最近 [days] 天内的记录
  Future<List<TrainingRecord>> getRecentHistory({
    int days = 14,
    TrainingType? type,
  }) {
    final start = _dateStr(DateTime.now().subtract(Duration(days: days - 1)));
    return getHistory(type: type, startDate: start);
  }

  // ── 周均值 ───────────────────────────────

  /// 返回指定周（默认本周）各类型的平均分。
  ///
  /// key 为 [TrainingType.key]，value 为平均分；
  /// 若某类型本周无记录则不包含在结果中。
  Future<Map<String, double>> getWeeklyAverage({DateTime? weekStart}) async {
    final monday = _mondayOf(weekStart ?? DateTime.now());
    final sunday = monday.add(const Duration(days: 6));
    return _db.getTrainingAverageByType(
      startDate: _dateStr(monday),
      endDate: _dateStr(sunday),
    );
  }

  /// 返回最近 [days] 天每天各类型的平均分（用于折线图）
  Future<List<DailyAverage>> getDailyAverages({
    int days = 14,
    TrainingType? type,
  }) async {
    final start = _dateStr(DateTime.now().subtract(Duration(days: days - 1)));
    final rows = await _db.getTrainingDailyAverages(
      type: type?.key,
      startDate: start,
    );
    return rows
        .map((r) => DailyAverage(
              date: r['date'] as String,
              type: TrainingType.fromKey(r['type'] as String),
              average: (r['average'] as num).toDouble(),
              count: (r['count'] as num).toInt(),
            ))
        .toList();
  }

  // ── 趋势分析 ─────────────────────────────

  /// 计算所有类型（或指定类型）的本周 vs 上周趋势。
  ///
  /// 返回列表，每个元素对应一个维度的 [TrendResult]。
  Future<List<TrendResult>> getTrend({TrainingType? type}) async {
    final now = DateTime.now();
    final thisMonday = _mondayOf(now);
    final lastMonday = thisMonday.subtract(const Duration(days: 7));
    final lastSunday = thisMonday.subtract(const Duration(days: 1));

    final current = await _db.getTrainingAverageByType(
      startDate: _dateStr(thisMonday),
      endDate: _dateStr(now),
    );
    final previous = await _db.getTrainingAverageByType(
      startDate: _dateStr(lastMonday),
      endDate: _dateStr(lastSunday),
    );

    final types =
        type != null ? [type] : TrainingType.values;

    return types.map((t) {
      final curr = current[t.key];
      final prev = previous[t.key];
      return TrendResult.compute(
        type: t,
        currentWeekAvg: curr,
        previousWeekAvg: prev,
      );
    }).toList();
  }

  /// 获取单个维度的趋势（快捷方法）
  Future<TrendResult> getTrendFor(TrainingType type) async {
    final results = await getTrend(type: type);
    return results.first;
  }

  // ── 统计摘要 ─────────────────────────────

  /// 返回全部趋势描述文字列表，适合在 UI 中直接展示
  /// 示例：["手部训练较上周提升 8%", "语音训练与上周基本持平", ...]
  Future<List<String>> getTrendDescriptions() async {
    final trends = await getTrend();
    return trends
        .where((t) => t.direction != TrendDirection.noData ||
            t.currentWeekAvg != null)
        .map((t) => t.description)
        .toList();
  }

  /// 获取今日各类型已训练次数
  Future<Map<TrainingType, int>> getTodayCount() async {
    final today = _dateStr(DateTime.now());
    final records = await getHistory(startDate: today, endDate: today);
    final map = <TrainingType, int>{};
    for (final r in records) {
      map[r.type] = (map[r.type] ?? 0) + 1;
    }
    return map;
  }

  // ── 日期工具（静态）──────────────────────

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  /// 返回给定日期所在周的周一
  static DateTime _mondayOf(DateTime d) =>
      d.subtract(Duration(days: d.weekday - 1));

  // ── 示例输出（用于文档 / 测试）──────────

  /// 打印当前趋势（调试用）
  Future<void> printTrends() async {
    final trends = await getTrend();
    for (final t in trends) {
      debugPrint('[趋势] ${t.description} '
          '(本周 ${t.currentWeekAvg?.toStringAsFixed(1) ?? '-'} / '
          '上周 ${t.previousWeekAvg?.toStringAsFixed(1) ?? '-'})');
    }
  }
}
