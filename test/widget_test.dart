import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/main.dart';

void main() {
  test('Amplio app can be constructed for iOS locale', () {
    const app = AmplioApp(initialLocale: Locale('zh', ''));

    expect(app.initialLocale.languageCode, 'zh');
  });
}
