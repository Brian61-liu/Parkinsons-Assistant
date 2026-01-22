// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '请选择您要进行的训练';

  @override
  String get tremorTest => '手部震颤测试';

  @override
  String get tremorTestTitle => '手部震颤测试';

  @override
  String get tremorTestInstruction => '请将手机握在手中，保持手臂静止30秒';

  @override
  String remainingTime(int time) {
    return '剩余 $time 秒';
  }

  @override
  String get readyToTest => '准备开始测试';

  @override
  String get frequency => '频率';

  @override
  String get amplitude => '幅度';

  @override
  String get waitingForData => '等待数据...';

  @override
  String get startTest => '开始测试';

  @override
  String get stopTest => '停止测试';

  @override
  String get testCompleted => '测试完成';

  @override
  String averageFrequency(String frequency) {
    return '平均频率: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '平均幅度: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '最大幅度: $maxAmplitude';
  }

  @override
  String get ok => '确定';

  @override
  String get sensorPermissionRequired => '需要传感器权限才能进行测试';

  @override
  String get language => '语言';

  @override
  String get changeLanguage => '切换语言';

  @override
  String get selectLanguage => '选择语言';

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
  String get realtimeWaveform => '实时波形';

  @override
  String get tremorSeverity => '震颤程度';

  @override
  String get tremorFrequency => '震颤频率';

  @override
  String get avgAmplitude => '平均振幅';

  @override
  String get maxAmp => '最大振幅';

  @override
  String get variability => '变异度';

  @override
  String get sampleRate => '采样率';

  @override
  String get dataPoints => '数据点';

  @override
  String get severityNormal => '正常';

  @override
  String get severityMild => '轻度';

  @override
  String get severityModerate => '中度';

  @override
  String get severityModerateSevere => '中重度';

  @override
  String get severitySevere => '重度';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '請選擇您要進行的訓練';

  @override
  String get tremorTest => '手部顫抖測試';

  @override
  String get tremorTestTitle => '手部顫抖測試';

  @override
  String get tremorTestInstruction => '請將手機握在手中，保持手臂靜止30秒';

  @override
  String remainingTime(int time) {
    return '剩餘時間: $time 秒';
  }

  @override
  String get readyToTest => '準備開始測試';

  @override
  String get frequency => '頻率';

  @override
  String get amplitude => '幅度';

  @override
  String get waitingForData => '等待資料...';

  @override
  String get startTest => '開始測試';

  @override
  String get stopTest => '停止測試';

  @override
  String get testCompleted => '測試完成';

  @override
  String averageFrequency(String frequency) {
    return '平均頻率: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '平均幅度: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '最大幅度: $maxAmplitude';
  }

  @override
  String get ok => '確定';

  @override
  String get sensorPermissionRequired => '需要感測器權限才能進行測試';

  @override
  String get language => '語言';

  @override
  String get changeLanguage => '切換語言';

  @override
  String get selectLanguage => '選擇語言';

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
  String get realtimeWaveform => '即時波形';

  @override
  String get tremorSeverity => '顫抖程度';

  @override
  String get tremorFrequency => '顫抖頻率';

  @override
  String get avgAmplitude => '平均振幅';

  @override
  String get maxAmp => '最大振幅';

  @override
  String get variability => '變異度';

  @override
  String get sampleRate => '採樣率';

  @override
  String get dataPoints => '數據點';

  @override
  String get severityNormal => '正常';

  @override
  String get severityMild => '輕度';

  @override
  String get severityModerate => '中度';

  @override
  String get severityModerateSevere => '中重度';

  @override
  String get severitySevere => '重度';
}
