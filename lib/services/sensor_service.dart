import 'dart:async';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import '../utils/constants.dart';

/// 传感器服务类 - 轻量级震颤检测
/// 优化性能，适配90%手机
class SensorService {
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  
  // 使用固定大小数组提高性能
  final List<double> _data = [];
  
  // 简单一阶滤波状态
  double _lastFiltered = 0;
  double _gravity = 9.8; // 重力估计值
  
  int _sampleCount = 0;
  DateTime? _startTime;
  double _actualSampleRate = AppConstants.tremorSampleRate;
  
  bool _isRecording = false;

  // 50Hz 采样率 - 低功耗，足够检测3-7Hz震颤
  Stream<AccelerometerEvent> get accelerometerStream =>
      accelerometerEventStream(samplingPeriod: const Duration(milliseconds: 20));

  void startRecording() {
    _isRecording = true;
    _data.clear();
    _lastFiltered = 0;
    _gravity = 9.8;
    _sampleCount = 0;
    _startTime = DateTime.now();
    _accelerometerSubscription?.cancel();

    _accelerometerSubscription = accelerometerStream.listen(_onSensorData);
  }
  
  void _onSensorData(AccelerometerEvent event) {
    if (!_isRecording) return;
    
    _sampleCount++;
    
    // 计算加速度模长
    final magnitude = sqrt(
      event.x * event.x + event.y * event.y + event.z * event.z
    );
    
    // 简单高通滤波去除重力
    _gravity = _gravity * 0.9 + magnitude * 0.1;
    final filtered = magnitude - _gravity;
    
    // 简单低通滤波平滑
    _lastFiltered = _lastFiltered * 0.7 + filtered.abs() * 0.3;
    
    _data.add(_lastFiltered);
    
    // 限制数据量
    if (_data.length > AppConstants.dataBufferSize) {
      _data.removeAt(0);
    }
    
    // 每秒更新一次采样率
    if (_sampleCount % 50 == 0 && _startTime != null) {
      final elapsed = DateTime.now().difference(_startTime!).inMilliseconds / 1000.0;
      if (elapsed > 0) {
        _actualSampleRate = _sampleCount / elapsed;
      }
    }
  }

  void stopRecording() {
    _isRecording = false;
    _accelerometerSubscription?.cancel();
  }

  List<double> getRecordedData() {
    return List.from(_data);
  }

  double getActualSampleRate() {
    return _actualSampleRate;
  }

  /// 快速计算振幅（用于实时显示）
  double calculateAverageAmplitude(List<double> data) {
    if (data.isEmpty) return 0.0;
    double sum = 0;
    for (final v in data) {
      sum += v;
    }
    return sum / data.length;
  }

  /// 快速计算频率 - 简单峰值计数
  double calculateFrequency(List<double> data) {
    if (data.length < 25) return 0.0; // 至少0.5秒
    
    // 只用最近2秒数据
    final recentData = data.length > 100 ? data.sublist(data.length - 100) : data;
    
    // 计算均值和阈值
    double sum = 0;
    double maxVal = 0;
    for (final v in recentData) {
      sum += v;
      if (v > maxVal) maxVal = v;
    }
    final mean = sum / recentData.length;
    final threshold = mean + (maxVal - mean) * 0.3;
    
    // 简单峰值计数
    int peaks = 0;
    for (int i = 1; i < recentData.length - 1; i++) {
      if (recentData[i] > threshold &&
          recentData[i] > recentData[i - 1] &&
          recentData[i] > recentData[i + 1]) {
        peaks++;
        i += 3; // 跳过最小间隔
      }
    }
    
    // 频率 = 峰值数 / 时间
    final duration = recentData.length / _actualSampleRate;
    return duration > 0 ? peaks / duration : 0.0;
  }

  /// 最终分析（测试结束时调用）
  Map<String, dynamic> getDetailedAnalysis() {
    if (_data.length < AppConstants.minDataForAnalysis) {
      return {
        'status': 'insufficient_data',
        'message': '数据不足',
      };
    }
    
    final data = List<double>.from(_data);
    
    // 计算振幅
    double sum = 0, maxVal = 0;
    for (final v in data) {
      sum += v;
      if (v > maxVal) maxVal = v;
    }
    final amplitude = sum / data.length;
    
    // 计算频率
    final frequency = calculateFrequency(data);
    
    // 震颤等级
    String severity;
    if (amplitude < AppConstants.tremorThreshold) {
      severity = 'minimal';
    } else if (amplitude < AppConstants.mildTremorAmplitude) {
      severity = 'mild';
    } else if (amplitude < AppConstants.moderateTremorAmplitude) {
      severity = 'moderate';
    } else if (amplitude < AppConstants.severeTremorAmplitude) {
      severity = 'moderateSevere';
    } else {
      severity = 'severe';
    }
    
    return {
      'status': 'success',
      'frequency': frequency,
      'amplitude': amplitude,
      'maxAmplitude': maxVal,
      'variability': 0.0,
      'energyRatio': 0.0,
      'severity': severity,
      'sampleRate': _actualSampleRate,
      'dataPoints': data.length,
      'duration': data.length / _actualSampleRate,
    };
  }

  void dispose() {
    stopRecording();
  }
}
