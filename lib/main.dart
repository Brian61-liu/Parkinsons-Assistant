import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'utils/gentle_page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/loading_screen.dart';
import 'services/user_settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 状态栏：浅色背景下使用深色图标与文字，提升对比度，便于康复/老年用户辨识
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFFF0F9FF),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );

  // 关键：不要在 main() await 耗时初始化，否则会卡在原生启动图。
  // 先渲染一个轻量 LoadingScreen，再在页面内完成初始化并跳转。
  final userSettings = UserSettingsService();
  // 异步加载，不阻塞首帧
  // ignore: discarded_futures
  userSettings.load();

  runApp(
    ChangeNotifierProvider<UserSettingsService>.value(
      value: userSettings,
      child: const AmplioApp(initialLocale: Locale('zh', '')),
    ),
  );
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

class AmplioApp extends StatefulWidget {
  final Locale initialLocale;

  const AmplioApp({super.key, required this.initialLocale});

  @override
  State<AmplioApp> createState() => _AmplioAppState();
}

class _AmplioAppState extends State<AmplioApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
    _loadSavedLocale().then((saved) {
      if (!mounted) return;
      setState(() {
        _locale = saved;
      });
    });
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
      title: 'Amplio',
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
      theme: context.watch<UserSettingsService>().buildTheme().copyWith(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              ),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: GentlePageTransitionsBuilder(),
                TargetPlatform.iOS: GentlePageTransitionsBuilder(),
              },
            ),
          ),
      builder: (context, child) {
        final scale = context.watch<UserSettingsService>().fontScale;
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(scale)),
          child: child!,
        );
      },
      home: LoadingScreen(onLanguageChange: changeLanguage),
    );
  }
}

/// 认证状态检查器，支持游客模式
class AuthGate extends StatefulWidget {
  final Function(Locale) onLanguageChange;

  const AuthGate({super.key, required this.onLanguageChange});

  @override
  State<AuthGate> createState() => _AuthStateCheckerState();
}

class _AuthStateCheckerState extends State<AuthGate> {
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
      if (!mounted) return;
      setState(() {
        _isGuestMode = isGuest;
      });
    } catch (e) {
      debugPrint('Failed to check guest mode: $e');
    }
  }

  void _setGuestMode(bool isGuest) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_guest_mode', isGuest);
      if (!mounted) return;
      setState(() {
        _isGuestMode = isGuest;
      });
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
