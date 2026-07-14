import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../models/medication_reminder.dart';
import 'medication_reminder_service.dart';

/// 用药清单：本机每日到点通知（无远程推送）。
class MedicationNotificationService {
  MedicationNotificationService._();
  static final MedicationNotificationService instance =
      MedicationNotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  String _title = 'Amplio';
  String Function(String label) _bodyFor = (label) => label;

  /// 由 UI 注入本地化文案（可选；未注入时用标签本身）。
  void setCopy({
    required String title,
    required String Function(String label) bodyFor,
  }) {
    _title = title;
    _bodyFor = bodyFor;
  }

  Future<void> init() async {
    if (_initialized) return;

    tzdata.initializeTimeZones();
    try {
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } catch (e) {
      debugPrint('MedicationNotificationService: timezone fallback: $e');
      tz.setLocalLocation(tz.getLocation('UTC'));
    }

    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      settings: const InitializationSettings(iOS: darwin, macOS: darwin),
    );
    _initialized = true;
    debugPrint('MedicationNotificationService: initialized');
  }

  Future<bool> requestPermission() async {
    await init();
    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    final granted = await ios?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        ) ??
        false;
    debugPrint('MedicationNotificationService: permission=$granted');
    return granted;
  }

  Future<void> cancelReminder(int id) async {
    await init();
    await _plugin.cancel(id: id);
  }

  Future<void> cancelAll() async {
    await init();
    await _plugin.cancelAll();
  }

  Future<void> scheduleDaily(MedicationReminder reminder) async {
    await init();
    final id = reminder.id;
    if (id == null) return;

    await _plugin.cancel(id: id);
    if (!reminder.enabled) return;

    final (hour, minute) = MedicationReminderService.parseTime(reminder.timeHhmm);
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (!scheduled.isAfter(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    const details = NotificationDetails(
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _plugin.zonedSchedule(
      id: id,
      title: _title,
      body: _bodyFor(reminder.label),
      scheduledDate: scheduled,
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'medication:$id',
    );
    debugPrint(
      'MedicationNotificationService: scheduled id=$id at '
      '${reminder.timeHhmm} (next=$scheduled)',
    );
  }

  /// 按功能开关与提醒列表全量同步通知。
  Future<void> syncAll(List<MedicationReminder> reminders,
      {required bool featureEnabled}) async {
    await init();
    await cancelAll();
    if (!featureEnabled) return;
    for (final r in reminders) {
      if (r.enabled && r.id != null) {
        await scheduleDaily(r);
      }
    }
  }
}
