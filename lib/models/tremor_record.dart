// 震颤测试记录模型
class TremorRecord {
  final int? id;
  final DateTime timestamp;
  final double averageFrequency; // 平均频率（Hz）
  final double maxAmplitude; // 最大幅度
  final double averageAmplitude; // 平均幅度
  final int duration; // 测试时长（秒）
  final List<double> accelerometerData; // 原始加速度数据

  TremorRecord({
    this.id,
    required this.timestamp,
    required this.averageFrequency,
    required this.maxAmplitude,
    required this.averageAmplitude,
    required this.duration,
    required this.accelerometerData,
  });

  // 转换为Map（用于数据库存储）
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'averageFrequency': averageFrequency,
      'maxAmplitude': maxAmplitude,
      'averageAmplitude': averageAmplitude,
      'duration': duration,
      'accelerometerData': accelerometerData.join(','), // 将列表转为字符串
    };
  }

  // 从Map创建对象（用于数据库读取）
  factory TremorRecord.fromMap(Map<String, dynamic> map) {
    return TremorRecord(
      id: map['id'] as int?,
      timestamp: DateTime.parse(map['timestamp'] as String),
      averageFrequency: map['averageFrequency'] as double,
      maxAmplitude: map['maxAmplitude'] as double,
      averageAmplitude: map['averageAmplitude'] as double,
      duration: map['duration'] as int,
      accelerometerData: (map['accelerometerData'] as String)
          .split(',')
          .map((e) => double.parse(e))
          .toList(),
    );
  }
}
