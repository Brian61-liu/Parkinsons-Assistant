import 'training_item.dart';

// ─────────────────────────────────────────────────────────────
//  TrainingRecord — 单次训练结果
// ─────────────────────────────────────────────────────────────

class TrainingRecord {
  final int? id;

  /// 训练类型
  final TrainingType type;

  /// 本次训练评分 0–100
  final double score;

  /// 日期字符串 YYYY-MM-DD（冗余存储，方便按天查询）
  final String date;

  /// 精确时间戳
  final DateTime timestamp;

  /// 训练时长（分钟），可选
  final int? duration;

  const TrainingRecord({
    this.id,
    required this.type,
    required this.score,
    required this.date,
    required this.timestamp,
    this.duration,
  });

  factory TrainingRecord.now({
    required TrainingType type,
    required double score,
    int? duration,
  }) {
    final now = DateTime.now();
    return TrainingRecord(
      type: type,
      score: score,
      date: _dateStr(now),
      timestamp: now,
      duration: duration,
    );
  }

  static String _dateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'type': type.key,
        'score': score,
        'date': date,
        'timestamp': timestamp.toIso8601String(),
        'duration': duration,
      };

  factory TrainingRecord.fromMap(Map<String, dynamic> m) => TrainingRecord(
        id: m['id'] as int?,
        type: TrainingType.fromKey(m['type'] as String),
        score: (m['score'] as num).toDouble(),
        date: m['date'] as String,
        timestamp: DateTime.parse(m['timestamp'] as String),
        duration: m['duration'] as int?,
      );

  TrainingRecord copyWith({
    int? id,
    TrainingType? type,
    double? score,
    String? date,
    DateTime? timestamp,
    int? duration,
  }) {
    return TrainingRecord(
      id: id ?? this.id,
      type: type ?? this.type,
      score: score ?? this.score,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
      duration: duration ?? this.duration,
    );
  }

  @override
  String toString() =>
      'TrainingRecord(type: ${type.key}, score: $score, date: $date)';
}

// ─────────────────────────────────────────────────────────────
//  DailyAverage — 某天某类型的平均评分（用于图表）
// ─────────────────────────────────────────────────────────────

class DailyAverage {
  final String date;
  final TrainingType type;

  /// 当天该类型的平均分
  final double average;

  /// 当天该类型的训练次数
  final int count;

  const DailyAverage({
    required this.date,
    required this.type,
    required this.average,
    required this.count,
  });

  @override
  String toString() =>
      'DailyAverage(date: $date, type: ${type.key}, avg: '
      '${average.toStringAsFixed(1)}, count: $count)';
}

// ─────────────────────────────────────────────────────────────
//  TrendDirection — 趋势方向
// ─────────────────────────────────────────────────────────────

enum TrendDirection {
  /// 较上周提升（changePercent > 2）
  up,

  /// 较上周下降（changePercent < -2）
  down,

  /// 基本持平（|changePercent| ≤ 2）
  stable,

  /// 上周无数据，无法比较
  noData,
}

// ─────────────────────────────────────────────────────────────
//  TrendResult — 单个维度的趋势分析结果
// ─────────────────────────────────────────────────────────────

class TrendResult {
  final TrainingType type;

  /// 本周平均分（null 表示本周无数据）
  final double? currentWeekAvg;

  /// 上周平均分（null 表示上周无数据）
  final double? previousWeekAvg;

  /// 变化百分比：(current - prev) / prev × 100
  /// null 表示上周无数据
  final double? changePercent;

  final TrendDirection direction;

  /// 人类可读描述，例如："手部稳定性较上周提升 8%"
  final String description;

  const TrendResult({
    required this.type,
    required this.currentWeekAvg,
    required this.previousWeekAvg,
    required this.changePercent,
    required this.direction,
    required this.description,
  });

  factory TrendResult.compute({
    required TrainingType type,
    required double? currentWeekAvg,
    required double? previousWeekAvg,
  }) {
    if (previousWeekAvg == null || previousWeekAvg == 0) {
      return TrendResult(
        type: type,
        currentWeekAvg: currentWeekAvg,
        previousWeekAvg: previousWeekAvg,
        changePercent: null,
        direction: TrendDirection.noData,
        description: currentWeekAvg != null
            ? '${type.label}本周平均 ${currentWeekAvg.toStringAsFixed(0)} 分（上周无数据）'
            : '${type.label}本周暂无训练数据',
      );
    }

    if (currentWeekAvg == null) {
      return TrendResult(
        type: type,
        currentWeekAvg: null,
        previousWeekAvg: previousWeekAvg,
        changePercent: null,
        direction: TrendDirection.noData,
        description: '${type.label}本周暂无训练数据',
      );
    }

    final pct = (currentWeekAvg - previousWeekAvg) /
        previousWeekAvg *
        100;

    final direction = pct > 2
        ? TrendDirection.up
        : pct < -2
            ? TrendDirection.down
            : TrendDirection.stable;

    final String desc;
    final absPct = pct.abs().toStringAsFixed(0);
    if (direction == TrendDirection.up) {
      desc = '${type.label}较上周提升 $absPct%';
    } else if (direction == TrendDirection.down) {
      desc = '${type.label}较上周下降 $absPct%';
    } else {
      desc = '${type.label}与上周基本持平';
    }

    return TrendResult(
      type: type,
      currentWeekAvg: currentWeekAvg,
      previousWeekAvg: previousWeekAvg,
      changePercent: pct,
      direction: direction,
      description: desc,
    );
  }

  @override
  String toString() => 'TrendResult(${type.key}: $description)';
}
