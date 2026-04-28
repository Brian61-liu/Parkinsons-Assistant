import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/training_goal.dart';

// ─────────────────────────────────────────────────────────────
//  默认目标配置
// ─────────────────────────────────────────────────────────────

/// 每日默认目标训练次数
const int kDefaultDailyTarget = 3;

/// 每周默认目标训练次数（5 个训练日 × 3 次）
const int kDefaultWeeklyTarget = 15;

// SharedPreferences 键名
const String _kDailyPrefix = 'goal_daily_';
const String _kWeeklyPrefix = 'goal_weekly_';
const String _kStreakKey = 'goal_streak';
const String _kDailyTargetKey = 'goal_daily_target';
const String _kWeeklyTargetKey = 'goal_weekly_target';

// ─────────────────────────────────────────────────────────────
//  GoalManager
// ─────────────────────────────────────────────────────────────

/// 训练目标管理器，负责：
/// - 每日 / 每周目标进度追踪
/// - 连续训练天数（streak）计算
/// - 目标参数配置
///
/// 所有状态通过 SharedPreferences 持久化，无需网络或数据库。
class GoalManager {
  // 内存缓存（避免每次都读磁盘）
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _store async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  // ── 公开 API ──────────────────────────────

  /// 记录一次训练完成，自动更新日目标、周目标和 streak。
  ///
  /// [date] 默认为今天（YYYY-MM-DD），测试时可传入指定日期。
  Future<void> completeTraining({String? date}) async {
    final today = date ?? _dateKey(DateTime.now());

    // 并行读取，提升性能
    final results = await Future.wait([
      getDailyProgress(date: today),
      getWeeklyProgress(date: today),
      getStreakInfo(),
    ]);

    final daily = results[0] as DailyGoal;
    final weekly = results[1] as WeeklyGoal;
    final streak = results[2] as StreakInfo;

    // 更新日目标
    final updatedDaily = daily.increment();

    // 更新周目标（记录活跃天）
    final updatedWeekly = weekly.increment(today);

    // 更新 streak
    final updatedStreak = _recalcStreak(streak, today);

    // 并行写入
    await Future.wait([
      _saveDailyGoal(updatedDaily),
      _saveWeeklyGoal(updatedWeekly),
      _saveStreakInfo(updatedStreak),
    ]);

    debugPrint('GoalManager: 训练完成 [$today] '
        '| 日 ${updatedDaily.completedCount}/${updatedDaily.targetCount} '
        '| 周 ${updatedWeekly.completedCount}/${updatedWeekly.targetCount} '
        '| streak ${updatedStreak.currentStreak}天');
  }

  /// 获取指定日期的每日进度（默认今天）。
  /// 若记录不存在则返回初始状态。
  Future<DailyGoal> getDailyProgress({String? date}) async {
    final key = date ?? _dateKey(DateTime.now());
    final prefs = await _store;
    final target = prefs.getInt(_kDailyTargetKey) ?? kDefaultDailyTarget;
    final raw = prefs.getString('$_kDailyPrefix$key');

    if (raw == null) {
      return DailyGoal(date: key, targetCount: target, completedCount: 0);
    }

    // 如果目标值已被用户更新，以最新配置为准
    return DailyGoal.fromJson(raw).copyWith(targetCount: target);
  }

  /// 获取包含指定日期那一周的每周进度（默认今天所在周）。
  Future<WeeklyGoal> getWeeklyProgress({String? date}) async {
    final ref = date != null ? DateTime.parse(date) : DateTime.now();
    final weekKey = _weekKey(ref);
    final prefs = await _store;
    final target = prefs.getInt(_kWeeklyTargetKey) ?? kDefaultWeeklyTarget;
    final raw = prefs.getString('$_kWeeklyPrefix$weekKey');

    if (raw == null) {
      return WeeklyGoal(
          week: weekKey, targetCount: target, completedCount: 0);
    }

    return WeeklyGoal.fromJson(raw).copyWith(targetCount: target);
  }

  /// 获取连续训练天数信息。
  Future<StreakInfo> getStreakInfo() async {
    final prefs = await _store;
    final raw = prefs.getString(_kStreakKey);
    if (raw == null) {
      return const StreakInfo(currentStreak: 0, longestStreak: 0);
    }
    return StreakInfo.fromJson(raw);
  }

  /// 获取连续天数（快捷方法）
  Future<int> getStreak() async => (await getStreakInfo()).currentStreak;

  /// 判断今日目标是否已达成
  Future<bool> isDailyGoalMet() async {
    final goal = await getDailyProgress();
    return goal.isCompleted;
  }

  /// 判断本周目标是否已达成
  Future<bool> isWeeklyGoalMet() async {
    final goal = await getWeeklyProgress();
    return goal.isCompleted;
  }

  // ── 目标配置 ──────────────────────────────

  /// 设置每日目标次数（持久化，立即生效）
  Future<void> setDailyTarget(int target) async {
    assert(target > 0, 'dailyTarget 必须大于 0');
    final prefs = await _store;
    await prefs.setInt(_kDailyTargetKey, target);
    debugPrint('GoalManager: 每日目标更新为 $target 次');
  }

  /// 设置每周目标次数（持久化，立即生效）
  Future<void> setWeeklyTarget(int target) async {
    assert(target > 0, 'weeklyTarget 必须大于 0');
    final prefs = await _store;
    await prefs.setInt(_kWeeklyTargetKey, target);
    debugPrint('GoalManager: 每周目标更新为 $target 次');
  }

  /// 获取当前每日目标值
  Future<int> getDailyTarget() async {
    final prefs = await _store;
    return prefs.getInt(_kDailyTargetKey) ?? kDefaultDailyTarget;
  }

  /// 获取当前每周目标值
  Future<int> getWeeklyTarget() async {
    final prefs = await _store;
    return prefs.getInt(_kWeeklyTargetKey) ?? kDefaultWeeklyTarget;
  }

  // ── 综合快照 ──────────────────────────────

  /// 一次性读取今日摘要（用于主页展示，减少多次异步调用）
  Future<GoalSnapshot> getSnapshot() async {
    final results = await Future.wait([
      getDailyProgress(),
      getWeeklyProgress(),
      getStreakInfo(),
    ]);
    return GoalSnapshot(
      daily: results[0] as DailyGoal,
      weekly: results[1] as WeeklyGoal,
      streak: results[2] as StreakInfo,
    );
  }

  // ── 清除数据（调试 / 重置用）─────────────

  Future<void> resetAll() async {
    final prefs = await _store;
    final keys = prefs.getKeys().where(
          (k) =>
              k.startsWith(_kDailyPrefix) ||
              k.startsWith(_kWeeklyPrefix) ||
              k == _kStreakKey,
        );
    for (final k in keys) {
      await prefs.remove(k);
    }
    debugPrint('GoalManager: 所有目标数据已清除');
  }

  // ── Streak 计算（纯函数，可独立单测）──────

  /// 根据上一次 streak 状态和今日日期重新计算连续天数。
  ///
  /// 规则：
  /// - 今天已记录 → 不变
  /// - 昨天有记录 → streak + 1
  /// - 其他情况  → streak 重置为 1（新的连续开始）
  static StreakInfo _recalcStreak(StreakInfo prev, String today) {
    final last = prev.lastTrainingDate;

    if (last == today) {
      // 今天已计入，直接返回
      return prev;
    }

    final yesterday = _dateKey(DateTime.parse(today)
        .subtract(const Duration(days: 1)));

    final int newCurrent;
    if (last == yesterday) {
      newCurrent = prev.currentStreak + 1;
    } else {
      newCurrent = 1;
    }

    final newLongest =
        newCurrent > prev.longestStreak ? newCurrent : prev.longestStreak;

    return StreakInfo(
      currentStreak: newCurrent,
      longestStreak: newLongest,
      lastTrainingDate: today,
    );
  }

  // ── 日期工具 ──────────────────────────────

  /// YYYY-MM-DD
  static String _dateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  /// 返回所在周的周一日期（YYYY-MM-DD），作为周键
  static String _weekKey(DateTime d) {
    final monday = d.subtract(Duration(days: d.weekday - 1));
    return _dateKey(monday);
  }

  // ── 私有持久化 ────────────────────────────

  Future<void> _saveDailyGoal(DailyGoal goal) async {
    final prefs = await _store;
    await prefs.setString('$_kDailyPrefix${goal.date}', goal.toJson());
  }

  Future<void> _saveWeeklyGoal(WeeklyGoal goal) async {
    final prefs = await _store;
    await prefs.setString('$_kWeeklyPrefix${goal.week}', goal.toJson());
  }

  Future<void> _saveStreakInfo(StreakInfo info) async {
    final prefs = await _store;
    await prefs.setString(_kStreakKey, info.toJson());
  }
}

// ─────────────────────────────────────────────────────────────
//  GoalSnapshot — 一次性快照，用于 UI 展示
// ─────────────────────────────────────────────────────────────

class GoalSnapshot {
  final DailyGoal daily;
  final WeeklyGoal weekly;
  final StreakInfo streak;

  const GoalSnapshot({
    required this.daily,
    required this.weekly,
    required this.streak,
  });

  bool get isDailyDone => daily.isCompleted;
  bool get isWeeklyDone => weekly.isCompleted;
  int get currentStreak => streak.currentStreak;

  @override
  String toString() =>
      'GoalSnapshot(daily: $daily, weekly: $weekly, streak: $streak)';
}
