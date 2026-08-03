import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/l10n/app_localizations.dart';
import 'package:parkinson_new/pages/privacy_policy_page.dart';

Widget _wrap(Widget child, {Locale locale = const Locale('zh')}) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: child,
  );
}

void main() {
  testWidgets('PrivacyPolicyPage smoke (zh)', (tester) async {
    await tester.pumpWidget(_wrap(const PrivacyPolicyPage()));
    await tester.pumpAndSettle();

    final l10n = await AppLocalizations.delegate.load(const Locale('zh'));
    expect(find.text(l10n.privacyPolicy), findsWidgets);
    expect(find.text(l10n.dataSecurity), findsOneWidget);
  });

  testWidgets('permission-denied copy is available in en/zh', (tester) async {
    final zh = await AppLocalizations.delegate.load(const Locale('zh'));
    final en = await AppLocalizations.delegate.load(const Locale('en'));

    expect(zh.microphonePermissionDenied, isNotEmpty);
    expect(zh.microphonePermissionDeniedMessage, contains('设置'));
    expect(zh.cameraPermissionDeniedMessage, contains('设置'));
    expect(zh.sensorPermissionRequired, isNotEmpty);

    expect(en.microphonePermissionDenied, contains('denied'));
    expect(en.cameraPermissionDeniedMessage.toLowerCase(), contains('denied'));
    expect(en.sensorPermissionRequired.toLowerCase(), contains('sensor'));

    await tester.pumpWidget(
      _wrap(
        Scaffold(
          body: ListView(
            children: [
              Text(zh.microphonePermissionDenied),
              Text(zh.cameraPermissionRequired),
              Text(en.microphonePermissionDeniedMessage),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(zh.microphonePermissionDenied), findsOneWidget);
    expect(find.text(zh.cameraPermissionRequired), findsOneWidget);
    expect(find.text(en.microphonePermissionDeniedMessage), findsOneWidget);
  });
}
