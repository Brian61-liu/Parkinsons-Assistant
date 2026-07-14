import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/medication_reminder.dart';
import '../models/medication_check_in.dart';
import 'database_service.dart';
import 'medication_notification_service.dart';

const String _kFeatureEnabled = 'medication_feature_enabled';
const String _kDisclaimerAcceptedAt = 'medication_disclaimer_accepted_at';
const String _kCardCollapsed = 'medication_card_collapsed';
const String _kAutoPurgeCheckins = 'medication_auto_purge_checkins';

/// 用药清单：本机 SQLite + SharedPreferences UI 状态 + 本地到点通知。
class MedicationReminderService {
  final DatabaseService _db;
  final MedicationNotificationService _notifications;
  SharedPreferences? _prefs;

  MedicationReminderService({
    DatabaseService? databaseService,
    MedicationNotificationService? notificationService,
  })  : _db = databaseService ?? DatabaseService(),
        _notifications =
            notificationService ?? MedicationNotificationService.instance;

  Future<SharedPreferences> get _store async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> isFeatureEnabled() async {
    final prefs = await _store;
    return prefs.getBool(_kFeatureEnabled) ?? false;
  }

  Future<bool> hasAcceptedDisclaimer() async {
    final prefs = await _store;
    return prefs.getString(_kDisclaimerAcceptedAt) != null;
  }

  Future<void> acceptDisclaimerAndEnable() async {
    final prefs = await _store;
    await prefs.setString(
      _kDisclaimerAcceptedAt,
      DateTime.now().toIso8601String(),
    );
    await prefs.setBool(_kFeatureEnabled, true);
    await _notifications.requestPermission();
    await rescheduleNotifications();
    debugPrint('MedicationReminderService: feature enabled');
  }

  Future<void> disableFeature({bool deleteAllData = false}) async {
    final prefs = await _store;
    await prefs.setBool(_kFeatureEnabled, false);
    await prefs.setBool(_kCardCollapsed, false);
    await _notifications.cancelAll();
    if (deleteAllData) {
      await _db.deleteAllMedicationData();
      debugPrint('MedicationReminderService: all medication data deleted');
    }
    debugPrint('MedicationReminderService: feature disabled');
  }

  Future<bool> isCardCollapsed() async {
    final prefs = await _store;
    return prefs.getBool(_kCardCollapsed) ?? false;
  }

  Future<void> setCardCollapsed(bool collapsed) async {
    final prefs = await _store;
    await prefs.setBool(_kCardCollapsed, collapsed);
  }

  Future<bool> isAutoPurgeEnabled() async {
    final prefs = await _store;
    return prefs.getBool(_kAutoPurgeCheckins) ?? true;
  }

  Future<void> maybePurgeOldCheckIns() async {
    if (!await isAutoPurgeEnabled()) return;
    final removed = await _db.purgeMedicationCheckInsOlderThan(90);
    if (removed > 0) {
      debugPrint(
        'MedicationReminderService: purged $removed old check-in rows',
      );
    }
  }

  Future<List<MedicationTodayItem>> getTodayItems() async {
    await maybePurgeOldCheckIns();
    return _db.getTodayMedicationItems();
  }

  Future<List<MedicationReminder>> getAllReminders() async {
    return _db.getAllMedicationReminders();
  }

  Future<int> addReminder({
    required String label,
    required String timeHhmm,
  }) async {
    final reminder = MedicationReminder.create(
      label: label,
      timeHhmm: timeHhmm,
    );
    final id = await _db.insertMedicationReminder(reminder);
    final saved = reminder.copyWith(id: id);
    if (await isFeatureEnabled()) {
      await _notifications.scheduleDaily(saved);
    }
    debugPrint('MedicationReminderService: added reminder id=$id');
    return id;
  }

  Future<void> updateReminder(MedicationReminder reminder) async {
    await _db.updateMedicationReminder(reminder);
    if (await isFeatureEnabled()) {
      await _notifications.scheduleDaily(reminder);
    } else if (reminder.id != null) {
      await _notifications.cancelReminder(reminder.id!);
    }
    debugPrint('MedicationReminderService: updated reminder id=${reminder.id}');
  }

  Future<void> deleteReminder(int id) async {
    await _db.deleteMedicationReminder(id);
    await _notifications.cancelReminder(id);
    debugPrint('MedicationReminderService: deleted reminder id=$id');
  }

  Future<void> setReminderEnabled(int id, bool enabled) async {
    final all = await _db.getAllMedicationReminders();
    final match = all.where((r) => r.id == id).firstOrNull;
    if (match == null) return;
    final updated = match.copyWith(enabled: enabled);
    await _db.updateMedicationReminder(updated);
    if (await isFeatureEnabled()) {
      await _notifications.scheduleDaily(updated);
    }
  }

  Future<void> checkIn(MedicationReminder reminder) async {
    final today = _todayKey();
    await _db.checkInMedication(
      reminderId: reminder.id!,
      scheduledDate: today,
      scheduledTime: reminder.timeHhmm,
    );
    debugPrint(
      'MedicationReminderService: check-in reminderId=${reminder.id}',
    );
  }

  Future<void> undoCheckIn(MedicationReminder reminder) async {
    final today = _todayKey();
    await _db.undoMedicationCheckIn(
      reminderId: reminder.id!,
      scheduledDate: today,
      scheduledTime: reminder.timeHhmm,
    );
    debugPrint(
      'MedicationReminderService: undo check-in reminderId=${reminder.id}',
    );
  }

  Future<void> deleteAllMedicationData() async {
    await _notifications.cancelAll();
    await _db.deleteAllMedicationData();
    debugPrint('MedicationReminderService: deleteAllMedicationData');
  }

  /// 启动或文案变更后，按当前数据重建通知队列。
  Future<void> rescheduleNotifications() async {
    final enabled = await isFeatureEnabled();
    final all = await getAllReminders();
    await _notifications.syncAll(all, featureEnabled: enabled);
  }

  static String _todayKey() {
    final d = DateTime.now();
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-'
        '${d.day.toString().padLeft(2, '0')}';
  }

  /// HH:mm from [TimeOfDay]-like hour/minute.
  static String formatTime(int hour, int minute) =>
      '${hour.toString().padLeft(2, '0')}:'
      '${minute.toString().padLeft(2, '0')}';

  static (int hour, int minute) parseTime(String hhmm) {
    final parts = hhmm.split(':');
    return (int.parse(parts[0]), int.parse(parts[1]));
  }
}
