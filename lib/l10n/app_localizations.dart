import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
    Locale('zh', 'TW'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Kineo'**
  String get appTitle;

  /// Instruction text on home page
  ///
  /// In en, this message translates to:
  /// **'Please select the training you want to perform'**
  String get selectTraining;

  /// Hand tremor test button title
  ///
  /// In en, this message translates to:
  /// **'Hand Tremor Test'**
  String get tremorTest;

  /// Hand tremor test page title
  ///
  /// In en, this message translates to:
  /// **'Hand Tremor Test'**
  String get tremorTestTitle;

  /// Instruction text for tremor test
  ///
  /// In en, this message translates to:
  /// **'Please hold your phone in your hand and keep your arm still for 30 seconds'**
  String get tremorTestInstruction;

  /// Remaining time display
  ///
  /// In en, this message translates to:
  /// **'Remaining: {time}s'**
  String remainingTime(int time);

  /// Ready state text
  ///
  /// In en, this message translates to:
  /// **'Ready to start test'**
  String get readyToTest;

  /// Frequency label
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get frequency;

  /// Amplitude label
  ///
  /// In en, this message translates to:
  /// **'Amplitude'**
  String get amplitude;

  /// Waiting for data message
  ///
  /// In en, this message translates to:
  /// **'Waiting for data...'**
  String get waitingForData;

  /// Start test button text
  ///
  /// In en, this message translates to:
  /// **'Start Test'**
  String get startTest;

  /// Stop test button text
  ///
  /// In en, this message translates to:
  /// **'Stop Test'**
  String get stopTest;

  /// Test completed dialog title
  ///
  /// In en, this message translates to:
  /// **'Test Completed'**
  String get testCompleted;

  /// Average frequency display
  ///
  /// In en, this message translates to:
  /// **'Average Frequency: {frequency} Hz'**
  String averageFrequency(String frequency);

  /// Average amplitude display
  ///
  /// In en, this message translates to:
  /// **'Average Amplitude: {amplitude}'**
  String averageAmplitude(String amplitude);

  /// Max amplitude display
  ///
  /// In en, this message translates to:
  /// **'Max Amplitude: {maxAmplitude}'**
  String maxAmplitude(String maxAmplitude);

  /// OK button text
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Sensor permission error message
  ///
  /// In en, this message translates to:
  /// **'Sensor permission required to perform test'**
  String get sensorPermissionRequired;

  /// Language label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Change language button text
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// Language selection dialog title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get selectLanguage;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Simplified Chinese language option
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get chinese;

  /// Traditional Chinese language option
  ///
  /// In en, this message translates to:
  /// **'繁體中文'**
  String get chineseTraditional;

  /// Spanish language option
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get spanish;

  /// French language option
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get french;

  /// German language option
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get german;

  /// Japanese language option
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get japanese;

  /// Korean language option
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get korean;

  /// Portuguese language option
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get portuguese;

  /// Italian language option
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get italian;

  /// Russian language option
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get russian;

  /// Arabic language option
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// Chart title
  ///
  /// In en, this message translates to:
  /// **'Real-time Waveform'**
  String get realtimeWaveform;

  /// Tremor severity label
  ///
  /// In en, this message translates to:
  /// **'Tremor Severity'**
  String get tremorSeverity;

  /// Tremor frequency label
  ///
  /// In en, this message translates to:
  /// **'Tremor Frequency'**
  String get tremorFrequency;

  /// Average amplitude label
  ///
  /// In en, this message translates to:
  /// **'Avg Amplitude'**
  String get avgAmplitude;

  /// Maximum amplitude label
  ///
  /// In en, this message translates to:
  /// **'Max Amplitude'**
  String get maxAmp;

  /// Variability label
  ///
  /// In en, this message translates to:
  /// **'Variability'**
  String get variability;

  /// Sample rate label
  ///
  /// In en, this message translates to:
  /// **'Sample Rate'**
  String get sampleRate;

  /// Data points label
  ///
  /// In en, this message translates to:
  /// **'Data Points'**
  String get dataPoints;

  /// Normal severity
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get severityNormal;

  /// Mild severity
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get severityMild;

  /// Moderate severity
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get severityModerate;

  /// Moderate to severe
  ///
  /// In en, this message translates to:
  /// **'Moderate-Severe'**
  String get severityModerateSevere;

  /// Severe severity
  ///
  /// In en, this message translates to:
  /// **'Severe'**
  String get severitySevere;

  /// App subtitle on login page
  ///
  /// In en, this message translates to:
  /// **'Your personal Parkinson\'s assistant for movement tracking and analysis'**
  String get appSubtitle;

  /// Google sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get signInWithGoogle;

  /// Google sign in button text
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signingIn;

  /// Privacy notice on login page
  ///
  /// In en, this message translates to:
  /// **'By signing in, you agree to our Terms of Service and Privacy Policy'**
  String get privacyNotice;

  /// Login error dialog title
  ///
  /// In en, this message translates to:
  /// **'Login Error'**
  String get loginError;

  /// Confirm button text
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Logout button text
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirm;

  /// Welcome message with user name
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcome(String name);

  /// Sync to cloud button text
  ///
  /// In en, this message translates to:
  /// **'Sync to Cloud'**
  String get syncToCloud;

  /// Data sync success message
  ///
  /// In en, this message translates to:
  /// **'Data synced successfully'**
  String get dataSynced;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyPolicyIntro.
  ///
  /// In en, this message translates to:
  /// **'Introduction'**
  String get privacyPolicyIntro;

  /// No description provided for @privacyPolicyIntroText.
  ///
  /// In en, this message translates to:
  /// **'Kineo is committed to protecting your privacy and the security of your personal health data. This policy explains how we collect, use, store, and protect your information in compliance with HIPAA and GDPR regulations.'**
  String get privacyPolicyIntroText;

  /// No description provided for @dataCollection.
  ///
  /// In en, this message translates to:
  /// **'Data We Collect'**
  String get dataCollection;

  /// No description provided for @dataCollectionText.
  ///
  /// In en, this message translates to:
  /// **'We collect the following data:\n\n• Account info: Email, name (for authentication)\n• Sensor data: Movement data during tremor tests\n• Test results: Frequency, amplitude, severity\n\nWe follow data minimization principles.'**
  String get dataCollectionText;

  /// No description provided for @dataUsage.
  ///
  /// In en, this message translates to:
  /// **'How We Use Your Data'**
  String get dataUsage;

  /// No description provided for @dataUsageText.
  ///
  /// In en, this message translates to:
  /// **'Your data is used solely for:\n\n• Providing tremor analysis and tracking\n• Generating health reports for you and providers\n• Improving algorithms (anonymized, with consent)'**
  String get dataUsageText;

  /// No description provided for @dataStorage.
  ///
  /// In en, this message translates to:
  /// **'Data Storage & Security'**
  String get dataStorage;

  /// No description provided for @dataStorageText.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored securely on Google Firebase.\n\n• End-to-end encryption\n• TLS 1.3 for all transmissions\n• Strict access controls\n• Regular security audits'**
  String get dataStorageText;

  /// No description provided for @dataSharing.
  ///
  /// In en, this message translates to:
  /// **'Data Sharing'**
  String get dataSharing;

  /// No description provided for @dataSharingText.
  ///
  /// In en, this message translates to:
  /// **'We NEVER sell your personal health data.\n\nData is only shared:\n• With your explicit consent\n• With healthcare providers you designate\n• When required by law\n\nAnonymized data may be used for research.'**
  String get dataSharingText;

  /// No description provided for @userRights.
  ///
  /// In en, this message translates to:
  /// **'Your Rights (GDPR)'**
  String get userRights;

  /// No description provided for @userRightsText.
  ///
  /// In en, this message translates to:
  /// **'Under GDPR, you have the right to:\n\n• Access: View all your data\n• Portability: Export your data\n• Erasure: Delete your data\n• Withdraw: Revoke consent anytime\n• Complain: Lodge complaints with authorities'**
  String get userRightsText;

  /// No description provided for @dataSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security Measures'**
  String get dataSecurity;

  /// No description provided for @dataSecurityText.
  ///
  /// In en, this message translates to:
  /// **'We implement multiple security layers:\n\n• AES-256 encryption at rest\n• TLS 1.3 for data in transit\n• Multi-factor authentication\n• Regular penetration testing\n• Comprehensive audit logging\n• Employee security training'**
  String get dataSecurityText;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactUsText.
  ///
  /// In en, this message translates to:
  /// **'For privacy inquiries or to exercise your data rights, contact our Data Protection Officer at: privacy@kineo-app.com'**
  String get contactUsText;

  /// No description provided for @lastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @gdprRights.
  ///
  /// In en, this message translates to:
  /// **'Under GDPR and HIPAA, you have the right to access, export, and delete your personal health data at any time.'**
  String get gdprRights;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export My Data'**
  String get exportData;

  /// No description provided for @exportDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Download a complete copy of all your data in JSON format. This includes your profile information and all tremor test records.'**
  String get exportDataDescription;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @exporting.
  ///
  /// In en, this message translates to:
  /// **'Exporting...'**
  String get exporting;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Export Successful'**
  String get exportSuccess;

  /// No description provided for @exportSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your data has been copied to the clipboard. You can paste it into a text file to save.'**
  String get exportSuccessMessage;

  /// No description provided for @deleteAllRecords.
  ///
  /// In en, this message translates to:
  /// **'Delete All Test Records'**
  String get deleteAllRecords;

  /// No description provided for @deleteAllRecordsDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete all your tremor test records. This action cannot be undone.'**
  String get deleteAllRecordsDescription;

  /// No description provided for @deleteAllData.
  ///
  /// In en, this message translates to:
  /// **'Delete All Data'**
  String get deleteAllData;

  /// No description provided for @deleteAllDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all your test records? This action is irreversible.'**
  String get deleteAllDataConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Deletion Successful'**
  String get deleteSuccess;

  /// No description provided for @deleteSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'All your test records have been permanently deleted.'**
  String get deleteSuccessMessage;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete your account and all associated data. This includes all test records and personal information.'**
  String get deleteAccountDescription;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete your account and ALL your data. This action CANNOT be undone.'**
  String get deleteAccountWarning;

  /// No description provided for @deleteAccountFinalWarning.
  ///
  /// In en, this message translates to:
  /// **'FINAL WARNING: Once deleted, your account and all data will be gone forever. Are you absolutely sure?'**
  String get deleteAccountFinalWarning;

  /// No description provided for @finalWarning.
  ///
  /// In en, this message translates to:
  /// **'Final Warning'**
  String get finalWarning;

  /// No description provided for @deleteForever.
  ///
  /// In en, this message translates to:
  /// **'Delete Forever'**
  String get deleteForever;

  /// No description provided for @continue_.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @testHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get testHistory;

  /// No description provided for @noTestRecords.
  ///
  /// In en, this message translates to:
  /// **'No test records yet'**
  String get noTestRecords;

  /// No description provided for @noTestRecordsHint.
  ///
  /// In en, this message translates to:
  /// **'Complete a tremor test to see your results here'**
  String get noTestRecordsHint;

  /// No description provided for @testDate.
  ///
  /// In en, this message translates to:
  /// **'Test Date'**
  String get testDate;

  /// No description provided for @deleteRecord.
  ///
  /// In en, this message translates to:
  /// **'Delete Record'**
  String get deleteRecord;

  /// No description provided for @deleteRecordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this test record?'**
  String get deleteRecordConfirm;

  /// No description provided for @recordDeleted.
  ///
  /// In en, this message translates to:
  /// **'Record deleted'**
  String get recordDeleted;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @seconds.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get seconds;

  /// No description provided for @tapToCancel.
  ///
  /// In en, this message translates to:
  /// **'Tap to cancel'**
  String get tapToCancel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
