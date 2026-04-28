import 'dart:convert';

/// 训练类型枚举
enum TrainingType {
  hand('hand', '手部训练'),
  voice('voice', '语音训练'),
  motion('motion', '肢体动作');

  final String key;
  final String label;

  const TrainingType(this.key, this.label);

  static TrainingType fromKey(String key) =>
      TrainingType.values.firstWhere((t) => t.key == key);
}

/// 单条训练项目
class TrainingItem {
  final String id;
  final TrainingType type;
  final String title;
  final String description;

  /// 训练时长（分钟）
  final int duration;

  /// 难度等级 1–5
  final int difficulty;

  /// 是否已完成（当日计划内使用）
  final bool isCompleted;

  const TrainingItem({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    this.isCompleted = false,
  });

  TrainingItem copyWith({
    String? id,
    TrainingType? type,
    String? title,
    String? description,
    int? duration,
    int? difficulty,
    bool? isCompleted,
  }) {
    return TrainingItem(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      difficulty: difficulty ?? this.difficulty,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'type': type.key,
        'title': title,
        'description': description,
        'duration': duration,
        'difficulty': difficulty,
        'isCompleted': isCompleted,
      };

  factory TrainingItem.fromMap(Map<String, dynamic> m) => TrainingItem(
        id: m['id'] as String,
        type: TrainingType.fromKey(m['type'] as String),
        title: m['title'] as String,
        description: m['description'] as String,
        duration: m['duration'] as int,
        difficulty: m['difficulty'] as int,
        isCompleted: (m['isCompleted'] as bool?) ?? false,
      );

  String toJson() => jsonEncode(toMap());

  factory TrainingItem.fromJson(String source) =>
      TrainingItem.fromMap(jsonDecode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TrainingItem(id: $id, type: ${type.key}, title: $title, '
      'duration: ${duration}min, difficulty: $difficulty)';
}
