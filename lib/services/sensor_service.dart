import 'dart:async';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';

// 传感器服务类
class SensorService {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  final List<double> _accelerometerData = [];
  bool _isRecording = false;

  // 获取加速度数据流
  Stream<AccelerometerEvent> get accelerometerStream =>
      accelerometerEventStream();

  // 开始记录数据
  void startRecording() {
    _isRecording = true;
    _accelerometerData.clear();
    _accelerometerSubscription?.cancel();

    _accelerometerSubscription = accelerometerEventStream().listen((event) {
      if (_isRecording) {
        // 计算加速度的模长（总加速度）
        final magnitude = sqrt(
          event.x * event.x + event.y * event.y + event.z * event.z,
        );
        _accelerometerData.add(magnitude);
      }
    });
  }

  // 停止记录数据
  void stopRecording() {
    _isRecording = false;
    _accelerometerSubscription?.cancel();
  }

  // 获取记录的数据
  List<double> getRecordedData() {
    return List.unmodifiable(_accelerometerData);
  }

  // 计算震颤频率（简化版本：通过峰值计数）
  double calculateFrequency(List<double> data, {int sampleRate = 50}) {
    if (data.isEmpty) return 0.0;

    // 计算平均值
    final mean = data.reduce((a, b) => a + b) / data.length;

    // 计算标准差作为阈值
    final variance =
        data.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / data.length;
    final stdDev = sqrt(variance);
    final threshold = mean + stdDev * 0.5;

    // 计算峰值数量（过阈值次数）
    int peakCount = 0;
    bool wasAbove = false;
    for (final value in data) {
      if (value > threshold && !wasAbove) {
        peakCount++;
        wasAbove = true;
      } else if (value <= threshold) {
        wasAbove = false;
      }
    }

    // 频率 = 峰值数 / 时间（秒）
    final duration = data.length / sampleRate;
    return duration > 0 ? peakCount / (2 * duration) : 0.0; // 除以2得到完整周期
  }

  // 计算平均幅度
  double calculateAverageAmplitude(List<double> data) {
    if (data.isEmpty) return 0.0;
    final mean = data.reduce((a, b) => a + b) / data.length;
    return data.map((x) => (x - mean).abs()).reduce((a, b) => a + b) /
        data.length;
  }

  // 计算最大幅度
  double calculateMaxAmplitude(List<double> data) {
    if (data.isEmpty) return 0.0;
    final mean = data.reduce((a, b) => a + b) / data.length;
    return data.map((x) => (x - mean).abs()).reduce(max);
  }

  // 清理资源
  void dispose() {
    stopRecording();
  }
}
