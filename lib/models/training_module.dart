import 'dart:convert';

import 'training_item.dart';

/// 一级训练分类（保持与现有 hand/voice/motion 一致）
enum TrainingDomain {
  hand('hand', '手部训练'),
  voice('voice', '语音训练'),
  motion('motion', '肢体动作');

  final String key;
  final String label;
  const TrainingDomain(this.key, this.label);

  static TrainingDomain fromKey(String key) =>
      TrainingDomain.values.firstWhere((d) => d.key == key);
}

/// 二级训练子模块（9 个）
enum TrainingSubmodule {
  // HandTraining
  staticControl('static_control', '静态控制', TrainingDomain.hand),
  objectHold('object_hold', '持物控制', TrainingDomain.hand),
  fineMotor('fine_motor', '精细动作', TrainingDomain.hand),

  // VoiceTraining
  clarity('clarity', '清晰度', TrainingDomain.voice),
  volume('volume', '音量控制', TrainingDomain.voice),
  fluency('fluency', '流畅度', TrainingDomain.voice),

  // MotionTraining
  balance('balance', '平衡能力', TrainingDomain.motion),
  gait('gait', '步态训练', TrainingDomain.motion),
  coordination('coordination', '协调能力', TrainingDomain.motion);

  final String key;
  final String label;
  final TrainingDomain domain;
  const TrainingSubmodule(this.key, this.label, this.domain);

  static TrainingSubmodule fromKey(String key) =>
      TrainingSubmodule.values.firstWhere((m) => m.key == key);
}

/// 子模块定义（满足用户要求：id/name/description）
class TrainingModuleDefinition {
  final String id;
  final String name;
  final String description;
  final TrainingDomain domain;
  final TrainingSubmodule submodule;

  const TrainingModuleDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.domain,
    required this.submodule,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'domain': domain.key,
        'submodule': submodule.key,
      };

  factory TrainingModuleDefinition.fromMap(Map<String, dynamic> map) =>
      TrainingModuleDefinition(
        id: map['id'] as String,
        name: map['name'] as String,
        description: map['description'] as String,
        domain: TrainingDomain.fromKey(map['domain'] as String),
        submodule: TrainingSubmodule.fromKey(map['submodule'] as String),
      );
}

/// 模块化训练任务（支持根据子模块生成 + 独立评分）
class ModuleTrainingTask {
  final String id;
  final TrainingDomain domain;
  final TrainingSubmodule submodule;
  final String title;
  final String description;
  final int duration;
  final int difficulty;

  /// 任务完成后的评分，独立于其它子模块（0-100）
  final double? score;

  const ModuleTrainingTask({
    required this.id,
    required this.domain,
    required this.submodule,
    required this.title,
    required this.description,
    required this.duration,
    required this.difficulty,
    this.score,
  });

  ModuleTrainingTask copyWith({
    String? id,
    TrainingDomain? domain,
    TrainingSubmodule? submodule,
    String? title,
    String? description,
    int? duration,
    int? difficulty,
    double? score,
  }) {
    return ModuleTrainingTask(
      id: id ?? this.id,
      domain: domain ?? this.domain,
      submodule: submodule ?? this.submodule,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      difficulty: difficulty ?? this.difficulty,
      score: score ?? this.score,
    );
  }

  TrainingItem toTrainingItem() => TrainingItem(
        id: id,
        type: TrainingType.fromKey(domain.key),
        title: title,
        description: description,
        duration: duration,
        difficulty: difficulty,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'domain': domain.key,
        'submodule': submodule.key,
        'title': title,
        'description': description,
        'duration': duration,
        'difficulty': difficulty,
        'score': score,
      };

  factory ModuleTrainingTask.fromMap(Map<String, dynamic> map) =>
      ModuleTrainingTask(
        id: map['id'] as String,
        domain: TrainingDomain.fromKey(map['domain'] as String),
        submodule: TrainingSubmodule.fromKey(map['submodule'] as String),
        title: map['title'] as String,
        description: map['description'] as String,
        duration: map['duration'] as int,
        difficulty: map['difficulty'] as int,
        score: (map['score'] as num?)?.toDouble(),
      );

  String toJson() => jsonEncode(toMap());
  factory ModuleTrainingTask.fromJson(String source) =>
      ModuleTrainingTask.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

/// 子模块评分聚合结果
class SubmoduleScore {
  final TrainingSubmodule submodule;
  final double averageScore;
  final int count;

  const SubmoduleScore({
    required this.submodule,
    required this.averageScore,
    required this.count,
  });

  Map<String, dynamic> toMap() => {
        'submodule': submodule.key,
        'averageScore': averageScore,
        'count': count,
      };
}

