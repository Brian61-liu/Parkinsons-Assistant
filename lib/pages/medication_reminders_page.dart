import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/medication_reminder.dart';
import '../services/medication_reminder_service.dart';
import '../utils/gentle_page_route.dart';
import '../utils/medication_disclaimer.dart';
import 'medication_reminder_edit_page.dart';

class MedicationRemindersPage extends StatefulWidget {
  const MedicationRemindersPage({super.key});

  @override
  State<MedicationRemindersPage> createState() =>
      _MedicationRemindersPageState();
}

class _MedicationRemindersPageState extends State<MedicationRemindersPage> {
  final _service = MedicationReminderService();
  List<MedicationReminder> _reminders = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final list = await _service.getAllReminders();
    if (mounted) {
      setState(() {
        _reminders = list;
        _loading = false;
      });
    }
  }

  Future<void> _addReminder() async {
    final ok = await ensureMedicationDisclaimer(context, _service);
    if (!ok || !mounted) return;
    final saved = await pushGentle<bool>(
      context,
      const MedicationReminderEditPage(),
    );
    if (saved == true) _load();
  }

  Future<void> _editReminder(MedicationReminder reminder) async {
    final saved = await pushGentle<bool>(
      context,
      MedicationReminderEditPage(existing: reminder),
    );
    if (saved == true) _load();
  }

  Future<void> _deleteReminder(MedicationReminder reminder) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l10n.medicationDeleteReminder),
        content: Text(l10n.medicationDeleteReminderConfirm),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
    if (confirmed != true || reminder.id == null) return;
    await _service.deleteReminder(reminder.id!);
    _load();
  }

  Future<void> _closeFeature() async {
    final l10n = AppLocalizations.of(context)!;
    final action = await showCupertinoDialog<String>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l10n.medicationClose),
        content: Text(l10n.medicationCloseConfirm),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, 'hide'),
            child: Text(l10n.medicationCloseHideOnly),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(ctx, 'delete'),
            child: Text(l10n.medicationCloseAndDelete),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, 'cancel'),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
    if (action == null || action == 'cancel') return;
    await _service.disableFeature(deleteAllData: action == 'delete');
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: AppBar(
        title: Text(l10n.medicationManage),
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: _reminders.isEmpty
                      ? Center(
                          child: Text(
                            l10n.medicationNoReminders,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: _reminders.length,
                          itemBuilder: (context, index) {
                            final r = _reminders[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                minVerticalPadding: 12,
                                title: Text(
                                  r.label,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(r.timeHhmm),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CupertinoSwitch(
                                      value: r.enabled,
                                      onChanged: (v) async {
                                        if (r.id != null) {
                                          await _service.setReminderEnabled(
                                            r.id!,
                                            v,
                                          );
                                          _load();
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(CupertinoIcons.pencil),
                                      onPressed: () => _editReminder(r),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        CupertinoIcons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _deleteReminder(r),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: _addReminder,
                      icon: const Icon(CupertinoIcons.add),
                      label: Text(l10n.medicationAdd),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: _closeFeature,
                      child: Text(
                        l10n.medicationClose,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
