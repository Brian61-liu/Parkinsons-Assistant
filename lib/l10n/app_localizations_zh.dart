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
  String get gaitAssist => '步态节律辅助';

  @override
  String get tremorTestTitle => '手部震颤测试';

  @override
  String get tremorTestInstruction => '请将手机握在手中，保持手臂静止30秒';

  @override
  String remainingTime(int time) {
    return '剩余时间: $time 秒';
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
  String get gaitAssistTitle => '步态节律辅助';

  @override
  String get gaitInstruction => '跟随节拍器进行步态训练';

  @override
  String get tempoSpeed => '节拍速度 (BPM)';

  @override
  String get startTraining => '开始训练';

  @override
  String get stopTraining => '停止训练';

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
  String get gaitAssist => '步態節律輔助';

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
  String get gaitAssistTitle => '步態節律輔助';

  @override
  String get gaitInstruction => '跟隨節拍器進行步態訓練';

  @override
  String get tempoSpeed => '節拍速度 (BPM)';

  @override
  String get startTraining => '開始訓練';

  @override
  String get stopTraining => '停止訓練';

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
}
