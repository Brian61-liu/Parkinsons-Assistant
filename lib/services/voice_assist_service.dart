import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// 简易语音/可访问性提示服务。
///
/// 当前为模拟实现：
/// - 通过 [debugPrint] 输出语音提示文案，方便联调与日志追踪
/// - 通过系统 [HapticFeedback] 提供触觉反馈
///
/// 未来可替换为 flutter_tts 等真实语音合成实现。
class VoiceAssistService {
  /// 是否启用语音提示（由 UserSettings 控制）
  bool enabled;
  final void Function(String message)? onSpeak;

  VoiceAssistService({this.enabled = false, this.onSpeak});

  /// 朗读文本（模拟）。
  void speak(String message) {
    if (!enabled) return;
    debugPrint('[VoiceAssist] $message');
    onSpeak?.call(message);
  }

  /// 按钮点击反馈（语音 + 触觉）。
  Future<void> announceTap(String label) async {
    speak(label);
    try {
      await HapticFeedback.selectionClick();
    } catch (_) {
      // 部分平台不支持，忽略
    }
  }

  /// 关键操作完成提示（语音 + 中等强度震动）。
  Future<void> announceConfirm(String message) async {
    speak(message);
    try {
      await HapticFeedback.mediumImpact();
    } catch (_) {}
  }
}
