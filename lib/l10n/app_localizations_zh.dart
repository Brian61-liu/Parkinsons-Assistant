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
  String get clickToStartTest => '点击开始测试';

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
  String get selectLanguage => '语言';

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
  String get signInWithGoogle => '使用 Google 登录';

  @override
  String get signingIn => '正在登录...';

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
      '我们收集以下数据：\n\n• 账户信息：邮箱、姓名（用于身份验证）\n• 传感器数据：震颤测试期间的运动数据\n• 测试结果：频率、振幅和严重程度评估\n\n我们遵循数据最小化原则，只收集必要的数据。';

  @override
  String get dataUsage => '数据使用方式';

  @override
  String get dataUsageText =>
      '您的数据仅用于以下目的：\n\n• 提供震颤分析和健康追踪\n• 为您和医疗保健提供者生成健康报告\n• 改进算法（仅在您同意时使用匿名数据）';

  @override
  String get dataStorage => '数据存储与安全';

  @override
  String get dataStorageText =>
      '您的数据安全存储在 Google Firebase 服务器上。\n\n• 采用端到端加密\n• 所有传输使用 TLS 1.3 加密\n• 严格的访问控制\n• 定期安全审计';

  @override
  String get dataSharing => '数据共享';

  @override
  String get dataSharingText =>
      '我们绝不出售您的个人健康数据。\n\n数据仅在以下情况下共享：\n• 经您明确同意\n• 与您指定的医疗保健提供者共享\n• 法律要求时\n\n汇总的匿名数据可能用于研究。';

  @override
  String get userRights => '您的权利 (GDPR)';

  @override
  String get userRightsText =>
      '根据 GDPR，您享有以下权利：\n\n• 访问权：查看您的所有数据\n• 可携带权：导出您的数据\n• 删除权：删除您的数据（被遗忘权）\n• 撤回权：随时撤回同意\n• 投诉权：向监管机构投诉';

  @override
  String get dataSecurity => '安全措施';

  @override
  String get dataSecurityText =>
      '我们采取多层安全措施保护您的数据：\n\n• AES-256 静态数据加密\n• TLS 1.3 传输加密\n• 多因素身份验证\n• 定期渗透测试\n• 全面的审计日志\n• 员工安全培训';

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

  @override
  String get testHistory => '历史记录';

  @override
  String get noTestRecords => '暂无测试记录';

  @override
  String get noTestRecordsHint => '完成一次震颤测试后，您的结果将显示在这里';

  @override
  String get testDate => '测试日期';

  @override
  String get deleteRecord => '删除记录';

  @override
  String get deleteRecordConfirm => '确定要删除这条测试记录吗？';

  @override
  String get recordDeleted => '记录已删除';

  @override
  String get duration => '时长';

  @override
  String get seconds => '秒';

  @override
  String get tapToCancel => '点击取消';

  @override
  String get changeAvatar => '更改头像';

  @override
  String get selectFromGallery => '从相册选择';

  @override
  String get takePhoto => '拍照';

  @override
  String get avatarUpdated => '头像更新成功';

  @override
  String get avatarUpdateFailed => '头像更新失败';

  @override
  String get voiceTraining => '语音训练';

  @override
  String get voiceTrainingMainInstruction => '请持续发长音 —— 啊 ——';

  @override
  String get voiceTrainingInstruction =>
      '基于 LSVT LOUD 疗法理念，请大声说话。圆的大小会根据您的音量实时变化，达到 75-85 dB 时圆会变绿。';

  @override
  String get voiceTrainingReady => '准备开始';

  @override
  String get voiceTrainingCalibrating => '正在校准环境噪音...';

  @override
  String get voiceTrainingTooQuiet => '再大声一点！';

  @override
  String get voiceTrainingKeepGoing => '很好，再加把劲！';

  @override
  String get voiceTrainingExcellent => '太棒了！保持住！';

  @override
  String voiceTrainingTarget(String target) {
    return '目标：$target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return '目标：$range dB';
  }

  @override
  String get startListening => '开始训练';

  @override
  String get stopListening => '停止训练';

  @override
  String get microphonePermissionRequired => '需要麦克风权限';

  @override
  String get microphonePermissionDenied => '麦克风权限被拒绝';

  @override
  String get microphonePermissionDeniedMessage =>
      '麦克风权限已被永久拒绝。请在系统设置中手动开启麦克风权限以使用语音训练功能。';

  @override
  String get microphoneError => '麦克风错误';

  @override
  String get openSettings => '打开设置';

  @override
  String get continueAsGuest => '游客登录';

  @override
  String get movementTraining => '肢体动作训练';

  @override
  String get movementTrainingInstruction => '请将双手举高，保持动作标准';

  @override
  String get armsRaised => '双手已举高';

  @override
  String get raiseArms => '请举高双手';

  @override
  String get successCount => '成功次数';

  @override
  String get cameraPermissionRequired => '需要摄像头权限';

  @override
  String get cameraPermissionDeniedMessage =>
      '摄像头权限已被拒绝。请在系统设置中手动开启摄像头权限以使用肢体动作训练功能。';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '請選擇您要進行的訓練';

  @override
  String get clickToStartTest => '點擊開始測試';

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
  String get selectLanguage => '語言';

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
  String get signInWithGoogle => '使用 Google 登入';

  @override
  String get signingIn => '正在登入...';

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

  @override
  String get privacyPolicy => '隱私政策';

  @override
  String get privacyPolicyIntro => '簡介';

  @override
  String get privacyPolicyIntroText =>
      'Kineo 致力於保護您的隱私和個人健康資料的安全。本政策說明我們如何收集、使用、儲存和保護您的資訊，符合 HIPAA 和 GDPR 法規要求。';

  @override
  String get dataCollection => '我們收集的資料';

  @override
  String get dataCollectionText =>
      '我們收集以下資料：\n\n• 帳戶資訊：電子郵件、姓名（用於身份驗證）\n• 感測器資料：顫抖測試期間的運動資料\n• 測試結果：頻率、振幅和嚴重程度評估\n\n我們遵循資料最小化原則，只收集必要的資料。';

  @override
  String get dataUsage => '資料使用方式';

  @override
  String get dataUsageText =>
      '您的資料僅用於以下目的：\n\n• 提供顫抖分析和健康追蹤\n• 為您和醫療保健提供者生成健康報告\n• 改進演算法（僅在您同意時使用匿名資料）';

  @override
  String get dataStorage => '資料儲存與安全';

  @override
  String get dataStorageText =>
      '您的資料安全儲存在 Google Firebase 伺服器上。\n\n• 採用端到端加密\n• 所有傳輸使用 TLS 1.3 加密\n• 嚴格的存取控制\n• 定期安全審計';

  @override
  String get dataSharing => '資料共享';

  @override
  String get dataSharingText =>
      '我們絕不出售您的個人健康資料。\n\n資料僅在以下情況下共享：\n• 經您明確同意\n• 與您指定的醫療保健提供者共享\n• 法律要求時\n\n彙總的匿名資料可能用於研究。';

  @override
  String get userRights => '您的權利 (GDPR)';

  @override
  String get userRightsText =>
      '根據 GDPR，您享有以下權利：\n\n• 存取權：查看您的所有資料\n• 可攜權：匯出您的資料\n• 刪除權：刪除您的資料（被遺忘權）\n• 撤回權：隨時撤回同意\n• 投訴權：向監管機構投訴';

  @override
  String get dataSecurity => '安全措施';

  @override
  String get dataSecurityText =>
      '我們採取多層安全措施保護您的資料：\n\n• AES-256 靜態資料加密\n• TLS 1.3 傳輸加密\n• 多因素身份驗證\n• 定期滲透測試\n• 全面的審計日誌\n• 員工安全培訓';

  @override
  String get contactUs => '聯絡我們';

  @override
  String get contactUsText => '隱私諮詢請聯絡：privacy@kineo-app.com';

  @override
  String get lastUpdated => '最後更新';

  @override
  String get version => '版本';

  @override
  String get dataManagement => '資料管理';

  @override
  String get gdprRights => '根據 GDPR 和 HIPAA，您有權隨時存取、匯出和刪除您的個人健康資料。';

  @override
  String get exportData => '匯出我的資料';

  @override
  String get exportDataDescription => '下載您所有資料的完整副本（JSON 格式）。';

  @override
  String get export => '匯出';

  @override
  String get exporting => '正在匯出...';

  @override
  String get exportSuccess => '匯出成功';

  @override
  String get exportSuccessMessage => '您的資料已複製到剪貼簿。';

  @override
  String get deleteAllRecords => '刪除所有測試記錄';

  @override
  String get deleteAllRecordsDescription => '永久刪除您的所有顫抖測試記錄。此操作無法撤銷。';

  @override
  String get deleteAllData => '刪除所有資料';

  @override
  String get deleteAllDataConfirm => '確定要刪除所有測試記錄嗎？此操作不可逆。';

  @override
  String get delete => '刪除';

  @override
  String get deleteSuccess => '刪除成功';

  @override
  String get deleteSuccessMessage => '您的所有測試記錄已永久刪除。';

  @override
  String get deleteAccount => '刪除帳戶';

  @override
  String get deleteAccountDescription => '永久刪除您的帳戶及所有相關資料。';

  @override
  String get deleteAccountWarning => '這將永久刪除您的帳戶和所有資料。此操作無法撤銷。';

  @override
  String get deleteAccountFinalWarning => '最後警告：一旦刪除，您的帳戶和所有資料將永遠消失。您確定嗎？';

  @override
  String get finalWarning => '最後警告';

  @override
  String get deleteForever => '永久刪除';

  @override
  String get continue_ => '繼續';

  @override
  String get error => '錯誤';

  @override
  String get settings => '設定';

  @override
  String get testHistory => '歷史記錄';

  @override
  String get noTestRecords => '暫無測試記錄';

  @override
  String get noTestRecordsHint => '完成一次顫抖測試後，您的結果將顯示在這裡';

  @override
  String get testDate => '測試日期';

  @override
  String get deleteRecord => '刪除記錄';

  @override
  String get deleteRecordConfirm => '確定要刪除這條測試記錄嗎？';

  @override
  String get recordDeleted => '記錄已刪除';

  @override
  String get duration => '時長';

  @override
  String get seconds => '秒';

  @override
  String get tapToCancel => '點擊取消';

  @override
  String get changeAvatar => '更改頭像';

  @override
  String get selectFromGallery => '從相冊選擇';

  @override
  String get takePhoto => '拍照';

  @override
  String get avatarUpdated => '頭像更新成功';

  @override
  String get avatarUpdateFailed => '頭像更新失敗';

  @override
  String get voiceTraining => '語音訓練';

  @override
  String get voiceTrainingMainInstruction => '請持續發長音 —— 啊 ——';

  @override
  String get voiceTrainingInstruction =>
      '基於 LSVT LOUD 療法理念，請大聲說話。圓的大小會根據您的音量即時變化，達到 75-85 dB 時圓會變綠。';

  @override
  String get voiceTrainingReady => '準備開始';

  @override
  String get voiceTrainingCalibrating => '正在校準環境噪音...';

  @override
  String get voiceTrainingTooQuiet => '再大聲一點！';

  @override
  String get voiceTrainingKeepGoing => '很好，再加把勁！';

  @override
  String get voiceTrainingExcellent => '太棒了！保持住！';

  @override
  String voiceTrainingTarget(String target) {
    return '目標：$target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return '目標：$range dB';
  }

  @override
  String get startListening => '開始訓練';

  @override
  String get stopListening => '停止訓練';

  @override
  String get microphonePermissionRequired => '需要麥克風權限';

  @override
  String get microphonePermissionDenied => '麥克風權限被拒絕';

  @override
  String get microphonePermissionDeniedMessage =>
      '麥克風權限已被永久拒絕。請在系統設定中手動開啟麥克風權限以使用語音訓練功能。';

  @override
  String get microphoneError => '麥克風錯誤';

  @override
  String get openSettings => '打開設定';

  @override
  String get continueAsGuest => '遊客登入';
}
