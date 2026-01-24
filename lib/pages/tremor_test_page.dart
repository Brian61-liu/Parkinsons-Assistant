import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import '../l10n/app_localizations.dart';
import '../services/sensor_service.dart';
import '../services/database_service.dart';
import '../models/tremor_record.dart';
import '../utils/constants.dart';

class TremorTestPage extends StatefulWidget {
  const TremorTestPage({super.key});

  @override
  State<TremorTestPage> createState() => _TremorTestPageState();
}

class _TremorTestPageState extends State<TremorTestPage> {
  final SensorService _sensorService = SensorService();
  final DatabaseService _databaseService = DatabaseService();

  static const Color _primaryColor = Color(0xFF0EA5E9);
  static const Color _secondaryColor = Color(0xFF10B981);
  static const Color _textPrimary = Color(0xFF1E3A5F);
  static const Color _textSecondary = Color(0xFF64748B);

  bool _isRecording = false;
  int _remainingTime = AppConstants.tremorTestDuration;
  Timer? _timer;
  double _currentFrequency = 0.0;
  double _currentAmplitude = 0.0;
  List<double> _chartData = [];
  bool _hasPermission = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    setState(() => _hasPermission = true);
  }

  Future<void> _startTest() async {
    if (!_hasPermission) {
      await _checkPermission();
      if (!_hasPermission) {
        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.sensorPermissionRequired)),
          );
        }
        return;
      }
    }

    setState(() {
      _isRecording = true;
      _remainingTime = AppConstants.tremorTestDuration;
      _chartData.clear();
      _currentFrequency = 0.0;
      _currentAmplitude = 0.0;
    });

    _sensorService.startRecording();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      _remainingTime--;

      final data = _sensorService.getRecordedData();
      if (data.isNotEmpty) {
        _currentAmplitude = _sensorService.calculateAverageAmplitude(data);
        if (timer.tick % 5 == 0) {
          _currentFrequency = _sensorService.calculateFrequency(data);
        }
        _chartData = data.length > 50 ? data.sublist(data.length - 50) : List.from(data);
      }
      
      setState(() {});
      if (_remainingTime <= 0) _stopTest();
    });
  }

  Future<void> _stopTest() async {
    _timer?.cancel();
    _sensorService.stopRecording();

    final analysis = _sensorService.getDetailedAnalysis();

    if (analysis['status'] == 'success') {
      final frequency = analysis['frequency'] as double;
      final avgAmplitude = analysis['amplitude'] as double;
      final maxAmplitude = analysis['maxAmplitude'] as double;
      final variability = analysis['variability'] as double;
      final severity = analysis['severity'] as String;
      final actualSampleRate = analysis['sampleRate'] as double;
      final dataPoints = analysis['dataPoints'] as int;

      final record = TremorRecord(
        timestamp: DateTime.now(),
        averageFrequency: frequency,
        maxAmplitude: maxAmplitude,
        averageAmplitude: avgAmplitude,
        duration: AppConstants.tremorTestDuration,
        accelerometerData: _sensorService.getRecordedData(),
      );

      await _databaseService.insertTremorRecord(record);

      if (mounted) {
        setState(() {
          _isRecording = false;
          _currentFrequency = frequency;
          _currentAmplitude = avgAmplitude;
        });

        _showDetailedResults(
          frequency: frequency,
          avgAmplitude: avgAmplitude,
          maxAmplitude: maxAmplitude,
          variability: variability,
          severity: severity,
          sampleRate: actualSampleRate,
          dataPoints: dataPoints,
        );
      }
    } else {
      setState(() => _isRecording = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(analysis['message'] ?? '测试失败')),
        );
      }
    }
  }

  void _showDetailedResults({
    required double frequency,
    required double avgAmplitude,
    required double maxAmplitude,
    required double variability,
    required String severity,
    required double sampleRate,
    required int dataPoints,
  }) {
    final l10n = AppLocalizations.of(context)!;

    Color severityColor;
    String severityText;
    IconData severityIcon;

    switch (severity) {
      case 'minimal':
        severityColor = const Color(0xFF10B981);
        severityText = l10n.severityNormal;
        severityIcon = Icons.check_circle;
        break;
      case 'mild':
        severityColor = const Color(0xFF22C55E);
        severityText = l10n.severityMild;
        severityIcon = Icons.info;
        break;
      case 'moderate':
        severityColor = const Color(0xFFF59E0B);
        severityText = l10n.severityModerate;
        severityIcon = Icons.warning;
        break;
      case 'moderateSevere':
        severityColor = const Color(0xFFF97316);
        severityText = l10n.severityModerateSevere;
        severityIcon = Icons.warning_amber;
        break;
      case 'severe':
        severityColor = const Color(0xFFEF4444);
        severityText = l10n.severitySevere;
        severityIcon = Icons.error;
        break;
      default:
        severityColor = Colors.grey;
        severityText = '-';
        severityIcon = Icons.help;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: severityColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(severityIcon, size: 40, color: severityColor),
            ),
            const SizedBox(height: 12),
            Text(l10n.testCompleted, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _textPrimary)),
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: severityColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('${l10n.tremorSeverity}: $severityText', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: severityColor)),
            ),
            const SizedBox(height: 16),
            _buildResultRow(Icons.speed, l10n.tremorFrequency, '${frequency.toStringAsFixed(2)} Hz', _primaryColor),
            const SizedBox(height: 10),
            _buildResultRow(Icons.show_chart, l10n.avgAmplitude, '${avgAmplitude.toStringAsFixed(3)}', _secondaryColor),
            const SizedBox(height: 10),
            _buildResultRow(Icons.trending_up, l10n.maxAmp, '${maxAmplitude.toStringAsFixed(3)}', const Color(0xFF8B5CF6)),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: _primaryColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(l10n.ok, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(IconData icon, String label, String value, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 13, color: _textSecondary))),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _textPrimary)),
      ],
    );
  }

  double _getMinY() {
    if (_chartData.isEmpty) return 0;
    return (_chartData.reduce((a, b) => a < b ? a : b) - 0.5).clamp(0, double.infinity);
  }

  double _getMaxY() {
    if (_chartData.isEmpty) return 10;
    return _chartData.reduce((a, b) => a > b ? a : b) + 0.5;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _sensorService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // 顶部导航
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: _primaryColor.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 2))],
                      ),
                      child: const Icon(CupertinoIcons.back, color: _primaryColor, size: 22),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(l10n.tremorTestTitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: _textPrimary)),
                ],
              ),
              
              const SizedBox(height: 16),

              // 说明卡片
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF0EA5E9), Color(0xFF10B981)]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: _primaryColor.withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(10)),
                      child: const Icon(CupertinoIcons.hand_raised, color: Colors.white, size: 26),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(l10n.tremorTestInstruction, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white, height: 1.4)),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),

              // 状态显示
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _isRecording ? _primaryColor.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.2), width: 2),
                ),
                child: _isRecording
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(CupertinoIcons.timer, color: _primaryColor, size: 20),
                          const SizedBox(width: 8),
                          Text(l10n.remainingTime(_remainingTime), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _primaryColor)),
                        ],
                      )
                    : Text(l10n.readyToTest, style: const TextStyle(fontSize: 16, color: _textSecondary, fontWeight: FontWeight.w500)),
              ),
              
              const SizedBox(height: 16),

              // 数据卡片
              Row(
                children: [
                  _buildCompactMetricCard(l10n.frequency, _currentFrequency.toStringAsFixed(2), 'Hz', _primaryColor, CupertinoIcons.waveform),
                  const SizedBox(width: 12),
                  _buildCompactMetricCard(l10n.amplitude, _currentAmplitude.toStringAsFixed(3), '', _secondaryColor, CupertinoIcons.chart_bar),
                ],
              ),
              
              const SizedBox(height: 16),

              // 图表区域
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: _primaryColor.withValues(alpha: 0.08), blurRadius: 15, offset: const Offset(0, 4))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xFF0EA5E9), Color(0xFF10B981)]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(CupertinoIcons.waveform_path, color: Colors.white, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Text(l10n.realtimeWaveform, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _textPrimary)),
                          const Spacer(),
                          if (_isRecording)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: _secondaryColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(width: 6, height: 6, decoration: const BoxDecoration(color: _secondaryColor, shape: BoxShape.circle)),
                                  const SizedBox(width: 4),
                                  const Text('LIVE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: _secondaryColor)),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: _chartData.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(CupertinoIcons.waveform_path, size: 40, color: _primaryColor.withValues(alpha: 0.3)),
                                    const SizedBox(height: 8),
                                    Text(l10n.waitingForData, style: const TextStyle(fontSize: 13, color: _textSecondary)),
                                  ],
                                ),
                              )
                            : LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: true,
                                    horizontalInterval: 2,
                                    verticalInterval: 20,
                                    getDrawingHorizontalLine: (value) => FlLine(color: const Color(0xFFE2E8F0), strokeWidth: 1),
                                    getDrawingVerticalLine: (value) => FlLine(color: const Color(0xFFE2E8F0), strokeWidth: 1),
                                  ),
                                  titlesData: const FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  minY: _getMinY(),
                                  maxY: _getMaxY(),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: _chartData.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
                                      isCurved: true,
                                      curveSmoothness: 0.25,
                                      color: _primaryColor,
                                      barWidth: 2,
                                      dotData: const FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                          colors: [_primaryColor.withValues(alpha: 0.2), _primaryColor.withValues(alpha: 0.0)],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),

              // 底部按钮
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isRecording ? _stopTest : _startTest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRecording ? const Color(0xFFEF4444) : _primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(_isRecording ? CupertinoIcons.stop_fill : CupertinoIcons.play_fill, size: 24),
                      const SizedBox(width: 8),
                      Text(_isRecording ? l10n.stopTest : l10n.startTest, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactMetricCard(String label, String value, String unit, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.12), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                  child: Icon(icon, color: color, size: 18),
                ),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(fontSize: 13, color: _textSecondary, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(unit, style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.7), fontWeight: FontWeight.w500)),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
