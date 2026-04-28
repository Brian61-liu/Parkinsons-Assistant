import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/assessment_result.dart';
import '../models/training_item.dart';
import '../models/training_plan.dart';

// ─────────────────────────────────────────────────────────────
//  预定义训练项目目录（按类型 × 难度排列，共 18 条）
// ─────────────────────────────────────────────────────────────

/// 所有可调度的训练项目（静态目录，不可变）
const List<TrainingItem> _kCatalog = [
  // ── 手部训练 ──────────────────────────────────
  TrainingItem(
    id: 'hand_d1_a',
    type: TrainingType.hand,
    title: '手指弯曲放松',
    description: '缓慢弯曲并伸直全部手指，重复 10 次，感受关节舒展。',
    duration: 5,
    difficulty: 1,
  ),
  TrainingItem(
    id: 'hand_d1_b',
    type: TrainingType.hand,
    title: '手掌开合热身',
    description: '双手同时张开再合拢，节奏均匀，重复 12 次。',
    duration: 5,
    difficulty: 1,
  ),
  TrainingItem(
    id: 'hand_d2_a',
    type: TrainingType.hand,
    title: '握拳展开练习',
    description: '用力握拳保持 3 秒，再完全展开，重复 8 次。',
    duration: 8,
    difficulty: 2,
  ),
  TrainingItem(
    id: 'hand_d2_b',
    type: TrainingType.hand,
    title: '手指波浪运动',
    description: '从小指到拇指依次弯曲，形成波浪，来回各 5 组。',
    duration: 8,
    difficulty: 2,
  ),
  TrainingItem(
    id: 'hand_d3_a',
    type: TrainingType.hand,
    title: '手指对指练习',
    description: '拇指依次与其他 4 根手指轻触，正逆序各 5 轮。',
    duration: 10,
    difficulty: 3,
  ),
  TrainingItem(
    id: 'hand_d3_b',
    type: TrainingType.hand,
    title: '手腕旋转训练',
    description: '顺时针和逆时针各旋转手腕 10 圈，保持流畅。',
    duration: 10,
    difficulty: 3,
  ),
  TrainingItem(
    id: 'hand_d4_a',
    type: TrainingType.hand,
    title: '精细抓握强化',
    description: '使用软球进行抓握—放松循环，增强手部力量，共 3 组 × 15 次。',
    duration: 12,
    difficulty: 4,
  ),
  TrainingItem(
    id: 'hand_d5_a',
    type: TrainingType.hand,
    title: '双手协调挑战',
    description: '双手交替拍击节拍，按节奏完成 4 × 16 拍序列。',
    duration: 15,
    difficulty: 5,
  ),

  // ── 语音训练 ──────────────────────────────────
  TrainingItem(
    id: 'voice_d1_a',
    type: TrainingType.voice,
    title: '深呼吸发声基础',
    description: '深吸一口气，缓慢呼气同时发"啊"音，保持 5 秒，重复 6 次。',
    duration: 5,
    difficulty: 1,
  ),
  TrainingItem(
    id: 'voice_d1_b',
    type: TrainingType.voice,
    title: '口部热身运动',
    description: '张嘴—闭嘴、咧嘴—噘嘴各 10 次，放松口周肌肉。',
    duration: 5,
    difficulty: 1,
  ),
  TrainingItem(
    id: 'voice_d2_a',
    type: TrainingType.voice,
    title: '元音拉伸练习',
    description: '依次拉长发"ā、ē、ī、ō、ū"各 5 秒，注意音色稳定。',
    duration: 8,
    difficulty: 2,
  ),
  TrainingItem(
    id: 'voice_d2_b',
    type: TrainingType.voice,
    title: '音量渐强训练',
    description: '以低音开始发"1"并逐渐加大音量，从 1 数到 10，重复 3 组。',
    duration: 8,
    difficulty: 2,
  ),
  TrainingItem(
    id: 'voice_d3_a',
    type: TrainingType.voice,
    title: '短句朗读练习',
    description: '以清晰语速朗读："今天阳光很好，我要认真练习。" 重复 5 遍。',
    duration: 10,
    difficulty: 3,
  ),
  TrainingItem(
    id: 'voice_d4_a',
    type: TrainingType.voice,
    title: '语速节奏控制',
    description: '按节拍器（60 bpm）逐字朗读短文，训练语速稳定性。',
    duration: 12,
    difficulty: 4,
  ),
  TrainingItem(
    id: 'voice_d5_a',
    type: TrainingType.voice,
    title: '绕口令挑战',
    description: '练习绕口令"吃葡萄不吐葡萄皮"，加速直至流畅，共 5 组。',
    duration: 15,
    difficulty: 5,
  ),

  // ── 肢体动作训练 ──────────────────────────────
  TrainingItem(
    id: 'motion_d1_a',
    type: TrainingType.motion,
    title: '坐姿肢体舒展',
    description: '坐稳后缓慢转头左右各 5 次，再做肩部环绕 10 次。',
    duration: 5,
    difficulty: 1,
  ),
  TrainingItem(
    id: 'motion_d2_a',
    type: TrainingType.motion,
    title: '上肢左右摆动',
    description: '站立或坐立，双臂向两侧伸展再放下，重复 12 次，保持节奏。',
    duration: 8,
    difficulty: 2,
  ),
  TrainingItem(
    id: 'motion_d3_a',
    type: TrainingType.motion,
    title: '上肢协调运动',
    description: '双臂交替向前伸展再收回，配合呼吸，共 3 组 × 10 次。',
    duration: 10,
    difficulty: 3,
  ),
  TrainingItem(
    id: 'motion_d4_a',
    type: TrainingType.motion,
    title: '步态节奏练习',
    description: '原地踏步，膝盖抬至腰高，按节拍保持 90 步/分，共 2 分钟。',
    duration: 12,
    difficulty: 4,
  ),
  TrainingItem(
    id: 'motion_d5_a',
    type: TrainingType.motion,
    title: '全身协调挑战',
    description: '完成"手臂摆动 + 踏步 + 发声"三合一动作序列，4 × 8 拍。',
    duration: 15,
    difficulty: 5,
  ),
];

// ─────────────────────────────────────────────────────────────
//  难度分配策略
// ─────────────────────────────────────────────────────────────

/// 根据单维度得分返回【必做难度区间】和【选做难度区间】
({List<int> rec, List<int> opt}) _difficultyRange(double score) {
  if (score >= 70) {
    // 高水平 → 必做 3–4，选做 4–5
    return (rec: [3, 4], opt: [4, 5]);
  } else if (score >= 45) {
    // 中水平 → 必做 2–3，选做 3–4
    return (rec: [2, 3], opt: [3, 4]);
  } else {
    // 低水平 → 必做 1–2，选做 2–3
    return (rec: [1, 2], opt: [2, 3]);
  }
}

// ─────────────────────────────────────────────────────────────
//  TrainingPlanService
// ─────────────────────────────────────────────────────────────

class TrainingPlanService {
  static const String _prefKey = 'training_plan_cache';

  // ── 公开 API ──────────────────────────────

  /// 获取今日计划：
  /// - 缓存存在且日期匹配 → 直接返回缓存
  /// - 否则根据 [assessment] 重新生成并缓存
  Future<TrainingPlan> getTodaysPlan(AssessmentResult assessment) async {
    final cached = await _loadCached();
    final today = _todayKey();

    if (cached != null && cached.date == today) {
      debugPrint('TrainingPlanService: 命中缓存 (${cached.date})');
      return cached;
    }

    return regeneratePlan(assessment);
  }

  /// 强制重新生成并缓存（不读旧计划）
  Future<TrainingPlan> regeneratePlan(AssessmentResult assessment) async {
    final plan = generateDailyPlan(assessment);
    await _savePlan(plan);
    debugPrint('TrainingPlanService: 生成新计划 → ${plan.date}, '
        'rec=${plan.recommended.length}, opt=${plan.optional.length}');
    return plan;
  }

  /// 标记某项为已完成，并更新缓存
  Future<TrainingPlan> markItemCompleted(
    TrainingPlan plan,
    String itemId,
  ) async {
    final updated = plan.markCompleted(itemId);
    await _savePlan(updated);
    return updated;
  }

  // ── 核心生成函数（纯函数，可独立单测）──────

  /// 根据 [assessment] 生成当日训练计划。
  ///
  /// **必做规则：**
  /// - 找出得分最低的维度 → 分配 2 条必做项
  /// - 其余两个维度各 1 条必做项
  /// - 共 4 条必做，难度由各维度评分决定
  ///
  /// **选做规则：**
  /// - 每个维度各 1 条，难度比必做高一档
  /// - 共 3 条选做
  ///
  /// **低分强化：**
  /// - 某维度评分 < 45，对应必做数量 +1（最终可能 5 条必做）
  static TrainingPlan generateDailyPlan(AssessmentResult assessment) {
    final rng = Random();
    final today = _todayKey();

    final scores = {
      TrainingType.hand: assessment.handScore,
      TrainingType.voice: assessment.voiceScore,
      TrainingType.motion: assessment.motionScore,
    };

    // 找出得分最低的维度（将分配更多必做项）
    final weakest = scores.entries
        .reduce((a, b) => a.value <= b.value ? a : b)
        .key;

    final List<TrainingItem> recommended = [];
    final List<TrainingItem> optional = [];

    for (final type in TrainingType.values) {
      final score = scores[type]!;
      final range = _difficultyRange(score);

      // 必做数量：最弱维度 2 条（低分时 3 条），其他 1 条
      final isWeak = type == weakest;
      final recCount = isWeak ? (score < 45 ? 3 : 2) : 1;

      final recItems = _pickItems(
        type: type,
        diffLevels: range.rec,
        count: recCount,
        exclude: [],
        rng: rng,
      );
      recommended.addAll(recItems);

      // 选做：每维度 1 条，难度比必做高一档
      final optItems = _pickItems(
        type: type,
        diffLevels: range.opt,
        count: 1,
        exclude: recItems.map((i) => i.id).toList(),
        rng: rng,
      );
      optional.addAll(optItems);
    }

    return TrainingPlan(
      date: today,
      recommended: recommended,
      optional: optional,
      generatedAt: DateTime.now(),
      basedOnLevel: assessment.level,
    );
  }

  // ── 私有工具 ──────────────────────────────

  /// 从目录中筛选指定 [type] 且难度在 [diffLevels] 内的项目，随机取 [count] 条。
  /// [exclude] 列表中的 id 不会被选中（避免选做与必做重复）。
  static List<TrainingItem> _pickItems({
    required TrainingType type,
    required List<int> diffLevels,
    required int count,
    required List<String> exclude,
    required Random rng,
  }) {
    final pool = _kCatalog
        .where((i) =>
            i.type == type &&
            diffLevels.contains(i.difficulty) &&
            !exclude.contains(i.id))
        .toList();

    pool.shuffle(rng);
    return pool.take(count).toList();
  }

  static String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
  }

  Future<void> _savePlan(TrainingPlan plan) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefKey, plan.toJson());
    } catch (e) {
      debugPrint('TrainingPlanService: 保存计划失败 $e');
    }
  }

  Future<TrainingPlan?> _loadCached() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final json = prefs.getString(_prefKey);
      if (json == null) return null;
      return TrainingPlan.fromJson(json);
    } catch (e) {
      debugPrint('TrainingPlanService: 加载缓存失败 $e');
      return null;
    }
  }

  // ── 示例数据（用于 UI 预览、测试）──────────

  /// 返回一个固定的示例计划（不依赖 AssessmentResult）
  static TrainingPlan examplePlan() {
    return generateDailyPlan(
      AssessmentResult.fromScores(
        timestamp: DateTime.now(),
        handScore: 42,   // 低水平 → 更多手部必做
        voiceScore: 58,  // 中水平
        motionScore: 72, // 高水平
      ),
    );
  }
}
