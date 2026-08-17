// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => '请选择您要进行的训练';

  @override
  String get clickToStartTest => '点击开始测试';

  @override
  String get clickToStartTraining => '点击开始训练';

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
  String get tremorTestCancelledNoSave => '已取消测试，未保存记录';

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
  String get waveformAxisTime => '时间';

  @override
  String get waveformAxisAmplitude => '振幅';

  @override
  String get waveformHint => '波形越高，手部抖动越明显';

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
  String get severityNormal => '较低晃动';

  @override
  String get severityMild => '轻度晃动';

  @override
  String get severityModerate => '中等晃动';

  @override
  String get severityModerateSevere => '偏高晃动';

  @override
  String get severitySevere => '最高档位';

  @override
  String get appSubtitle => '您的帕金森运动追踪与分析助手';

  @override
  String get signInWithGoogle => '使用 Google 登录';

  @override
  String get signInWithApple => '使用 Apple 登录';

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
  String get syncing => '同步中…';

  @override
  String get syncFailed => '同步失败，请检查网络后重试。';

  @override
  String get syncFailedHint => '同步失败 — 点按重试';

  @override
  String get syncRetry => '重试';

  @override
  String get loginRequiredForSync => '请先登录以使用云端同步';

  @override
  String lastSyncedAt(String time) {
    return '上次同步：$time';
  }

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyPolicyIntro => '简介';

  @override
  String get privacyPolicyIntroText =>
      'Amplio 致力于保护您的隐私和个人健康数据的安全。本政策说明我们如何收集、使用、存储和保护您的信息。';

  @override
  String get dataCollection => '我们收集的数据';

  @override
  String get dataCollectionText =>
      '我们收集以下数据：\n\n• 账户信息：邮箱、姓名（用于身份验证）\n• 传感器数据：震颤测试期间的运动数据\n• 测试结果：频率、振幅和严重程度评估\n\n我们遵循数据最小化原则，只收集必要的数据。';

  @override
  String get dataUsage => '数据使用方式';

  @override
  String get dataUsageText =>
      '您的数据仅用于以下目的：\n\n• 提供康复训练功能与进度追踪\n• 在 App 内向您展示摘要与报告（仅供个人参考）\n• 仅在使用匿名数据且获得您同意时用于改进应用';

  @override
  String get dataStorage => '数据存储与安全';

  @override
  String get dataStorageText =>
      '登录后，账号与已同步的训练数据可能存储在 Google Firebase；游客与仅本地数据保留在您的设备上。\n\n• 与云服务通信使用 HTTPS/TLS\n• 访问受账号身份与 Firestore 安全规则限制\n• 可在 App 内导出或删除数据';

  @override
  String get dataSharing => '数据共享';

  @override
  String get dataSharingText =>
      '我们不出售您的个人健康数据。\n\n数据仅在以下情况离开本应用：\n• 您主动导出或分享文件\n• 法律要求披露\n\n本应用目前不会直接向医疗机构发送数据。';

  @override
  String get userRights => '您的数据权利';

  @override
  String get userRightsText =>
      '您享有以下权利：\n\n• 访问权：查看您的所有数据\n• 可携带权：导出您的数据\n• 删除权：删除您的数据（被遗忘权）\n• 撤回权：随时撤回同意\n• 联系我们：如有隐私疑问请联系我们';

  @override
  String get dataSecurity => '安全措施';

  @override
  String get dataSecurityText =>
      '我们使用当前技术栈中可用的安全能力保护您的数据：\n\n• 云请求使用 TLS\n• 登录账号使用 Firebase Authentication\n• Firestore 规则限制仅访问您自己的数据\n• 对本机敏感健康字段（如震颤传感器采样、用药昵称）使用 AES 加密，密钥保存在 iOS Keychain\n• App 内提供导出与账户删除\n\n您主动导出的文件为便于阅读的明文格式。本政策不宣称对整个本地数据库文件做全库加密。';

  @override
  String get medicationPrivacy => '可选的用药昵称清单';

  @override
  String get medicationPrivacyText =>
      '若您开启可选的用药昵称清单，昵称、提醒时间与打卡记录会保存在本设备。登录后还可同步到 Amplio 云端账户，以便在另一台 iPhone 上恢复。若您允许通知权限，可选的本地通知仅在本机触发。您可在应用内删除这些数据（含删除账户）。该功能不是医疗建议；数据导出默认不含用药，仅在你每次导出时单独同意才会写入文件。';

  @override
  String get contactUs => '联系我们';

  @override
  String get contactUsText =>
      'Amplio 由个人开发者运营（域名：ampliocare.com）。\n\n• 隐私与数据请求：privacy@ampliocare.com\n• 用户支持：support@ampliocare.com\n• 医生/医院合作：clinical@ampliocare.com\n• 商务联系：hello@ampliocare.com';

  @override
  String get termsOfService => '服务条款';

  @override
  String get termsIntro => '简介';

  @override
  String get termsIntroText =>
      '本《服务条款》（草稿）说明您如何使用 Amplio——面向帕金森人群的 iPhone 康复训练辅助应用。Amplio 由个人开发者运营。本条款不能替代专业法律意见。';

  @override
  String get termsAcceptance => '接受条款';

  @override
  String get termsAcceptanceText =>
      '登录、以游客身份继续使用，或以其他方式使用 Amplio，即表示您同意本条款及《隐私政策》。若不同意，请勿使用本应用。';

  @override
  String get termsUseOfApp => '使用说明';

  @override
  String get termsUseOfAppText =>
      'Amplio 提供可选的训练工具，例如震颤测量、语音练习、肢体练习、进度摘要，以及可选的用药昵称清单（游客仅本机；登录后可同步）。\n\n您仅可将本应用用于合法的个人用途，不得滥用传感器、账户或导出数据，以免损害他人或违反适用法律。';

  @override
  String get termsMedicalDisclaimer => '非医疗建议';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio 是健康与康复训练辅助工具，不能诊断、治疗、治愈或预防帕金森病或其他疾病。\n\n分数、趋势、报告与提醒仅供个人参考，不能替代医生、物理治疗师、语言治疗师或其他合格专业人员的建议。医疗决策请咨询专业人士。若出现疼痛、眩晕或不安全情况，请立即停止相关练习。';

  @override
  String get termsAccounts => '账号与数据';

  @override
  String get termsAccountsText =>
      '您可通过 Apple 登录、Google 登录或游客模式使用 Amplio。您应对登录账号下的活动负责。\n\n您可在应用内导出或删除部分数据。删除账号将删除我们控制的相关云端数据（受技术与法律限制）。游客与仅本地数据在您清除前可能仅保留在设备上。';

  @override
  String get termsLimitation => '责任限制';

  @override
  String get termsLimitationText =>
      '在法律允许的最大范围内，开发者以「现状」提供 Amplio，不作不间断或无错误运行的保证。\n\n除法律不可排除的责任外，开发者不对因依赖训练分数、错过用药提醒、进行练习或无法使用应用而导致的伤害、损失或损害承担责任。';

  @override
  String get termsChanges => '条款变更';

  @override
  String get termsChangesText =>
      '我们可能随应用演进更新本条款，并更新「最后更新」日期。更新后继续使用即表示您接受修订后的条款。重大变更应在应用内可供查阅时予以审阅。';

  @override
  String get lastUpdated => '最后更新';

  @override
  String get version => '版本';

  @override
  String get dataManagement => '数据管理';

  @override
  String get gdprRights => '您有权随时访问、导出和删除您的个人健康数据。';

  @override
  String get exportData => '导出我的数据';

  @override
  String get exportDataDescription =>
      '将个人资料与训练记录导出为 CSV 文件，可通过系统分享面板保存到「文件」或发送。用药昵称仅在你本次导出单独同意后才会写入文件。';

  @override
  String get export => '导出';

  @override
  String get exporting => '正在导出...';

  @override
  String get exportSuccess => '导出成功';

  @override
  String get exportSuccessMessage =>
      'CSV 文件已生成。请在分享面板中存储到「文件」或发送给他人；原始传感器采样仅汇总为数量。';

  @override
  String get exportMedicationConsentTitle => '要包含用药昵称吗？';

  @override
  String get exportMedicationConsentBody =>
      '将导出训练记录为 CSV 文件。\n\n用药昵称、提醒时间与打卡默认不包含。仅当你本次选择「包含用药清单」才会写入。这不是处方或病历。\n\n点取消则停止导出；也可以不含用药继续导出。';

  @override
  String get exportMedicationExclude => '不含用药，继续导出';

  @override
  String get exportMedicationInclude => '包含用药清单';

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
      '请用清晰、有力的声音练习。圆的大小会随音量变化，进入目标范围时会变绿。仅供个人练习，不是医学治疗。';

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
  String get continueAsGuest => '以游客身份继续';

  @override
  String get movementTraining => '肢体动作训练';

  @override
  String get movementTrainingInstruction => '请将双手举高，保持动作标准';

  @override
  String get armsRaised => '双手已举高';

  @override
  String get raiseArms => '请举高双手';

  @override
  String get lowerArms => '很好！请放下双手';

  @override
  String get successCount => '成功次数';

  @override
  String get cameraPermissionRequired => '需要摄像头权限';

  @override
  String get cameraPermissionDeniedMessage =>
      '摄像头权限已被拒绝。请在系统设置中手动开启摄像头权限以使用肢体动作训练功能。';

  @override
  String get setGoal => '设置目标';

  @override
  String get reps => '次';

  @override
  String get greatJob => '太棒了！';

  @override
  String get goalCompleted => '您已完成目标！';

  @override
  String get playAgain => '再来一次';

  @override
  String get trainingHistory => '训练历史';

  @override
  String get noTrainingRecords => '暂无训练记录';

  @override
  String get noTrainingRecordsHint => '完成一次训练后，您的记录将显示在这里';

  @override
  String get trainingDetails => '训练详情';

  @override
  String get goalStatus => '目标状态';

  @override
  String get goalReached => '已完成';

  @override
  String get goalNotReached => '未完成';

  @override
  String get minutes => '分';

  @override
  String get selectTrainingType => '选择训练类型';

  @override
  String get armsRaisedTraining => '举手运动';

  @override
  String get legLiftTraining => '原地抬腿运动';

  @override
  String get legLiftInstruction => '请抬起一条腿，然后放下，完成一次动作';

  @override
  String get lowerLegs => '请放下腿部';

  @override
  String get legsRaised => '腿部已抬起';

  @override
  String get raiseLegs => '请抬起腿部';

  @override
  String get trainingType => '训练类型';

  @override
  String get medicationList => '用药清单';

  @override
  String get medicationListEnable => '设置用药清单';

  @override
  String get medicationDisclaimer =>
      'Amplio 用药清单仅帮助您在本机自行记录服药时间，不能替代医生或药师建议，不提供用药或剂量指导。游客模式数据仅保存在本设备；登录后提醒与打卡可同步到您的 Amplio 账户。';

  @override
  String get medicationDisclaimerAccept => '我了解并开启';

  @override
  String get medicationLabel => '标签';

  @override
  String get medicationLabelHint => '例如：早饭后（可用昵称，不必填真实药名）';

  @override
  String get medicationTime => '时间';

  @override
  String get medicationTaken => '已服用';

  @override
  String get medicationUndo => '撤销';

  @override
  String get medicationUndoConfirm => '撤销今日该条的打卡记录？';

  @override
  String medicationTodayProgress(int done, int total) {
    return '今日 $done/$total';
  }

  @override
  String get medicationManage => '管理';

  @override
  String get medicationAdd => '添加提醒';

  @override
  String get medicationEdit => '编辑提醒';

  @override
  String get medicationClose => '关闭用药清单';

  @override
  String get medicationCloseConfirm => '可以仅隐藏清单，也可同时删除本机全部用药数据。';

  @override
  String get medicationCloseHideOnly => '仅隐藏';

  @override
  String get medicationCloseAndDelete => '隐藏并删除全部数据';

  @override
  String get medicationDeleteAllData => '删除用药清单数据';

  @override
  String get medicationDeleteAllDataDescription => '永久删除本设备上的全部用药提醒与打卡记录。';

  @override
  String get medicationDeleteAllDataConfirm => '确定删除本设备上的全部用药清单数据？此操作无法撤消。';

  @override
  String get medicationCollapse => '折叠';

  @override
  String get medicationExpand => '展开';

  @override
  String get medicationEmptyToday => '今日暂无提醒，请在管理中添加。';

  @override
  String medicationCompletedAt(String time) {
    return '已于 $time 完成';
  }

  @override
  String get medicationSave => '保存';

  @override
  String get medicationDeleteReminder => '删除提醒';

  @override
  String get medicationDeleteReminderConfirm => '确定删除该提醒？';

  @override
  String get medicationNoReminders => '暂无提醒';

  @override
  String get medicationDeleteSuccess => '用药清单数据已删除';

  @override
  String get rehabReport => '康复报告';

  @override
  String get rehabReportDisclaimer => '仅供参考，不构成医学诊断，也不替代医生或治疗师建议。';

  @override
  String get reportOverallScore => '综合评分';

  @override
  String reportDailyProgress(int percent) {
    return '今日目标：$percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return '本周目标：$percent%';
  }

  @override
  String reportStreak(int days) {
    return '连续训练 $days 天';
  }

  @override
  String get reportNoData => '训练数据尚不足';

  @override
  String get handTraining => '手部';

  @override
  String get voiceTrainingShort => '语音';

  @override
  String get motionTrainingShort => '肢体';

  @override
  String get tabHome => '首页';

  @override
  String get tabPlan => '计划';

  @override
  String get tabData => '数据';

  @override
  String get tabProfile => '我的';

  @override
  String get comingSoon => '即将推出';

  @override
  String trainingStreak(int days) {
    return '$days 天';
  }

  @override
  String get trainingStreakLabel => '训练连续';

  @override
  String get voiceClarity => '语音训练';

  @override
  String get handStability => '手部测量';

  @override
  String get movementAbility => '肢体训练';

  @override
  String get medicationReminder => '用药提醒';

  @override
  String lastTrainingAgo(String timeAgo) {
    return '上次训练 · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return '上次测量 · $timeAgo';
  }

  @override
  String get relativeToday => '今天';

  @override
  String get relativeYesterday => '昨天';

  @override
  String relativeDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String get noTrainingYet => '尚未训练';

  @override
  String get noMeasurementYet => '尚未测量';

  @override
  String get tapToStart => '点击开始';

  @override
  String durationSec(int count) {
    return '$count秒';
  }

  @override
  String durationMin(int count) {
    return '$count 分钟';
  }

  @override
  String get voiceSessionCount => '1 次训练';

  @override
  String get handMeasurementCount => '1 次测量';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total 次';
  }

  @override
  String get medicationSetupPrompt => '设置用药提醒';

  @override
  String get medicationSetupSubtitle => '保存在本机；登录后可同步';

  @override
  String get medicationNoUpcoming => '今日暂无待打卡提醒';

  @override
  String get medicationNextDoseLabel => '下次';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => '即将到';

  @override
  String get medicationStatusPending => '待打卡';

  @override
  String medicationNotificationBody(String label) {
    return '该服药了：$label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      '可选：允许通知后，Amplio 会在您设定的时间于本机提醒。通知不会上传云端。';

  @override
  String get recentActivity => '最近活动';

  @override
  String get nonMedicalDisclaimerTitle => '仅供参考';

  @override
  String get nonMedicalDisclaimerBody =>
      '所展示的测量结果仅供康复训练参考，不能用于医学诊断，也不能替代医生或治疗师的建议。';

  @override
  String get voicePrepHint => '请坐稳，将手机举到嘴边，距离大约 30 厘米';

  @override
  String voicePrepDurationHint(int seconds) {
    return '本次练习大约 $seconds 秒';
  }

  @override
  String get voicePrepEnvironmentHint => '建议在安静的房间练习，效果更好';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return '请保持安静 · 还剩 $seconds 秒';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return '已练习 $seconds 秒';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return '目标：$seconds 秒';
  }

  @override
  String get voiceLegendTarget => '目标音量';

  @override
  String get voiceLegendYours => '你的音量';

  @override
  String get voiceShowDetail => '显示数值';

  @override
  String get voiceHideDetail => '隐藏数值';

  @override
  String get voiceCompletedTitle => '练习完成';

  @override
  String get voiceCompletedDurationLabel => '本次练习';

  @override
  String get voiceCompletedTargetLabel => '达到目标音量时长';

  @override
  String get voiceCompletedEncourageGood => '非常好！继续保持大声说话的习惯。';

  @override
  String get voiceCompletedEncourageTryMore => '不错的尝试，下次可以试着更大声一点。';

  @override
  String get voiceRetryButton => '再练一次';

  @override
  String get voiceFinishButton => '完成';

  @override
  String get voicePracticeFooterHint => '此练习通过大声说话帮助语音训练，仅供参考，非医学诊断。';

  @override
  String get voiceSessionTooShort => '练习时间过短，未保存本次记录';

  @override
  String get voiceProtocolPickerTitle => '选择练习方式';

  @override
  String get voiceProtocolSteady => '持续音量';

  @override
  String get voiceProtocolSteadyDesc => '拉长发「啊」，尽量保持在目标音量区。';

  @override
  String get voiceProtocolLadder => '音量阶梯';

  @override
  String get voiceProtocolLadderDesc => '轻 → 目标 → 稍强 → 再回落。';

  @override
  String get voiceProtocolMultiSet => '三组短练';

  @override
  String get voiceProtocolMultiSetDesc => '三组短练习，组间短暂休息。';

  @override
  String get voiceTrainingReferenceDisclaimer => '仅供个人康复练习参考，不能诊断或治疗疾病。';

  @override
  String get voiceLadderPhaseSoft => '阶段 1：轻一点';

  @override
  String get voiceLadderPhaseTarget => '阶段 2：目标音量';

  @override
  String get voiceLadderPhaseStrong => '阶段 3：再强一点';

  @override
  String get voiceLadderPhaseCoolDown => '阶段 4：慢慢回落';

  @override
  String voiceLadderChip(int seconds) {
    return '本阶段剩 $seconds 秒';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return '第 $current/$total 组 · $seconds 秒';
  }

  @override
  String voiceRestChip(int seconds) {
    return '休息 $seconds 秒';
  }

  @override
  String get voiceRestTitle => '休息一下';

  @override
  String voiceRestBody(int next, int total) {
    return '下一组是第 $next / $total 组，放松嗓子。';
  }

  @override
  String get tremorDurationPickerTitle => '练习时长';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return '请将手机握在手中，保持手臂静止 $seconds 秒。';
  }

  @override
  String get tremorMotionBandDisclaimer => '晃动档位仅供个人参考，不是医学评估或诊断。';

  @override
  String get planTodayTitle => '今日练习';

  @override
  String get planTodaySubtitle => '根据训练模块给出的建议，点按即可开始。';

  @override
  String get planEmptyHint => '暂无建议，可先从首页开始一次训练。';

  @override
  String get planDomainHand => '手部';

  @override
  String get planDomainVoice => '语音';

  @override
  String get planDomainMotion => '肢体';

  @override
  String planGoalProgress(int done, int target) {
    return '今日进度：$done/$target 次';
  }

  @override
  String get planGoalCompleted => '今日目标已完成，做得很好。';

  @override
  String planWeeklyProgress(int done, int target) {
    return '本周进度：$done/$target 次';
  }

  @override
  String get planOpenTask => '开始';

  @override
  String get planMotionShelvedNote => '部分机型肢体检测仍不稳定，仍可打开练习页尝试。';

  @override
  String get voiceProtocolClarity => '清晰短句';

  @override
  String get voiceProtocolClarityDesc => '大声朗读短句。不做发音对错评分。';

  @override
  String get voiceClarityHint => '请把句子读清楚。我们只检测你是否出声，不判断读得对不对。';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return '第 $current / $total 句';
  }

  @override
  String get voiceClarityVoiceDetected => '已检测到声音';

  @override
  String get voiceClarityWaitingVoice => '请大声读出这句话';

  @override
  String get voiceClarityNextPhrase => '下一句';

  @override
  String get voiceClarityFinish => '完成';

  @override
  String get voiceClarityPhrase1 => '早上好';

  @override
  String get voiceClarityPhrase2 => '你今天好吗？';

  @override
  String get voiceClarityPhrase3 => '请把水递给我';

  @override
  String get voiceClarityPhrase4 => '我感觉不错';

  @override
  String get voiceClarityPhrase5 => '明天见';

  @override
  String get handModePickerTitle => '练习方式';

  @override
  String get handModeStillHold => '静止持机';

  @override
  String get handModeStillHoldDesc => '握着手机保持静止，用传感器观察晃动。';

  @override
  String get handModeObjectHold => '持物稳定';

  @override
  String get handModeObjectHoldDesc => '握住杯子或软球保持稳定。引导计时，无物体检测。';

  @override
  String get handModeFineMotor => '对指练习';

  @override
  String get handModeFineMotorDesc => '拇指依次触碰四指。由你点按计数。';

  @override
  String get handGuidedDisclaimer => '引导练习仅供个人康复参考，不是医学评估。';

  @override
  String get handObjectHoldInstruction => '请坐稳。单手握住杯子或软球，保持稳定，不必用力捏紧。';

  @override
  String get handObjectHoldStart => '开始保持';

  @override
  String get handObjectHoldRunning => '请继续保持稳定…';

  @override
  String get handObjectHoldDone => '本轮完成';

  @override
  String get handFineMotorInstruction => '拇指依次触碰食指、中指、无名指、小指，算作一组。';

  @override
  String get handFineMotorMarkCycle => '我完成了一组';

  @override
  String handFineMotorProgress(int done, int target) {
    return '已完成 $done/$target 组';
  }

  @override
  String get handGuidedCompleteTitle => '练习完成';

  @override
  String get handGuidedCompleteBody => '做得很好。本次已保存为个人练习参考。';

  @override
  String get dataTabTitle => '我的数据';

  @override
  String get dataTabSubtitle => '本周练习分数与趋势，仅供个人参考。';

  @override
  String get dataTrendsTitle => '本周 vs 上周';

  @override
  String get dataOpenFullReport => '打开完整康复报告';

  @override
  String get dataRecentSessions => '最近练习';

  @override
  String dataStreakDays(int days) {
    return '连续训练：$days 天';
  }

  @override
  String get reportShareButton => '分享报告';

  @override
  String get reportShareConsentTitle => '要分享康复摘要吗？';

  @override
  String get reportShareConsentBody =>
      '将生成包含练习分数与趋势的文本文件，并打开系统分享面板（信息、邮件、文件等）。\n\n仅供个人参考，不是医学诊断。\n\n一旦你把文件发出去，Amplio 无法从对方处撤回。现在可以取消；下一屏也可以不选择任何分享目标。';

  @override
  String get reportShareConsentConfirm => '我已了解，继续';

  @override
  String get reportShareFileTitle => 'Amplio Care 康复摘要';

  @override
  String get reportShareSuccess => '已打开分享面板';

  @override
  String get reportShareFailed => '分享失败，请重试。';

  @override
  String get reportShareFooterNote => '每次分享都需要你确认。Amplio 不会自动把报告发给医生。';

  @override
  String get profileTabTitle => '我的';

  @override
  String get profileGuestLabel => '游客';

  @override
  String get profileGuestSubtitle => '数据保存在本机。登录后可使用云同步。';

  @override
  String get profileSignedInLabel => '已登录';

  @override
  String get profileSectionPreferences => '偏好设置';

  @override
  String get profileSectionAccount => '账号与数据';

  @override
  String get profileSectionLegal => '隐私与条款';

  @override
  String get accessibilitySettings => '无障碍';

  @override
  String get exitGuestMode => '退出游客模式';

  @override
  String get exitGuestModeConfirm => '确定要退出游客模式吗？退出后需要重新登录或再次以游客继续。';

  @override
  String get trainingReminderPageTitle => '练习提醒';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody => '有空时做一小段练习即可，错过也没关系。';

  @override
  String get trainingReminderDisclaimer =>
      '这是可选的本机提醒，不是治疗计划。可随时关闭。错过不会扣分，也不改变训练记录。';

  @override
  String get trainingReminderEnable => '提醒我去练习';

  @override
  String trainingReminderTimeLabel(int n) {
    return '时刻 $n';
  }

  @override
  String get trainingReminderAddTime => '增加第二个时刻';

  @override
  String get trainingReminderRemoveTime => '删除此时刻';

  @override
  String get trainingReminderQuietWeekends => '周末不提醒';

  @override
  String get trainingReminderQuietWeekendsHint => '周六、周日不发送提醒。';

  @override
  String get trainingReminderPermissionDenied => '未允许通知。可稍后在 iPhone 设置中打开。';

  @override
  String get planReminderOff => '设置练习提醒';

  @override
  String planReminderOn(String times) {
    return '提醒：$times';
  }
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => '請選擇您要進行的訓練';

  @override
  String get clickToStartTest => '點擊開始測試';

  @override
  String get clickToStartTraining => '點擊開始訓練';

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
  String get tremorTestCancelledNoSave => '已取消測試，未儲存記錄';

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
  String get waveformAxisTime => '時間';

  @override
  String get waveformAxisAmplitude => '振幅';

  @override
  String get waveformHint => '波形越高，手部抖動越明顯';

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
  String get severityNormal => '較低晃動';

  @override
  String get severityMild => '輕微晃動';

  @override
  String get severityModerate => '中等晃動';

  @override
  String get severityModerateSevere => '較高晃動';

  @override
  String get severitySevere => '最高級距';

  @override
  String get appSubtitle => '您的帕金森運動追蹤與分析助手';

  @override
  String get signInWithGoogle => '使用 Google 登入';

  @override
  String get signInWithApple => '使用 Apple 登入';

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
  String get syncing => '同步中…';

  @override
  String get syncFailed => '同步失敗，請檢查網路後重試。';

  @override
  String get syncFailedHint => '同步失敗 — 點按重試';

  @override
  String get syncRetry => '重試';

  @override
  String get loginRequiredForSync => '請先登入以使用雲端同步';

  @override
  String lastSyncedAt(String time) {
    return '上次同步：$time';
  }

  @override
  String get privacyPolicy => '隱私政策';

  @override
  String get privacyPolicyIntro => '簡介';

  @override
  String get privacyPolicyIntroText =>
      'Amplio 致力於保護您的隱私和個人健康資料的安全。本政策說明我們如何收集、使用、儲存和保護您的資訊。';

  @override
  String get dataCollection => '我們收集的資料';

  @override
  String get dataCollectionText =>
      '我們收集以下資料：\n\n• 帳戶資訊：電子郵件、姓名（用於身份驗證）\n• 感測器資料：顫抖測試期間的運動資料\n• 測試結果：頻率、振幅和嚴重程度評估\n\n我們遵循資料最小化原則，只收集必要的資料。';

  @override
  String get dataUsage => '資料使用方式';

  @override
  String get dataUsageText =>
      '您的資料僅用於以下目的：\n\n• 提供復健訓練功能與進度追蹤\n• 在 App 內向您顯示摘要與報告（僅供個人參考）\n• 僅在使用匿名資料且取得您同意時用於改進應用';

  @override
  String get dataStorage => '資料儲存與安全';

  @override
  String get dataStorageText =>
      '登入後，帳號與已同步的訓練資料可能儲存在 Google Firebase；訪客與僅本機資料保留在您的裝置上。\n\n• 與雲端服務通訊使用 HTTPS/TLS\n• 存取受帳號身分與 Firestore 安全規則限制\n• 可在 App 內匯出或刪除資料';

  @override
  String get dataSharing => '資料共享';

  @override
  String get dataSharingText =>
      '我們不出售您的個人健康資料。\n\n資料僅在以下情況離開本應用：\n• 您主動匯出或分享檔案\n• 法律要求揭露\n\n本應用目前不會直接向醫療機構傳送資料。';

  @override
  String get userRights => '您的資料權利';

  @override
  String get userRightsText =>
      '您享有以下權利：\n\n• 存取權：查看您的所有資料\n• 可攜權：匯出您的資料\n• 刪除權：刪除您的資料（被遺忘權）\n• 撤回權：隨時撤回同意\n• 聯絡我們：如有隱私疑問請聯絡我們';

  @override
  String get dataSecurity => '安全措施';

  @override
  String get dataSecurityText =>
      '我們使用目前技術堆疊中可用的安全能力保護您的資料：\n\n• 雲端請求使用 TLS\n• 登入帳號使用 Firebase Authentication\n• Firestore 規則限制僅存取您自己的資料\n• 對本機敏感健康欄位（如震顫感測器採樣、用藥暱稱）使用 AES 加密，金鑰保存在 iOS Keychain\n• App 內提供匯出與帳號刪除\n\n您主動匯出的檔案為便於閱讀的明文格式。本政策不宣稱對整個本機資料庫檔案做全庫加密。';

  @override
  String get medicationPrivacy => '可選的用藥暱稱清單';

  @override
  String get medicationPrivacyText =>
      '若您開啟可選的用藥暱稱清單，暱稱、提醒時間與打卡紀錄會儲存在本裝置。登入後也可同步到您的 Amplio 雲端帳戶，以便在另一台 iPhone 上還原。若您允許通知權限，可選的本機通知只會在本裝置觸發。您可在 App 內刪除這些資料（包括刪除帳號）。此功能不是醫療建議；除非您每次匯出時另行同意，否則匯出資料不會包含用藥資訊。';

  @override
  String get contactUs => '聯絡我們';

  @override
  String get contactUsText =>
      'Amplio 由個人開發者營運（域名：ampliocare.com）。\n\n• 隱私與資料請求：privacy@ampliocare.com\n• 使用者支援：support@ampliocare.com\n• 醫師/醫院合作：clinical@ampliocare.com\n• 商務聯絡：hello@ampliocare.com';

  @override
  String get termsOfService => '服務條款';

  @override
  String get termsIntro => '簡介';

  @override
  String get termsIntroText =>
      '本《服務條款》（草稿）說明您如何使用 Amplio——面向帕金森族群的 iPhone 復健訓練輔助應用。Amplio 由個人開發者營運。本條款不能替代專業法律意見。';

  @override
  String get termsAcceptance => '接受條款';

  @override
  String get termsAcceptanceText =>
      '登入、以訪客身分繼續使用，或以其他方式使用 Amplio，即表示您同意本條款及《隱私政策》。若不同意，請勿使用本應用。';

  @override
  String get termsUseOfApp => '使用說明';

  @override
  String get termsUseOfAppText =>
      'Amplio 提供可選的訓練工具，例如顫抖測量、語音練習、肢體練習、進度摘要，以及可選的用藥暱稱清單（訪客僅本機；登入後可同步）。\n\n您僅可將本應用用於合法的個人用途，不得濫用感測器、帳號或匯出資料，以免損害他人或違反適用法律。';

  @override
  String get termsMedicalDisclaimer => '非醫療建議';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio 是健康與復健訓練輔助工具，不能診斷、治療、治癒或預防帕金森病或其他疾病。\n\n分數、趨勢、報告與提醒僅供個人參考，不能替代醫生、物理治療師、語言治療師或其他合格專業人員的建議。醫療決策請諮詢專業人士。若出現疼痛、眩暈或不安全情況，請立即停止相關練習。';

  @override
  String get termsAccounts => '帳號與資料';

  @override
  String get termsAccountsText =>
      '您可透過 Apple 登入、Google 登入或訪客模式使用 Amplio。您應對登入帳號下的活動負責。\n\n您可在應用內匯出或刪除部分資料。刪除帳號將刪除我們控制的相關雲端資料（受技術與法律限制）。訪客與僅本機資料在您清除前可能僅保留在裝置上。';

  @override
  String get termsLimitation => '責任限制';

  @override
  String get termsLimitationText =>
      '在法律允許的最大範圍內，開發者以「現狀」提供 Amplio，不作不間斷或無錯誤運作的保證。\n\n除法律不可排除的責任外，開發者不對因依賴訓練分數、錯過用藥提醒、進行練習或無法使用應用而導致的傷害、損失或損害承擔責任。';

  @override
  String get termsChanges => '條款變更';

  @override
  String get termsChangesText =>
      '我們可能隨應用演進更新本條款，並更新「最後更新」日期。更新後繼續使用即表示您接受修訂後的條款。重大變更應在應用內可供查閱時予以審閱。';

  @override
  String get lastUpdated => '最後更新';

  @override
  String get version => '版本';

  @override
  String get dataManagement => '資料管理';

  @override
  String get gdprRights => '您有權隨時存取、匯出和刪除您的個人健康資料。';

  @override
  String get exportData => '匯出我的資料';

  @override
  String get exportDataDescription =>
      '將您的個人資料與訓練紀錄匯出為 CSV 檔案。您可透過系統分享面板儲存到「檔案」或傳送；只有本次另行同意時，檔案才會包含用藥暱稱。';

  @override
  String get export => '匯出';

  @override
  String get exporting => '正在匯出...';

  @override
  String get exportSuccess => '匯出成功';

  @override
  String get exportSuccessMessage =>
      'CSV 檔案已準備完成。請使用分享面板儲存到「檔案」或傳送；原始感測器樣本只會匯總為數量。';

  @override
  String get exportMedicationConsentTitle => '要包含用藥暱稱嗎？';

  @override
  String get exportMedicationConsentBody =>
      '訓練紀錄將匯出為 CSV 檔案。\n\n除非您選擇「本次包含」，否則不會包含用藥暱稱、提醒時間與打卡紀錄。這不是處方或病歷。\n\n選擇取消可停止匯出；您也可以繼續匯出但不包含用藥資料。';

  @override
  String get exportMedicationExclude => '不含用藥資料並匯出';

  @override
  String get exportMedicationInclude => '包含用藥清單';

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
  String get deleteAccountDescription => '永久刪除您的帳號及所有相關資料，包括所有測試紀錄與個人資訊。';

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
      '請用清晰、有力的聲音練習。圓圈大小會隨音量變化；進入目標範圍時，圓圈會變成綠色。僅供個人練習，不是醫療處置。';

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
  String get continueAsGuest => '以訪客身分繼續';

  @override
  String get movementTraining => '肢體動作訓練';

  @override
  String get movementTrainingInstruction => '請將雙手舉高，保持動作標準';

  @override
  String get armsRaised => '雙手已舉高';

  @override
  String get raiseArms => '請舉高雙手';

  @override
  String get lowerArms => '很好！請放下雙手';

  @override
  String get successCount => '成功次數';

  @override
  String get cameraPermissionRequired => '需要相機權限';

  @override
  String get cameraPermissionDeniedMessage =>
      '相機權限已被拒絕。請在系統設定中開啟相機權限，以使用肢體動作訓練功能。';

  @override
  String get setGoal => '設置目標';

  @override
  String get reps => '次';

  @override
  String get greatJob => '太棒了！';

  @override
  String get goalCompleted => '您已完成目標！';

  @override
  String get playAgain => '再來一次';

  @override
  String get trainingHistory => '訓練歷史';

  @override
  String get noTrainingRecords => '暫無訓練記錄';

  @override
  String get noTrainingRecordsHint => '完成一次訓練後，您的記錄將顯示在這裡';

  @override
  String get trainingDetails => '訓練詳情';

  @override
  String get goalStatus => '目標狀態';

  @override
  String get goalReached => '已完成';

  @override
  String get goalNotReached => '未完成';

  @override
  String get minutes => '分';

  @override
  String get selectTrainingType => '選擇訓練類型';

  @override
  String get armsRaisedTraining => '舉手運動';

  @override
  String get legLiftTraining => '原地抬腿運動';

  @override
  String get legLiftInstruction => '請抬起一條腿，然後放下，完成一次動作';

  @override
  String get lowerLegs => '請放下腿部';

  @override
  String get legsRaised => '腿部已抬起';

  @override
  String get raiseLegs => '請抬起腿部';

  @override
  String get trainingType => '訓練類型';

  @override
  String get medicationList => '用藥清單';

  @override
  String get medicationListEnable => '設定用藥清單';

  @override
  String get medicationDisclaimer =>
      'Amplio 用藥清單僅幫助您在本機自行記錄服藥時間，不能替代醫師或藥師建議，不提供用藥或劑量指導。訪客模式資料僅保存在本裝置；登入後提醒與打卡可同步到您的 Amplio 帳戶。';

  @override
  String get medicationDisclaimerAccept => '我了解並開啟';

  @override
  String get medicationLabel => '標籤';

  @override
  String get medicationLabelHint => '例如：早飯後（可用暱稱，不必填真實藥名）';

  @override
  String get medicationTime => '時間';

  @override
  String get medicationTaken => '已服用';

  @override
  String get medicationUndo => '撤銷';

  @override
  String get medicationUndoConfirm => '撤銷今日該條的打卡記錄？';

  @override
  String medicationTodayProgress(int done, int total) {
    return '今日 $done/$total';
  }

  @override
  String get medicationManage => '管理';

  @override
  String get medicationAdd => '新增提醒';

  @override
  String get medicationEdit => '編輯提醒';

  @override
  String get medicationClose => '關閉用藥清單';

  @override
  String get medicationCloseConfirm => '可以僅隱藏清單，也可同時刪除本機全部用藥資料。';

  @override
  String get medicationCloseHideOnly => '僅隱藏';

  @override
  String get medicationCloseAndDelete => '隱藏並刪除全部資料';

  @override
  String get medicationDeleteAllData => '刪除用藥清單資料';

  @override
  String get medicationDeleteAllDataDescription => '永久刪除本裝置上的全部用藥提醒與打卡記錄。';

  @override
  String get medicationDeleteAllDataConfirm => '確定刪除本裝置上的全部用藥清單資料？此操作無法撤銷。';

  @override
  String get medicationCollapse => '摺疊';

  @override
  String get medicationExpand => '展開';

  @override
  String get medicationEmptyToday => '今日暫無提醒，請在管理中添加。';

  @override
  String medicationCompletedAt(String time) {
    return '已於 $time 完成';
  }

  @override
  String get medicationSave => '儲存';

  @override
  String get medicationDeleteReminder => '刪除提醒';

  @override
  String get medicationDeleteReminderConfirm => '確定刪除該提醒？';

  @override
  String get medicationNoReminders => '暫無提醒';

  @override
  String get medicationDeleteSuccess => '用藥清單資料已刪除';

  @override
  String get rehabReport => '復健報告';

  @override
  String get rehabReportDisclaimer => '僅供參考，不構成醫學診斷，也不替代醫師或治療師建議。';

  @override
  String get reportOverallScore => '綜合評分';

  @override
  String reportDailyProgress(int percent) {
    return '今日目標：$percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return '本週目標：$percent%';
  }

  @override
  String reportStreak(int days) {
    return '連續訓練 $days 天';
  }

  @override
  String get reportNoData => '訓練資料尚不足';

  @override
  String get handTraining => '手部';

  @override
  String get voiceTrainingShort => '語音';

  @override
  String get motionTrainingShort => '肢體';

  @override
  String get tabHome => '首頁';

  @override
  String get tabPlan => '計畫';

  @override
  String get tabData => '數據';

  @override
  String get tabProfile => '我的';

  @override
  String get comingSoon => '即將推出';

  @override
  String trainingStreak(int days) {
    return '$days 天';
  }

  @override
  String get trainingStreakLabel => '連續訓練';

  @override
  String get voiceClarity => '語音訓練';

  @override
  String get handStability => '手部測量';

  @override
  String get movementAbility => '肢體訓練';

  @override
  String get medicationReminder => '用藥提醒';

  @override
  String lastTrainingAgo(String timeAgo) {
    return '上次訓練 · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return '上次測量 · $timeAgo';
  }

  @override
  String get relativeToday => '今天';

  @override
  String get relativeYesterday => '昨天';

  @override
  String relativeDaysAgo(int days) {
    return '$days 天前';
  }

  @override
  String get noTrainingYet => '尚未訓練';

  @override
  String get noMeasurementYet => '尚未測量';

  @override
  String get tapToStart => '點擊開始';

  @override
  String durationSec(int count) {
    return '$count 秒';
  }

  @override
  String durationMin(int count) {
    return '$count 分鐘';
  }

  @override
  String get voiceSessionCount => '1 次訓練';

  @override
  String get handMeasurementCount => '1 次測量';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total 次';
  }

  @override
  String get medicationSetupPrompt => '設定用藥提醒';

  @override
  String get medicationSetupSubtitle => '保存在本機；登入後可同步';

  @override
  String get medicationNoUpcoming => '今日暫無待打卡提醒';

  @override
  String get medicationNextDoseLabel => '下次';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => '即將到';

  @override
  String get medicationStatusPending => '待打卡';

  @override
  String medicationNotificationBody(String label) {
    return '該服藥了：$label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      '可選：允許通知後，Amplio 會在您設定的時間於本機提醒。通知不會上傳雲端。';

  @override
  String get recentActivity => '最近活動';

  @override
  String get nonMedicalDisclaimerTitle => '僅供參考';

  @override
  String get nonMedicalDisclaimerBody =>
      '所展示的測量結果僅供復健訓練參考，不能用於醫學診斷，也不能替代醫師或治療師的建議。';

  @override
  String get voicePrepHint => '請坐穩，將手機舉到嘴邊，距離大約 30 公分';

  @override
  String voicePrepDurationHint(int seconds) {
    return '本次練習大約 $seconds 秒';
  }

  @override
  String get voicePrepEnvironmentHint => '建議在安靜的房間練習，效果更好';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return '請保持安靜 · 還剩 $seconds 秒';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return '已練習 $seconds 秒';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return '目標：$seconds 秒';
  }

  @override
  String get voiceLegendTarget => '目標音量';

  @override
  String get voiceLegendYours => '你的音量';

  @override
  String get voiceShowDetail => '顯示數值';

  @override
  String get voiceHideDetail => '隱藏數值';

  @override
  String get voiceCompletedTitle => '練習完成';

  @override
  String get voiceCompletedDurationLabel => '本次練習';

  @override
  String get voiceCompletedTargetLabel => '達到目標音量時長';

  @override
  String get voiceCompletedEncourageGood => '非常好！繼續保持大聲說話的習慣。';

  @override
  String get voiceCompletedEncourageTryMore => '不錯的嘗試，下次可以試著更大聲一點。';

  @override
  String get voiceRetryButton => '再練一次';

  @override
  String get voiceFinishButton => '完成';

  @override
  String get voicePracticeFooterHint => '此練習透過大聲說話幫助語音訓練，僅供參考，非醫學診斷。';

  @override
  String get voiceSessionTooShort => '練習時間過短，未儲存本次紀錄';

  @override
  String get voiceProtocolPickerTitle => '選擇練習方式';

  @override
  String get voiceProtocolSteady => '穩定音量';

  @override
  String get voiceProtocolSteadyDesc => '持續發長音「啊」，盡量維持在目標音量區間。';

  @override
  String get voiceProtocolLadder => '音量階梯';

  @override
  String get voiceProtocolLadderDesc => '輕聲 → 目標音量 → 稍強 → 慢慢降低。';

  @override
  String get voiceProtocolMultiSet => '3 組短練習';

  @override
  String get voiceProtocolMultiSetDesc => '進行三組短練習，組間稍作休息。';

  @override
  String get voiceTrainingReferenceDisclaimer => '僅供個人復健練習參考，不是診斷或治療。';

  @override
  String get voiceLadderPhaseSoft => '階段 1：輕聲';

  @override
  String get voiceLadderPhaseTarget => '階段 2：目標音量';

  @override
  String get voiceLadderPhaseStrong => '階段 3：稍強';

  @override
  String get voiceLadderPhaseCoolDown => '階段 4：慢慢降低';

  @override
  String voiceLadderChip(int seconds) {
    return '本階段剩餘：$seconds 秒';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return '第 $current/$total 組 · $seconds 秒';
  }

  @override
  String voiceRestChip(int seconds) {
    return '休息 $seconds 秒';
  }

  @override
  String get voiceRestTitle => '休息';

  @override
  String voiceRestBody(int next, int total) {
    return '下一組：第 $next/$total 組。請讓嗓音放鬆。';
  }

  @override
  String get tremorDurationPickerTitle => '測量時間';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds 秒';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return '將手機握穩 $seconds 秒，並保持手臂穩定。';
  }

  @override
  String get tremorMotionBandDisclaimer => '晃動級距僅供個人參考，不是醫療評估。';

  @override
  String get planTodayTitle => '今日練習';

  @override
  String get planTodaySubtitle => '根據您的訓練模組提供建議。點一下即可開始。';

  @override
  String get planEmptyHint => '目前沒有建議。請先從首頁開始一項訓練。';

  @override
  String get planDomainHand => '手部';

  @override
  String get planDomainVoice => '語音';

  @override
  String get planDomainMotion => '肢體';

  @override
  String planGoalProgress(int done, int target) {
    return '今日：$done/$target 次';
  }

  @override
  String get planGoalCompleted => '已完成今日目標，做得很好。';

  @override
  String planWeeklyProgress(int done, int target) {
    return '本週：$done/$target 次';
  }

  @override
  String get planOpenTask => '開始';

  @override
  String get planMotionShelvedNote => '部分手機的肢體偵測功能有限；您仍可開啟練習畫面。';

  @override
  String get voiceProtocolClarity => '清晰短句';

  @override
  String get voiceProtocolClarityDesc => '大聲朗讀短句，不評分發音是否正確。';

  @override
  String get voiceClarityHint => '請清楚讀出句子。我們只檢查您是否有發聲，不判斷是否讀得「正確」。';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return '第 $current/$total 句';
  }

  @override
  String get voiceClarityVoiceDetected => '已偵測到聲音，很好';

  @override
  String get voiceClarityWaitingVoice => '請大聲讀出這句話';

  @override
  String get voiceClarityNextPhrase => '下一句';

  @override
  String get voiceClarityFinish => '完成';

  @override
  String get voiceClarityPhrase1 => '早安';

  @override
  String get voiceClarityPhrase2 => '您今天好嗎？';

  @override
  String get voiceClarityPhrase3 => '請把水遞給我';

  @override
  String get voiceClarityPhrase4 => '我很好';

  @override
  String get voiceClarityPhrase5 => '明天見';

  @override
  String get handModePickerTitle => '練習方式';

  @override
  String get handModeStillHold => '靜止持機';

  @override
  String get handModeStillHoldDesc => '握穩手機，讓感測器測量晃動。';

  @override
  String get handModeObjectHold => '穩定持物';

  @override
  String get handModeObjectHoldDesc => '穩定握住杯子或軟球。僅提供計時引導，不會偵測物體。';

  @override
  String get handModeFineMotor => '手指對碰';

  @override
  String get handModeFineMotorDesc => '用拇指依序碰觸每根手指，並自行計算完成次數。';

  @override
  String get handGuidedDisclaimer => '引導式練習僅供個人復健參考，不是醫療評估。';

  @override
  String get handObjectHoldInstruction => '請舒適坐好。單手握住杯子或軟球，保持穩定，不要過度用力擠壓。';

  @override
  String get handObjectHoldStart => '開始持握';

  @override
  String get handObjectHoldRunning => '請繼續穩定持握…';

  @override
  String get handObjectHoldDone => '持握完成';

  @override
  String get handFineMotorInstruction => '用拇指依序碰觸食指、中指、無名指和小指，這樣算一組。';

  @override
  String get handFineMotorMarkCycle => '我完成了一組';

  @override
  String handFineMotorProgress(int done, int target) {
    return '組數：$done/$target';
  }

  @override
  String get handGuidedCompleteTitle => '練習完成';

  @override
  String get handGuidedCompleteBody => '做得很好。本次紀錄已儲存，僅供個人練習參考。';

  @override
  String get dataTabTitle => '您的資料';

  @override
  String get dataTabSubtitle => '本週練習分數與趨勢，僅供個人參考。';

  @override
  String get dataTrendsTitle => '本週與上週比較';

  @override
  String get dataOpenFullReport => '開啟完整復健報告';

  @override
  String get dataRecentSessions => '最近練習';

  @override
  String dataStreakDays(int days) {
    return '連續訓練：$days 天';
  }

  @override
  String get reportShareButton => '分享報告';

  @override
  String get reportShareConsentTitle => '要分享您的復健摘要嗎？';

  @override
  String get reportShareConsentBody =>
      '這會建立一個包含練習分數與趨勢的文字檔，並開啟系統分享面板（訊息、郵件、「檔案」等）。\n\n僅供個人參考，不是醫療診斷。\n\n檔案一旦傳送，Amplio 無法從收件者處撤回。您可以現在取消，也可以在下一個畫面不選擇任何分享對象。';

  @override
  String get reportShareConsentConfirm => '我了解，繼續';

  @override
  String get reportShareFileTitle => 'Amplio Care 復健摘要';

  @override
  String get reportShareSuccess => '已開啟分享面板';

  @override
  String get reportShareFailed => '無法分享報告，請再試一次。';

  @override
  String get reportShareFooterNote => '每次分享都需要您的確認。Amplio 不會自動以電子郵件傳送給醫師。';

  @override
  String get profileTabTitle => '個人資料';

  @override
  String get profileGuestLabel => '訪客';

  @override
  String get profileGuestSubtitle => '資料儲存在本機。登入後即可使用雲端同步。';

  @override
  String get profileSignedInLabel => '已登入';

  @override
  String get profileSectionPreferences => '偏好設定';

  @override
  String get profileSectionAccount => '帳號與資料';

  @override
  String get profileSectionLegal => '隱私權與條款';

  @override
  String get accessibilitySettings => '輔助使用';

  @override
  String get exitGuestMode => '離開訪客模式';

  @override
  String get exitGuestModeConfirm => '要離開訪客模式嗎？您需要登入，或再次選擇以訪客身分繼續。';

  @override
  String get trainingReminderPageTitle => '練習提醒';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody => '方便時做一段短練習即可，錯過也沒關係。';

  @override
  String get trainingReminderDisclaimer =>
      '這是可選的本機提醒，不是治療時程。您可隨時關閉；錯過提醒不會影響分數。';

  @override
  String get trainingReminderEnable => '提醒我練習';

  @override
  String trainingReminderTimeLabel(int n) {
    return '時間 $n';
  }

  @override
  String get trainingReminderAddTime => '新增第二個時間';

  @override
  String get trainingReminderRemoveTime => '移除此時間';

  @override
  String get trainingReminderQuietWeekends => '週末不提醒';

  @override
  String get trainingReminderQuietWeekendsHint => '星期六與星期日不發送提醒。';

  @override
  String get trainingReminderPermissionDenied => '未允許通知。您可稍後在 iPhone「設定」中開啟。';

  @override
  String get planReminderOff => '設定練習提醒';

  @override
  String planReminderOn(String times) {
    return '提醒：$times';
  }
}
