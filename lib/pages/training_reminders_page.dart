import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../services/medication_reminder_service.dart';
import '../services/training_reminder_service.dart';
import '../theme/app_colors.dart';

/// 训练提醒设置：本机通知，可关，错过不惩罚。
class TrainingRemindersPage extends StatefulWidget {
  const TrainingRemindersPage({super.key});

  @override
  State<TrainingRemindersPage> createState() => _TrainingRemindersPageState();
}

class _TrainingRemindersPageState extends State<TrainingRemindersPage> {
  final _service = TrainingReminderService();
  TrainingReminderSettings _settings = const TrainingReminderSettings(
    enabled: false,
    times: ['09:00', '16:00'],
    quietWeekends: false,
  );
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    _service.setCopy(
      title: l10n.trainingReminderTitle,
      body: l10n.trainingReminderBody,
    );
  }

  Future<void> _load() async {
    final settings = await _service.load();
    if (!mounted) return;
    setState(() {
      _settings = settings;
      _loading = false;
    });
  }

  Future<void> _persist() async {
    final wantedOn = _settings.enabled;
    await _service.save(_settings);
    final loaded = await _service.load();
    if (!mounted) return;
    setState(() => _settings = loaded);
    if (wantedOn && !loaded.enabled) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.trainingReminderPermissionDenied)),
      );
    }
  }

  Future<void> _pickTime(int index) async {
    final (h, m) = MedicationReminderService.parseTime(_settings.times[index]);
    final picked = await _showTimePicker(TimeOfDay(hour: h, minute: m));
    if (picked == null) return;
    final hhmm = MedicationReminderService.formatTime(
      picked.hour,
      picked.minute,
    );
    final next = [..._settings.times];
    next[index] = hhmm;
    setState(() {
      _settings = TrainingReminderSettings(
        enabled: _settings.enabled,
        times: next,
        quietWeekends: _settings.quietWeekends,
      );
    });
    await _persist();
  }

  Future<TimeOfDay?> _showTimePicker(TimeOfDay initial) async {
    var selected = initial;
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final ok = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (ctx) {
        return Container(
          height: 280,
          color: Colors.white,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: Text(l10n.cancel),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: Text(l10n.confirm),
                    ),
                  ],
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime(
                      now.year,
                      now.month,
                      now.day,
                      initial.hour,
                      initial.minute,
                    ),
                    use24hFormat: MediaQuery.alwaysUse24HourFormatOf(context),
                    onDateTimeChanged: (dateTime) {
                      selected = TimeOfDay(
                        hour: dateTime.hour,
                        minute: dateTime.minute,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return ok == true ? selected : null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(l10n.trainingReminderPageTitle),
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CupertinoActivityIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              children: [
                Text(
                  l10n.trainingReminderDisclaimer,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64748B),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SwitchListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    title: Text(
                      l10n.trainingReminderEnable,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                    value: _settings.enabled,
                    activeThumbColor: AppColors.primary,
                    onChanged: (v) async {
                      setState(() {
                        _settings = TrainingReminderSettings(
                          enabled: v,
                          times: _settings.times,
                          quietWeekends: _settings.quietWeekends,
                        );
                      });
                      await _persist();
                    },
                  ),
                ),
                if (_settings.enabled) ...[
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        for (var i = 0; i < _settings.times.length; i++)
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            title: Text(
                              l10n.trainingReminderTimeLabel(i + 1),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF334155),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _settings.times[i],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E3A5F),
                                  ),
                                ),
                                if (_settings.times.length > 1) ...[
                                  const SizedBox(width: 8),
                                  IconButton(
                                    tooltip: l10n.trainingReminderRemoveTime,
                                    onPressed: () async {
                                      final next = [..._settings.times]
                                        ..removeAt(i);
                                      setState(() {
                                        _settings = TrainingReminderSettings(
                                          enabled: _settings.enabled,
                                          times: next,
                                          quietWeekends:
                                              _settings.quietWeekends,
                                        );
                                      });
                                      await _persist();
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.minus_circle,
                                      color: Color(0xFFDC2626),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            onTap: () => _pickTime(i),
                          ),
                        if (_settings.times.length < 2)
                          ListTile(
                            leading: const Icon(
                              CupertinoIcons.add_circled,
                              color: AppColors.primary,
                            ),
                            title: Text(
                              l10n.trainingReminderAddTime,
                              style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () async {
                              setState(() {
                                _settings = TrainingReminderSettings(
                                  enabled: _settings.enabled,
                                  times: [..._settings.times, '16:00'],
                                  quietWeekends: _settings.quietWeekends,
                                );
                              });
                              await _persist();
                            },
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SwitchListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      title: Text(
                        l10n.trainingReminderQuietWeekends,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                      subtitle: Text(
                        l10n.trainingReminderQuietWeekendsHint,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                      value: _settings.quietWeekends,
                      activeThumbColor: AppColors.primary,
                      onChanged: (v) async {
                        setState(() {
                          _settings = TrainingReminderSettings(
                            enabled: _settings.enabled,
                            times: _settings.times,
                            quietWeekends: v,
                          );
                        });
                        await _persist();
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.medicationNotificationPermissionNote,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF94A3B8),
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
    );
  }
}
