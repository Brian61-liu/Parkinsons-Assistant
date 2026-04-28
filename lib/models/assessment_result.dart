class AssessmentResult {
  final int? id;
  final DateTime timestamp;
  final double handScore;
  final double voiceScore;
  final double motionScore;
  final double overallScore;
  final String level;

  const AssessmentResult({
    this.id,
    required this.timestamp,
    required this.handScore,
    required this.voiceScore,
    required this.motionScore,
    required this.overallScore,
    required this.level,
  });

  /// 根据三项评分计算综合评分与等级，便于外部调用
  factory AssessmentResult.fromScores({
    int? id,
    required DateTime timestamp,
    required double handScore,
    required double voiceScore,
    required double motionScore,
  }) {
    final overall =
        (handScore * 0.4 + voiceScore * 0.3 + motionScore * 0.3);
    final level = _calcLevel(overall);
    return AssessmentResult(
      id: id,
      timestamp: timestamp,
      handScore: handScore,
      voiceScore: voiceScore,
      motionScore: motionScore,
      overallScore: overall,
      level: level,
    );
  }

  static String _calcLevel(double score) {
    if (score >= 70) return '高';
    if (score >= 45) return '中';
    return '低';
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'timestamp': timestamp.toIso8601String(),
      'handScore': handScore,
      'voiceScore': voiceScore,
      'motionScore': motionScore,
      'overallScore': overallScore,
      'level': level,
    };
  }

  factory AssessmentResult.fromMap(Map<String, dynamic> map) {
    return AssessmentResult(
      id: map['id'] as int?,
      timestamp: DateTime.parse(map['timestamp'] as String),
      handScore: (map['handScore'] as num).toDouble(),
      voiceScore: (map['voiceScore'] as num).toDouble(),
      motionScore: (map['motionScore'] as num).toDouble(),
      overallScore: (map['overallScore'] as num).toDouble(),
      level: map['level'] as String,
    );
  }

  AssessmentResult copyWith({
    int? id,
    DateTime? timestamp,
    double? handScore,
    double? voiceScore,
    double? motionScore,
    double? overallScore,
    String? level,
  }) {
    return AssessmentResult(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      handScore: handScore ?? this.handScore,
      voiceScore: voiceScore ?? this.voiceScore,
      motionScore: motionScore ?? this.motionScore,
      overallScore: overallScore ?? this.overallScore,
      level: level ?? this.level,
    );
  }
}
