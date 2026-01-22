// 应用常量定义
class AppConstants {
  // 震颤测试常量
  static const double tremorSampleRate = 50.0; // 采样率：50Hz（低功耗，足够检测3-7Hz）
  static const int tremorTestDuration = 30; // 测试时长：30秒
  static const double tremorThreshold = 0.02; // 震颤阈值
  
  // 滤波器常量 - 简化参数
  static const double highPassAlpha = 0.8; // 高通滤波器系数
  static const double lowPassAlpha = 0.3; // 低通滤波器系数
  
  // 帕金森震颤特征频率范围（3-7Hz）
  static const double tremorMinFreq = 3.0; // 最小震颤频率
  static const double tremorMaxFreq = 7.0; // 最大震颤频率
  
  // 数据缓冲区大小
  static const int dataBufferSize = 300; // 保留最近6秒数据（50Hz * 6）
  static const int minDataForAnalysis = 50; // 最少需要1秒数据
  
  // 峰值检测参数
  static const double peakThresholdMultiplier = 0.5; // 峰值阈值乘数
  static const int minPeakDistance = 4; // 最小峰值间隔（50Hz下约80ms）
  
  // 震颤严重程度阈值（m/s²）
  static const double mildTremorAmplitude = 0.1; // 轻度震颤
  static const double moderateTremorAmplitude = 0.3; // 中度震颤
  static const double severeTremorAmplitude = 0.5; // 重度震颤

  // 颜色
  static const int primaryColorValue = 0xFF2196F3;
  static const int secondaryColorValue = 0xFF4CAF50;
}
