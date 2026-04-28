import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/user_settings_service.dart';
import '../services/voice_assist_service.dart';

/// 满足无障碍标准的按钮：
/// - 最小点击区域 ⋧ 56×56（>44）
/// - 支持高对比度配色
/// - 可选语音提示（命中 [UserSettings.voiceHints]）
class AccessibleButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;

  /// 朗读文案，未提供则使用 [label]
  final String? voiceLabel;
  final bool fullWidth;
  final EdgeInsetsGeometry? padding;

  /// 满足 WCAG 触控标准的最小尺寸
  static const double minTapSize = 56;

  const AccessibleButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.voiceLabel,
    this.fullWidth = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<UserSettingsService>().settings;
    final highContrast = settings.highContrast;
    final voiceEnabled = settings.voiceHints;

    final bg = highContrast ? Colors.black : Theme.of(context).colorScheme.primary;
    final fg = highContrast ? Colors.white : Theme.of(context).colorScheme.onPrimary;

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: voiceLabel ?? label,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: minTapSize,
          minWidth: minTapSize,
        ),
        child: ElevatedButton(
          onPressed: onPressed == null
              ? null
              : () {
                  if (voiceEnabled) {
                    VoiceAssistService(enabled: true).announceTap(
                      voiceLabel ?? label,
                    );
                  }
                  onPressed!();
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: bg,
            foregroundColor: fg,
            minimumSize:
                fullWidth ? const Size.fromHeight(minTapSize) : const Size(minTapSize, minTapSize),
            padding:
                padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            side: highContrast
                ? const BorderSide(color: Colors.black, width: 2)
                : BorderSide.none,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 24),
                const SizedBox(width: 12),
              ],
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
