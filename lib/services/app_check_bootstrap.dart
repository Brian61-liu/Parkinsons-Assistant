import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';

/// 仅 iOS 注册生产 provider；Debug 用 debug provider（模拟器 / 开发机）。
/// Console 侧请保持 Monitor，勿过早 Enforcement。
Future<void> activateAmplioAppCheck() async {
  await FirebaseAppCheck.instance.activate(
    appleProvider: kDebugMode
        ? AppleProvider.debug
        : AppleProvider.appAttestWithDeviceCheckFallback,
  );
}
