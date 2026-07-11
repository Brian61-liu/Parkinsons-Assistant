import 'package:flutter/material.dart';

/// Amplio 设计系统颜色 Token
abstract final class AppColors {
  // ── 主色 ──────────────────────────────────────────────────
  static const Color primary = Color(0xFF007AFF); // iOS 蓝
  static const Color primaryLight = Color(0xFFE8F3FF);

  // ── 语义色 ────────────────────────────────────────────────
  /// 仅用于"待打卡"状态，不用于医疗判断
  static const Color successGreen = Color(0xFF34C759);
  static const Color successGreenLight = Color(0xFFE6F9EC);
  static const Color warningAmber = Color(0xFFFF9500);
  static const Color warningAmberLight = Color(0xFFFFF3E0);
  static const Color errorRed = Color(0xFFFF3B30);

  // ── 背景 ──────────────────────────────────────────────────
  static const Color scaffoldBackground = Color(0xFFF5F5F7);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color tabBarBackground = Color(0xFFFFFFFF);

  // ── 卡片图标背景 ──────────────────────────────────────────
  static const Color voiceIconBg = Color(0xFFE8F3FF); // 蓝
  static const Color handIconBg = Color(0xFFE8F3FF);
  static const Color motionIconBg = Color(0xFFE8F3FF);
  static const Color medIconBg = Color(0xFFFFF3E0); // 琥珀

  // ── 文字 ──────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6C6C70);
  static const Color textTertiary = Color(0xFFAEAEB2);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── 分割线 / 描边 ─────────────────────────────────────────
  static const Color divider = Color(0xFFE5E5EA);
  static const Color borderLight = Color(0xFFF2F2F7);
}
