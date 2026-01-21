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
  String get gaitAssist => '歩行リズム補助';

  @override
  String get tremorTestTitle => '手の震えテスト';

  @override
  String get tremorTestInstruction => 'スマートフォンを手に持ち、30秒間腕を静止させてください';

  @override
  String remainingTime(int time) {
    return '残り時間: $time 秒';
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
  String get gaitAssistTitle => '歩行リズム補助';

  @override
  String get gaitInstruction => 'メトロノームに合わせて歩行トレーニングを行ってください';

  @override
  String get tempoSpeed => 'テンポ速度 (BPM)';

  @override
  String get startTraining => 'トレーニング開始';

  @override
  String get stopTraining => 'トレーニング停止';

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
}
