import 'medication_reminder.dart';

/// 手动服药打卡记录（仅本机；MVP 状态为 taken）。
class MedicationCheckIn {
  final int? id;
  final int reminderId;
  final String scheduledDate;
  final String scheduledTime;
  final DateTime checkedAt;
  final String status;

  const MedicationCheckIn({
    this.id,
    required this.reminderId,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.checkedAt,
    this.status = 'taken',
  });

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'reminder_id': reminderId,
        'scheduled_date': scheduledDate,
        'scheduled_time': scheduledTime,
        'checked_at': checkedAt.toIso8601String(),
        'status': status,
      };

  factory MedicationCheckIn.fromMap(Map<String, dynamic> map) {
    return MedicationCheckIn(
      id: map['id'] as int?,
      reminderId: map['reminder_id'] as int,
      scheduledDate: map['scheduled_date'] as String,
      scheduledTime: map['scheduled_time'] as String,
      checkedAt: DateTime.parse(map['checked_at'] as String),
      status: map['status'] as String? ?? 'taken',
    );
  }
}

/// 今日清单行：提醒 + 是否已打卡。
class MedicationTodayItem {
  final MedicationReminder reminder;
  final bool isTaken;
  final DateTime? checkedAt;

  const MedicationTodayItem({
    required this.reminder,
    required this.isTaken,
    this.checkedAt,
  });
}
