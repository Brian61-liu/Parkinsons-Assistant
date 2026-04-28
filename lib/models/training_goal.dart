import 'dart:convert';

// ─────────────────────────────────────────────────────────────
//  DailyGoal — 每日训练目标
// ─────────────────────────────────────────────────────────────

class DailyGoal {
  /// 日期，格式 YYYY-MM-DD
  final String date;

  /// 目标完成训练次数
  final int targetCount;

  /// 已完成次数
  final int completedCount;

  const DailyGoal({
    required this.date,
    required this.targetCount,
    required this.completedCount,
  });

  // ── 派生属性 ───────────────────────────────

  bool get isCompleted => completedCount >= targetCount;

  /// 完成进度 0.0–1.0（超过目标时仍返回 1.0）
  double get progress =>
      targetCount == 0 ? 0 : (completedCount / targetCount).clamp(0.0, 1.0);

  /// 还需完成多少次
  int get remaining => (targetCount - completedCount).clamp(0, targetCount);

  // ── 不可变更新 ─────────────────────────────

  DailyGoal increment() => copyWith(completedCount: completedCount + 1);

  DailyGoal copyWith({
    String? date,
    int? targetCount,
    int? completedCount,
  }) {
    return DailyGoal(
      date: date ?? this.date,
      targetCount: targetCount ?? this.targetCount,
      completedCount: completedCount ?? this.completedCount,
    );
  }

  // ── 序列化 ────────────────────────────────

  Map<String, dynamic> toMap() => {
        'date': date,
        'targetCount': targetCount,
        'completedCount': completedCount,
      };

  factory DailyGoal.fromMap(Map<String, dynamic> m) => DailyGoal(
        date: m['date'] as String,
        targetCount: m['targetCount'] as int,
        completedCount: m['completedCount'] as int,
      );

  String toJson() => jsonEncode(toMap());

  factory DailyGoal.fromJson(String source) =>
      DailyGoal.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DailyGoal(date: $date, $completedCount/$targetCount, done: $isCompleted)';
}

// ─────────────────────────────────────────────────────────────
//  WeeklyGoal — 每周训练目标
// ─────────────────────────────────────────────────────────────

class WeeklyGoal {
  /// 周标识，格式为本周周一的日期 YYYY-MM-DD
  final String week;

  /// 目标完成训练次数
  final int targetCount;

  /// 已完成次数
  final int completedCount;

  /// 本周有训练记录的天数（用于展示活跃天）
  final Set<String> activeDays;

  const WeeklyGoal({
    required this.week,
    required this.targetCount,
    required this.completedCount,
    Set<String>? activeDays,
  }) : activeDays = activeDays ?? const {};

  // ── 派生属性 ───────────────────────────────

  bool get isCompleted => completedCount >= targetCount;

  double get progress =>
      targetCount == 0 ? 0 : (completedCount / targetCount).clamp(0.0, 1.0);

  int get remaining => (targetCount - completedCount).clamp(0, targetCount);

  int get activeDayCount => activeDays.length;

  // ── 不可变更新 ─────────────────────────────

  WeeklyGoal increment(String date) => copyWith(
        completedCount: completedCount + 1,
        activeDays: {...activeDays, date},
      );

  WeeklyGoal copyWith({
    String? week,
    int? targetCount,
    int? completedCount,
    Set<String>? activeDays,
  }) {
    return WeeklyGoal(
      week: week ?? this.week,
      targetCount: targetCount ?? this.targetCount,
      completedCount: completedCount ?? this.completedCount,
      activeDays: activeDays ?? this.activeDays,
    );
  }

  // ── 序列化 ────────────────────────────────

  Map<String, dynamic> toMap() => {
        'week': week,
        'targetCount': targetCount,
        'completedCount': completedCount,
        'activeDays': activeDays.toList(),
      };

  factory WeeklyGoal.fromMap(Map<String, dynamic> m) => WeeklyGoal(
        week: m['week'] as String,
        targetCount: m['targetCount'] as int,
        completedCount: m['completedCount'] as int,
        activeDays: Set<String>.from(
            (m['activeDays'] as List<dynamic>).cast<String>()),
      );

  String toJson() => jsonEncode(toMap());

  factory WeeklyGoal.fromJson(String source) =>
      WeeklyGoal.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'WeeklyGoal(week: $week, $completedCount/$targetCount, '
      'activeDays: $activeDayCount)';
}

// ─────────────────────────────────────────────────────────────
//  StreakInfo — 连续训练天数信息
// ─────────────────────────────────────────────────────────────

class StreakInfo {
  /// 当前连续训练天数
  final int currentStreak;

  /// 历史最长连续天数
  final int longestStreak;

  /// 最后一次训练日期（YYYY-MM-DD），null 表示从未训练
  final String? lastTrainingDate;

  const StreakInfo({
    required this.currentStreak,
    required this.longestStreak,
    this.lastTrainingDate,
  });

  bool get hasTrainedToday {
    if (lastTrainingDate == null) return false;
    final now = DateTime.now();
    final today =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return lastTrainingDate == today;
  }

  Map<String, dynamic> toMap() => {
        'currentStreak': currentStreak,
        'longestStreak': longestStreak,
        'lastTrainingDate': lastTrainingDate,
      };

  factory StreakInfo.fromMap(Map<String, dynamic> m) => StreakInfo(
        currentStreak: m['currentStreak'] as int,
        longestStreak: m['longestStreak'] as int,
        lastTrainingDate: m['lastTrainingDate'] as String?,
      );

  String toJson() => jsonEncode(toMap());

  factory StreakInfo.fromJson(String source) =>
      StreakInfo.fromMap(jsonDecode(source) as Map<String, dynamic>);

  StreakInfo copyWith({
    int? currentStreak,
    int? longestStreak,
    String? lastTrainingDate,
  }) {
    return StreakInfo(
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lastTrainingDate: lastTrainingDate ?? this.lastTrainingDate,
    );
  }

  @override
  String toString() =>
      'StreakInfo(current: $currentStreak, longest: $longestStreak, '
      'lastDate: $lastTrainingDate)';
}
