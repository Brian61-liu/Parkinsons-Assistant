// 训练类型枚举
enum TrainingType {
  armsRaised,    // 举手运动
  fistClench,    // 握拳运动
  legLift,       // 原地抬腿运动
}

// 肢体动作训练记录模型
class MovementTrainingRecord {
  final int? id;
  final DateTime timestamp;
  final int duration; // 训练时长（秒）
  final int successCount; // 成功次数
  final int targetCount; // 目标次数
  final bool goalReached; // 是否达到目标
  final TrainingType trainingType; // 训练类型

  MovementTrainingRecord({
    this.id,
    required this.timestamp,
    required this.duration,
    required this.successCount,
    required this.targetCount,
    required this.goalReached,
    this.trainingType = TrainingType.armsRaised, // 默认为举手运动
  });

  // 转换为Map（用于数据库存储）
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'duration': duration,
      'successCount': successCount,
      'targetCount': targetCount,
      'goalReached': goalReached ? 1 : 0,
      'trainingType': trainingType.index, // 存储枚举索引
    };
  }

  // 从Map创建对象（用于数据库读取）
  factory MovementTrainingRecord.fromMap(Map<String, dynamic> map) {
    return MovementTrainingRecord(
      id: map['id'] as int?,
      timestamp: DateTime.parse(map['timestamp'] as String),
      duration: map['duration'] as int,
      successCount: map['successCount'] as int,
      targetCount: map['targetCount'] as int,
      goalReached: (map['goalReached'] as int) == 1,
      trainingType: map['trainingType'] != null
          ? TrainingType.values[map['trainingType'] as int]
          : TrainingType.armsRaised, // 兼容旧数据
    );
  }
}
