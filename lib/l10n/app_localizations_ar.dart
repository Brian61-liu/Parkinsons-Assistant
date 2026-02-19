// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => 'يرجى اختيار التدريب الذي تريد القيام به';

  @override
  String get clickToStartTest => 'انقر لبدء الاختبار';

  @override
  String get clickToStartTraining => 'انقر لبدء التدريب';

  @override
  String get tremorTest => 'اختبار رعشة اليد';

  @override
  String get tremorTestTitle => 'اختبار رعشة اليد';

  @override
  String get tremorTestInstruction =>
      'يرجى حمل الهاتف في يدك والحفاظ على الذراع ثابتة لمدة 30 ثانية';

  @override
  String remainingTime(int time) {
    return 'الوقت المتبقي: $time ثانية';
  }

  @override
  String get readyToTest => 'جاهز لبدء الاختبار';

  @override
  String get frequency => 'التردد';

  @override
  String get amplitude => 'السعة';

  @override
  String get waitingForData => 'في انتظار البيانات...';

  @override
  String get startTest => 'بدء الاختبار';

  @override
  String get stopTest => 'إيقاف الاختبار';

  @override
  String get tremorTestCancelledNoSave => 'تم إلغاء الاختبار، لم يتم حفظ السجل';

  @override
  String get testCompleted => 'اكتمل الاختبار';

  @override
  String averageFrequency(String frequency) {
    return 'متوسط التردد: $frequency هرتز';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'متوسط السعة: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'السعة القصوى: $maxAmplitude';
  }

  @override
  String get ok => 'حسناً';

  @override
  String get sensorPermissionRequired => 'يتطلب إذن المستشعر لإجراء الاختبار';

  @override
  String get language => 'اللغة';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get selectLanguage => 'اللغة';

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
  String get realtimeWaveform => 'الموجة';

  @override
  String get waveformAxisTime => 'الوقت';

  @override
  String get waveformAxisAmplitude => 'السعة';

  @override
  String get waveformHint => 'كلما ارتفعت الموجة زاد وضوح رعشة اليد';

  @override
  String get tremorSeverity => 'الشدة';

  @override
  String get tremorFrequency => 'التردد';

  @override
  String get avgAmplitude => 'متوسط السعة';

  @override
  String get maxAmp => 'السعة القصوى';

  @override
  String get variability => 'التباين';

  @override
  String get sampleRate => 'العينة';

  @override
  String get dataPoints => 'البيانات';

  @override
  String get severityNormal => 'طبيعي';

  @override
  String get severityMild => 'خفيف';

  @override
  String get severityModerate => 'معتدل';

  @override
  String get severityModerateSevere => 'متوسط-شديد';

  @override
  String get severitySevere => 'شديد';

  @override
  String get appSubtitle => 'مساعدك الشخصي لمرض باركنسون لتتبع وتحليل الحركة';

  @override
  String get signInWithGoogle => 'تسجيل الدخول بـ Google';

  @override
  String get signingIn => 'جارٍ تسجيل الدخول...';

  @override
  String get privacyNotice =>
      'من خلال تسجيل الدخول، فإنك توافق على شروط الخدمة وسياسة الخصوصية الخاصة بنا';

  @override
  String get loginError => 'خطأ في تسجيل الدخول';

  @override
  String get confirm => 'تأكيد';

  @override
  String get cancel => 'إلغاء';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirm => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String welcome(String name) {
    return 'مرحباً، $name';
  }

  @override
  String get syncToCloud => 'مزامنة مع السحابة';

  @override
  String get dataSynced => 'تمت مزامنة البيانات بنجاح';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacyPolicyIntro => 'مقدمة';

  @override
  String get privacyPolicyIntroText =>
      'تلتزم Amplio بحماية خصوصيتك وبياناتك الصحية. توضح هذه السياسة كيفية جمع واستخدام وتخزين وحماية معلوماتك، وفقاً لـ HIPAA و GDPR.';

  @override
  String get dataCollection => 'البيانات التي نجمعها';

  @override
  String get dataCollectionText =>
      'نجمع البيانات التالية:\n\n• الحساب: البريد الإلكتروني، الاسم (للمصادقة)\n• المستشعرات: بيانات الحركة أثناء الاختبارات\n• النتائج: التردد، السعة، الشدة\n\nنتبع مبدأ تقليل البيانات.';

  @override
  String get dataUsage => 'استخدام البيانات';

  @override
  String get dataUsageText =>
      'تُستخدم بياناتك فقط لـ:\n\n• توفير تحليل وتتبع الرعشة\n• إنشاء تقارير صحية\n• تحسين الخوارزميات (بيانات مجهولة بموافقتك)';

  @override
  String get dataStorage => 'التخزين والأمان';

  @override
  String get dataStorageText =>
      'يتم تخزين بياناتك بأمان على Google Firebase.\n\n• تشفير من طرف إلى طرف\n• TLS 1.3 لجميع الإرسالات\n• ضوابط وصول صارمة\n• تدقيقات أمنية منتظمة';

  @override
  String get dataSharing => 'مشاركة البيانات';

  @override
  String get dataSharingText =>
      'لا نبيع أبداً بياناتك الصحية.\n\nتتم مشاركة البيانات فقط:\n• بموافقتك الصريحة\n• مع مقدمي الرعاية الصحية المعينين\n• عند مطالبة القانون\n\nقد تُستخدم البيانات المجهولة للبحث.';

  @override
  String get userRights => 'حقوقك (GDPR)';

  @override
  String get userRightsText =>
      'وفقاً لـ GDPR، لديك الحق في:\n\n• الوصول: عرض جميع بياناتك\n• النقل: تصدير بياناتك\n• المحو: حذف بياناتك\n• السحب: سحب الموافقة\n• الشكوى: تقديم شكاوى للسلطات';

  @override
  String get dataSecurity => 'إجراءات الأمان';

  @override
  String get dataSecurityText =>
      'نطبق طبقات أمان متعددة:\n\n• تشفير AES-256 في الراحة\n• TLS 1.3 في النقل\n• مصادقة متعددة العوامل\n• اختبارات اختراق منتظمة\n• سجلات تدقيق شاملة\n• تدريب أمني للموظفين';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get contactUsText => 'استفسارات الخصوصية: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get version => 'الإصدار';

  @override
  String get dataManagement => 'إدارة البيانات';

  @override
  String get gdprRights =>
      'وفقاً لـ GDPR و HIPAA، يمكنك الوصول إلى بياناتك الصحية وتصديرها وحذفها في أي وقت.';

  @override
  String get exportData => 'تصدير بياناتي';

  @override
  String get exportDataDescription =>
      'قم بتنزيل نسخة كاملة من جميع بياناتك (تنسيق JSON).';

  @override
  String get export => 'تصدير';

  @override
  String get exporting => 'جارٍ التصدير...';

  @override
  String get exportSuccess => 'تم التصدير بنجاح';

  @override
  String get exportSuccessMessage => 'تم نسخ بياناتك إلى الحافظة.';

  @override
  String get deleteAllRecords => 'حذف جميع السجلات';

  @override
  String get deleteAllRecordsDescription =>
      'احذف جميع سجلات الاختبارات نهائياً. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get deleteAllData => 'حذف جميع البيانات';

  @override
  String get deleteAllDataConfirm =>
      'هل أنت متأكد من حذف جميع السجلات؟ هذا الإجراء لا رجعة فيه.';

  @override
  String get delete => 'حذف';

  @override
  String get deleteSuccess => 'تم الحذف بنجاح';

  @override
  String get deleteSuccessMessage => 'تم حذف جميع السجلات نهائياً.';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteAccountDescription =>
      'احذف حسابك وجميع البيانات المرتبطة نهائياً.';

  @override
  String get deleteAccountWarning =>
      'سيتم حذف حسابك وجميع البيانات نهائياً. لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get deleteAccountFinalWarning =>
      'تحذير أخير: بعد الحذف، سيفقد حسابك وبياناتك إلى الأبد. هل أنت متأكد؟';

  @override
  String get finalWarning => 'تحذير أخير';

  @override
  String get deleteForever => 'حذف نهائي';

  @override
  String get continue_ => 'متابعة';

  @override
  String get error => 'خطأ';

  @override
  String get settings => 'الإعدادات';

  @override
  String get testHistory => 'السجل';

  @override
  String get noTestRecords => 'لا توجد سجلات اختبار';

  @override
  String get noTestRecordsHint => 'أكمل اختبار الرعشة لرؤية نتائجك هنا';

  @override
  String get testDate => 'تاريخ الاختبار';

  @override
  String get deleteRecord => 'حذف السجل';

  @override
  String get deleteRecordConfirm => 'هل أنت متأكد من حذف سجل الاختبار هذا؟';

  @override
  String get recordDeleted => 'تم حذف السجل';

  @override
  String get duration => 'المدة';

  @override
  String get seconds => 'ث';

  @override
  String get tapToCancel => 'انقر للإلغاء';

  @override
  String get changeAvatar => 'تغيير الصورة الشخصية';

  @override
  String get selectFromGallery => 'اختر من المعرض';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get avatarUpdated => 'تم تحديث الصورة الشخصية بنجاح';

  @override
  String get avatarUpdateFailed => 'فشل تحديث الصورة الشخصية';

  @override
  String get voiceTraining => 'تدريب الصوت';

  @override
  String get voiceTrainingMainInstruction =>
      'يرجى الاستمرار في إصدار صوت طويل — آه —';

  @override
  String get voiceTrainingInstruction =>
      'بناءً على مبادئ علاج LSVT LOUD، يرجى التحدث بصوت عالٍ. سيتغير حجم الدائرة في الوقت الفعلي بناءً على مستوى الصوت. عندما يصل إلى 75-85 ديسيبل، ستصبح الدائرة خضراء.';

  @override
  String get voiceTrainingReady => 'جاهز للبدء';

  @override
  String get voiceTrainingCalibrating => 'معايرة الضوضاء البيئية...';

  @override
  String get voiceTrainingTooQuiet => 'تحدث بصوت أعلى!';

  @override
  String get voiceTrainingKeepGoing => 'جيد، استمر!';

  @override
  String get voiceTrainingExcellent => 'رائع! استمر!';

  @override
  String voiceTrainingTarget(String target) {
    return 'الهدف: $target ديسيبل';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'الهدف: $range ديسيبل';
  }

  @override
  String get startListening => 'بدء التدريب';

  @override
  String get stopListening => 'إيقاف التدريب';

  @override
  String get microphonePermissionRequired => 'إذن الميكروفون مطلوب';

  @override
  String get microphonePermissionDenied => 'تم رفض إذن الميكروفون';

  @override
  String get microphonePermissionDeniedMessage =>
      'تم رفض إذن الميكروفون بشكل دائم. يرجى تمكين إذن الميكروفون في إعدادات النظام لاستخدام تدريب الصوت.';

  @override
  String get microphoneError => 'خطأ في الميكروفون';

  @override
  String get openSettings => 'فتح الإعدادات';

  @override
  String get continueAsGuest => 'المتابعة كضيف';

  @override
  String get movementTraining => 'تدريب الحركة';

  @override
  String get movementTrainingInstruction =>
      'يرجى رفع الذراعين والاحتفاظ بالوضعية الصحيحة';

  @override
  String get armsRaised => 'الذراعان مرفوعان';

  @override
  String get raiseArms => 'يرجى رفع الذراعين';

  @override
  String get lowerArms => 'ممتاز! يرجى خفض الذراعين';

  @override
  String get successCount => 'عدد النجاحات';

  @override
  String get cameraPermissionRequired => 'إذن الكاميرا مطلوب';

  @override
  String get cameraPermissionDeniedMessage =>
      'تم رفض إذن الكاميرا. يرجى تمكين إذن الكاميرا في إعدادات النظام لاستخدام تدريب الحركة.';

  @override
  String get setGoal => 'تعيين الهدف';

  @override
  String get reps => 'مرة';

  @override
  String get greatJob => 'عمل رائع!';

  @override
  String get goalCompleted => 'لقد أكملت هدفك!';

  @override
  String get playAgain => 'العب مرة أخرى';

  @override
  String get trainingHistory => 'تاريخ التدريب';

  @override
  String get noTrainingRecords => 'لا توجد سجلات تدريب';

  @override
  String get noTrainingRecordsHint =>
      'ستظهر سجلات التدريب الخاصة بك هنا بعد إكمال جلسة';

  @override
  String get trainingDetails => 'تفاصيل التدريب';

  @override
  String get goalStatus => 'حالة الهدف';

  @override
  String get goalReached => 'مكتمل';

  @override
  String get goalNotReached => 'غير مكتمل';

  @override
  String get minutes => 'دقيقة';

  @override
  String get selectTrainingType => 'اختر نوع التدريب';

  @override
  String get armsRaisedTraining => 'رفع الذراعين';

  @override
  String get legLiftTraining => 'رفع الساق';

  @override
  String get legLiftInstruction =>
      'يرجى رفع ساق واحدة، ثم خفضها لإكمال حركة واحدة';

  @override
  String get lowerLegs => 'يرجى خفض ساقيك';

  @override
  String get legsRaised => 'الساقان مرفوعتان';

  @override
  String get raiseLegs => 'يرجى رفع ساقيك';

  @override
  String get trainingType => 'نوع التدريب';
}
