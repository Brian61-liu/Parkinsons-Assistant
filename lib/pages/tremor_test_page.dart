import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import '../l10n/app_localizations.dart';
import '../services/sensor_service.dart';
import '../services/database_service.dart';
import '../models/tremor_record.dart';
import '../utils/constants.dart';

// 手部震颤测试页面
class TremorTestPage extends StatefulWidget {
  const TremorTestPage({super.key});

  @override
  State<TremorTestPage> createState() => _TremorTestPageState();
}

class _TremorTestPageState extends State<TremorTestPage> {
  final SensorService _sensorService = SensorService();
  final DatabaseService _databaseService = DatabaseService();

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

  // 检查权限（传感器权限在大多数设备上不需要运行时权限，但 Android 12+ 需要）
  Future<void> _checkPermission() async {
    // Android 12 (API 31) 及以上版本需要 HIGH_SAMPLING_RATE_SENSORS 权限
    // 这里先假设权限已授予，实际运行时如果失败会提示用户
    // 可以在 AndroidManifest.xml 中声明权限
    setState(() {
      _hasPermission = true; // 默认允许，实际运行时如果失败会捕获异常
    });
  }

  // 开始测试
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

  // 开始计时器
  void _startTimer() {
    _timer?.cancel();
    // 每秒更新一次
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      _remainingTime--;

      // 获取数据
      final data = _sensorService.getRecordedData();
      
      if (data.isNotEmpty) {
        _currentAmplitude = _sensorService.calculateAverageAmplitude(data);
        
        // 每5秒计算一次频率
        if (timer.tick % 5 == 0) {
          _currentFrequency = _sensorService.calculateFrequency(data);
        }

        // 图表只显示最近50个点
        _chartData = data.length > 50
            ? data.sublist(data.length - 50)
            : List.from(data);
      }
      
      setState(() {});

      if (_remainingTime <= 0) {
        _stopTest();
      }
    });
  }

  // 停止测试
  Future<void> _stopTest() async {
    _timer?.cancel();
    _sensorService.stopRecording();

    // 获取详细分析结果
    final analysis = _sensorService.getDetailedAnalysis();

    if (analysis['status'] == 'success') {
      final frequency = analysis['frequency'] as double;
      final avgAmplitude = analysis['amplitude'] as double;
      final maxAmplitude = analysis['maxAmplitude'] as double;
      final variability = analysis['variability'] as double;
      final severity = analysis['severity'] as String;
      final actualSampleRate = analysis['sampleRate'] as double;
      final dataPoints = analysis['dataPoints'] as int;

      // 保存记录
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

        // 显示详细结果对话框
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
      setState(() {
        _isRecording = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(analysis['message'] ?? '测试失败')));
      }
    }
  }

  // 显示详细测试结果
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

    // 获取严重程度颜色和文本
    Color severityColor;
    String severityText;
    IconData severityIcon;

    switch (severity) {
      case 'minimal':
        severityColor = const Color(0xFF4CAF50);
        severityText = l10n.severityNormal;
        severityIcon = Icons.check_circle;
        break;
      case 'mild':
        severityColor = const Color(0xFF8BC34A);
        severityText = l10n.severityMild;
        severityIcon = Icons.info;
        break;
      case 'moderate':
        severityColor = const Color(0xFFFF9800);
        severityText = l10n.severityModerate;
        severityIcon = Icons.warning;
        break;
      case 'moderateSevere':
        severityColor = const Color(0xFFFF5722);
        severityText = l10n.severityModerateSevere;
        severityIcon = Icons.warning_amber;
        break;
      case 'severe':
        severityColor = const Color(0xFFF44336);
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
            Text(
              l10n.testCompleted,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 严重程度指示
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: severityColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: severityColor.withValues(alpha: 0.3)),
              ),
              child: Text(
                '${l10n.tremorSeverity}: $severityText',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: severityColor,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 详细数据
            _buildResultRow(
              icon: Icons.speed,
              label: l10n.tremorFrequency,
              value: '${frequency.toStringAsFixed(2)} Hz',
              color: const Color(0xFFFF6B35),
            ),
            const SizedBox(height: 12),
            _buildResultRow(
              icon: Icons.show_chart,
              label: l10n.avgAmplitude,
              value: '${avgAmplitude.toStringAsFixed(3)} m/s²',
              color: const Color(0xFF2196F3),
            ),
            const SizedBox(height: 12),
            _buildResultRow(
              icon: Icons.trending_up,
              label: l10n.maxAmp,
              value: '${maxAmplitude.toStringAsFixed(3)} m/s²',
              color: const Color(0xFF9C27B0),
            ),
            const SizedBox(height: 12),
            _buildResultRow(
              icon: Icons.analytics,
              label: l10n.variability,
              value: variability.toStringAsFixed(4),
              color: const Color(0xFF009688),
            ),

            const SizedBox(height: 16),
            // 技术信息
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTechInfo(l10n.sampleRate, '${sampleRate.toStringAsFixed(0)} Hz'),
                  _buildTechInfo(l10n.dataPoints, '$dataPoints'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                l10n.ok,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建结果行
  Widget _buildResultRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3436),
          ),
        ),
      ],
    );
  }

  // 构建技术信息
  Widget _buildTechInfo(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF636E72),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
      ],
    );
  }

  // 计算图表Y轴最小值
  double _getMinY() {
    if (_chartData.isEmpty) return 0;
    final min = _chartData.reduce((a, b) => a < b ? a : b);
    return (min - 0.5).clamp(0, double.infinity);
  }

  // 计算图表Y轴最大值
  double _getMaxY() {
    if (_chartData.isEmpty) return 10;
    final max = _chartData.reduce((a, b) => a > b ? a : b);
    return max + 0.5;
  }

  // 计算图表间隔
  double _getChartInterval() {
    if (_chartData.isEmpty) return 2;
    final range = _getMaxY() - _getMinY();
    if (range < 1) return 0.2;
    if (range < 2) return 0.5;
    if (range < 5) return 1;
    return 2;
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
      backgroundColor: const Color(0xFFF8F9FA),
      // 使用 iOS 风格的导航栏
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CupertinoNavigationBar(
          backgroundColor: const Color(0xFFFF6B35),
          border: null,
          middle: Text(
            l10n.tremorTestTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          leading: CupertinoNavigationBarBackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // 说明卡片
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFFF6B35,
                            ).withValues(alpha: 0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.back_hand_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              l10n.tremorTestInstruction,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 状态/倒计时显示
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: _isRecording
                            ? const Color(0xFFFF6B35).withValues(alpha: 0.1)
                            : Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _isRecording
                              ? const Color(0xFFFF6B35).withValues(alpha: 0.3)
                              : Colors.grey.withValues(alpha: 0.2),
                          width: 2,
                        ),
                      ),
                      child: _isRecording
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.timer_outlined,
                                  color: Color(0xFFFF6B35),
                                  size: 22,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.remainingTime(_remainingTime),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF6B35),
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              l10n.readyToTest,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                    const SizedBox(height: 24),

                    // 实时数据显示
                    Row(
                      children: [
                        _buildMetricCard(
                          l10n.frequency,
                          _currentFrequency.toStringAsFixed(2),
                          'Hz',
                          const Color(0xFF4ECDC4),
                          Icons.waves,
                        ),
                        const SizedBox(width: 16),
                        _buildMetricCard(
                          l10n.amplitude,
                          _currentAmplitude.toStringAsFixed(3),
                          '',
                          const Color(0xFF45B7D1),
                          Icons.show_chart,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // 数据图表
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 图表标题
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFF6B35),
                                      Color(0xFFFF8C42),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.timeline_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  l10n.realtimeWaveform,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2D3436),
                                  ),
                                ),
                              ),
                              if (_isRecording)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFFF6B35,
                                    ).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFF6B35),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'LIVE',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFF6B35),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // 图表区域
                          SizedBox(
                            height: 180,
                            child: _chartData.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF8F9FA),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.show_chart_rounded,
                                            size: 40,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          l10n.waitingForData,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : LineChart(
                                    LineChartData(
                                      gridData: FlGridData(
                                        show: true,
                                        drawVerticalLine: true,
                                        horizontalInterval: _getChartInterval(),
                                        verticalInterval: 20,
                                        getDrawingHorizontalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xFFEEEEEE),
                                            strokeWidth: 1,
                                          );
                                        },
                                        getDrawingVerticalLine: (value) {
                                          return FlLine(
                                            color: const Color(0xFFEEEEEE),
                                            strokeWidth: 1,
                                          );
                                        },
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 35,
                                            interval: _getChartInterval(),
                                            getTitlesWidget: (value, meta) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 8,
                                                ),
                                                child: Text(
                                                  value.toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    color: Color(0xFF636E72),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        bottomTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        topTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        rightTitles: const AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                      ),
                                      borderData: FlBorderData(
                                        show: true,
                                        border: Border.all(
                                          color: const Color(0xFFEEEEEE),
                                          width: 1,
                                        ),
                                      ),
                                      minY: _getMinY(),
                                      maxY: _getMaxY(),
                                      lineBarsData: [
                                        LineChartBarData(
                                          spots: _chartData.asMap().entries.map(
                                            (e) {
                                              return FlSpot(
                                                e.key.toDouble(),
                                                e.value,
                                              );
                                            },
                                          ).toList(),
                                          isCurved: true,
                                          curveSmoothness: 0.25,
                                          color: const Color(0xFFFF6B35),
                                          barWidth: 2.5,
                                          isStrokeCapRound: true,
                                          dotData: const FlDotData(show: false),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(
                                                  0xFFFF6B35,
                                                ).withValues(alpha: 0.25),
                                                const Color(
                                                  0xFFFF6B35,
                                                ).withValues(alpha: 0.05),
                                                const Color(
                                                  0xFFFF6B35,
                                                ).withValues(alpha: 0.0),
                                              ],
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
                  ],
                ),
              ),
            ),

            // 底部按钮
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _isRecording ? _stopTest : _startTest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRecording
                        ? const Color(0xFFE53935)
                        : const Color(0xFFFF6B35),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _isRecording
                            ? Icons.stop_rounded
                            : Icons.play_arrow_rounded,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isRecording ? l10n.stopTest : l10n.startTest,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建指标卡片
  Widget _buildMetricCard(
    String label,
    String value,
    String unit,
    Color color,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      unit,
                      style: TextStyle(
                        fontSize: 14,
                        color: color.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
