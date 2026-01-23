// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Si prega di selezionare l\'allenamento che si desidera eseguire';

  @override
  String get tremorTest => 'Test del Tremore della Mano';

  @override
  String get tremorTestTitle => 'Test del Tremore della Mano';

  @override
  String get tremorTestInstruction =>
      'Si prega di tenere il telefono in mano e mantenere il braccio fermo per 30 secondi';

  @override
  String remainingTime(int time) {
    return '${time}s rimanente';
  }

  @override
  String get readyToTest => 'Pronto per iniziare il test';

  @override
  String get frequency => 'Frequenza';

  @override
  String get amplitude => 'Ampiezza';

  @override
  String get waitingForData => 'In attesa di dati...';

  @override
  String get startTest => 'Avvia Test';

  @override
  String get stopTest => 'Ferma Test';

  @override
  String get testCompleted => 'Test Completato';

  @override
  String averageFrequency(String frequency) {
    return 'Frequenza Media: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Ampiezza Media: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Ampiezza Massima: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Autorizzazione sensore richiesta per eseguire il test';

  @override
  String get language => 'Lingua';

  @override
  String get changeLanguage => 'Cambia Lingua';

  @override
  String get selectLanguage => 'Seleziona Lingua';

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
  String get realtimeWaveform => 'Forma d\'Onda';

  @override
  String get tremorSeverity => 'Gravità';

  @override
  String get tremorFrequency => 'Frequenza';

  @override
  String get avgAmplitude => 'Amp. Media';

  @override
  String get maxAmp => 'Amp. Max';

  @override
  String get variability => 'Variabilità';

  @override
  String get sampleRate => 'Campione';

  @override
  String get dataPoints => 'Punti';

  @override
  String get severityNormal => 'Normale';

  @override
  String get severityMild => 'Lieve';

  @override
  String get severityModerate => 'Moderato';

  @override
  String get severityModerateSevere => 'Mod-Grave';

  @override
  String get severitySevere => 'Grave';

  @override
  String get appSubtitle =>
      'Il tuo assistente personale per il Parkinson per il monitoraggio e l\'analisi dei movimenti';

  @override
  String get signInWithGoogle => 'Accedi con Google';

  @override
  String get privacyNotice =>
      'Accedendo, accetti i nostri Termini di servizio e l\'Informativa sulla privacy';

  @override
  String get loginError => 'Errore di Accesso';

  @override
  String get confirm => 'Conferma';

  @override
  String get cancel => 'Annulla';

  @override
  String get logout => 'Esci';

  @override
  String get logoutConfirm => 'Sei sicuro di voler uscire?';

  @override
  String welcome(String name) {
    return 'Benvenuto, $name';
  }

  @override
  String get syncToCloud => 'Sincronizza nel Cloud';

  @override
  String get dataSynced => 'Dati sincronizzati con successo';

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
