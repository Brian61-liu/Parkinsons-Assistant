import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/assessment_result.dart';
import '../services/database_service.dart';
import '../utils/gentle_page_route.dart';
import '../main.dart';

// ──────────────────────────────────────────────
//  测试步骤定义
// ──────────────────────────────────────────────

enum _Step { ready, handTest, voiceTest, motionTest, result }

class _TestConfig {
  final String key;
  final String title;
  final String instruction;
  final IconData icon;
  final Color color;
  final int durationSeconds;

  const _TestConfig({
    required this.key,
    required this.title,
    required this.instruction,
    required this.icon,
    required this.color,
    required this.durationSeconds,
  });
}

const _tests = [
  _TestConfig(
    key: 'hand',
    title: '手部稳定性测试',
    instruction: '请将手机平放在桌面上，保持静止约 5 秒钟。',
    icon: Icons.back_hand_rounded,
    color: Color(0xFF6366F1),
    durationSeconds: 5,
  ),
  _TestConfig(
    key: 'voice',
    title: '语音清晰度测试',
    instruction: '请用正常音量朗读：\n"今天天气很好，我感觉不错。"',
    icon: Icons.mic_rounded,
    color: Color(0xFF14B8A6),
    durationSeconds: 5,
  ),
  _TestConfig(
    key: 'motion',
    title: '肢体动作测试',
    instruction: '请缓慢伸展双臂，抬起再放下，重复 3 次。',
    icon: Icons.accessibility_new_rounded,
    color: Color(0xFFF59E0B),
    durationSeconds: 6,
  ),
];

// ──────────────────────────────────────────────
//  页面主体
// ──────────────────────────────────────────────

class AssessmentPage extends StatefulWidget {
  final Function(Locale) onLanguageChange;
  final Function(bool)? onGuestModeChanged;

  const AssessmentPage({
    super.key,
    required this.onLanguageChange,
    this.onGuestModeChanged,
  });

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  _Step _step = _Step.ready;
  int _testIndex = 0;
  int _countdown = 0;
  bool _counting = false;

  // 各项模拟评分
  double _handScore = 0;
  double _voiceScore = 0;
  double _motionScore = 0;
  AssessmentResult? _result;

  final DatabaseService _db = DatabaseService();
  final Random _rng = Random();

  // 生成带随机波动的模拟评分（范围40-85，偏向中等水平）
  double _simulateScore() {
    return 40.0 + _rng.nextDouble() * 45.0;
  }

  Future<void> _runTest(_TestConfig cfg) async {
    setState(() {
      _counting = true;
      _countdown = cfg.durationSeconds;
    });

    for (int i = cfg.durationSeconds; i > 0; i--) {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!mounted) return;
      setState(() => _countdown = i - 1);
    }

    final score = _simulateScore();

    if (cfg.key == 'hand') _handScore = score;
    if (cfg.key == 'voice') _voiceScore = score;
    if (cfg.key == 'motion') _motionScore = score;

    setState(() => _counting = false);

    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    if (_testIndex < _tests.length - 1) {
      setState(() {
        _testIndex++;
        _step = [_Step.handTest, _Step.voiceTest, _Step.motionTest][_testIndex];
      });
      _runTest(_tests[_testIndex]);
    } else {
      await _finishAssessment();
    }
  }

  Future<void> _finishAssessment() async {
    final result = AssessmentResult.fromScores(
      timestamp: DateTime.now(),
      handScore: _handScore,
      voiceScore: _voiceScore,
      motionScore: _motionScore,
    );

    await _db.insertAssessmentResult(result);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('assessment_completed', true);

    if (!mounted) return;
    setState(() {
      _result = result;
      _step = _Step.result;
    });
  }

  void _startAssessment() {
    setState(() {
      _step = _Step.handTest;
      _testIndex = 0;
    });
    _runTest(_tests[0]);
  }

  Future<void> _goToMain() async {
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      GentlePageRoute(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AuthGate(onLanguageChange: widget.onLanguageChange),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFF),
      body: SafeArea(
        child: switch (_step) {
          _Step.ready => _ReadyView(onStart: _startAssessment),
          _Step.handTest ||
          _Step.voiceTest ||
          _Step.motionTest =>
            _TestingView(
              cfg: _tests[_testIndex],
              countdown: _countdown,
              counting: _counting,
              testIndex: _testIndex,
              total: _tests.length,
            ),
          _Step.result => _ResultView(
              result: _result!,
              onContinue: _goToMain,
            ),
        },
      ),
    );
  }
}

// ──────────────────────────────────────────────
//  准备页
// ──────────────────────────────────────────────

class _ReadyView extends StatelessWidget {
  final VoidCallback onStart;

  const _ReadyView({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF14B8A6).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment_turned_in_rounded,
              size: 52,
              color: Color(0xFF14B8A6),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            '初始能力评估',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F2942),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '接下来将进行 3 项简短测试\n预计耗时约 2 分钟',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF14B8A6),
              fontWeight: FontWeight.w500,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            '测试内容包括手部稳定性、语音清晰度和肢体动作。\n结果将用于生成您的个人基准评分，请放松进行。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: onStart,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14B8A6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('开始测试'),
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
//  测试中视图
// ──────────────────────────────────────────────

class _TestingView extends StatelessWidget {
  final _TestConfig cfg;
  final int countdown;
  final bool counting;
  final int testIndex;
  final int total;

  const _TestingView({
    required this.cfg,
    required this.countdown,
    required this.counting,
    required this.testIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // 进度指示
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(total, (i) {
              final done = i < testIndex;
              final active = i == testIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: active ? 28 : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: done
                      ? const Color(0xFF10B981)
                      : active
                          ? cfg.color
                          : const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Text(
            '测试 ${testIndex + 1} / $total',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
          ),
          const Spacer(),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: cfg.color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(cfg.icon, size: 60, color: cfg.color),
          ),
          const SizedBox(height: 32),
          Text(
            cfg.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F2942),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            cfg.instruction,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF64748B),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 40),
          if (counting)
            _CountdownRing(countdown: countdown, color: cfg.color)
          else
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
              ),
            ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _CountdownRing extends StatelessWidget {
  final int countdown;
  final Color color;

  const _CountdownRing({required this.countdown, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 4),
      ),
      child: Center(
        child: Text(
          '$countdown',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
//  结果视图
// ──────────────────────────────────────────────

class _ResultView extends StatelessWidget {
  final AssessmentResult result;
  final VoidCallback onContinue;

  const _ResultView({required this.result, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final levelColor = switch (result.level) {
      '高' => const Color(0xFF10B981),
      '中' => const Color(0xFFF59E0B),
      _ => const Color(0xFFEF4444),
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            '评估完成',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F2942),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '以下是您的初始能力评分',
            style: TextStyle(fontSize: 15, color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 28),

          // 综合评分圆圈
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: levelColor.withValues(alpha: 0.12),
              border: Border.all(color: levelColor, width: 3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  result.overallScore.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: levelColor,
                  ),
                ),
                Text(
                  result.level,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: levelColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),

          // 分项评分卡片
          _ScoreCard(
            label: '手部稳定性',
            score: result.handScore,
            icon: Icons.back_hand_rounded,
            color: const Color(0xFF6366F1),
          ),
          const SizedBox(height: 12),
          _ScoreCard(
            label: '语音清晰度',
            score: result.voiceScore,
            icon: Icons.mic_rounded,
            color: const Color(0xFF14B8A6),
          ),
          const SizedBox(height: 12),
          _ScoreCard(
            label: '肢体动作',
            score: result.motionScore,
            icon: Icons.accessibility_new_rounded,
            color: const Color(0xFFF59E0B),
          ),
          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              '评分已保存。随着坚持训练，您的评分将逐渐提升。加油！',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF3B82F6),
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 28),

          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF14B8A6),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('进入 Amplio'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  final String label;
  final double score;
  final IconData icon;
  final Color color;

  const _ScoreCard({
    required this.label,
    required this.score,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final pct = (score / 100).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F2942),
                      ),
                    ),
                    Text(
                      score.toStringAsFixed(0),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: pct,
                    minHeight: 8,
                    backgroundColor: color.withValues(alpha: 0.12),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
