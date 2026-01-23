// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Пожалуйста, выберите упражнение, которое хотите выполнить';

  @override
  String get tremorTest => 'Тест на Тремор Рук';

  @override
  String get tremorTestTitle => 'Тест на Тремор Рук';

  @override
  String get tremorTestInstruction =>
      'Пожалуйста, держите телефон в руке и держите руку неподвижно в течение 30 секунд';

  @override
  String remainingTime(int time) {
    return 'Осталось $timeс';
  }

  @override
  String get readyToTest => 'Готов к началу теста';

  @override
  String get frequency => 'Частота';

  @override
  String get amplitude => 'Амплитуда';

  @override
  String get waitingForData => 'Ожидание данных...';

  @override
  String get startTest => 'Начать Тест';

  @override
  String get stopTest => 'Остановить Тест';

  @override
  String get testCompleted => 'Тест Завершен';

  @override
  String averageFrequency(String frequency) {
    return 'Средняя Частота: $frequency Гц';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Средняя Амплитуда: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Максимальная Амплитуда: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Для выполнения теста требуется разрешение датчика';

  @override
  String get language => 'Язык';

  @override
  String get changeLanguage => 'Изменить Язык';

  @override
  String get selectLanguage => 'Выбрать Язык';

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
  String get realtimeWaveform => 'Волна';

  @override
  String get tremorSeverity => 'Тяжесть';

  @override
  String get tremorFrequency => 'Частота';

  @override
  String get avgAmplitude => 'Ср. Ампл.';

  @override
  String get maxAmp => 'Макс Ампл.';

  @override
  String get variability => 'Изменчив.';

  @override
  String get sampleRate => 'Частота';

  @override
  String get dataPoints => 'Данные';

  @override
  String get severityNormal => 'Норма';

  @override
  String get severityMild => 'Легко';

  @override
  String get severityModerate => 'Умеренно';

  @override
  String get severityModerateSevere => 'Ум-Тяжело';

  @override
  String get severitySevere => 'Тяжело';

  @override
  String get appSubtitle =>
      'Ваш персональный помощник при болезни Паркинсона для отслеживания и анализа движений';

  @override
  String get signInWithGoogle => 'Войти через Google';

  @override
  String get privacyNotice =>
      'Входя, вы соглашаетесь с нашими Условиями обслуживания и Политикой конфиденциальности';

  @override
  String get loginError => 'Ошибка Входа';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get cancel => 'Отмена';

  @override
  String get logout => 'Выйти';

  @override
  String get logoutConfirm => 'Вы уверены, что хотите выйти?';

  @override
  String welcome(String name) {
    return 'Добро пожаловать, $name';
  }

  @override
  String get syncToCloud => 'Синхронизация с облаком';

  @override
  String get dataSynced => 'Данные успешно синхронизированы';

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
