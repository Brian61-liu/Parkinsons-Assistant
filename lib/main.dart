import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 加载保存的语言设置
  final savedLocale = await _loadSavedLocale();

  runApp(KineoApp(initialLocale: savedLocale));
}

/// 加载保存的语言设置
Future<Locale> _loadSavedLocale() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('app_language_code');
    final countryCode = prefs.getString('app_country_code');

    if (languageCode != null) {
      return Locale(languageCode, countryCode ?? '');
    }
  } catch (e) {
    debugPrint('Failed to load saved locale: $e');
  }

  // 默认中文
  return const Locale('zh', '');
}

class KineoApp extends StatefulWidget {
  final Locale initialLocale;

  const KineoApp({super.key, required this.initialLocale});

  @override
  State<KineoApp> createState() => _KineoAppState();
}

class _KineoAppState extends State<KineoApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  Future<void> changeLanguage(Locale locale) async {
    // 保存语言设置
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('app_language_code', locale.languageCode);
      await prefs.setString('app_country_code', locale.countryCode ?? '');
    } catch (e) {
      debugPrint('Failed to save locale: $e');
    }

    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kineo',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // 阿拉伯语 Arabic
        Locale('zh', ''), // 简体中文 Chinese Simplified
        Locale('zh', 'TW'), // 繁體中文 Chinese Traditional
        Locale('en', ''), // 英语 English
        Locale('fr', ''), // 法语 French
        Locale('de', ''), // 德语 German
        Locale('it', ''), // 意大利语 Italian
        Locale('ja', ''), // 日语 Japanese
        Locale('ko', ''), // 韩语 Korean
        Locale('pt', ''), // 葡萄牙语 Portuguese
        Locale('ru', ''), // 俄语 Russian
        Locale('es', ''), // 西班牙语 Spanish
      ],
      theme: ThemeData(
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
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.1)),
          child: child!,
        );
      },
      home: _AuthStateChecker(onLanguageChange: changeLanguage),
    );
  }
}

/// 认证状态检查器，支持游客模式
class _AuthStateChecker extends StatefulWidget {
  final Function(Locale) onLanguageChange;

  const _AuthStateChecker({required this.onLanguageChange});

  @override
  State<_AuthStateChecker> createState() => _AuthStateCheckerState();
}

class _AuthStateCheckerState extends State<_AuthStateChecker> {
  bool _isGuestMode = false;

  @override
  void initState() {
    super.initState();
    _checkGuestMode();
  }

  Future<void> _checkGuestMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isGuest = prefs.getBool('is_guest_mode') ?? false;
      if (mounted) {
        setState(() {
          _isGuestMode = isGuest;
        });
      }
    } catch (e) {
      debugPrint('Failed to check guest mode: $e');
    }
  }

  void _setGuestMode(bool isGuest) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest_mode', isGuest);
      if (mounted) {
        setState(() {
          _isGuestMode = isGuest;
        });
      }
    } catch (e) {
      debugPrint('Failed to set guest mode: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 如果是游客模式，直接显示主页
    if (_isGuestMode) {
      return HomePage(
        onLanguageChange: widget.onLanguageChange,
        onGuestModeChanged: _setGuestMode,
      );
    }

    // 否则检查 Firebase 认证状态
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 正在检查登录状态
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // 已登录 -> 显示主页
        if (snapshot.hasData) {
          return HomePage(
            onLanguageChange: widget.onLanguageChange,
            onGuestModeChanged: _setGuestMode,
          );
        }

        // 未登录 -> 显示登录页
        return LoginPage(
          onLanguageChange: widget.onLanguageChange,
          onGuestLogin: () => _setGuestMode(true),
        );
      },
    );
  }
}
