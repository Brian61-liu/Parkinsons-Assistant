import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/l10n/app_localizations.dart';
import 'package:parkinson_new/pages/movement_training_page.dart';
import 'package:parkinson_new/pages/tremor_test_page.dart';
import 'package:parkinson_new/pages/voice_training_page.dart';
import 'package:parkinson_new/services/user_settings_service.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:provider/provider.dart';

import 'support/fake_permission_handler.dart';

Widget _wrap(Widget child, {Locale locale = const Locale('zh')}) {
  return ChangeNotifierProvider(
    create: (_) => UserSettingsService(),
    child: MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    ),
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PermissionHandlerPlatform previousHandler;
  late FakePermissionHandlerPlatform fakePermissions;

  setUp(() {
    previousHandler = PermissionHandlerPlatform.instance;
    fakePermissions = FakePermissionHandlerPlatform();
    PermissionHandlerPlatform.instance = fakePermissions;
  });

  tearDown(() {
    PermissionHandlerPlatform.instance = previousHandler;
  });

  testWidgets('TremorTestPage shows sensor permission SnackBar when denied', (
    tester,
  ) async {
    final l10n = await AppLocalizations.delegate.load(const Locale('zh'));

    await tester.pumpWidget(
      _wrap(const TremorTestPage(forcePermissionDenied: true)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text(l10n.startTest));
    await tester.pump();

    expect(find.text(l10n.sensorPermissionRequired), findsOneWidget);
  });

  testWidgets(
    'VoiceTrainingPage shows SnackBar when microphone permission denied',
    (tester) async {
      final l10n = await AppLocalizations.delegate.load(const Locale('zh'));
      fakePermissions.status = PermissionStatus.denied;

      await tester.pumpWidget(_wrap(const VoiceTrainingPage()));
      await tester.pumpAndSettle();

      await tester.tap(find.text(l10n.startListening));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text(l10n.microphonePermissionDenied), findsOneWidget);
    },
  );

  testWidgets(
    'VoiceTrainingPage shows settings dialog when permanently denied',
    (tester) async {
      final l10n = await AppLocalizations.delegate.load(const Locale('zh'));
      fakePermissions.status = PermissionStatus.permanentlyDenied;

      await tester.pumpWidget(_wrap(const VoiceTrainingPage()));
      await tester.pumpAndSettle();

      await tester.tap(find.text(l10n.startListening));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(find.text(l10n.microphonePermissionRequired), findsOneWidget);
      expect(
        find.text(l10n.microphonePermissionDeniedMessage),
        findsOneWidget,
      );
      expect(find.text(l10n.openSettings), findsOneWidget);

      await tester.tap(find.text(l10n.openSettings));
      await tester.pumpAndSettle();

      expect(fakePermissions.openSettingsCalled, isTrue);
    },
  );

  testWidgets(
    'MovementTrainingPage shows camera denial UI when permission denied',
    (tester) async {
      final l10n = await AppLocalizations.delegate.load(const Locale('zh'));
      fakePermissions.status = PermissionStatus.denied;

      await tester.pumpWidget(
        _wrap(const MovementTrainingPage(requestCameraOnStart: true)),
      );
      await tester.pump(); // post-frame → request camera
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(find.text(l10n.cameraPermissionRequired), findsWidgets);
      expect(find.text(l10n.cameraPermissionDeniedMessage), findsWidgets);

      await tester.tap(
        find.widgetWithText(CupertinoDialogAction, l10n.cancel),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoAlertDialog), findsNothing);
      expect(find.text(l10n.cameraPermissionRequired), findsOneWidget);
      expect(find.text(l10n.cameraPermissionDeniedMessage), findsOneWidget);
      expect(find.text(l10n.openSettings), findsOneWidget);
    },
  );
}
