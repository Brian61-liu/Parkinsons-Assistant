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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: textColor), // 稍微减小图标
                const SizedBox(width: 20),
                Flexible(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 2, // 允许最多两行
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 28, // 适当减小字体以适应更长的文本
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      letterSpacing: 0.5,
                      height: 1.2, // 行高
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
