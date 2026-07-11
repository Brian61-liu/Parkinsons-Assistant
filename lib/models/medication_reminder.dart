/// 本地用药提醒项（非处方；用户自定义短标签 + 时间点）。
class MedicationReminder {
  static const int maxLabelLength = 32;

  final int? id;
  final String label;
  final String timeHhmm;
  final bool enabled;
  final int sortOrder;
  final DateTime createdAt;

  const MedicationReminder({
    this.id,
    required this.label,
    required this.timeHhmm,
    this.enabled = true,
    this.sortOrder = 0,
    required this.createdAt,
  });

  factory MedicationReminder.create({
    required String label,
    required String timeHhmm,
    bool enabled = true,
    int sortOrder = 0,
  }) {
    return MedicationReminder(
      label: label.trim().length > maxLabelLength
          ? label.trim().substring(0, maxLabelLength)
          : label.trim(),
      timeHhmm: timeHhmm,
      enabled: enabled,
      sortOrder: sortOrder,
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'label': label,
        'time_hhmm': timeHhmm,
        'enabled': enabled ? 1 : 0,
        'sort_order': sortOrder,
        'created_at': createdAt.toIso8601String(),
      };

  factory MedicationReminder.fromMap(Map<String, dynamic> map) {
    return MedicationReminder(
      id: map['id'] as int?,
      label: map['label'] as String,
      timeHhmm: map['time_hhmm'] as String,
      enabled: (map['enabled'] as int) != 0,
      sortOrder: map['sort_order'] as int? ?? 0,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  MedicationReminder copyWith({
    int? id,
    String? label,
    String? timeHhmm,
    bool? enabled,
    int? sortOrder,
    DateTime? createdAt,
  }) {
    return MedicationReminder(
      id: id ?? this.id,
      label: label ?? this.label,
      timeHhmm: timeHhmm ?? this.timeHhmm,
      enabled: enabled ?? this.enabled,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
