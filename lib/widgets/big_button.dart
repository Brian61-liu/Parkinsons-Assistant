import 'package:flutter/material.dart';

// 大按钮组件（专为老年人设计，使用 Material Design 风格，点击反馈明显）
class BigButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  const BigButton({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 使用 Material Design 的 InkWell 或 ElevatedButton 提供点击反馈
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        // Material Design 的点击波纹效果
        splashColor: textColor.withValues(alpha: 0.3),
        highlightColor: textColor.withValues(alpha: 0.1),
        child: Container(
          width: double.infinity,
          height: 140, // 增大按钮高度：120 -> 140
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 56, color: textColor), // 增大图标：48 -> 56
              const SizedBox(width: 24),
              Text(
                title,
                style: TextStyle(
                  fontSize: 32, // 增大字体：28 -> 32
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  letterSpacing: 1.2, // 增加字间距，提高可读性
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
