import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/medication_reminder.dart';
import '../services/medication_reminder_service.dart';

class MedicationReminderEditPage extends StatefulWidget {
  final MedicationReminder? existing;

  const MedicationReminderEditPage({super.key, this.existing});

  @override
  State<MedicationReminderEditPage> createState() =>
      _MedicationReminderEditPageState();
}

class _MedicationReminderEditPageState extends State<MedicationReminderEditPage> {
  final _service = MedicationReminderService();
  final _labelController = TextEditingController();
  late TimeOfDay _time;

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    if (existing != null) {
      _labelController.text = existing.label;
      final (h, m) = MedicationReminderService.parseTime(existing.timeHhmm);
      _time = TimeOfDay(hour: h, minute: m);
    } else {
      _time = const TimeOfDay(hour: 8, minute: 0);
    }
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  DateTime get _pickerDateTime {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, _time.hour, _time.minute);
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    final label = _labelController.text.trim();
    if (label.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.medicationLabel)),
      );
      return;
    }

    final hhmm = MedicationReminderService.formatTime(_time.hour, _time.minute);

    if (_isEdit) {
      await _service.updateReminder(
        widget.existing!.copyWith(label: label, timeHhmm: hhmm),
      );
    } else {
      await _service.addReminder(label: label, timeHhmm: hhmm);
    }

    if (mounted) Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: AppBar(
        title: Text(_isEdit ? l10n.medicationEdit : l10n.medicationAdd),
        backgroundColor: const Color(0xFF1E3A5F),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              l10n.medicationLabel,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _labelController,
              maxLength: MedicationReminder.maxLabelLength,
              decoration: InputDecoration(
                hintText: l10n.medicationLabelHint,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.medicationTime,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A5F),
              ),
            ),
            const SizedBox(height: 8),
            Semantics(
              label: l10n.medicationTime,
              hint: _time.format(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 216,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF1C1C1E),
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _pickerDateTime,
                      use24hFormat:
                          MediaQuery.alwaysUse24HourFormatOf(context),
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          _time = TimeOfDay(
                            hour: dateTime.hour,
                            minute: dateTime.minute,
                          );
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton(
                onPressed: _save,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFF59E0B),
                ),
                child: Text(l10n.medicationSave),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
