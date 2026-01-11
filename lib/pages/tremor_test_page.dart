import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('需要传感器权限才能进行测试')));
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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      setState(() {
        _remainingTime--;

        // 更新实时数据
        final data = _sensorService.getRecordedData();
        if (data.isNotEmpty) {
          _currentAmplitude = _sensorService.calculateAverageAmplitude(data);
          _currentFrequency = _sensorService.calculateFrequency(
            data,
            sampleRate: AppConstants.tremorSampleRate.round(),
          );

          // 更新图表数据（保留最近100个点）
          _chartData = data.length > 100
              ? data.sublist(data.length - 100)
              : data;
        }
      });

      if (_remainingTime <= 0) {
        _stopTest();
      }
    });
  }

  // 停止测试
  Future<void> _stopTest() async {
    _timer?.cancel();
    _sensorService.stopRecording();

    final data = _sensorService.getRecordedData();
    if (data.isNotEmpty) {
      final frequency = _sensorService.calculateFrequency(
        data,
        sampleRate: AppConstants.tremorSampleRate.round(),
      );
      final avgAmplitude = _sensorService.calculateAverageAmplitude(data);
      final maxAmplitude = _sensorService.calculateMaxAmplitude(data);

      // 保存记录
      final record = TremorRecord(
        timestamp: DateTime.now(),
        averageFrequency: frequency,
        maxAmplitude: maxAmplitude,
        averageAmplitude: avgAmplitude,
        duration: AppConstants.tremorTestDuration,
        accelerometerData: data,
      );

      await _databaseService.insertTremorRecord(record);

      if (mounted) {
        setState(() {
          _isRecording = false;
          _currentFrequency = frequency;
          _currentAmplitude = avgAmplitude;
        });

        // 显示结果对话框
        _showResults(frequency, avgAmplitude, maxAmplitude);
      }
    } else {
      setState(() {
        _isRecording = false;
      });
    }
  }

  // 显示测试结果（增大对话框尺寸）
  void _showResults(
    double frequency,
    double avgAmplitude,
    double maxAmplitude,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          '测试完成',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '平均频率: ${frequency.toStringAsFixed(2)} Hz',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16), // 增大间距：8 -> 16
            Text(
              '平均幅度: ${avgAmplitude.toStringAsFixed(3)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              '最大幅度: ${maxAmplitude.toStringAsFixed(3)}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            height: 56, // 增大按钮高度
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '确定',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _sensorService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用 iOS 风格的导航栏
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CupertinoNavigationBar(
          backgroundColor: Colors.orange[50],
          border: null,
          middle: const Text(
            '手部震颤测试',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
          leading: CupertinoNavigationBarBackButton(
            color: Colors.deepOrange,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24), // 增大内边距：20 -> 24
        child: Column(
          children: [
            // 说明文字
            Card(
              color: Colors.orange[50],
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0), // 增大内边距：16 -> 20
                child: Text(
                  '请将手机握在手中，保持手臂静止30秒',
                  style: const TextStyle(
                    fontSize: 22, // 增大字体：18 -> 22
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 32), // 增大间距：20 -> 32
            // 倒计时显示
            if (_isRecording)
              Text(
                '剩余时间: $_remainingTime 秒',
                style: const TextStyle(
                  fontSize: 42, // 增大字体：32 -> 42
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  letterSpacing: 1.5,
                ),
              )
            else
              const Text(
                '准备开始测试',
                style: TextStyle(
                  fontSize: 28, // 增大字体：24 -> 28
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

            const SizedBox(height: 40), // 增大间距：30 -> 40
            // 实时数据显示
            if (_isRecording || _chartData.isNotEmpty) ...[
              Row(
                children: [
                  const SizedBox(width: 8),
                  _buildMetricCard(
                    '频率',
                    '${_currentFrequency.toStringAsFixed(2)} Hz',
                    Colors.blue,
                  ),
                  const SizedBox(width: 16),
                  _buildMetricCard(
                    '幅度',
                    _currentAmplitude.toStringAsFixed(3),
                    Colors.green,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 24), // 增大间距：20 -> 24
              // 数据图表（增大图表区域）
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0), // 增大内边距：16 -> 20
                    child: _chartData.isEmpty
                        ? const Center(
                            child: Text(
                              '等待数据...',
                              style: TextStyle(fontSize: 22),
                            ),
                          )
                        : LineChart(
                            LineChartData(
                              gridData: const FlGridData(show: true),
                              titlesData: const FlTitlesData(
                                show: true,
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 50,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(show: true),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: _chartData.asMap().entries.map((e) {
                                    return FlSpot(e.key.toDouble(), e.value);
                                  }).toList(),
                                  isCurved: true,
                                  color: Colors.orange,
                                  barWidth: 3, // 增大线条宽度：2 -> 3
                                  dotData: const FlDotData(show: false),
                                  belowBarData: BarAreaData(show: false),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            ] else
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.back_hand,
                    size: 150, // 增大图标：120 -> 150
                    color: Colors.orange[300],
                  ),
                ),
              ),

            const SizedBox(height: 24), // 增大间距：20 -> 24
            // 开始/停止按钮（使用 Material Design，点击反馈明显）
            SizedBox(
              width: double.infinity,
              height: 70, // 增大按钮高度：60 -> 70
              child: ElevatedButton(
                onPressed: _isRecording ? _stopTest : _startTest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isRecording ? Colors.red : Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 4, // Material Design 阴影效果
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  _isRecording ? '停止测试' : '开始测试',
                  style: const TextStyle(
                    fontSize: 28, // 增大字体：24 -> 28
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 构建指标卡片（增大尺寸）
  Widget _buildMetricCard(String label, String value, Color color) {
    return Expanded(
      child: Card(
        color: color.withValues(alpha: 0.1),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0), // 增大内边距：16 -> 20
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 20, // 增大字体：16 -> 20
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12), // 增大间距：8 -> 12
              Text(
                value,
                style: TextStyle(
                  fontSize: 32, // 增大字体：24 -> 32
                  fontWeight: FontWeight.bold,
                  color: color,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
