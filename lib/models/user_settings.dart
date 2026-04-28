import 'dart:convert';

/// 无障碍用户设置
/// {
///   fontScale: number,
///   highContrast: boolean
/// }
class UserSettings {
  /// 字体缩放（1.0–1.6）
  final double fontScale;

  /// 是否启用高对比度主题
  final bool highContrast;

  /// 是否启用语音提示（按钮点击播报）
  final bool voiceHints;

  const UserSettings({
    this.fontScale = 1.1,
    this.highContrast = false,
    this.voiceHints = false,
  });

  /// 字体缩放约束范围
  static const double minFontScale = 1.0;
  static const double maxFontScale = 1.6;

  UserSettings copyWith({
    double? fontScale,
    bool? highContrast,
    bool? voiceHints,
  }) {
    return UserSettings(
      fontScale: fontScale ?? this.fontScale,
      highContrast: highContrast ?? this.highContrast,
      voiceHints: voiceHints ?? this.voiceHints,
    );
  }

  Map<String, dynamic> toMap() => {
        'fontScale': fontScale,
        'highContrast': highContrast,
        'voiceHints': voiceHints,
      };

  factory UserSettings.fromMap(Map<String, dynamic> map) => UserSettings(
        fontScale: (map['fontScale'] as num?)?.toDouble() ?? 1.1,
        highContrast: (map['highContrast'] as bool?) ?? false,
        voiceHints: (map['voiceHints'] as bool?) ?? false,
      );

  String toJson() => jsonEncode(toMap());

  factory UserSettings.fromJson(String source) =>
      UserSettings.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
