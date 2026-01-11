// 应用常量定义
class AppConstants {
  // 震颤测试常量
  static const double tremorSampleRate = 50.0; // 采样率：50Hz
  static const int tremorTestDuration = 30; // 测试时长：30秒
  static const double tremorThreshold = 0.1; // 震颤阈值

  // 步态辅助常量
  static const int minBPM = 60; // 最小BPM
  static const int maxBPM = 120; // 最大BPM
  static const int defaultBPM = 80; // 默认BPM
  static const int bpmStep = 5; // BPM调节步长

  // 颜色
  static const int primaryColorValue = 0xFF2196F3;
  static const int secondaryColorValue = 0xFF4CAF50;
}
