import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_settings.dart';

/// 无障碍设置状态管理（基于 ChangeNotifier，配合 provider 使用）。
///
/// 持久化到 SharedPreferences。
class UserSettingsService extends ChangeNotifier {
  static const String _prefsKey = 'user_settings_v1';

  UserSettings _settings = const UserSettings();

  UserSettings get settings => _settings;
  double get fontScale => _settings.fontScale;
  bool get highContrast => _settings.highContrast;
  bool get voiceHints => _settings.voiceHints;

  bool _initialized = false;
  bool get initialized => _initialized;

  /// 启动时调用一次，恢复设置。
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_prefsKey);
      if (raw != null) {
        _settings = UserSettings.fromJson(raw);
      }
    } catch (e) {
      debugPrint('UserSettingsService load failed: $e');
    } finally {
      _initialized = true;
      notifyListeners();
    }
  }

  Future<void> updateFontScale(double scale) async {
    final clamped = scale.clamp(
      UserSettings.minFontScale,
      UserSettings.maxFontScale,
    );
    if (clamped == _settings.fontScale) return;
    await _save(_settings.copyWith(fontScale: clamped));
  }

  Future<void> setHighContrast(bool enabled) async {
    if (enabled == _settings.highContrast) return;
    await _save(_settings.copyWith(highContrast: enabled));
  }

  Future<void> setVoiceHints(bool enabled) async {
    if (enabled == _settings.voiceHints) return;
    await _save(_settings.copyWith(voiceHints: enabled));
  }

  Future<void> reset() async {
    await _save(const UserSettings());
  }

  Future<void> _save(UserSettings next) async {
    _settings = next;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsKey, next.toJson());
    } catch (e) {
      debugPrint('UserSettingsService save failed: $e');
    }
  }

  /// 根据当前设置生成主题（普通 / 高对比度）。
  ThemeData buildTheme() {
    if (_settings.highContrast) {
      return ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF000000),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF0033CC),
          onSecondary: Color(0xFFFFFFFF),
          error: Color(0xFFCC0000),
          onError: Color(0xFFFFFFFF),
          surface: Color(0xFFFFFFFF),
          onSurface: Color(0xFF000000),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          displayLarge:
              TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black),
          displayMedium:
              TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.black),
          displaySmall:
              TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Colors.black),
          headlineLarge:
              TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black),
          headlineMedium:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black),
          titleLarge:
              TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        ),
      );
    }

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 18),
        bodyMedium: TextStyle(fontSize: 16),
      ),
    );
  }
}
