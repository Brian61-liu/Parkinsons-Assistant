import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_settings.dart';
import '../services/user_settings_service.dart';
import '../widgets/accessible_button.dart';

/// 无障碍设置页（扁平结构：仅一屏 + 几个开关）
class AccessibilitySettingsPage extends StatelessWidget {
  const AccessibilitySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final service = context.watch<UserSettingsService>();
    final settings = service.settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('无障碍设置'),
        toolbarHeight: 64,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _SectionTitle('字体大小'),
            _FontScaleControl(
              value: settings.fontScale,
              onChanged: service.updateFontScale,
            ),
            const SizedBox(height: 24),
            _SectionTitle('显示偏好'),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('高对比度模式', style: TextStyle(fontSize: 18)),
              subtitle: const Text('黑白高对比，便于阅读'),
              value: settings.highContrast,
              onChanged: service.setHighContrast,
            ),
            const SizedBox(height: 8),
            _SectionTitle('交互辅助'),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('语音提示', style: TextStyle(fontSize: 18)),
              subtitle: const Text('点击按钮时朗读名称（控制台模拟）'),
              value: settings.voiceHints,
              onChanged: service.setVoiceHints,
            ),
            const SizedBox(height: 32),
            AccessibleButton(
              label: '恢复默认设置',
              icon: Icons.restore,
              onPressed: service.reset,
            ),
            const SizedBox(height: 24),
            _PreviewBox(),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _FontScaleControl extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _FontScaleControl({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Text('A', style: TextStyle(fontSize: 14)),
            Expanded(
              child: Slider(
                min: UserSettings.minFontScale,
                max: UserSettings.maxFontScale,
                divisions: 6,
                value: value,
                label: 'x${value.toStringAsFixed(1)}',
                onChanged: onChanged,
              ),
            ),
            const Text('A', style: TextStyle(fontSize: 28)),
          ],
        ),
        Text(
          '当前缩放：x${value.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}

class _PreviewBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('预览', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text('这是正文文字示例。', style: TextStyle(fontSize: 16)),
          SizedBox(height: 4),
          Text('训练目标：每日完成 3 次。', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
