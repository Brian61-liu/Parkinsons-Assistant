// 步态训练记录模型
class GaitRecord {
  final int? id;
  final DateTime timestamp;
  final int bpm; // 节拍器BPM
  final int duration; // 训练时长（秒）
  final String notes; // 备注

  GaitRecord({
    this.id,
    required this.timestamp,
    required this.bpm,
    required this.duration,
    this.notes = '',
  });

  // 转换为Map（用于数据库存储）
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'bpm': bpm,
      'duration': duration,
      'notes': notes,
    };
  }

  // 从Map创建对象（用于数据库读取）
  factory GaitRecord.fromMap(Map<String, dynamic> map) {
    return GaitRecord(
      id: map['id'] as int?,
      timestamp: DateTime.parse(map['timestamp'] as String),
      bpm: map['bpm'] as int,
      duration: map['duration'] as int,
      notes: map['notes'] as String? ?? '',
    );
  }
}
