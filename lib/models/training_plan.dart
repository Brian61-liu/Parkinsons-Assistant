import 'dart:convert';
import 'training_item.dart';

/// 当日训练计划
class TrainingPlan {
  /// 日期字符串，格式 YYYY-MM-DD
  final String date;

  /// 必做项目（3–4 条，基于评分弱项优先）
  final List<TrainingItem> recommended;

  /// 选做项目（2–3 条，难度略高，供状态好时加练）
  final List<TrainingItem> optional;

  /// 计划生成时间
  final DateTime generatedAt;

  /// 生成本计划所依据的评分等级（低/中/高）
  final String basedOnLevel;

  const TrainingPlan({
    required this.date,
    required this.recommended,
    required this.optional,
    required this.generatedAt,
    required this.basedOnLevel,
  });

  // ── 派生属性 ──────────────────────────────

  /// 全部训练项（必做 + 选做）
  List<TrainingItem> get allItems => [...recommended, ...optional];

  /// 必做总时长（分钟）
  int get recommendedTotalDuration =>
      recommended.fold(0, (sum, item) => sum + item.duration);

  /// 已完成的必做数量
  int get completedCount =>
      recommended.where((i) => i.isCompleted).length;

  /// 必做完成百分比 0.0–1.0
  double get completionRate =>
      recommended.isEmpty ? 0 : completedCount / recommended.length;

  bool get isFullyCompleted => completedCount == recommended.length;

  // ── 标记完成 ─────────────────────────────

  /// 返回将 [itemId] 标记为已完成的新计划（不可变更新）
  TrainingPlan markCompleted(String itemId) {
    return copyWith(
      recommended: recommended
          .map((i) => i.id == itemId ? i.copyWith(isCompleted: true) : i)
          .toList(),
      optional: optional
          .map((i) => i.id == itemId ? i.copyWith(isCompleted: true) : i)
          .toList(),
    );
  }

  // ── 序列化 ───────────────────────────────

  Map<String, dynamic> toMap() => {
        'date': date,
        'recommended': recommended.map((i) => i.toMap()).toList(),
        'optional': optional.map((i) => i.toMap()).toList(),
        'generatedAt': generatedAt.toIso8601String(),
        'basedOnLevel': basedOnLevel,
      };

  factory TrainingPlan.fromMap(Map<String, dynamic> m) => TrainingPlan(
        date: m['date'] as String,
        recommended: (m['recommended'] as List<dynamic>)
            .map((e) => TrainingItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        optional: (m['optional'] as List<dynamic>)
            .map((e) => TrainingItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        generatedAt: DateTime.parse(m['generatedAt'] as String),
        basedOnLevel: m['basedOnLevel'] as String,
      );

  String toJson() => jsonEncode(toMap());

  factory TrainingPlan.fromJson(String source) =>
      TrainingPlan.fromMap(jsonDecode(source) as Map<String, dynamic>);

  TrainingPlan copyWith({
    String? date,
    List<TrainingItem>? recommended,
    List<TrainingItem>? optional,
    DateTime? generatedAt,
    String? basedOnLevel,
  }) {
    return TrainingPlan(
      date: date ?? this.date,
      recommended: recommended ?? this.recommended,
      optional: optional ?? this.optional,
      generatedAt: generatedAt ?? this.generatedAt,
      basedOnLevel: basedOnLevel ?? this.basedOnLevel,
    );
  }

  @override
  String toString() =>
      'TrainingPlan(date: $date, recommended: ${recommended.length}, '
      'optional: ${optional.length}, level: $basedOnLevel)';
}
