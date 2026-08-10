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
  String get signInWithApple => 'تسجيل الدخول بـ Apple';

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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed => 'فشلت المزامنة. تحقق من الشبكة وحاول مرة أخرى.';

  @override
  String get syncFailedHint => 'فشلت المزامنة — اضغط لإعادة المحاولة';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'يرجى تسجيل الدخول لاستخدام المزامنة السحابية';

  @override
  String lastSyncedAt(String time) {
    return 'آخر مزامنة: $time';
  }

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get privacyPolicyIntro => 'مقدمة';

  @override
  String get privacyPolicyIntroText =>
      'تلتزم Amplio بحماية خصوصيتك وبياناتك الصحية. توضح هذه السياسة كيفية جمع واستخدام وتخزين وحماية معلوماتك.';

  @override
  String get dataCollection => 'البيانات التي نجمعها';

  @override
  String get dataCollectionText =>
      'نجمع البيانات التالية:\n\n• الحساب: البريد الإلكتروني، الاسم (للمصادقة)\n• المستشعرات: بيانات الحركة أثناء الاختبارات\n• النتائج: التردد، السعة، الشدة\n\nنتبع مبدأ تقليل البيانات.';

  @override
  String get dataUsage => 'استخدام البيانات';

  @override
  String get dataUsageText =>
      'تُستخدم بياناتك فقط من أجل:\n\n• توفير ميزات التدريب التأهيلي وتتبع التقدم\n• عرض الملخصات والتقارير داخل التطبيق لمرجعك الشخصي\n• تحسين التطبيق فقط إذا استخدمنا بيانات مجهولة الهوية بموافقتك';

  @override
  String get dataStorage => 'التخزين والأمان';

  @override
  String get dataStorageText =>
      'عند تسجيل الدخول، قد تُخزَّن بيانات الحساب وبيانات التدريب المتزامنة لدى Google Firebase. تبقى بيانات الضيف والبيانات المحلية فقط على جهازك.\n\n• HTTPS/TLS لحركة الشبكة إلى خدماتنا السحابية\n• الوصول مقيّد بحسابك وقواعد أمان Firestore\n• يمكنك تصدير أو حذف البيانات من التطبيق';

  @override
  String get dataSharing => 'مشاركة البيانات';

  @override
  String get dataSharingText =>
      'لا نبيع بياناتك الصحية الشخصية.\n\nتغادر البيانات التطبيق فقط عندما:\n• تصدّر أو تشارك الملفات بنفسك صراحةً\n• يقتضي القانون الإفصاح\n\nلا يرسل التطبيق حاليًا بيانات مباشرة إلى مقدمي الرعاية الصحية.';

  @override
  String get userRights => 'حقوقك في البيانات';

  @override
  String get userRightsText =>
      'لديك الحق في:\n\n• الوصول: عرض جميع بياناتك\n• النقل: تصدير بياناتك\n• المحو: حذف بياناتك\n• السحب: سحب الموافقة\n• التواصل: لأي استفسارات تتعلق بالخصوصية';

  @override
  String get dataSecurity => 'إجراءات الأمان';

  @override
  String get dataSecurityText =>
      'نحمي بياناتك بضوابط الأمان المتاحة في مجموعتنا التقنية الحالية:\n\n• TLS لطلبات السحابة\n• Firebase Authentication للحسابات المسجّلة الدخول\n• قواعد Firestore التي تقيّد الوصول إلى بياناتك فقط\n• التصدير وحذف الحساب داخل التطبيق\n\nحماية أقوى مثل التشفير الكامل لقاعدة البيانات المحلية ما زالت قيد التحسين ولا تُعرَض على أنها مكتملة.';

  @override
  String get medicationPrivacy => 'قائمة اختيارية بألقاب الأدوية';

  @override
  String get medicationPrivacyText =>
      'إذا فعّلت قائمة ألقاب الأدوية الاختيارية، تُخزَّن الألقاب وأوقات التذكير وعمليات التسجيل على هذا الجهاز. عند تسجيل الدخول يمكن أيضاً مزامنتها مع حساب Amplio السحابي لاستعادتها على iPhone آخر. قد تظهر الإشعارات المحلية الاختيارية على هذا الجهاز فقط إذا سمحت بإذن الإشعارات. يمكنك حذف هذه البيانات من التطبيق (بما في ذلك حذف الحساب). هذه الميزة ليست نصيحة طبية ولا تُدرج افتراضيًا في تصدير البيانات.';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get contactUsText =>
      'تُدار Amplio بواسطة مطوّر فردي مستقل (النطاق: ampliocare.com).\n\n• الخصوصية / طلبات البيانات: privacy@ampliocare.com\n• دعم المستخدم: support@ampliocare.com\n• الشراكات السريرية: clinical@ampliocare.com\n• الأعمال: hello@ampliocare.com';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get termsIntro => 'مقدمة';

  @override
  String get termsIntroText =>
      'شروط الخدمة هذه («الشروط») مسودة اتفاق لاستخدام Amplio، مساعد تدريب تأهيلي على iPhone للأشخاص الذين يعيشون مع مرض باركنسون. تُدار Amplio بواسطة مطوّر فردي مستقل. هذه الشروط ليست بديلاً عن الاستشارة القانونية المهنية.';

  @override
  String get termsAcceptance => 'القبول';

  @override
  String get termsAcceptanceText =>
      'بتسجيل الدخول أو المتابعة كضيف أو استخدام Amplio بأي طريقة أخرى، فإنك توافق على هذه الشروط وسياسة الخصوصية. إذا لم توافق، يُرجى عدم استخدام التطبيق.';

  @override
  String get termsUseOfApp => 'استخدام Amplio';

  @override
  String get termsUseOfAppText =>
      'توفر Amplio أدوات تدريب اختيارية مثل قياس الرعاش وممارسة الصوت وممارسة الحركة وملخصات التقدم وقائمة اختيارية بألقاب الأدوية (على الجهاز للضيوف؛ وقد تُزامَن عند تسجيل الدخول).\n\nتوافق على استخدام التطبيق فقط لأغراض شخصية مشروعة وعدم إساءة استخدام المستشعرات أو الحسابات أو البيانات المصدّرة بطرق تضر بالآخرين أو تنتهك القانون المعمول به.';

  @override
  String get termsMedicalDisclaimer => 'ليست نصيحة طبية';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio مساعدة للعافية والتدريب التأهيلي. لا تشخّص ولا تعالج ولا تشفي ولا تمنع مرض باركنسون أو أي حالة أخرى.\n\nالدرجات والاتجاهات والتقارير والتذكيرات للمرجع الشخصي فقط ولا تحل محل نصيحة طبيب أو معالج طبيعي أو أخصائي نطق أو أي مهني مؤهل آخر. اطلب الرعاية المهنية للقرارات الطبية. أوقف أي تمرين يسبب ألمًا أو دوارًا أو ظروفًا غير آمنة.';

  @override
  String get termsAccounts => 'الحسابات والبيانات';

  @override
  String get termsAccountsText =>
      'يمكنك استخدام Amplio عبر Apple Sign-In أو Google Sign-In أو كضيف. أنت مسؤول عن النشاط تحت حسابك المسجّل الدخول.\n\nيمكنك تصدير أو حذف بيانات معينة في التطبيق. حذف حسابك يزيل بيانات السحابة المرتبطة التي نتحكم بها، ضمن الحدود التقنية والقانونية. قد تبقى بيانات الضيف والمحلية فقط على جهازك حتى تمسحها.';

  @override
  String get termsLimitation => 'تحديد المسؤولية';

  @override
  String get termsLimitationText =>
      'إلى أقصى حد يسمح به القانون، يقدّم المطوّر Amplio «كما هي» دون ضمانات لتشغيل متواصل أو خالٍ من الأخطاء.\n\nلا يتحمل المطوّر المسؤولية عن الإصابات أو الخسائر أو الأضرار الناشئة عن الاعتماد على درجات التدريب أو تفويت تذكيرات الأدوية أو محاولات التمرين أو عدم القدرة على الوصول إلى التطبيق، إلا حيث لا يمكن تحديد المسؤولية بموجب القانون.';

  @override
  String get termsChanges => 'التغييرات';

  @override
  String get termsChangesText =>
      'قد نحدّث هذه الشروط مع تطور التطبيق. سيتغيّر تاريخ «آخر تحديث» عندئذٍ. الاستمرار في الاستخدام بعد التحديث يعني قبولك للشروط المعدّلة. ينبغي مراجعة التغييرات الجوهرية في التطبيق عند توفرها.';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get version => 'الإصدار';

  @override
  String get dataManagement => 'إدارة البيانات';

  @override
  String get gdprRights =>
      'يمكنك الوصول إلى بياناتك الصحية وتصديرها وحذفها في أي وقت.';

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

  @override
  String get medicationList => 'Medication list';

  @override
  String get medicationListEnable => 'إعداد قائمة الأدوية';

  @override
  String get medicationDisclaimer =>
      'تساعد قائمة أدوية Amplio فقط على تتبع الأوقات بنفسك. وهي ليست نصيحة طبية ولا تقدّم إرشادات للجرعات. في وضع الضيف تبقى البيانات على هذا الجهاز فقط. عند تسجيل الدخول يمكن مزامنة التذكيرات والتسجيلات مع حساب Amplio.';

  @override
  String get medicationDisclaimerAccept => 'أفهم وأفعّل';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint => 'مثل: بعد الإفطار (يمكن استخدام لقب)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm => 'إزالة تسجيل اليوم لهذا العنصر؟';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'اليوم $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'إيقاف قائمة الأدوية';

  @override
  String get medicationCloseConfirm =>
      'يمكنك إخفاء القائمة أو حذف جميع بيانات الأدوية على هذا الجهاز أيضًا.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'إخفاء وحذف جميع البيانات';

  @override
  String get medicationDeleteAllData => 'حذف بيانات قائمة الأدوية';

  @override
  String get medicationDeleteAllDataDescription =>
      'حذف جميع تذكيرات الأدوية وتسجيلات التحقق على هذا الجهاز نهائيًا.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'حذف جميع بيانات قائمة الأدوية على هذا الجهاز؟ لا يمكن التراجع عن ذلك.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday => 'لا تذكيرات لليوم. أضف واحدًا من الإدارة.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'حذف هذا التذكير؟';

  @override
  String get medicationNoReminders => 'لا تذكيرات بعد';

  @override
  String get medicationDeleteSuccess => 'تم حذف بيانات قائمة الأدوية';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'للمرجع التأهيلي فقط. ليس تشخيصًا طبيًا ولا يحل محل نصيحة فريق الرعاية.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'أهداف اليوم: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'هذا الأسبوع: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'سلسلة: $days أيام';
  }

  @override
  String get reportNoData => 'لا توجد بيانات تدريب كافية بعد';

  @override
  String get handTraining => 'Hand';

  @override
  String get voiceTrainingShort => 'Voice';

  @override
  String get motionTrainingShort => 'Movement';

  @override
  String get tabHome => 'Home';

  @override
  String get tabPlan => 'Plan';

  @override
  String get tabData => 'Data';

  @override
  String get tabProfile => 'Profile';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String trainingStreak(int days) {
    return '$days days';
  }

  @override
  String get trainingStreakLabel => 'Training Streak';

  @override
  String get voiceClarity => 'Voice Clarity';

  @override
  String get handStability => 'Hand Stability';

  @override
  String get movementAbility => 'تدريب الحركة';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'آخر تدريب · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'آخر قياس · $timeAgo';
  }

  @override
  String get relativeToday => 'Today';

  @override
  String get relativeYesterday => 'Yesterday';

  @override
  String relativeDaysAgo(int days) {
    return '$days days ago';
  }

  @override
  String get noTrainingYet => 'No training yet';

  @override
  String get noMeasurementYet => 'لا قياس بعد';

  @override
  String get tapToStart => 'Tap to start';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 session';

  @override
  String get handMeasurementCount => '1 measurement';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total تكرار';
  }

  @override
  String get medicationSetupPrompt => 'إعداد تذكيرات الأدوية';

  @override
  String get medicationSetupSubtitle =>
      'على هذا الجهاز؛ تُزامَن عند تسجيل الدخول';

  @override
  String get medicationNoUpcoming => 'لا تذكيرات قادمة اليوم';

  @override
  String get medicationNextDoseLabel => 'Next dose';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'Upcoming';

  @override
  String get medicationStatusPending => 'Pending';

  @override
  String medicationNotificationBody(String label) {
    return 'حان وقت: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'اختياري: اسمح بالإشعارات ليذكّرك Amplio في الأوقات التي تحددها. تبقى الإشعارات على هذا الجهاز.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'للمرجع فقط';

  @override
  String get nonMedicalDisclaimerBody =>
      'القياسات المعروضة هي مرجع لتدريب التأهيل فقط. وهي ليست تشخيصًا طبيًا ولا تحل محل نصيحة فريقك الصحي.';

  @override
  String get voicePrepHint =>
      'اجلس براحة. أمسك الهاتف على بعد حوالي 30 سم من فمك.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'تمرّن لمدة حوالي $seconds ثانية';
  }

  @override
  String get voicePrepEnvironmentHint => 'تمرّن في غرفة هادئة لأفضل نتيجة';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'يرجى البقاء هادئًا · $secondsث';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'تم التمرين $secondsث';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'الهدف: $secondsث';
  }

  @override
  String get voiceLegendTarget => 'Target volume';

  @override
  String get voiceLegendYours => 'Your volume';

  @override
  String get voiceShowDetail => 'Show number';

  @override
  String get voiceHideDetail => 'Hide number';

  @override
  String get voiceCompletedTitle => 'اكتمل التمرين';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'الوقت عند مستوى الصوت المستهدف';

  @override
  String get voiceCompletedEncourageGood =>
      'أحسنت! واصل عادة التحدث بصوت عالٍ.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'محاولة جيدة. حاول التحدث بصوت أعلى قليلًا في المرة القادمة.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'يشجّع هذا التمرين على التحدث بصوت عالٍ لتدريب الصوت. للمرجع فقط، وليس تشخيصًا طبيًا.';

  @override
  String get voiceSessionTooShort => 'كانت الجلسة قصيرة جدًا ولم تُحفظ';
}
