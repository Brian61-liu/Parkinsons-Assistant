# Amplio

Amplio is an iPhone app that supports people living with Parkinson's disease with rehabilitation training, training records, trend review, and privacy-first data management.

The product target is Apple App Store only. It is designed for iPhone users and is not maintained for other client platforms.

## Product Scope

- Hand tremor testing with iPhone motion sensors.
- Voice training with microphone-based volume feedback.
- Movement training with iPhone camera pose detection.
- Training records, trend analysis, and rehabilitation reports for reference only.
- Firebase sign-in and optional cloud sync.
- Local medication checklist with manual check-ins.
- Multi-language, large text, and iOS VoiceOver-oriented accessibility support.

Amplio is a rehabilitation support tool. It must not be described as diagnosing, treating, or curing Parkinson's disease, and it must not replace advice from physicians, physical therapists, or speech therapists.

## Platform

- Supported client: iPhone / iOS.
- Store target: Apple App Store.
- Launch regions: global, excluding mainland China.

## Tech Stack

- Flutter / Dart.
- Firebase Auth / Firestore.
- Google Sign-In and Sign in with Apple.
- SQLite via `sqflite`.
- `shared_preferences`, `provider`, `flutter_localizations`.
- `sensors_plus`, `noise_meter`, `camera`, `google_mlkit_pose_detection`.
- `fl_chart`.

## Development

Prerequisites:

- Flutter SDK and Dart SDK matching `pubspec.yaml`.
- Xcode with iOS development tooling.
- A physical iPhone for camera, microphone, sensor, Firebase Auth, and App Store compliance testing.

Common commands:

```bash
flutter pub get
flutter analyze
flutter test
flutter build ios --release
```

## Release Notes

Before App Store submission, verify:

- Bundle ID, signing team, capabilities, and entitlements in Xcode.
- `ios/Runner/GoogleService-Info.plist` matches the iOS Firebase app.
- Sign in with Apple and Google Sign-In work on a physical iPhone.
- Camera, microphone, photo access, and health-data privacy copy match actual app behavior.
- App Privacy Nutrition Labels, privacy policy, service terms, support URL, and medical disclaimer are consistent.
