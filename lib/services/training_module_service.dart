import 'dart:math';

import '../models/training_module.dart';

/// 模块化训练服务：
/// - 提供 9 个子模块结构定义
/// - 根据子模块生成训练任务
/// - 统计子模块独立评分
class TrainingModuleService {
  final Random _random;

  TrainingModuleService({Random? random}) : _random = random ?? Random();

  /// 模块结构定义（id/name/description）
  static const List<TrainingModuleDefinition> moduleDefinitions = [
    // HandTraining
    TrainingModuleDefinition(
      id: 'hand.static_control',
      name: '静态控制',
      description: '通过保持手部稳定，降低不自主抖动，提升静止姿态控制能力。',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.staticControl,
    ),
    TrainingModuleDefinition(
      id: 'hand.object_hold',
      name: '持物控制',
      description: '通过握持杯子、球体等物体训练手部力量与持续控制能力。',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.objectHold,
    ),
    TrainingModuleDefinition(
      id: 'hand.fine_motor',
      name: '精细动作',
      description: '通过对指、捏取和小幅运动提升手指精细操作能力。',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.fineMotor,
    ),

    // VoiceTraining
    TrainingModuleDefinition(
      id: 'voice.clarity',
      name: '清晰度',
      description: '聚焦发音清晰和咬字准确，改善可懂度。',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.clarity,
    ),
    TrainingModuleDefinition(
      id: 'voice.volume',
      name: '音量控制',
      description: '训练发声强度稳定性，避免声音过弱。',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.volume,
    ),
    TrainingModuleDefinition(
      id: 'voice.fluency',
      name: '流畅度',
      description: '提升语句连贯性和说话节奏，减少停顿和卡顿。',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.fluency,
    ),

    // MotionTraining
    TrainingModuleDefinition(
      id: 'motion.balance',
      name: '平衡能力',
      description: '通过重心控制和姿势维持训练，提高稳定性。',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.balance,
    ),
    TrainingModuleDefinition(
      id: 'motion.gait',
      name: '步态训练',
      description: '改善步幅与步频，降低冻结步态风险。',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.gait,
    ),
    TrainingModuleDefinition(
      id: 'motion.coordination',
      name: '协调能力',
      description: '提升上下肢协同和多动作组合执行能力。',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.coordination,
    ),
  ];

  /// 按子模块生成训练任务（可用于日计划或专项计划）
  List<ModuleTrainingTask> generateTasksBySubmodule({
    required TrainingSubmodule submodule,
    int count = 2,
    int difficulty = 3,
  }) {
    final pool = _taskTemplates
        .where((t) => t.submodule == submodule)
        .toList(growable: false);

    if (pool.isEmpty) return const [];
    final shuffled = [...pool]..shuffle(_random);

    return shuffled
        .take(count.clamp(1, shuffled.length))
        .map(
          (t) => t.copyWith(
            difficulty: difficulty.clamp(1, 5),
            duration: _durationByDifficulty(difficulty.clamp(1, 5)),
          ),
        )
        .toList(growable: false);
  }

  /// 按一级分类生成任务（自动覆盖该分类下全部子模块）
  List<ModuleTrainingTask> generateTasksByDomain({
    required TrainingDomain domain,
    int eachSubmoduleCount = 1,
    int difficulty = 3,
  }) {
    final submodules = TrainingSubmodule.values
        .where((m) => m.domain == domain)
        .toList(growable: false);

    final result = <ModuleTrainingTask>[];
    for (final submodule in submodules) {
      result.addAll(
        generateTasksBySubmodule(
          submodule: submodule,
          count: eachSubmoduleCount,
          difficulty: difficulty,
        ),
      );
    }
    return result;
  }

  /// 记录单任务评分（返回带 score 的新对象）
  ModuleTrainingTask scoreTask(
    ModuleTrainingTask task, {
    required double score,
  }) {
    return task.copyWith(score: score.clamp(0, 100));
  }

  /// 子模块独立评分聚合（平均分）
  List<SubmoduleScore> aggregateSubmoduleScores(List<ModuleTrainingTask> tasks) {
    final withScore = tasks.where((t) => t.score != null).toList(growable: false);
    final grouped = <TrainingSubmodule, List<double>>{};

    for (final task in withScore) {
      grouped.putIfAbsent(task.submodule, () => <double>[]).add(task.score!);
    }

    return grouped.entries.map((entry) {
      final scores = entry.value;
      final avg = scores.reduce((a, b) => a + b) / scores.length;
      return SubmoduleScore(
        submodule: entry.key,
        averageScore: avg,
        count: scores.length,
      );
    }).toList(growable: false);
  }

  /// 示例训练数据：每个一级分类各 2 条
  List<ModuleTrainingTask> exampleTasks() {
    return [
      ...generateTasksByDomain(
        domain: TrainingDomain.hand,
        eachSubmoduleCount: 1,
        difficulty: 2,
      ).take(2),
      ...generateTasksByDomain(
        domain: TrainingDomain.voice,
        eachSubmoduleCount: 1,
        difficulty: 3,
      ).take(2),
      ...generateTasksByDomain(
        domain: TrainingDomain.motion,
        eachSubmoduleCount: 1,
        difficulty: 3,
      ).take(2),
    ];
  }

  int _durationByDifficulty(int difficulty) {
    switch (difficulty) {
      case 1:
        return 5;
      case 2:
        return 8;
      case 3:
        return 10;
      case 4:
        return 12;
      case 5:
      default:
        return 15;
    }
  }

  static const List<ModuleTrainingTask> _taskTemplates = [
    // Hand - static_control
    ModuleTrainingTask(
      id: 'task_hand_static_1',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.staticControl,
      title: '静止持姿训练',
      description: '手持手机保持水平静止，观察抖动幅度。',
      duration: 8,
      difficulty: 2,
    ),
    ModuleTrainingTask(
      id: 'task_hand_static_2',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.staticControl,
      title: '定点稳定挑战',
      description: '手腕悬空对准目标点，持续稳定 20 秒。',
      duration: 10,
      difficulty: 3,
    ),

    // Hand - object_hold
    ModuleTrainingTask(
      id: 'task_hand_hold_1',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.objectHold,
      title: '握球稳定控制',
      description: '握软球维持中等力度，避免过紧或过松。',
      duration: 8,
      difficulty: 2,
    ),
    ModuleTrainingTask(
      id: 'task_hand_hold_2',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.objectHold,
      title: '持杯转移训练',
      description: '平稳拿起并移动水杯，控制倾斜角度。',
      duration: 12,
      difficulty: 4,
    ),

    // Hand - fine_motor
    ModuleTrainingTask(
      id: 'task_hand_fine_1',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.fineMotor,
      title: '拇指对指循环',
      description: '拇指依次触碰四指，保持节奏和准确率。',
      duration: 10,
      difficulty: 3,
    ),
    ModuleTrainingTask(
      id: 'task_hand_fine_2',
      domain: TrainingDomain.hand,
      submodule: TrainingSubmodule.fineMotor,
      title: '小物件捏取训练',
      description: '捏取硬币或按钮，强化精细控制。',
      duration: 12,
      difficulty: 4,
    ),

    // Voice - clarity
    ModuleTrainingTask(
      id: 'task_voice_clarity_1',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.clarity,
      title: '元音清晰发音',
      description: '拉长发 a/e/i/o/u，保持口型清晰。',
      duration: 8,
      difficulty: 2,
    ),
    ModuleTrainingTask(
      id: 'task_voice_clarity_2',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.clarity,
      title: '短句咬字训练',
      description: '重复清晰朗读短句，关注辅音准确。',
      duration: 10,
      difficulty: 3,
    ),

    // Voice - volume
    ModuleTrainingTask(
      id: 'task_voice_volume_1',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.volume,
      title: '音量阶梯训练',
      description: '从低到高逐级提升音量，再平稳回落。',
      duration: 8,
      difficulty: 2,
    ),
    ModuleTrainingTask(
      id: 'task_voice_volume_2',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.volume,
      title: '持续强度发声',
      description: '维持稳定音量发声 5 秒，重复多组。',
      duration: 12,
      difficulty: 4,
    ),

    // Voice - fluency
    ModuleTrainingTask(
      id: 'task_voice_fluency_1',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.fluency,
      title: '节拍朗读训练',
      description: '跟随节拍器朗读，减少停顿。',
      duration: 10,
      difficulty: 3,
    ),
    ModuleTrainingTask(
      id: 'task_voice_fluency_2',
      domain: TrainingDomain.voice,
      submodule: TrainingSubmodule.fluency,
      title: '连贯叙述训练',
      description: '围绕固定主题连贯描述 30 秒。',
      duration: 12,
      difficulty: 4,
    ),

    // Motion - balance
    ModuleTrainingTask(
      id: 'task_motion_balance_1',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.balance,
      title: '静态平衡维持',
      description: '双脚并拢站立，保持重心稳定。',
      duration: 8,
      difficulty: 2,
    ),
    ModuleTrainingTask(
      id: 'task_motion_balance_2',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.balance,
      title: '单侧重心转移',
      description: '左右重心缓慢转移，控制身体晃动。',
      duration: 12,
      difficulty: 4,
    ),

    // Motion - gait
    ModuleTrainingTask(
      id: 'task_motion_gait_1',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.gait,
      title: '步幅节奏训练',
      description: '按节拍行走，保持步幅一致。',
      duration: 10,
      difficulty: 3,
    ),
    ModuleTrainingTask(
      id: 'task_motion_gait_2',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.gait,
      title: '起步冻结突破',
      description: '用口令提示法改善起步困难。',
      duration: 12,
      difficulty: 4,
    ),

    // Motion - coordination
    ModuleTrainingTask(
      id: 'task_motion_coord_1',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.coordination,
      title: '上下肢协同训练',
      description: '抬膝与摆臂同步，强化动作配合。',
      duration: 10,
      difficulty: 3,
    ),
    ModuleTrainingTask(
      id: 'task_motion_coord_2',
      domain: TrainingDomain.motion,
      submodule: TrainingSubmodule.coordination,
      title: '交替节律挑战',
      description: '执行左右交替动作，维持节律稳定。',
      duration: 15,
      difficulty: 5,
    ),
  ];
}

