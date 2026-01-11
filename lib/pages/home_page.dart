import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
import '../pages/tremor_test_page.dart';
import '../pages/gait_assist_page.dart';
import '../widgets/big_button.dart';

// 主页面
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(24), // 增大内边距：20 -> 24
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.selectTraining,
              style: const TextStyle(
                fontSize: 26, // 增大字体：22 -> 26
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50), // 增大间距：40 -> 50
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
            const SizedBox(height: 36), // 增大间距：30 -> 36
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
    );
  }
}
