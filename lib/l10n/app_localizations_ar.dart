// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Amplio Care';

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
  String get tremorSeverity => 'نطاق الحركة';

  @override
  String get tremorFrequency => 'التردد';

  @override
  String get avgAmplitude => 'متوسط السعة';

  @override
  String get maxAmp => 'السعة القصوى';

  @override
  String get variability => 'التباين';

  @override
  String get sampleRate => 'معدل أخذ العينات';

  @override
  String get dataPoints => 'نقاط البيانات';

  @override
  String get severityNormal => 'حركة أقل';

  @override
  String get severityMild => 'حركة خفيفة';

  @override
  String get severityModerate => 'حركة متوسطة';

  @override
  String get severityModerateSevere => 'حركة أكبر';

  @override
  String get severitySevere => 'أعلى نطاق';

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
  String get syncing => 'جارٍ المزامنة…';

  @override
  String get syncFailed => 'فشلت المزامنة. تحقق من الشبكة وحاول مرة أخرى.';

  @override
  String get syncFailedHint => 'فشلت المزامنة — اضغط لإعادة المحاولة';

  @override
  String get syncRetry => 'إعادة المحاولة';

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
      'تلتزم Amplio Care بحماية خصوصيتك وبياناتك الصحية. توضح هذه السياسة كيفية جمع واستخدام وتخزين وحماية معلوماتك.';

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
      'نحمي بياناتك باستخدام ضوابط الأمان المتاحة في بنيتنا التقنية الحالية:\n\n• TLS للطلبات السحابية\n• Firebase Authentication للحسابات المسجّل الدخول إليها\n• قواعد Firestore التي تقصر الوصول على بياناتك\n• تشفير AES على الجهاز للحقول الصحية المحلية الحساسة، مثل عينات مستشعر الرعاش والأسماء المستعارة للأدوية، مع تخزين المفتاح في سلسلة مفاتيح iOS\n• التصدير وحذف الحساب من داخل التطبيق\n\nتُكتب الملفات التي تصدّرها بتنسيق مقروء لاستخدامك الشخصي. ولا ندّعي تشفير ملف قاعدة البيانات المحلية بالكامل.';

  @override
  String get medicationPrivacy => 'قائمة اختيارية بالأسماء المستعارة للأدوية';

  @override
  String get medicationPrivacyText =>
      'إذا فعّلت القائمة الاختيارية للأسماء المستعارة للأدوية، فستُخزَّن الأسماء المستعارة وأوقات التذكير وعمليات التسجيل على هذا الجهاز. وعند تسجيل الدخول، يمكن مزامنتها أيضًا مع حساب Amplio Care السحابي لاستعادتها على جهاز iPhone آخر. لا تظهر الإشعارات المحلية الاختيارية على هذا الجهاز إلا إذا منحت إذن الإشعارات. ويمكنك حذف هذه البيانات من التطبيق، بما في ذلك عند حذف الحساب. هذه الميزة ليست نصيحة طبية، ولا تُدرج البيانات في التصدير إلا إذا وافقت على ذلك بشكل منفصل في كل مرة تصدّر فيها بياناتك.';

  @override
  String get contactUs => 'اتصل بنا';

  @override
  String get contactUsText =>
      'تُدار Amplio Care بواسطة مطوّر فردي مستقل (النطاق: ampliocare.com).\n\n• الخصوصية / طلبات البيانات: privacy@ampliocare.com\n• دعم المستخدم: support@ampliocare.com\n• الشراكات السريرية: clinical@ampliocare.com\n• الأعمال: hello@ampliocare.com';

  @override
  String get termsOfService => 'شروط الخدمة';

  @override
  String get termsIntro => 'مقدمة';

  @override
  String get termsIntroText =>
      'شروط الخدمة هذه («الشروط») مسودة اتفاق لاستخدام Amplio Care، مساعد تدريب تأهيلي على iPhone للأشخاص الذين يعيشون مع مرض باركنسون. تُدار Amplio Care بواسطة مطوّر فردي مستقل. هذه الشروط ليست بديلاً عن الاستشارة القانونية المهنية.';

  @override
  String get termsAcceptance => 'القبول';

  @override
  String get termsAcceptanceText =>
      'بتسجيل الدخول أو المتابعة كضيف أو استخدام Amplio Care بأي طريقة أخرى، فإنك توافق على هذه الشروط وسياسة الخصوصية. إذا لم توافق، يُرجى عدم استخدام التطبيق.';

  @override
  String get termsUseOfApp => 'استخدام Amplio Care';

  @override
  String get termsUseOfAppText =>
      'توفر Amplio Care أدوات تدريب اختيارية مثل قياس الرعاش وممارسة الصوت وممارسة الحركة وملخصات التقدم وقائمة اختيارية بالأسماء المستعارة للأدوية (على الجهاز للضيوف؛ وقد تُزامَن عند تسجيل الدخول).\n\nتوافق على استخدام التطبيق فقط لأغراض شخصية مشروعة وعدم إساءة استخدام المستشعرات أو الحسابات أو البيانات المصدّرة بطرق تضر بالآخرين أو تنتهك القانون المعمول به.';

  @override
  String get termsMedicalDisclaimer => 'ليست نصيحة طبية';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio Care أداة مساعدة للعافية والتدريب التأهيلي. وهي لا تشخّص مرض باركنسون أو أي حالة أخرى ولا تعالجها أو تشفيها أو تقي منها.\n\nالدرجات والاتجاهات والتقارير والتذكيرات للمرجع الشخصي فقط، ولا تحل محل نصيحة طبيب أو اختصاصي علاج طبيعي أو اختصاصي نطق أو أي مهني مؤهل آخر. اطلب رعاية متخصصة عند اتخاذ قرارات طبية. وأوقف أي تمرين يسبب ألمًا أو دوارًا أو يجعلك في وضع غير آمن.';

  @override
  String get termsAccounts => 'الحسابات والبيانات';

  @override
  String get termsAccountsText =>
      'يمكنك استخدام Amplio Care عبر Apple Sign-In أو Google Sign-In أو كضيف. أنت مسؤول عن النشاط تحت حسابك المسجّل الدخول.\n\nيمكنك تصدير أو حذف بيانات معينة في التطبيق. حذف حسابك يزيل بيانات السحابة المرتبطة التي نتحكم بها، ضمن الحدود التقنية والقانونية. قد تبقى بيانات الضيف والمحلية فقط على جهازك حتى تمسحها.';

  @override
  String get termsLimitation => 'تحديد المسؤولية';

  @override
  String get termsLimitationText =>
      'إلى أقصى حد يسمح به القانون، يقدّم المطوّر Amplio Care «كما هي» دون ضمانات لتشغيل متواصل أو خالٍ من الأخطاء.\n\nلا يتحمل المطوّر المسؤولية عن الإصابات أو الخسائر أو الأضرار الناشئة عن الاعتماد على درجات التدريب أو تفويت تذكيرات الأدوية أو محاولات التمرين أو عدم القدرة على الوصول إلى التطبيق، إلا حيث لا يمكن تحديد المسؤولية بموجب القانون.';

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
      'صدّر ملفك الشخصي وسجلات التدريب في ملف CSV. يمكنك حفظه أو مشاركته من خلال قائمة المشاركة في النظام. لا تُدرج الأسماء المستعارة للأدوية إلا إذا وافقت على ذلك لهذا التصدير.';

  @override
  String get export => 'تصدير';

  @override
  String get exporting => 'جارٍ التصدير...';

  @override
  String get exportSuccess => 'تم التصدير بنجاح';

  @override
  String get exportSuccessMessage =>
      'ملف CSV جاهز. استخدم قائمة المشاركة لحفظه في «الملفات» أو إرساله. تُلخَّص عينات المستشعر الخام بعددها فقط.';

  @override
  String get exportMedicationConsentTitle =>
      'هل تريد تضمين الأسماء المستعارة للأدوية؟';

  @override
  String get exportMedicationConsentBody =>
      'ستُصدَّر سجلات التدريب في ملف CSV.\n\nلن تُدرج الأسماء المستعارة للأدوية وأوقات التذكير وعمليات التسجيل إلا إذا اخترت «التضمين هذه المرة». هذا ليس وصفة طبية ولا سجلًا طبيًا.\n\nاختر «إلغاء» لإيقاف التصدير. ولا يزال بإمكانك التصدير دون بيانات الأدوية.';

  @override
  String get exportMedicationExclude => 'التصدير دون بيانات الأدوية';

  @override
  String get exportMedicationInclude => 'تضمين قائمة الأدوية';

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
      'تدرّب على التحدث بصوت واضح وقوي. يتغير حجم الدائرة بحسب مستوى صوتك، وتتحول إلى اللون الأخضر عند بلوغ النطاق المستهدف. للتدريب الشخصي فقط، وليس علاجًا طبيًا.';

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
  String get medicationList => 'قائمة الأدوية';

  @override
  String get medicationListEnable => 'إعداد قائمة الأدوية';

  @override
  String get medicationDisclaimer =>
      'تساعد قائمة أدوية Amplio Care فقط على تتبع الأوقات بنفسك. وهي ليست نصيحة طبية ولا تقدّم إرشادات للجرعات. في وضع الضيف تبقى البيانات على هذا الجهاز فقط. عند تسجيل الدخول يمكن مزامنة التذكيرات والتسجيلات مع حساب Amplio Care.';

  @override
  String get medicationDisclaimerAccept => 'أفهم وأفعّل';

  @override
  String get medicationLabel => 'الاسم';

  @override
  String get medicationLabelHint =>
      'مثل: بعد الإفطار (يمكن استخدام اسم مستعار)';

  @override
  String get medicationTime => 'الوقت';

  @override
  String get medicationTaken => 'تم التناول';

  @override
  String get medicationUndo => 'تراجع';

  @override
  String get medicationUndoConfirm => 'إزالة تسجيل اليوم لهذا العنصر؟';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'اليوم $done/$total';
  }

  @override
  String get medicationManage => 'إدارة';

  @override
  String get medicationAdd => 'إضافة تذكير';

  @override
  String get medicationEdit => 'تعديل التذكير';

  @override
  String get medicationClose => 'إيقاف قائمة الأدوية';

  @override
  String get medicationCloseConfirm =>
      'يمكنك إخفاء القائمة أو حذف جميع بيانات الأدوية على هذا الجهاز أيضًا.';

  @override
  String get medicationCloseHideOnly => 'إخفاء فقط';

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
  String get medicationCollapse => 'طي';

  @override
  String get medicationExpand => 'توسيع';

  @override
  String get medicationEmptyToday => 'لا تذكيرات لليوم. أضف واحدًا من الإدارة.';

  @override
  String medicationCompletedAt(String time) {
    return 'تم في $time';
  }

  @override
  String get medicationSave => 'حفظ';

  @override
  String get medicationDeleteReminder => 'حذف التذكير';

  @override
  String get medicationDeleteReminderConfirm => 'حذف هذا التذكير؟';

  @override
  String get medicationNoReminders => 'لا تذكيرات بعد';

  @override
  String get medicationDeleteSuccess => 'تم حذف بيانات قائمة الأدوية';

  @override
  String get rehabReport => 'تقرير التأهيل';

  @override
  String get rehabReportDisclaimer =>
      'للمرجع التأهيلي فقط. ليس تشخيصًا طبيًا ولا يحل محل نصيحة فريق الرعاية.';

  @override
  String get reportOverallScore => 'الدرجة الإجمالية';

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
  String get handTraining => 'اليد';

  @override
  String get voiceTrainingShort => 'الصوت';

  @override
  String get motionTrainingShort => 'الحركة';

  @override
  String get tabHome => 'الرئيسية';

  @override
  String get tabPlan => 'الخطة';

  @override
  String get tabData => 'البيانات';

  @override
  String get tabProfile => 'الملف الشخصي';

  @override
  String get comingSoon => 'قريبًا';

  @override
  String trainingStreak(int days) {
    return '$days يومًا';
  }

  @override
  String get trainingStreakLabel => 'سلسلة التدريب';

  @override
  String get voiceClarity => 'وضوح الصوت';

  @override
  String get handStability => 'ثبات اليد';

  @override
  String get movementAbility => 'القدرة الحركية';

  @override
  String get medicationReminder => 'الأدوية';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'آخر تدريب · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'آخر قياس · $timeAgo';
  }

  @override
  String get relativeToday => 'اليوم';

  @override
  String get relativeYesterday => 'أمس';

  @override
  String relativeDaysAgo(int days) {
    return 'منذ $days أيام';
  }

  @override
  String get noTrainingYet => 'لا يوجد تدريب بعد';

  @override
  String get noMeasurementYet => 'لا قياس بعد';

  @override
  String get tapToStart => 'اضغط للبدء';

  @override
  String durationSec(int count) {
    return '$count ث';
  }

  @override
  String durationMin(int count) {
    return '$count د';
  }

  @override
  String get voiceSessionCount => 'جلسة واحدة';

  @override
  String get handMeasurementCount => 'قياس واحد';

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
  String get medicationNextDoseLabel => 'الجرعة التالية';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'قادم';

  @override
  String get medicationStatusPending => 'معلّق';

  @override
  String medicationNotificationBody(String label) {
    return 'حان وقت: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'اختياري: اسمح بالإشعارات ليذكّرك Amplio Care في الأوقات التي تحددها. تبقى الإشعارات على هذا الجهاز.';

  @override
  String get recentActivity => 'النشاط الأخير';

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
  String get voiceLegendTarget => 'مستوى الصوت المستهدف';

  @override
  String get voiceLegendYours => 'مستوى صوتك';

  @override
  String get voiceShowDetail => 'إظهار الرقم';

  @override
  String get voiceHideDetail => 'إخفاء الرقم';

  @override
  String get voiceCompletedTitle => 'اكتمل التمرين';

  @override
  String get voiceCompletedDurationLabel => 'هذه الجلسة';

  @override
  String get voiceCompletedTargetLabel => 'الوقت عند مستوى الصوت المستهدف';

  @override
  String get voiceCompletedEncourageGood =>
      'أحسنت! واصل عادة التحدث بصوت عالٍ.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'محاولة جيدة. حاول التحدث بصوت أعلى قليلًا في المرة القادمة.';

  @override
  String get voiceRetryButton => 'التدرّب مجددًا';

  @override
  String get voiceFinishButton => 'تم';

  @override
  String get voicePracticeFooterHint =>
      'يشجّع هذا التمرين على التحدث بصوت عالٍ لتدريب الصوت. للمرجع فقط، وليس تشخيصًا طبيًا.';

  @override
  String get voiceSessionTooShort => 'كانت الجلسة قصيرة جدًا ولم تُحفظ';

  @override
  String get voiceProtocolPickerTitle => 'اختر أسلوب التدريب';

  @override
  String get voiceProtocolSteady => 'مستوى صوت ثابت';

  @override
  String get voiceProtocolSteadyDesc =>
      'استمر في نطق صوت «آه» طويل ضمن نطاق مستوى الصوت المستهدف.';

  @override
  String get voiceProtocolLadder => 'تدرّج مستوى الصوت';

  @override
  String get voiceProtocolLadderDesc =>
      'هادئ ← مستهدف ← أقوى قليلًا ← أخفض تدريجيًا.';

  @override
  String get voiceProtocolMultiSet => '3 مجموعات قصيرة';

  @override
  String get voiceProtocolMultiSetDesc =>
      'ثلاث جولات قصيرة تتخللها استراحة وجيزة.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'للتدريب التأهيلي الشخصي فقط. ليس تشخيصًا ولا علاجًا.';

  @override
  String get voiceLadderPhaseSoft => 'المرحلة 1: صوت أخفض';

  @override
  String get voiceLadderPhaseTarget => 'المرحلة 2: مستوى الصوت المستهدف';

  @override
  String get voiceLadderPhaseStrong => 'المرحلة 3: أقوى قليلًا';

  @override
  String get voiceLadderPhaseCoolDown => 'المرحلة 4: خفض الصوت تدريجيًا';

  @override
  String voiceLadderChip(int seconds) {
    return 'المتبقي من المرحلة: $seconds ث';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'المجموعة $current/$total · $seconds ث';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'استراحة $seconds ث';
  }

  @override
  String get voiceRestTitle => 'استراحة';

  @override
  String voiceRestBody(int next, int total) {
    return 'التالي: المجموعة $next من $total. أرخِ صوتك.';
  }

  @override
  String get tremorDurationPickerTitle => 'مدة الجلسة';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds ث';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'أمسك الهاتف بثبات لمدة $seconds ثانية، وحافظ على ثبات ذراعك.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'نطاقات الحركة للمرجع الشخصي فقط، وليست تقييمًا طبيًا.';

  @override
  String get planTodayTitle => 'تدريب اليوم';

  @override
  String get planTodaySubtitle => 'اقتراحات من وحدات التدريب لديك. اضغط للبدء.';

  @override
  String get planEmptyHint =>
      'لا توجد اقتراحات بعد. جرّب تدريبًا من الصفحة الرئيسية.';

  @override
  String get planDomainHand => 'اليد';

  @override
  String get planDomainVoice => 'الصوت';

  @override
  String get planDomainMotion => 'الحركة';

  @override
  String planGoalProgress(int done, int target) {
    return 'اليوم: $done/$target جلسات';
  }

  @override
  String get planGoalCompleted => 'اكتمل هدف اليوم. أحسنت.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'هذا الأسبوع: $done/$target جلسات';
  }

  @override
  String get planOpenTask => 'بدء';

  @override
  String get planMotionShelvedNote =>
      'قد يكون اكتشاف الحركة محدودًا على بعض الهواتف، لكن لا يزال بإمكانك فتح شاشة التدريب.';

  @override
  String get voiceProtocolClarity => 'عبارات واضحة';

  @override
  String get voiceProtocolClarityDesc =>
      'اقرأ عبارات قصيرة بصوت عالٍ. لا يجري تقييم النطق.';

  @override
  String get voiceClarityHint =>
      'اقرأ العبارة بوضوح. نتحقق فقط من أنك تحدثت، لا من أن النطق كان «صحيحًا».';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'العبارة $current من $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'تم اكتشاف الصوت — رائع';

  @override
  String get voiceClarityWaitingVoice => 'انطق العبارة بصوت عالٍ';

  @override
  String get voiceClarityNextPhrase => 'العبارة التالية';

  @override
  String get voiceClarityFinish => 'إنهاء';

  @override
  String get voiceClarityPhrase1 => 'صباح الخير';

  @override
  String get voiceClarityPhrase2 => 'كيف حالك اليوم؟';

  @override
  String get voiceClarityPhrase3 => 'يرجى تمرير الماء';

  @override
  String get voiceClarityPhrase4 => 'أنا بخير';

  @override
  String get voiceClarityPhrase5 => 'أراك غدًا';

  @override
  String get handModePickerTitle => 'أسلوب التدريب';

  @override
  String get handModeStillHold => 'الثبات';

  @override
  String get handModeStillHoldDesc =>
      'أمسك الهاتف بثبات بينما تقيس المستشعرات الحركة.';

  @override
  String get handModeObjectHold => 'إمساك غرض';

  @override
  String get handModeObjectHoldDesc =>
      'أمسك كوبًا أو كرة لينة بثبات. مؤقت إرشادي فقط، من دون اكتشاف الغرض.';

  @override
  String get handModeFineMotor => 'لمس الأصابع';

  @override
  String get handModeFineMotorDesc =>
      'المس بإبهامك كل إصبع بالتتابع، واحسب الدورات بنفسك.';

  @override
  String get handGuidedDisclaimer =>
      'تدريب موجّه لدعم التأهيل الشخصي فقط. ليس تقييمًا طبيًا.';

  @override
  String get handObjectHoldInstruction =>
      'اجلس براحة. أمسك كوبًا أو كرة لينة بيد واحدة وحافظ على ثباتها من دون الضغط عليها بقوة.';

  @override
  String get handObjectHoldStart => 'بدء الإمساك';

  @override
  String get handObjectHoldRunning => 'واصل الإمساك بثبات…';

  @override
  String get handObjectHoldDone => 'اكتمل الإمساك';

  @override
  String get handFineMotorInstruction =>
      'المس بإبهامك السبابة ثم الوسطى ثم البنصر ثم الخنصر. هذه دورة واحدة.';

  @override
  String get handFineMotorMarkCycle => 'أكملت دورة واحدة';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'الدورات: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'اكتمل التدريب';

  @override
  String get handGuidedCompleteBody =>
      'أحسنت. حُفظت هذه الجلسة كتدريب شخصي فقط.';

  @override
  String get dataTabTitle => 'بياناتك';

  @override
  String get dataTabSubtitle =>
      'درجات التدريب واتجاهاته الأسبوعية لمرجعك الشخصي.';

  @override
  String get dataTrendsTitle => 'هذا الأسبوع مقارنة بالأسبوع الماضي';

  @override
  String get dataOpenFullReport => 'فتح تقرير التأهيل الكامل';

  @override
  String get dataRecentSessions => 'الجلسات الأخيرة';

  @override
  String dataStreakDays(int days) {
    return 'سلسلة التدريب: $days يومًا';
  }

  @override
  String get reportShareButton => 'مشاركة التقرير';

  @override
  String get reportShareConsentTitle => 'هل تريد مشاركة ملخص التأهيل؟';

  @override
  String get reportShareConsentBody =>
      'يؤدي ذلك إلى إنشاء ملف نصي يتضمن درجات تدريبك واتجاهاته، ثم يفتح قائمة المشاركة في النظام، مثل الرسائل والبريد والملفات.\n\nللمرجع الشخصي فقط، وليس تشخيصًا طبيًا.\n\nبعد إرسال الملف، لا يمكن لـ Amplio Care استرجاعه من المستلم. يمكنك الإلغاء الآن أو عدم اختيار أي وجهة مشاركة في الشاشة التالية.';

  @override
  String get reportShareConsentConfirm => 'أفهم — متابعة';

  @override
  String get reportShareFileTitle => 'ملخص التأهيل من Amplio Care';

  @override
  String get reportShareSuccess => 'فُتحت قائمة المشاركة';

  @override
  String get reportShareFailed =>
      'تعذرت مشاركة التقرير. يرجى المحاولة مرة أخرى.';

  @override
  String get reportShareFooterNote =>
      'تتطلب كل مشاركة تأكيدك. لا يرسل Amplio Care التقارير إلى الأطباء تلقائيًا.';

  @override
  String get profileTabTitle => 'الملف الشخصي';

  @override
  String get profileGuestLabel => 'ضيف';

  @override
  String get profileGuestSubtitle =>
      'تم الدخول محليًا. تتوفر المزامنة السحابية بعد تسجيل الدخول.';

  @override
  String get profileSignedInLabel => 'تم تسجيل الدخول';

  @override
  String get profileSectionPreferences => 'التفضيلات';

  @override
  String get profileSectionAccount => 'الحساب والبيانات';

  @override
  String get profileSectionLegal => 'الخصوصية والشروط';

  @override
  String get accessibilitySettings => 'تسهيلات الاستخدام';

  @override
  String get exitGuestMode => 'الخروج من وضع الضيف';

  @override
  String get exitGuestModeConfirm =>
      'هل تريد مغادرة وضع الضيف؟ ستحتاج إلى تسجيل الدخول أو المتابعة كضيف مرة أخرى.';

  @override
  String get trainingReminderPageTitle => 'تذكيرات التدريب';

  @override
  String get trainingReminderTitle => 'Amplio Care';

  @override
  String get trainingReminderBody =>
      'تدريب قصير عندما يتاح لك الوقت. لا بأس إذا فاتك.';

  @override
  String get trainingReminderDisclaimer =>
      'تذكيرات محلية اختيارية وليست جدولًا علاجيًا. يمكنك إيقافها في أي وقت. لا يؤثر تفويت التذكير في درجاتك.';

  @override
  String get trainingReminderEnable => 'ذكّرني بالتدريب';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'الوقت $n';
  }

  @override
  String get trainingReminderAddTime => 'إضافة وقت ثانٍ';

  @override
  String get trainingReminderRemoveTime => 'إزالة هذا الوقت';

  @override
  String get trainingReminderQuietWeekends => 'تخطي عطلة نهاية الأسبوع';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'لا تذكيرات يومي السبت والأحد.';

  @override
  String get trainingReminderPermissionDenied =>
      'لم يُسمح بالإشعارات. يمكنك تمكينها لاحقًا من إعدادات iPhone.';

  @override
  String get planReminderOff => 'إعداد تذكير بالتدريب';

  @override
  String planReminderOn(String times) {
    return 'التذكيرات: $times';
  }
}
