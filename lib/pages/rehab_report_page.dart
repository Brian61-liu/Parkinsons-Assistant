import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/report.dart';
import '../services/report_service.dart';

class RehabReportPage extends StatefulWidget {
  const RehabReportPage({super.key});

  @override
  State<RehabReportPage> createState() => _RehabReportPageState();
}

class _RehabReportPageState extends State<RehabReportPage> {
  final _reportService = ReportService();
  RehabReport? _report;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final report = await _reportService.generateReport();
      if (mounted) {
        setState(() {
          _report = report;
          _loading = false;
        });
      }
    } catch (e) {
      debugPrint('RehabReportPage: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF4FBFF),
      appBar: AppBar(
        title: Text(l10n.rehabReport),
        backgroundColor: const Color(0xFFF4FBFF),
        foregroundColor: const Color(0xFF1E3A5F),
        elevation: 0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _report == null
              ? Center(child: Text(l10n.reportNoData))
              : RefreshIndicator(
                  onRefresh: _load,
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          l10n.rehabReportDisclaimer,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF3B82F6),
                            height: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _report!.summary,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF334155),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _scoreSection(l10n, _report!.scores),
                      const SizedBox(height: 20),
                      if (_report!.trends.highlights.isNotEmpty)
                        Text(
                          _report!.trends.highlights.first,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF64748B),
                            height: 1.5,
                          ),
                        ),
                      const SizedBox(height: 20),
                      _completionSection(l10n, _report!.completion),
                    ],
                  ),
                ),
    );
  }

  Widget _scoreSection(AppLocalizations l10n, ReportScores scores) {
    final noData = scores.level == '暂无数据';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.reportOverallScore,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E3A5F),
          ),
        ),
        const SizedBox(height: 12),
        if (noData)
          Text(
            l10n.reportNoData,
            style: const TextStyle(color: Color(0xFF64748B)),
          )
        else ...[
          _scoreRow(l10n.handTraining, scores.hand),
          _scoreRow(l10n.voiceTrainingShort, scores.voice),
          _scoreRow(l10n.motionTrainingShort, scores.motion),
          const Divider(height: 24),
          _scoreRow(
            l10n.reportOverallScore,
            scores.overall,
            bold: true,
            trailing: scores.level,
          ),
        ],
      ],
    );
  }

  Widget _scoreRow(
    String label,
    double value, {
    bool bold = false,
    String? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: bold ? 16 : 15,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
                color: const Color(0xFF334155),
              ),
            ),
          ),
          Text(
            value.toStringAsFixed(0),
            style: TextStyle(
              fontSize: bold ? 18 : 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF6366F1),
            ),
          ),
          if (trailing != null) ...[
            const SizedBox(width: 8),
            Text(
              trailing,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _completionSection(
    AppLocalizations l10n,
    ReportCompletion completion,
  ) {
    final dailyPct = (completion.dailyRate * 100).round();
    final weeklyPct = (completion.weeklyRate * 100).round();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.reportDailyProgress(dailyPct),
          style: const TextStyle(fontSize: 15, color: Color(0xFF334155)),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.reportWeeklyProgress(weeklyPct),
          style: const TextStyle(fontSize: 15, color: Color(0xFF334155)),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.reportStreak(completion.streakDays),
          style: const TextStyle(fontSize: 15, color: Color(0xFF334155)),
        ),
      ],
    );
  }
}
