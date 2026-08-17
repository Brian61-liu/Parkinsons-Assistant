import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'medication_notification_service.dart';
import 'medication_reminder_service.dart';

const String kTrainingReminderEnabled = 'training_reminder_enabled';
const String kTrainingReminderTimes = 'training_reminder_times';
const String kTrainingReminderQuietWeekends =
    'training_reminder_quiet_weekends';

/// 训练提醒占用的本机通知 id 段，避开用药 SQLite 自增 id。
const int kTrainingNotifIdMin = 91001;
const int kTrainingNotifIdMax = 91020;

class TrainingReminderSettings {
  final bool enabled;
  final List<String> times;
  final bool quietWeekends;

  const TrainingReminderSettings({
    required this.enabled,
    required this.times,
    required this.quietWeekends,
  });

  String get timesSummary => times.join(' · ');
}

/// 可选的本机训练提醒（每日 1～2 个时刻；可周末静音）。不是治疗计划。
class TrainingReminderService {
  TrainingReminderService({MedicationNotificationService? notifications})
    : _notifications = notifications ?? MedicationNotificationService.instance;

  final MedicationNotificationService _notifications;
  SharedPreferences? _prefs;

  static String _title = 'Amplio Care';
  static String _body = 'A short practice when you can. Missing it is fine.';

  void setCopy({required String title, required String body}) {
    _title = title;
    _body = body;
  }

  Future<SharedPreferences> get _store async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<TrainingReminderSettings> load() async {
    final prefs = await _store;
    final raw = prefs.getString(kTrainingReminderTimes);
    var times = <String>['09:00', '16:00'];
    if (raw != null) {
      try {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          times = decoded.cast<String>().take(2).toList();
        }
      } catch (e) {
        debugPrint('TrainingReminderService: times parse failed: $e');
      }
    }
    if (times.isEmpty) times = ['09:00'];
    return TrainingReminderSettings(
      enabled: prefs.getBool(kTrainingReminderEnabled) ?? false,
      times: times,
      quietWeekends: prefs.getBool(kTrainingReminderQuietWeekends) ?? false,
    );
  }

  Future<void> save(TrainingReminderSettings settings) async {
    final prefs = await _store;
    final times = settings.times.take(2).toList();
    if (times.isEmpty) times.add('09:00');
    await prefs.setBool(kTrainingReminderEnabled, settings.enabled);
    await prefs.setString(kTrainingReminderTimes, jsonEncode(times));
    await prefs.setBool(kTrainingReminderQuietWeekends, settings.quietWeekends);

    if (settings.enabled) {
      final granted = await _notifications.requestPermission();
      if (!granted) {
        await prefs.setBool(kTrainingReminderEnabled, false);
        await _cancelTrainingNotifications();
        debugPrint('TrainingReminderService: permission denied');
        return;
      }
    }
    await reschedule();
  }

  Future<void> reschedule() async {
    final settings = await load();
    await _cancelTrainingNotifications();
    if (!settings.enabled) return;

    if (settings.quietWeekends) {
      var slot = 0;
      for (final hhmm in settings.times) {
        final (hour, minute) = MedicationReminderService.parseTime(hhmm);
        for (
          var weekday = DateTime.monday;
          weekday <= DateTime.friday;
          weekday++
        ) {
          final id = 91011 + slot * 5 + (weekday - 1);
          await _notifications.scheduleZoned(
            id: id,
            title: _title,
            body: _body,
            payload: 'training:$id',
            hour: hour,
            minute: minute,
            match: DateTimeComponents.dayOfWeekAndTime,
            weekday: weekday,
          );
        }
        slot++;
      }
    } else {
      var i = 0;
      for (final hhmm in settings.times) {
        final (hour, minute) = MedicationReminderService.parseTime(hhmm);
        final id = kTrainingNotifIdMin + i;
        await _notifications.scheduleZoned(
          id: id,
          title: _title,
          body: _body,
          payload: 'training:$id',
          hour: hour,
          minute: minute,
        );
        i++;
      }
    }
    debugPrint(
      'TrainingReminderService: scheduled ${settings.times} '
      'quietWeekends=${settings.quietWeekends}',
    );
  }

  Future<void> _cancelTrainingNotifications() async {
    await _notifications.cancelIdRange(
      kTrainingNotifIdMin,
      kTrainingNotifIdMax,
    );
  }
}
