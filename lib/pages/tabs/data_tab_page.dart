import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/report.dart';
import '../../models/training_record.dart';
import '../../services/report_service.dart';
import '../../services/training_analytics_service.dart';
import '../../theme/app_colors.dart';
import '../../utils/gentle_page_route.dart';
import '../rehab_report_page.dart';

/// 数据 Tab：训练趋势摘要 + 进完整康复报告。
class DataTabPage extends StatefulWidget {
  const DataTabPage({super.key});

  @override
  State<DataTabPage> createState() => _DataTabPageState();
}

class _DataTabPageState extends State<DataTabPage> {
  final _reportService = ReportService();
  final _analytics = TrainingAnalyticsService();

  RehabReport? _report;
  List<TrainingRecord> _recent = const [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final results = await Future.wait<dynamic>([
        _reportService.generateReport(),
        _analytics.getRecentHistory(days: 14),
      ]);
      if (!mounted) return;
      final recent = results[1] as List<TrainingRecord>;
      setState(() {
        _report = results[0] as RehabReport;
        _recent = recent.take(12).toList();
        _loading = false;
      });
    } catch (e) {
      debugPrint('DataTabPage: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: _loading
            ? const Center(child: CupertinoActivityIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  setState(() => _loading = true);
                  await _load();
                },
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
                  children: [
                    Text(
                      l10n.dataTabTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.dataTabSubtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF64748B),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.rehabReportDisclaimer,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF94A3B8),
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (_report == null || _report!.scores.level == '暂无数据')
                      _emptyCard(l10n)
                    else ...[
                      _scoresCard(l10n, _report!.scores),
                      const SizedBox(height: 12),
                      _trendsCard(l10n, _report!),
                      const SizedBox(height: 12),
                      _goalsCard(l10n, _report!.completion),
                    ],
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        color: const Color(0xFF6366F1),
                        borderRadius: BorderRadius.circular(12),
                        onPressed: () async {
                          await pushGentle(context, const RehabReportPage());
                          if (mounted) await _load();
                        },
                        child: Text(
                          l10n.dataOpenFullReport,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    if (_recent.isNotEmpty) ...[
                      const SizedBox(height: 28),
                      Text(
                        l10n.dataRecentSessions,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ..._recent.map(_recentTile),
                    ],
                  ],
                ),
              ),
      ),
    );
  }

  Widget _emptyCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        l10n.reportNoData,
        style: const TextStyle(fontSize: 15, color: Color(0xFF64748B)),
      ),
    );
  }

  Widget _scoresCard(AppLocalizations l10n, ReportScores scores) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.reportOverallScore,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _miniScore(l10n.handTraining, scores.hand, const Color(0xFF0EA5E9)),
              _miniScore(l10n.voiceTrainingShort, scores.voice, const Color(0xFF10B981)),
              _miniScore(l10n.motionTrainingShort, scores.motion, const Color(0xFFF59E0B)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${l10n.reportOverallScore}: ${scores.overall.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniScore(String label, double value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value.toStringAsFixed(0),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _trendsCard(AppLocalizations l10n, RehabReport report) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dataTrendsTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 10),
          for (final h in report.trends.highlights.take(3)) ...[
            Text(
              '• $h',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF475569),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 6),
          ],
        ],
      ),
    );
  }

  Widget _goalsCard(AppLocalizations l10n, ReportCompletion completion) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.planGoalProgress(
              completion.dailyCompleted,
              completion.dailyTarget,
            ),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1E3A5F),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.dataStreakDays(completion.streakDays),
            style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
          ),
        ],
      ),
    );
  }

  Widget _recentTile(TrainingRecord record) {
    final l10n = AppLocalizations.of(context)!;
    final label = switch (record.type.key) {
      'hand' => l10n.handTraining,
      'voice' => l10n.voiceTrainingShort,
      'motion' => l10n.motionTrainingShort,
      _ => record.type.key,
    };
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
                Text(
                  record.date,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
          ),
          Text(
            record.score.toStringAsFixed(0),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6366F1),
            ),
          ),
        ],
      ),
    );
  }
}
