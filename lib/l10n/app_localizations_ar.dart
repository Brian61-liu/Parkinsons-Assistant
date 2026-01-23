// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => 'يرجى اختيار التدريب الذي تريد القيام به';

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
  String get selectLanguage => 'اختر اللغة';

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
  String get signInWithGoogle => 'تسجيل الدخول باستخدام Google';

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
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyIntro => 'Introduction';

  @override
  String get privacyPolicyIntroText =>
      'Kineo is committed to protecting your privacy and the security of your personal health data. This policy explains how we collect, use, store, and protect your information in compliance with HIPAA and GDPR regulations.';

  @override
  String get dataCollection => 'Data We Collect';

  @override
  String get dataCollectionText =>
      'We collect: 1) Account information (email, name) for authentication; 2) Movement sensor data during tremor tests; 3) Test results including frequency, amplitude, and severity assessments. We follow the principle of data minimization and only collect what is necessary.';

  @override
  String get dataUsage => 'How We Use Your Data';

  @override
  String get dataUsageText =>
      'Your data is used solely to: 1) Provide tremor analysis and tracking; 2) Generate health reports for you and your healthcare providers; 3) Improve our algorithms (only with anonymized data and your consent).';

  @override
  String get dataStorage => 'Data Storage & Security';

  @override
  String get dataStorageText =>
      'Your data is stored securely on Google Firebase servers with end-to-end encryption. All data transmissions use TLS 1.3 encryption. We implement strict access controls and regular security audits.';

  @override
  String get dataSharing => 'Data Sharing';

  @override
  String get dataSharingText =>
      'We NEVER sell your personal health data. Data is only shared: 1) With your explicit consent; 2) With healthcare providers you designate; 3) When required by law. Aggregated, anonymized data may be used for research.';

  @override
  String get userRights => 'Your Rights (GDPR)';

  @override
  String get userRightsText =>
      'You have the right to: 1) Access your data; 2) Export your data (data portability); 3) Delete your data (right to be forgotten); 4) Withdraw consent at any time; 5) Lodge a complaint with a supervisory authority.';

  @override
  String get dataSecurity => 'Security Measures';

  @override
  String get dataSecurityText =>
      'We implement: 1) AES-256 encryption at rest; 2) TLS 1.3 for data in transit; 3) Multi-factor authentication; 4) Regular penetration testing; 5) Comprehensive audit logging; 6) Employee security training.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactUsText =>
      'For privacy inquiries or to exercise your data rights, contact our Data Protection Officer at: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Data Management';

  @override
  String get gdprRights =>
      'Under GDPR and HIPAA, you have the right to access, export, and delete your personal health data at any time.';

  @override
  String get exportData => 'Export My Data';

  @override
  String get exportDataDescription =>
      'Download a complete copy of all your data in JSON format. This includes your profile information and all tremor test records.';

  @override
  String get export => 'Export';

  @override
  String get exporting => 'Exporting...';

  @override
  String get exportSuccess => 'Export Successful';

  @override
  String get exportSuccessMessage =>
      'Your data has been copied to the clipboard. You can paste it into a text file to save.';

  @override
  String get deleteAllRecords => 'Delete All Test Records';

  @override
  String get deleteAllRecordsDescription =>
      'Permanently delete all your tremor test records. This action cannot be undone.';

  @override
  String get deleteAllData => 'Delete All Data';

  @override
  String get deleteAllDataConfirm =>
      'Are you sure you want to delete all your test records? This action is irreversible.';

  @override
  String get delete => 'Delete';

  @override
  String get deleteSuccess => 'Deletion Successful';

  @override
  String get deleteSuccessMessage =>
      'All your test records have been permanently deleted.';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountDescription =>
      'Permanently delete your account and all associated data. This includes all test records and personal information.';

  @override
  String get deleteAccountWarning =>
      'This will permanently delete your account and ALL your data. This action CANNOT be undone.';

  @override
  String get deleteAccountFinalWarning =>
      'FINAL WARNING: Once deleted, your account and all data will be gone forever. Are you absolutely sure?';

  @override
  String get finalWarning => 'Final Warning';

  @override
  String get deleteForever => 'Delete Forever';

  @override
  String get continue_ => 'Continue';

  @override
  String get error => 'Error';

  @override
  String get settings => 'Settings';
}
