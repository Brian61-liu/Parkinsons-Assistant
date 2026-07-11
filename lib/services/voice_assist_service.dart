import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

/// 简易语音/可访问性提示服务。
///
/// 当前实现：
/// - 通过系统语义播报接口触发读屏提示（VoiceOver/TalkBack）
/// - 保留 [debugPrint] 便于联调与日志追踪
/// - 通过系统 [HapticFeedback] 提供触觉反馈
class VoiceAssistService {
  /// 是否启用语音提示（由 UserSettings 控制）
  bool enabled;
  final void Function(String message)? onSpeak;

  VoiceAssistService({this.enabled = false, this.onSpeak});

  /// 朗读文本（模拟）。
  void speak(String message) {
    if (!enabled) return;
    try {
      // ignore: deprecated_member_use
      SemanticsService.announce(message, TextDirection.ltr);
    } catch (_) {
      // 某些环境可能不支持 announce，降级为日志输出
    }
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
