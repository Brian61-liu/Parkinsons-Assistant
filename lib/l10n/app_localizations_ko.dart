// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '수행하려는 훈련을 선택하세요';

  @override
  String get tremorTest => '손 떨림 테스트';

  @override
  String get tremorTestTitle => '손 떨림 테스트';

  @override
  String get tremorTestInstruction => '휴대폰을 손에 들고 30초 동안 팔을 정지 상태로 유지하세요';

  @override
  String remainingTime(int time) {
    return '$time초 남음';
  }

  @override
  String get readyToTest => '테스트 시작 준비 완료';

  @override
  String get frequency => '주파수';

  @override
  String get amplitude => '진폭';

  @override
  String get waitingForData => '데이터를 기다리는 중...';

  @override
  String get startTest => '테스트 시작';

  @override
  String get stopTest => '테스트 중지';

  @override
  String get testCompleted => '테스트 완료';

  @override
  String averageFrequency(String frequency) {
    return '평균 주파수: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '평균 진폭: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '최대 진폭: $maxAmplitude';
  }

  @override
  String get ok => '확인';

  @override
  String get sensorPermissionRequired => '테스트를 수행하려면 센서 권한이 필요합니다';

  @override
  String get language => '언어';

  @override
  String get changeLanguage => '언어 변경';

  @override
  String get selectLanguage => '언어 선택';

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
  String get realtimeWaveform => '실시간 파형';

  @override
  String get tremorSeverity => '중증도';

  @override
  String get tremorFrequency => '주파수';

  @override
  String get avgAmplitude => '평균 진폭';

  @override
  String get maxAmp => '최대 진폭';

  @override
  String get variability => '변동성';

  @override
  String get sampleRate => '샘플링';

  @override
  String get dataPoints => '데이터';

  @override
  String get severityNormal => '정상';

  @override
  String get severityMild => '경미';

  @override
  String get severityModerate => '중등도';

  @override
  String get severityModerateSevere => '중증도';

  @override
  String get severitySevere => '심각';
}
