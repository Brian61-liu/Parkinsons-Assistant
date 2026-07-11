import '../models/home_dashboard_snapshot.dart';
import '../models/training_item.dart';
import 'database_service.dart';
import 'medication_reminder_service.dart';

/// 聚合主页 Dashboard 所需数据，一次 await 加载完。
class HomeDashboardService {
  HomeDashboardService({
    DatabaseService? db,
    MedicationReminderService? medicationService,
  })  : _db = db ?? DatabaseService(),
        _med = medicationService ?? MedicationReminderService();

  final DatabaseService _db;
  final MedicationReminderService _med;

  Future<HomeDashboardSnapshot> load() async {
    final results = await Future.wait([
      _db.getTrainingRecords(type: TrainingType.voice.key, limit: 1),
      _db.getTrainingRecords(type: TrainingType.hand.key, limit: 1),
      _db.getAllMovementTrainingRecords(),
      _db.getAllTremorRecords(),
      _db.getTrainingRecords(limit: 30),
      _med.isFeatureEnabled(),
    ]);

    final voiceRecords = results[0] as List;
    final handRecords = results[1] as List;
    final motionRecords = results[2] as List;
    final tremorRecords = results[3] as List;
    final allRecords = results[4] as List;
    final medEnabled = results[5] as bool;

    // ── 语音卡片 ──────────────────────────────────────────
    TrainingActivityItem? lastVoice;
    if (voiceRecords.isNotEmpty) {
      final r = voiceRecords.first;
      lastVoice = TrainingActivityItem(
        timestamp: r.timestamp,
        durationSeconds: _trainingDurationInSeconds(r.duration),
      );
    }

    // ── 手部卡片（优先用 training_records hand，fallback tremor_records） ──
    TrainingActivityItem? lastHand;
    if (handRecords.isNotEmpty) {
      final r = handRecords.first;
      lastHand = TrainingActivityItem(
        timestamp: r.timestamp,
        durationSeconds: _trainingDurationInSeconds(r.duration),
      );
    } else if (tremorRecords.isNotEmpty) {
      final r = tremorRecords.first;
      lastHand = TrainingActivityItem(
        timestamp: r.timestamp,
        durationSeconds: r.duration, // tremor_records.duration 已是秒
      );
    }

    // ── 肢体卡片 ─────────────────────────────────────────
    MovementActivityItem? lastMotion;
    if (motionRecords.isNotEmpty) {
      final r = motionRecords.first;
      lastMotion = MovementActivityItem(
        timestamp: r.timestamp,
        durationSeconds: r.duration,
        successCount: r.successCount,
        targetCount: r.targetCount,
      );
    }

    // ── 用药下次提醒 ──────────────────────────────────────
    String? nextMed;
    if (medEnabled) {
      final items = await _med.getTodayItems();
      final now = DateTime.now();
      for (final item in items) {
        if (item.isTaken) continue;
        final (h, m) = MedicationReminderService.parseTime(item.reminder.timeHhmm);
        final t = DateTime(now.year, now.month, now.day, h, m);
        if (t.isAfter(now)) {
          nextMed = item.reminder.timeHhmm;
          break;
        }
      }
    }

    // ── Training Streak ───────────────────────────────────
    final streak = await _computeStreak();

    // ── 最近 3 条活动 ────────────────────────────────────
    final recent = _buildRecentActivities(
      allRecords: allRecords,
      motionRecords: motionRecords,
      tremorRecords: tremorRecords,
    );

    return HomeDashboardSnapshot(
      trainingStreakDays: streak,
      lastVoice: lastVoice,
      lastHand: lastHand,
      lastMotion: lastMotion,
      nextMedicationTime: nextMed,
      medicationEnabled: medEnabled,
      recentActivities: recent,
    );
  }

  // ── Streak：合并三类记录，按自然日去重后从今天往回数连续天数 ──
  Future<int> _computeStreak() async {
    final voice = await _db.getTrainingRecords(limit: 90);
    final tremor = await _db.getAllTremorRecords();
    final motion = await _db.getAllMovementTrainingRecords();

    final days = <String>{};
    for (final r in voice) {
      days.add(r.date);
    }
    for (final r in tremor) {
      days.add(_dateKey(r.timestamp));
    }
    for (final r in motion) {
      days.add(_dateKey(r.timestamp));
    }

    int streak = 0;
    var day = DateTime.now();
    while (true) {
      if (!days.contains(_dateKey(day))) break;
      streak++;
      day = day.subtract(const Duration(days: 1));
      if (streak > 365) break;
    }
    return streak;
  }

  List<RecentActivityItem> _buildRecentActivities({
    required List allRecords,
    required List motionRecords,
    required List tremorRecords,
  }) {
    final items = <RecentActivityItem>[];

    for (final r in allRecords) {
      if (r.type == TrainingType.voice) {
        items.add(RecentActivityItem(
          type: ActivityType.voice,
          timestamp: r.timestamp,
          durationSeconds: _trainingDurationInSeconds(r.duration),
        ));
      } else if (r.type == TrainingType.hand) {
        items.add(RecentActivityItem(
          type: ActivityType.hand,
          timestamp: r.timestamp,
          durationSeconds: _trainingDurationInSeconds(r.duration),
        ));
      }
    }

    for (final r in tremorRecords) {
      items.add(RecentActivityItem(
        type: ActivityType.hand,
        timestamp: r.timestamp,
        durationSeconds: r.duration,
      ));
    }

    for (final r in motionRecords) {
      items.add(RecentActivityItem(
        type: ActivityType.motion,
        timestamp: r.timestamp,
        durationSeconds: r.duration,
        successCount: r.successCount,
        targetCount: r.targetCount,
      ));
    }

    items.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return items.take(3).toList();
  }

  /// training_records.duration 字段注释写"分钟"，但实际写入时 TrainingScoreService
  /// 传的是秒，统一视为秒处理，超过 3600 才截断。
  int? _trainingDurationInSeconds(int? d) {
    if (d == null) return null;
    return d;
  }

  static String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-'
      '${dt.day.toString().padLeft(2, '0')}';
}
