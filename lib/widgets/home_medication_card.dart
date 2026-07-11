import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/medication_check_in.dart';
import '../services/medication_reminder_service.dart';
import '../utils/gentle_page_route.dart';
import '../utils/medication_disclaimer.dart';
import '../pages/medication_reminders_page.dart';
import '../pages/medication_reminder_edit_page.dart';

/// 主页用药清单卡片：本地清单 + 手动打卡；默认功能关闭。
class HomeMedicationCard extends StatefulWidget {
  final VoidCallback? onStateChanged;

  const HomeMedicationCard({super.key, this.onStateChanged});

  @override
  State<HomeMedicationCard> createState() => _HomeMedicationCardState();
}

class _HomeMedicationCardState extends State<HomeMedicationCard> {
  static const Color _accent = Color(0xFFF59E0B);

  final _service = MedicationReminderService();
  bool _enabled = false;
  bool _collapsed = false;
  List<MedicationTodayItem> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final enabled = await _service.isFeatureEnabled();
    final collapsed = await _service.isCardCollapsed();
    List<MedicationTodayItem> items = [];
    if (enabled) {
      items = await _service.getTodayItems();
    }
    if (mounted) {
      setState(() {
        _enabled = enabled;
        _collapsed = collapsed;
        _items = items;
        _loading = false;
      });
    }
  }

  Future<void> _enableFeature() async {
    final ok = await showMedicationDisclaimerDialog(context, _service);
    if (ok && mounted) {
      await _refresh();
      widget.onStateChanged?.call();
    }
  }

  Future<void> _openManage() async {
    final changed = await pushGentle<bool>(
      context,
      const MedicationRemindersPage(),
    );
    if (changed == true || mounted) {
      await _refresh();
      widget.onStateChanged?.call();
    }
  }

  Future<void> _addFirstReminder() async {
    final ok = await ensureMedicationDisclaimer(context, _service);
    if (!ok || !mounted) return;
    final saved = await pushGentle<bool>(
      context,
      const MedicationReminderEditPage(),
    );
    if (saved == true) {
      await _refresh();
      widget.onStateChanged?.call();
    }
  }

  Future<void> _toggleCollapsed() async {
    final next = !_collapsed;
    await _service.setCardCollapsed(next);
    setState(() => _collapsed = next);
  }

  Future<void> _checkIn(MedicationTodayItem item) async {
    await _service.checkIn(item.reminder);
    await _refresh();
  }

  Future<void> _undoCheckIn(MedicationTodayItem item) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showCupertinoDialog<bool>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(l10n.medicationUndo),
        content: Text(l10n.medicationUndoConfirm),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.confirm),
          ),
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _service.undoCheckIn(item.reminder);
    await _refresh();
  }

  String _formatCheckedTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const SizedBox.shrink();
    }

    final l10n = AppLocalizations.of(context)!;

    if (!_enabled) {
      return _buildShell(
        child: Semantics(
          button: true,
          label: l10n.medicationListEnable,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _enableFeature,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medication_outlined, color: _accent, size: 22),
                    const SizedBox(width: 10),
                    Text(
                      l10n.medicationListEnable,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    final done = _items.where((i) => i.isTaken).length;
    final total = _items.length;

    if (_collapsed) {
      return _buildShell(
        child: Semantics(
          button: true,
          expanded: false,
          label:
              '${l10n.medicationList}, ${l10n.medicationTodayProgress(done, total)}',
          child: InkWell(
            onTap: _toggleCollapsed,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
              child: Row(
                children: [
                  Icon(Icons.medication_outlined, color: _accent, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${l10n.medicationList} · ${l10n.medicationTodayProgress(done, total)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: l10n.medicationExpand,
                    child: Semantics(
                      button: true,
                      label: l10n.medicationExpand,
                      child: IconButton(
                        onPressed: _toggleCollapsed,
                        icon: const Icon(CupertinoIcons.chevron_down),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return _buildShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.medication_outlined, color: _accent, size: 22),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.medicationList,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
              ),
              TextButton(
                onPressed: _openManage,
                child: Text(l10n.medicationManage),
              ),
              Tooltip(
                message: l10n.medicationCollapse,
                child: Semantics(
                  button: true,
                  label: l10n.medicationCollapse,
                  child: IconButton(
                    onPressed: _toggleCollapsed,
                    constraints: const BoxConstraints(
                      minWidth: 48,
                      minHeight: 48,
                    ),
                    icon: const Icon(CupertinoIcons.chevron_up),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (_items.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                l10n.medicationEmptyToday,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            )
          else
            ..._items.map(_buildTodayRow),
          const SizedBox(height: 8),
          if (_items.isEmpty)
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: _addFirstReminder,
                child: Text(l10n.medicationAdd),
              ),
            ),
          Text(
            l10n.medicationTodayProgress(done, total),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayRow(MedicationTodayItem item) {
    final l10n = AppLocalizations.of(context)!;
    final r = item.reminder;
    final semanticsLabel = item.isTaken
        ? '${r.label}, ${r.timeHhmm}, ${l10n.medicationTaken}'
        : '${r.label}, ${r.timeHhmm}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Semantics(
        label: semanticsLabel,
        child: Row(
          children: [
            SizedBox(
              width: 56,
              child: Text(
                r.timeHhmm,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E3A5F),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r.label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (item.isTaken && item.checkedAt != null)
                    Text(
                      l10n.medicationCompletedAt(
                        _formatCheckedTime(item.checkedAt!),
                      ),
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
            if (item.isTaken)
              TextButton(
                onPressed: () => _undoCheckIn(item),
                child: Text(l10n.medicationUndo),
              )
            else
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: () => _checkIn(item),
                  style: FilledButton.styleFrom(
                    backgroundColor: _accent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: Text(l10n.medicationTaken),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildShell({required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _accent.withValues(alpha: 0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: child,
    );
  }
}
