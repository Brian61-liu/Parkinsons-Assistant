import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../models/hand_practice_mode.dart';
import '../services/training_score_service.dart';
import '../theme/app_colors.dart';

/// 手部引导练习：持物稳定 / 对指（无物体或相机检测）。
class HandGuidedPracticePage extends StatefulWidget {
  const HandGuidedPracticePage({
    super.key,
    required this.mode,
  }) : assert(
          mode == HandPracticeMode.objectHold ||
              mode == HandPracticeMode.fineMotor,
        );

  final HandPracticeMode mode;

  @override
  State<HandGuidedPracticePage> createState() => _HandGuidedPracticePageState();
}

class _HandGuidedPracticePageState extends State<HandGuidedPracticePage> {
  static const Color _primary = Color(0xFF0EA5E9);
  static const int _objectHoldSeconds = 20;
  static const int _fineMotorTargetCycles = 5;

  bool _running = false;
  bool _completed = false;
  int _remaining = _objectHoldSeconds;
  int _cycles = 0;
  DateTime? _startedAt;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _finish({required int completedSteps, required int target}) async {
    _timer?.cancel();
    final duration = _startedAt == null
        ? 1
        : DateTime.now().difference(_startedAt!).inSeconds.clamp(1, 3600);
    await TrainingScoreService().recordHandGuided(
      completedSteps: completedSteps,
      targetSteps: target,
      durationSeconds: duration,
    );
    if (!mounted) return;
    setState(() {
      _running = false;
      _completed = true;
    });
  }

  void _startObjectHold() {
    setState(() {
      _running = true;
      _completed = false;
      _remaining = _objectHoldSeconds;
      _startedAt = DateTime.now();
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_remaining <= 1) {
        timer.cancel();
        unawaited(
          _finish(completedSteps: 1, target: 1),
        );
        return;
      }
      setState(() => _remaining -= 1);
    });
  }

  void _markFineMotorCycle() {
    if (_completed) return;
    _startedAt ??= DateTime.now();
    HapticFeedback.selectionClick();
    final next = _cycles + 1;
    setState(() {
      _running = true;
      _cycles = next;
    });
    if (next >= _fineMotorTargetCycles) {
      unawaited(
        _finish(
          completedSteps: next,
          target: _fineMotorTargetCycles,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isObject = widget.mode == HandPracticeMode.objectHold;
    final title =
        isObject ? l10n.handModeObjectHold : l10n.handModeFineMotor;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: _primary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1E3A5F),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _completed
            ? _buildCompleted(l10n)
            : (isObject ? _buildObjectHold(l10n) : _buildFineMotor(l10n)),
      ),
    );
  }

  Widget _buildCompleted(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _primary.withValues(alpha: 0.12),
            ),
            child: const Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: _primary,
              size: 52,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.handGuidedCompleteTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.handGuidedCompleteBody,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
              height: 1.4,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: CupertinoButton(
              color: _primary,
              borderRadius: BorderRadius.circular(14),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.voiceFinishButton,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectHold(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        children: [
          Text(
            l10n.handObjectHoldInstruction,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF475569),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.handGuidedDisclaimer,
            style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
          ),
          const Spacer(),
          if (_running) ...[
            Text(
              '$_remaining',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: _primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.handObjectHoldRunning,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E3A5F),
              ),
            ),
          ] else
            Icon(
              CupertinoIcons.cube,
              size: 72,
              color: _primary.withValues(alpha: 0.7),
            ),
          const Spacer(),
          if (!_running)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: CupertinoButton(
                color: _primary,
                borderRadius: BorderRadius.circular(14),
                onPressed: _startObjectHold,
                child: Text(
                  l10n.handObjectHoldStart,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFineMotor(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      child: Column(
        children: [
          Text(
            l10n.handFineMotorInstruction,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF475569),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.handGuidedDisclaimer,
            style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
          ),
          const Spacer(),
          Text(
            l10n.handFineMotorProgress(_cycles, _fineMotorTargetCycles),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: List.generate(_fineMotorTargetCycles, (i) {
              final done = i < _cycles;
              return Icon(
                done
                    ? CupertinoIcons.checkmark_circle_fill
                    : CupertinoIcons.circle,
                color: done ? _primary : Colors.grey.shade400,
                size: 28,
              );
            }),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: CupertinoButton(
              color: _primary,
              borderRadius: BorderRadius.circular(14),
              onPressed: _markFineMotorCycle,
              child: Text(
                l10n.handFineMotorMarkCycle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
