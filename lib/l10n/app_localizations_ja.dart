// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '実施したいトレーニングを選択してください';

  @override
  String get tremorTest => '手の震えテスト';

  @override
  String get tremorTestTitle => '手の震えテスト';

  @override
  String get tremorTestInstruction => 'スマートフォンを手に持ち、30秒間腕を静止させてください';

  @override
  String remainingTime(int time) {
    return '残り $time秒';
  }

  @override
  String get readyToTest => 'テスト開始準備完了';

  @override
  String get frequency => '周波数';

  @override
  String get amplitude => '振幅';

  @override
  String get waitingForData => 'データを待っています...';

  @override
  String get startTest => 'テスト開始';

  @override
  String get stopTest => 'テスト停止';

  @override
  String get testCompleted => 'テスト完了';

  @override
  String averageFrequency(String frequency) {
    return '平均周波数: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '平均振幅: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '最大振幅: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired => 'テストを実施するにはセンサーの許可が必要です';

  @override
  String get language => '言語';

  @override
  String get changeLanguage => '言語を変更';

  @override
  String get selectLanguage => '言語を選択';

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
  String get realtimeWaveform => 'リアルタイム波形';

  @override
  String get tremorSeverity => '重症度';

  @override
  String get tremorFrequency => '周波数';

  @override
  String get avgAmplitude => '平均振幅';

  @override
  String get maxAmp => '最大振幅';

  @override
  String get variability => '変動性';

  @override
  String get sampleRate => 'サンプル';

  @override
  String get dataPoints => 'データ';

  @override
  String get severityNormal => '正常';

  @override
  String get severityMild => '軽度';

  @override
  String get severityModerate => '中度';

  @override
  String get severityModerateSevere => '中重度';

  @override
  String get severitySevere => '重度';
}
