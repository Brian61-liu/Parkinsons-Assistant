import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/hand_practice_mode.dart';
import '../../models/training_goal.dart';
import '../../models/training_module.dart';
import '../../models/voice_protocol.dart';
import '../../services/goal_manager.dart';
import '../../services/training_module_service.dart';
import '../../services/training_reminder_service.dart';
import '../../theme/app_colors.dart';
import '../../utils/gentle_page_route.dart';
import '../movement_training_page.dart';
import '../tremor_test_page.dart';
import '../training_reminders_page.dart';
import '../voice_training_page.dart';

/// 计划 Tab：展示今日建议任务，并跳转到已有三大训练页。
class PlanTabPage extends StatefulWidget {
  const PlanTabPage({super.key, this.activeTabIndex, this.tabIndex = 1});

  final ValueListenable<int>? activeTabIndex;
  final int tabIndex;

  @override
  State<PlanTabPage> createState() => _PlanTabPageState();
}

class _PlanTabPageState extends State<PlanTabPage> {
  final _moduleService = TrainingModuleService();
  final _goalManager = GoalManager();
  final _reminderService = TrainingReminderService();

  List<ModuleTrainingTask> _tasks = const [];
  DailyGoal? _dailyGoal;
  WeeklyGoal? _weeklyGoal;
  TrainingReminderSettings? _reminder;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    widget.activeTabIndex?.addListener(_onTabChanged);
    _load();
  }

  @override
  void dispose() {
    widget.activeTabIndex?.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (widget.activeTabIndex?.value == widget.tabIndex) {
      _load();
    }
  }

  Future<void> _load() async {
    final tasks = _moduleService.todaysSuggestedTasks(count: 3);
    final results = await Future.wait([
      _goalManager.getDailyProgress(),
      _goalManager.getWeeklyProgress(),
      _reminderService.load(),
    ]);
    if (!mounted) return;
    setState(() {
      _tasks = tasks;
      _dailyGoal = results[0] as DailyGoal;
      _weeklyGoal = results[1] as WeeklyGoal;
      _reminder = results[2] as TrainingReminderSettings;
      _loading = false;
    });
  }

  String _domainLabel(AppLocalizations l10n, TrainingDomain domain) {
    switch (domain) {
      case TrainingDomain.hand:
        return l10n.planDomainHand;
      case TrainingDomain.voice:
        return l10n.planDomainVoice;
      case TrainingDomain.motion:
        return l10n.planDomainMotion;
    }
  }

  Color _domainColor(TrainingDomain domain) {
    switch (domain) {
      case TrainingDomain.hand:
        return const Color(0xFF0EA5E9);
      case TrainingDomain.voice:
        return const Color(0xFF10B981);
      case TrainingDomain.motion:
        return const Color(0xFFF59E0B);
    }
  }

  VoiceProtocol? _voiceProtocolFor(ModuleTrainingTask task) {
    if (task.domain != TrainingDomain.voice) return null;
    switch (task.submodule) {
      case TrainingSubmodule.volume:
        if (task.id.contains('volume_1')) return VoiceProtocol.ladder;
        return VoiceProtocol.multiSet;
      case TrainingSubmodule.clarity:
        return VoiceProtocol.clarity;
      case TrainingSubmodule.fluency:
        return VoiceProtocol.steady;
      default:
        return VoiceProtocol.steady;
    }
  }

  HandPracticeMode _handModeFor(ModuleTrainingTask task) {
    switch (task.submodule) {
      case TrainingSubmodule.objectHold:
        return HandPracticeMode.objectHold;
      case TrainingSubmodule.fineMotor:
        return HandPracticeMode.fineMotor;
      case TrainingSubmodule.staticControl:
      default:
        return HandPracticeMode.stillHold;
    }
  }

  Future<void> _openTask(ModuleTrainingTask task) async {
    final l10n = AppLocalizations.of(context)!;
    Widget page;
    switch (task.domain) {
      case TrainingDomain.hand:
        page = TremorTestPage(initialMode: _handModeFor(task));
      case TrainingDomain.voice:
        page = VoiceTrainingPage(
          initialProtocol: _voiceProtocolFor(task) ?? VoiceProtocol.steady,
        );
      case TrainingDomain.motion:
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.planMotionShelvedNote)));
        }
        page = const MovementTrainingPage();
    }
    await pushGentle(context, page);
    if (mounted) await _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final daily = _dailyGoal;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: _loading
            ? const Center(child: CupertinoActivityIndicator())
            : RefreshIndicator(
                onRefresh: _load,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                  children: [
                    Text(
                      l10n.planTodayTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.planTodaySubtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF64748B),
                        height: 1.35,
                      ),
                    ),
                    if (daily != null) ...[
                      const SizedBox(height: 16),
                      _goalCard(l10n, daily, _weeklyGoal),
                    ],
                    const SizedBox(height: 12),
                    _reminderRow(l10n),
                    const SizedBox(height: 20),
                    if (_tasks.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          l10n.planEmptyHint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      )
                    else
                      ..._tasks.map((task) => _buildTaskCard(l10n, task)),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _goalCard(AppLocalizations l10n, DailyGoal daily, WeeklyGoal? weekly) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            daily.isCompleted
                ? l10n.planGoalCompleted
                : l10n.planGoalProgress(
                    daily.completedCount,
                    daily.targetCount,
                  ),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: daily.progress,
              minHeight: 8,
              backgroundColor: const Color(0xFFE2E8F0),
              color: daily.isCompleted
                  ? const Color(0xFF10B981)
                  : AppColors.primary,
            ),
          ),
          if (weekly != null) ...[
            const SizedBox(height: 8),
            Text(
              l10n.planWeeklyProgress(
                weekly.completedCount,
                weekly.targetCount,
              ),
              style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _reminderRow(AppLocalizations l10n) {
    final reminder = _reminder;
    final subtitle = reminder == null
        ? l10n.planReminderOff
        : (reminder.enabled
              ? l10n.planReminderOn(reminder.timesSummary)
              : l10n.planReminderOff);
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () async {
          await pushGentle(context, const TrainingRemindersPage());
          if (mounted) await _load();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.bell,
                color: Color(0xFFF59E0B),
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_right,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskCard(AppLocalizations l10n, ModuleTrainingTask task) {
    final color = _domainColor(task.domain);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _domainLabel(l10n, task.domain),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${task.duration} min',
                style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            task.description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              color: color,
              borderRadius: BorderRadius.circular(12),
              onPressed: () => _openTask(task),
              child: Text(
                l10n.planOpenTask,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
