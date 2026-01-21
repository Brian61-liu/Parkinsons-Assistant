import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import '../pages/tremor_test_page.dart';
import '../pages/gait_assist_page.dart';
import '../widgets/big_button.dart';

// 主页面
class HomePage extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  const HomePage({super.key, required this.onLanguageChange});

  void _showLanguageDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // 语言列表：按英文名称字母顺序排序
    final languages = [
      {'code': 'ar', 'country': '', 'name': l10n.arabic},           // Arabic
      {'code': 'zh', 'country': '', 'name': l10n.chinese},          // Chinese (Simplified)
      {'code': 'zh', 'country': 'TW', 'name': l10n.chineseTraditional}, // Chinese (Traditional)
      {'code': 'en', 'country': '', 'name': l10n.english},          // English
      {'code': 'fr', 'country': '', 'name': l10n.french},           // French
      {'code': 'de', 'country': '', 'name': l10n.german},           // German
      {'code': 'it', 'country': '', 'name': l10n.italian},          // Italian
      {'code': 'ja', 'country': '', 'name': l10n.japanese},         // Japanese
      {'code': 'ko', 'country': '', 'name': l10n.korean},           // Korean
      {'code': 'pt', 'country': '', 'name': l10n.portuguese},       // Portuguese
      {'code': 'ru', 'country': '', 'name': l10n.russian},          // Russian
      {'code': 'es', 'country': '', 'name': l10n.spanish},          // Spanish
    ];
    
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          l10n.selectLanguage,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: languages.map((lang) {
          return CupertinoActionSheetAction(
            onPressed: () {
              onLanguageChange(Locale(
                lang['code'] as String,
                lang['country'] as String,
              ));
              Navigator.pop(context);
            },
            child: Text(
              lang['name'] as String,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: Text(l10n.ok, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      // 使用 iOS 风格的导航栏（CupertinoNavigationBar）
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CupertinoNavigationBar(
          backgroundColor: Colors.blue[50],
          border: null,
          middle: Text(
            l10n.appTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26, // 增大导航栏字体
              color: Colors.black87,
            ),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showLanguageDialog(context),
            child: const Icon(
              CupertinoIcons.globe,
              color: Colors.blue,
              size: 28,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  l10n.selectTraining,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3, // 允许多行显示
                ),
              ),
              const SizedBox(height: 40),
            BigButton(
              title: l10n.tremorTest,
              icon: Icons.back_hand,
              color: Colors.orange.shade100,
              textColor: Colors.deepOrange,
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    // 使用 iOS 风格的路由转场
                    builder: (context) => const TremorTestPage(),
                  ),
                );
              },
            ),
              const SizedBox(height: 30),
              BigButton(
                title: l10n.gaitAssist,
                icon: Icons.directions_walk,
                color: Colors.green.shade100,
                textColor: Colors.green.shade800,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      // 使用 iOS 风格的路由转场
                      builder: (context) => const GaitAssistPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
