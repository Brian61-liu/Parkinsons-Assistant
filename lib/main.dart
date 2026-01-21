import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ParkinsonApp());
}

class ParkinsonApp extends StatefulWidget {
  const ParkinsonApp({super.key});

  @override
  State<ParkinsonApp> createState() => _ParkinsonAppState();
}

class _ParkinsonAppState extends State<ParkinsonApp> {
  Locale _locale = const Locale('zh', ''); // 默认中文

  void changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kineo',
      debugShowCheckedModeBanner: false,
      locale: _locale, // 设置当前语言
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
        // 增大整体字体尺寸
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
      // 启用 iOS 风格的路由转场动画
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.1), // 全局放大字体 10%
          ),
          child: child!,
        );
      },
      home: HomePage(onLanguageChange: changeLanguage),
    );
  }
}
