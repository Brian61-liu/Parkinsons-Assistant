/// 主页 Dashboard 的一次性数据快照。
/// 由 [HomeDashboardService] 异步加载，传给 HomePage 渲染。
class HomeDashboardSnapshot {
  /// 连续训练天数（含今天），0 = 从未训练
  final int trainingStreakDays;

  /// 最近一次语音训练记录
  final TrainingActivityItem? lastVoice;

  /// 最近一次手部测量记录
  final TrainingActivityItem? lastHand;

  /// 最近一次肢体动作训练记录
  final MovementActivityItem? lastMotion;

  /// 今日下一条未打卡用药提醒时间（HH:mm），null = 无提醒或功能未开启
  final String? nextMedicationTime;

  /// 用药功能是否已开启
  final bool medicationEnabled;

  /// 最近 3 条活动记录（用于历史列表，时间倒序）
  final List<RecentActivityItem> recentActivities;

  const HomeDashboardSnapshot({
    required this.trainingStreakDays,
    this.lastVoice,
    this.lastHand,
    this.lastMotion,
    this.nextMedicationTime,
    required this.medicationEnabled,
    required this.recentActivities,
  });

  static const HomeDashboardSnapshot empty = HomeDashboardSnapshot(
    trainingStreakDays: 0,
    medicationEnabled: false,
    recentActivities: [],
  );
}

// ─────────────────────────────────────────────────────────────
//  单卡数据模型
// ─────────────────────────────────────────────────────────────

/// 语音 / 手部卡片数据
class TrainingActivityItem {
  /// 训练时间
  final DateTime timestamp;

  /// 时长（秒）
  final int? durationSeconds;

  const TrainingActivityItem({
    required this.timestamp,
    this.durationSeconds,
  });
}

/// 肢体动作卡片数据
class MovementActivityItem {
  final DateTime timestamp;
  final int? durationSeconds;
  final int successCount;
  final int targetCount;

  const MovementActivityItem({
    required this.timestamp,
    this.durationSeconds,
    required this.successCount,
    required this.targetCount,
  });
}

// ─────────────────────────────────────────────────────────────
//  最近活动列表条目
// ─────────────────────────────────────────────────────────────

enum ActivityType { voice, hand, motion }

class RecentActivityItem {
  final ActivityType type;
  final DateTime timestamp;
  final int? durationSeconds;

  /// 仅用于 motion
  final int? successCount;
  final int? targetCount;

  const RecentActivityItem({
    required this.type,
    required this.timestamp,
    this.durationSeconds,
    this.successCount,
    this.targetCount,
  });
}
