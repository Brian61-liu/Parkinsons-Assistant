// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => 'Please select the training you want to perform';

  @override
  String get tremorTest => 'Hand Tremor Test';

  @override
  String get tremorTestTitle => 'Hand Tremor Test';

  @override
  String get tremorTestInstruction =>
      'Please hold your phone in your hand and keep your arm still for 30 seconds';

  @override
  String remainingTime(int time) {
    return 'Remaining: ${time}s';
  }

  @override
  String get readyToTest => 'Ready to start test';

  @override
  String get frequency => 'Frequency';

  @override
  String get amplitude => 'Amplitude';

  @override
  String get waitingForData => 'Waiting for data...';

  @override
  String get startTest => 'Start Test';

  @override
  String get stopTest => 'Stop Test';

  @override
  String get testCompleted => 'Test Completed';

  @override
  String averageFrequency(String frequency) {
    return 'Average Frequency: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Average Amplitude: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Max Amplitude: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Sensor permission required to perform test';

  @override
  String get language => 'Language';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get chinese => '简体中文';

  @override
  String get chineseTraditional => '繁體中文';

  @override
  String get spanish => 'Español';

  @override
  String get french => 'Français';

  @override
  String get german => 'Deutsch';

  @override
  String get japanese => '日本語';

  @override
  String get korean => '한국어';

  @override
  String get portuguese => 'Português';

  @override
  String get italian => 'Italiano';

  @override
  String get russian => 'Русский';

  @override
  String get arabic => 'العربية';

  @override
  String get realtimeWaveform => 'Real-time Waveform';

  @override
  String get tremorSeverity => 'Tremor Severity';

  @override
  String get tremorFrequency => 'Tremor Frequency';

  @override
  String get avgAmplitude => 'Avg Amplitude';

  @override
  String get maxAmp => 'Max Amplitude';

  @override
  String get variability => 'Variability';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get dataPoints => 'Data Points';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Mild';

  @override
  String get severityModerate => 'Moderate';

  @override
  String get severityModerateSevere => 'Moderate-Severe';

  @override
  String get severitySevere => 'Severe';
}
