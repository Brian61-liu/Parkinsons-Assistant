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

  @override
  String get appSubtitle => '您的帕金森运动追踪与分析助手';

  @override
  String get signInWithGoogle => '使用 Google 账号登录';

  @override
  String get privacyNotice => '登录即表示您同意我们的服务条款和隐私政策';

  @override
  String get loginError => '登录错误';

  @override
  String get confirm => '确认';

  @override
  String get cancel => '取消';

  @override
  String get logout => '退出登录';

  @override
  String get logoutConfirm => '确定要退出登录吗？';

  @override
  String welcome(String name) {
    return '欢迎, $name';
  }

  @override
  String get syncToCloud => '同步到云端';

  @override
  String get dataSynced => '数据同步成功';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyPolicyIntro => '简介';

  @override
  String get privacyPolicyIntroText =>
      'Kineo 致力于保护您的隐私和个人健康数据的安全。本政策说明我们如何收集、使用、存储和保护您的信息，符合 HIPAA 和 GDPR 法规要求。';

  @override
  String get dataCollection => '我们收集的数据';

  @override
  String get dataCollectionText =>
      '我们收集：1) 用于身份验证的账户信息（邮箱、姓名）；2) 震颤测试期间的运动传感器数据；3) 测试结果，包括频率、振幅和严重程度评估。我们遵循数据最小化原则，只收集必要的数据。';

  @override
  String get dataUsage => '数据使用方式';

  @override
  String get dataUsageText =>
      '您的数据仅用于：1) 提供震颤分析和追踪；2) 为您和您的医疗保健提供者生成健康报告；3) 改进我们的算法（仅在您同意的情况下使用匿名数据）。';

  @override
  String get dataStorage => '数据存储与安全';

  @override
  String get dataStorageText =>
      '您的数据安全存储在 Google Firebase 服务器上，采用端到端加密。所有数据传输使用 TLS 1.3 加密。我们实施严格的访问控制和定期安全审计。';

  @override
  String get dataSharing => '数据共享';

  @override
  String get dataSharingText =>
      '我们绝不出售您的个人健康数据。数据仅在以下情况下共享：1) 经您明确同意；2) 与您指定的医疗保健提供者共享；3) 法律要求时。汇总的匿名数据可能用于研究。';

  @override
  String get userRights => '您的权利 (GDPR)';

  @override
  String get userRightsText =>
      '您有权：1) 访问您的数据；2) 导出您的数据（数据可携带性）；3) 删除您的数据（被遗忘权）；4) 随时撤回同意；5) 向监管机构投诉。';

  @override
  String get dataSecurity => '安全措施';

  @override
  String get dataSecurityText =>
      '我们实施：1) AES-256 静态加密；2) TLS 1.3 传输加密；3) 多因素身份验证；4) 定期渗透测试；5) 全面的审计日志；6) 员工安全培训。';

  @override
  String get contactUs => '联系我们';

  @override
  String get contactUsText => '如有隐私咨询或行使数据权利，请联系我们的数据保护官：privacy@kineo-app.com';

  @override
  String get lastUpdated => '最后更新';

  @override
  String get version => '版本';

  @override
  String get dataManagement => '数据管理';

  @override
  String get gdprRights => '根据 GDPR 和 HIPAA，您有权随时访问、导出和删除您的个人健康数据。';

  @override
  String get exportData => '导出我的数据';

  @override
  String get exportDataDescription =>
      '下载您所有数据的完整副本（JSON 格式）。包括您的个人资料和所有震颤测试记录。';

  @override
  String get export => '导出';

  @override
  String get exporting => '正在导出...';

  @override
  String get exportSuccess => '导出成功';

  @override
  String get exportSuccessMessage => '您的数据已复制到剪贴板。您可以将其粘贴到文本文件中保存。';

  @override
  String get deleteAllRecords => '删除所有测试记录';

  @override
  String get deleteAllRecordsDescription => '永久删除您的所有震颤测试记录。此操作无法撤消。';

  @override
  String get deleteAllData => '删除所有数据';

  @override
  String get deleteAllDataConfirm => '确定要删除所有测试记录吗？此操作不可逆。';

  @override
  String get delete => '删除';

  @override
  String get deleteSuccess => '删除成功';

  @override
  String get deleteSuccessMessage => '您的所有测试记录已永久删除。';

  @override
  String get deleteAccount => '删除账户';

  @override
  String get deleteAccountDescription => '永久删除您的账户及所有相关数据。包括所有测试记录和个人信息。';

  @override
  String get deleteAccountWarning => '这将永久删除您的账户和所有数据。此操作无法撤消。';

  @override
  String get deleteAccountFinalWarning => '最后警告：一旦删除，您的账户和所有数据将永远消失。您确定吗？';

  @override
  String get finalWarning => '最后警告';

  @override
  String get deleteForever => '永久删除';

  @override
  String get continue_ => '继续';

  @override
  String get error => '错误';

  @override
  String get settings => '设置';
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

  @override
  String get appSubtitle => '您的帕金森運動追蹤與分析助手';

  @override
  String get signInWithGoogle => '使用 Google 帳號登入';

  @override
  String get privacyNotice => '登入即表示您同意我們的服務條款和隱私政策';

  @override
  String get loginError => '登入錯誤';

  @override
  String get confirm => '確認';

  @override
  String get cancel => '取消';

  @override
  String get logout => '登出';

  @override
  String get logoutConfirm => '確定要登出嗎？';

  @override
  String welcome(String name) {
    return '歡迎, $name';
  }

  @override
  String get syncToCloud => '同步到雲端';

  @override
  String get dataSynced => '資料同步成功';
}
