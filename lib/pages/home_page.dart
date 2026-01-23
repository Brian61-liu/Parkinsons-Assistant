import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../l10n/app_localizations.dart';
import '../pages/tremor_test_page.dart';
import '../pages/data_management_page.dart';
import '../pages/privacy_policy_page.dart';
import '../widgets/big_button.dart';
import '../services/auth_service.dart';

// 主页面
class HomePage extends StatelessWidget {
  final Function(Locale) onLanguageChange;
  final AuthService _authService = AuthService();

  HomePage({super.key, required this.onLanguageChange});

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

  void _showLogoutDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirm),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(l10n.cancel),
          ),
          CupertinoDialogAction(
            onPressed: () async {
              Navigator.pop(context);
              await _authService.signOut();
            },
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }

  void _showSettingsMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          l10n.settings,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const DataManagementPage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.shield_lefthalf_fill, color: Colors.blue),
                const SizedBox(width: 8),
                Text(l10n.dataManagement),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const PrivacyPolicyPage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.doc_text, color: Colors.green),
                const SizedBox(width: 8),
                Text(l10n.privacyPolicy),
              ],
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              _showLogoutDialog(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.square_arrow_left, color: Colors.red),
                const SizedBox(width: 8),
                Text(l10n.logout),
              ],
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          child: Text(l10n.cancel),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser;
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CupertinoNavigationBar(
          backgroundColor: Colors.blue[50],
          border: null,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => _showSettingsMenu(context),
            child: const Icon(
              CupertinoIcons.gear,
              color: Colors.blue,
              size: 26,
            ),
          ),
          middle: Text(
            l10n.appTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
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
              // 用户欢迎信息
              if (user != null) ...[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: user.photoURL != null 
                      ? NetworkImage(user.photoURL!)
                      : null,
                  backgroundColor: Colors.blue[100],
                  child: user.photoURL == null 
                      ? Icon(Icons.person, size: 40, color: Colors.blue[700])
                      : null,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.welcome(user.displayName ?? user.email ?? 'User'),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
              ],
              
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
                  maxLines: 3,
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
                      builder: (context) => const TremorTestPage(),
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
