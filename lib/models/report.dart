import 'dart:convert';

import 'training_record.dart';

/// 康复报告：
/// {
///   summary: string,
///   scores: {...},
///   trends: {...},
///   completion: {...}
/// }
class RehabReport {
  final String summary;
  final ReportScores scores;
  final ReportTrends trends;
  final ReportCompletion completion;
  final DateTime generatedAt;

  const RehabReport({
    required this.summary,
    required this.scores,
    required this.trends,
    required this.completion,
    required this.generatedAt,
  });

  Map<String, dynamic> toMap() => {
        'summary': summary,
        'scores': scores.toMap(),
        'trends': trends.toMap(),
        'completion': completion.toMap(),
        'generatedAt': generatedAt.toIso8601String(),
      };

  factory RehabReport.fromMap(Map<String, dynamic> map) => RehabReport(
        summary: map['summary'] as String,
        scores:
            ReportScores.fromMap(map['scores'] as Map<String, dynamic>),
        trends:
            ReportTrends.fromMap(map['trends'] as Map<String, dynamic>),
        completion: ReportCompletion.fromMap(
            map['completion'] as Map<String, dynamic>),
        generatedAt: DateTime.parse(map['generatedAt'] as String),
      );

  String toJson() => jsonEncode(toMap());

  factory RehabReport.fromJson(String source) =>
      RehabReport.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class ReportScores {
  final double hand;
  final double voice;
  final double motion;
  final double overall;
  final String level;

  const ReportScores({
    required this.hand,
    required this.voice,
    required this.motion,
    required this.overall,
    required this.level,
  });

  Map<String, dynamic> toMap() => {
        'hand': hand,
        'voice': voice,
        'motion': motion,
        'overall': overall,
        'level': level,
      };

  factory ReportScores.fromMap(Map<String, dynamic> map) => ReportScores(
        hand: (map['hand'] as num).toDouble(),
        voice: (map['voice'] as num).toDouble(),
        motion: (map['motion'] as num).toDouble(),
        overall: (map['overall'] as num).toDouble(),
        level: map['level'] as String,
      );
}

class ReportTrends {
  final Map<String, TrendEntry> byType;
  final List<String> highlights;

  const ReportTrends({
    required this.byType,
    required this.highlights,
  });

  Map<String, dynamic> toMap() => {
        'byType': {
          for (final e in byType.entries) e.key: e.value.toMap(),
        },
        'highlights': highlights,
      };

  factory ReportTrends.fromMap(Map<String, dynamic> map) {
    final rawByType = map['byType'] as Map<String, dynamic>;
    return ReportTrends(
      byType: {
        for (final e in rawByType.entries)
          e.key: TrendEntry.fromMap(e.value as Map<String, dynamic>),
      },
      highlights: (map['highlights'] as List<dynamic>).cast<String>(),
    );
  }
}

class TrendEntry {
  final double? currentWeekAvg;
  final double? previousWeekAvg;
  final double? changePercent;
  final TrendDirection direction;
  final String description;

  const TrendEntry({
    required this.currentWeekAvg,
    required this.previousWeekAvg,
    required this.changePercent,
    required this.direction,
    required this.description,
  });

  Map<String, dynamic> toMap() => {
        'currentWeekAvg': currentWeekAvg,
        'previousWeekAvg': previousWeekAvg,
        'changePercent': changePercent,
        'direction': direction.name,
        'description': description,
      };

  factory TrendEntry.fromMap(Map<String, dynamic> map) => TrendEntry(
        currentWeekAvg: (map['currentWeekAvg'] as num?)?.toDouble(),
        previousWeekAvg: (map['previousWeekAvg'] as num?)?.toDouble(),
        changePercent: (map['changePercent'] as num?)?.toDouble(),
        direction: TrendDirection.values.firstWhere(
          (d) => d.name == map['direction'],
          orElse: () => TrendDirection.noData,
        ),
        description: map['description'] as String,
      );

  factory TrendEntry.fromTrendResult(TrendResult trend) => TrendEntry(
        currentWeekAvg: trend.currentWeekAvg,
        previousWeekAvg: trend.previousWeekAvg,
        changePercent: trend.changePercent,
        direction: trend.direction,
        description: trend.description,
      );
}

class ReportCompletion {
  final int dailyCompleted;
  final int dailyTarget;
  final double dailyRate;
  final bool dailyDone;

  final int weeklyCompleted;
  final int weeklyTarget;
  final double weeklyRate;
  final bool weeklyDone;

  final int streakDays;

  const ReportCompletion({
    required this.dailyCompleted,
    required this.dailyTarget,
    required this.dailyRate,
    required this.dailyDone,
    required this.weeklyCompleted,
    required this.weeklyTarget,
    required this.weeklyRate,
    required this.weeklyDone,
    required this.streakDays,
  });

  Map<String, dynamic> toMap() => {
        'daily': {
          'completed': dailyCompleted,
          'target': dailyTarget,
          'rate': dailyRate,
          'done': dailyDone,
        },
        'weekly': {
          'completed': weeklyCompleted,
          'target': weeklyTarget,
          'rate': weeklyRate,
          'done': weeklyDone,
        },
        'streakDays': streakDays,
      };

  factory ReportCompletion.fromMap(Map<String, dynamic> map) {
    final daily = map['daily'] as Map<String, dynamic>;
    final weekly = map['weekly'] as Map<String, dynamic>;

    return ReportCompletion(
      dailyCompleted: daily['completed'] as int,
      dailyTarget: daily['target'] as int,
      dailyRate: (daily['rate'] as num).toDouble(),
      dailyDone: daily['done'] as bool,
      weeklyCompleted: weekly['completed'] as int,
      weeklyTarget: weekly['target'] as int,
      weeklyRate: (weekly['rate'] as num).toDouble(),
      weeklyDone: weekly['done'] as bool,
      streakDays: map['streakDays'] as int,
    );
  }
}
