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
  /// **'Amplio'**
  String get appTitle;

  /// Instruction text on home page
  ///
  /// In en, this message translates to:
  /// **'Please select the training you want to perform'**
  String get selectTraining;

  /// Button description text for training options
  ///
  /// In en, this message translates to:
  /// **'Click to start test'**
  String get clickToStartTest;

  /// No description provided for @clickToStartTraining.
  ///
  /// In en, this message translates to:
  /// **'Click to start training'**
  String get clickToStartTraining;

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

  /// No description provided for @tremorTestCancelledNoSave.
  ///
  /// In en, this message translates to:
  /// **'Test cancelled, record not saved'**
  String get tremorTestCancelledNoSave;

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

  /// No description provided for @waveformAxisTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get waveformAxisTime;

  /// No description provided for @waveformAxisAmplitude.
  ///
  /// In en, this message translates to:
  /// **'Amplitude'**
  String get waveformAxisAmplitude;

  /// No description provided for @waveformHint.
  ///
  /// In en, this message translates to:
  /// **'Higher wave = more noticeable hand tremor'**
  String get waveformHint;

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

  /// Apple sign in button text
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get signInWithApple;

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
  /// **'Amplio is committed to protecting your privacy and the security of your personal health data. This policy explains how we collect, use, store, and protect your information.'**
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
  /// **'Your Data Rights'**
  String get userRights;

  /// No description provided for @userRightsText.
  ///
  /// In en, this message translates to:
  /// **'You have the right to:\n\n• Access: View all your data\n• Portability: Export your data\n• Erasure: Delete your data\n• Withdraw: Revoke consent anytime\n• Contact: For any privacy inquiries'**
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
  /// **'You can access, export, and delete your personal health data at any time.'**
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

  /// Change avatar dialog title
  ///
  /// In en, this message translates to:
  /// **'Change Avatar'**
  String get changeAvatar;

  /// Select from gallery option
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get selectFromGallery;

  /// Take photo option
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// Avatar update success message
  ///
  /// In en, this message translates to:
  /// **'Avatar updated successfully'**
  String get avatarUpdated;

  /// Avatar update failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to update avatar'**
  String get avatarUpdateFailed;

  /// Voice training page title
  ///
  /// In en, this message translates to:
  /// **'Voice Training'**
  String get voiceTraining;

  /// Main instruction headline for voice training
  ///
  /// In en, this message translates to:
  /// **'Please sustain a long sound — Ah —'**
  String get voiceTrainingMainInstruction;

  /// Voice training instruction text
  ///
  /// In en, this message translates to:
  /// **'Based on LSVT LOUD therapy principles, please speak loudly. The circle size will change in real-time based on your volume. When it reaches 75-85 dB, the circle will turn green.'**
  String get voiceTrainingInstruction;

  /// Ready state text for voice training
  ///
  /// In en, this message translates to:
  /// **'Ready to start'**
  String get voiceTrainingReady;

  /// No description provided for @voiceTrainingCalibrating.
  ///
  /// In en, this message translates to:
  /// **'Calibrating environmental noise...'**
  String get voiceTrainingCalibrating;

  /// Feedback when volume is too low (< 65 dB)
  ///
  /// In en, this message translates to:
  /// **'Speak louder!'**
  String get voiceTrainingTooQuiet;

  /// Encouragement text when at normal level (65-75 dB)
  ///
  /// In en, this message translates to:
  /// **'Good, keep pushing!'**
  String get voiceTrainingKeepGoing;

  /// Feedback when in target zone (75-85 dB)
  ///
  /// In en, this message translates to:
  /// **'Excellent! Keep it up!'**
  String get voiceTrainingExcellent;

  /// Target decibel display
  ///
  /// In en, this message translates to:
  /// **'Target: {target} dB'**
  String voiceTrainingTarget(String target);

  /// Target range display
  ///
  /// In en, this message translates to:
  /// **'Target: {range} dB'**
  String voiceTrainingTargetRange(String range);

  /// Start listening button text
  ///
  /// In en, this message translates to:
  /// **'Start Training'**
  String get startListening;

  /// Stop listening button text
  ///
  /// In en, this message translates to:
  /// **'Stop Training'**
  String get stopListening;

  /// Microphone permission dialog title
  ///
  /// In en, this message translates to:
  /// **'Microphone Permission Required'**
  String get microphonePermissionRequired;

  /// Microphone permission denied message
  ///
  /// In en, this message translates to:
  /// **'Microphone permission denied'**
  String get microphonePermissionDenied;

  /// Message when microphone permission is permanently denied
  ///
  /// In en, this message translates to:
  /// **'Microphone permission has been permanently denied. Please enable microphone permission in system settings to use voice training.'**
  String get microphonePermissionDeniedMessage;

  /// Microphone error message
  ///
  /// In en, this message translates to:
  /// **'Microphone error'**
  String get microphoneError;

  /// Open settings button text
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// Guest login button text
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueAsGuest;

  /// Movement training button title
  ///
  /// In en, this message translates to:
  /// **'Movement Training'**
  String get movementTraining;

  /// Instruction text for movement training
  ///
  /// In en, this message translates to:
  /// **'Please raise both arms and maintain proper posture'**
  String get movementTrainingInstruction;

  /// Status when arms are raised
  ///
  /// In en, this message translates to:
  /// **'Arms Raised'**
  String get armsRaised;

  /// Prompt to raise arms
  ///
  /// In en, this message translates to:
  /// **'Please Raise Arms'**
  String get raiseArms;

  /// Prompt to lower arms after raising
  ///
  /// In en, this message translates to:
  /// **'Great! Now Lower Your Arms'**
  String get lowerArms;

  /// Success count label
  ///
  /// In en, this message translates to:
  /// **'Success Count'**
  String get successCount;

  /// Camera permission required message
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Required'**
  String get cameraPermissionRequired;

  /// Camera permission denied message
  ///
  /// In en, this message translates to:
  /// **'Camera permission has been denied. Please enable camera permission in system settings to use movement training.'**
  String get cameraPermissionDeniedMessage;

  /// Set goal dialog title
  ///
  /// In en, this message translates to:
  /// **'Set Goal'**
  String get setGoal;

  /// Repetitions unit
  ///
  /// In en, this message translates to:
  /// **'reps'**
  String get reps;

  /// Success message
  ///
  /// In en, this message translates to:
  /// **'Great Job!'**
  String get greatJob;

  /// Goal completed message
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed your goal!'**
  String get goalCompleted;

  /// Play again button text
  ///
  /// In en, this message translates to:
  /// **'Play Again'**
  String get playAgain;

  /// Training history page title
  ///
  /// In en, this message translates to:
  /// **'Training History'**
  String get trainingHistory;

  /// No training records message
  ///
  /// In en, this message translates to:
  /// **'No Training Records'**
  String get noTrainingRecords;

  /// No training records hint
  ///
  /// In en, this message translates to:
  /// **'Your training records will appear here after completing a session'**
  String get noTrainingRecordsHint;

  /// Training details dialog title
  ///
  /// In en, this message translates to:
  /// **'Training Details'**
  String get trainingDetails;

  /// Goal status label
  ///
  /// In en, this message translates to:
  /// **'Goal Status'**
  String get goalStatus;

  /// Goal reached status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get goalReached;

  /// Goal not reached status
  ///
  /// In en, this message translates to:
  /// **'Not Completed'**
  String get goalNotReached;

  /// Minutes unit
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minutes;

  /// Select training type dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Training Type'**
  String get selectTrainingType;

  /// Arms raised training type
  ///
  /// In en, this message translates to:
  /// **'Arms Raised'**
  String get armsRaisedTraining;

  /// Leg lift training type
  ///
  /// In en, this message translates to:
  /// **'Leg Lift'**
  String get legLiftTraining;

  /// Leg lift instruction
  ///
  /// In en, this message translates to:
  /// **'Please lift one leg, then lower it to complete one action'**
  String get legLiftInstruction;

  /// Prompt to lower legs
  ///
  /// In en, this message translates to:
  /// **'Please lower your legs'**
  String get lowerLegs;

  /// Status when legs are raised
  ///
  /// In en, this message translates to:
  /// **'Legs Raised'**
  String get legsRaised;

  /// Prompt to raise legs
  ///
  /// In en, this message translates to:
  /// **'Please Raise Your Legs'**
  String get raiseLegs;

  /// Training type label
  ///
  /// In en, this message translates to:
  /// **'Training Type'**
  String get trainingType;

  /// No description provided for @medicationList.
  ///
  /// In en, this message translates to:
  /// **'Medication list'**
  String get medicationList;

  /// No description provided for @medicationListEnable.
  ///
  /// In en, this message translates to:
  /// **'Set up medication list'**
  String get medicationListEnable;

  /// No description provided for @medicationDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Amplio\'s medication list only helps you track times on your own. It is not medical advice and does not provide dosing guidance. All data stays on this device only.'**
  String get medicationDisclaimer;

  /// No description provided for @medicationDisclaimerAccept.
  ///
  /// In en, this message translates to:
  /// **'I understand and enable'**
  String get medicationDisclaimerAccept;

  /// No description provided for @medicationLabel.
  ///
  /// In en, this message translates to:
  /// **'Label'**
  String get medicationLabel;

  /// No description provided for @medicationLabelHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. After breakfast (nickname is fine)'**
  String get medicationLabelHint;

  /// No description provided for @medicationTime.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get medicationTime;

  /// No description provided for @medicationTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get medicationTaken;

  /// No description provided for @medicationUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get medicationUndo;

  /// No description provided for @medicationUndoConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove today\'s check-in for this item?'**
  String get medicationUndoConfirm;

  /// No description provided for @medicationTodayProgress.
  ///
  /// In en, this message translates to:
  /// **'Today {done}/{total}'**
  String medicationTodayProgress(int done, int total);

  /// No description provided for @medicationManage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get medicationManage;

  /// No description provided for @medicationAdd.
  ///
  /// In en, this message translates to:
  /// **'Add reminder'**
  String get medicationAdd;

  /// No description provided for @medicationEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit reminder'**
  String get medicationEdit;

  /// No description provided for @medicationClose.
  ///
  /// In en, this message translates to:
  /// **'Turn off medication list'**
  String get medicationClose;

  /// No description provided for @medicationCloseConfirm.
  ///
  /// In en, this message translates to:
  /// **'You can hide the list or also delete all medication data on this device.'**
  String get medicationCloseConfirm;

  /// No description provided for @medicationCloseHideOnly.
  ///
  /// In en, this message translates to:
  /// **'Hide only'**
  String get medicationCloseHideOnly;

  /// No description provided for @medicationCloseAndDelete.
  ///
  /// In en, this message translates to:
  /// **'Hide and delete all data'**
  String get medicationCloseAndDelete;

  /// No description provided for @medicationDeleteAllData.
  ///
  /// In en, this message translates to:
  /// **'Delete medication list data'**
  String get medicationDeleteAllData;

  /// No description provided for @medicationDeleteAllDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete all medication reminders and check-ins on this device.'**
  String get medicationDeleteAllDataDescription;

  /// No description provided for @medicationDeleteAllDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete all medication list data on this device? This cannot be undone.'**
  String get medicationDeleteAllDataConfirm;

  /// No description provided for @medicationCollapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get medicationCollapse;

  /// No description provided for @medicationExpand.
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get medicationExpand;

  /// No description provided for @medicationEmptyToday.
  ///
  /// In en, this message translates to:
  /// **'No reminders for today. Add one in Manage.'**
  String get medicationEmptyToday;

  /// No description provided for @medicationCompletedAt.
  ///
  /// In en, this message translates to:
  /// **'Done at {time}'**
  String medicationCompletedAt(String time);

  /// No description provided for @medicationSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get medicationSave;

  /// No description provided for @medicationDeleteReminder.
  ///
  /// In en, this message translates to:
  /// **'Delete reminder'**
  String get medicationDeleteReminder;

  /// No description provided for @medicationDeleteReminderConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this reminder?'**
  String get medicationDeleteReminderConfirm;

  /// No description provided for @medicationNoReminders.
  ///
  /// In en, this message translates to:
  /// **'No reminders yet'**
  String get medicationNoReminders;

  /// No description provided for @medicationDeleteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Medication list data deleted'**
  String get medicationDeleteSuccess;

  /// No description provided for @rehabReport.
  ///
  /// In en, this message translates to:
  /// **'Rehab report'**
  String get rehabReport;

  /// No description provided for @rehabReportDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'For rehabilitation reference only. Not a medical diagnosis and does not replace advice from your care team.'**
  String get rehabReportDisclaimer;

  /// No description provided for @reportOverallScore.
  ///
  /// In en, this message translates to:
  /// **'Overall score'**
  String get reportOverallScore;

  /// No description provided for @reportDailyProgress.
  ///
  /// In en, this message translates to:
  /// **'Today\'s goals: {percent}%'**
  String reportDailyProgress(int percent);

  /// No description provided for @reportWeeklyProgress.
  ///
  /// In en, this message translates to:
  /// **'This week: {percent}%'**
  String reportWeeklyProgress(int percent);

  /// No description provided for @reportStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak: {days} days'**
  String reportStreak(int days);

  /// No description provided for @reportNoData.
  ///
  /// In en, this message translates to:
  /// **'Not enough training data yet'**
  String get reportNoData;

  /// No description provided for @handTraining.
  ///
  /// In en, this message translates to:
  /// **'Hand'**
  String get handTraining;

  /// No description provided for @voiceTrainingShort.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get voiceTrainingShort;

  /// No description provided for @motionTrainingShort.
  ///
  /// In en, this message translates to:
  /// **'Movement'**
  String get motionTrainingShort;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabPlan.
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get tabPlan;

  /// No description provided for @tabData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get tabData;

  /// No description provided for @tabProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @trainingStreak.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String trainingStreak(int days);

  /// No description provided for @trainingStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Training Streak'**
  String get trainingStreakLabel;

  /// No description provided for @voiceClarity.
  ///
  /// In en, this message translates to:
  /// **'Voice Clarity'**
  String get voiceClarity;

  /// No description provided for @handStability.
  ///
  /// In en, this message translates to:
  /// **'Hand Stability'**
  String get handStability;

  /// No description provided for @movementAbility.
  ///
  /// In en, this message translates to:
  /// **'Movement Ability'**
  String get movementAbility;

  /// No description provided for @medicationReminder.
  ///
  /// In en, this message translates to:
  /// **'Medication'**
  String get medicationReminder;

  /// No description provided for @lastTrainingAgo.
  ///
  /// In en, this message translates to:
  /// **'Last training · {timeAgo}'**
  String lastTrainingAgo(String timeAgo);

  /// No description provided for @lastMeasurementAgo.
  ///
  /// In en, this message translates to:
  /// **'Last measured · {timeAgo}'**
  String lastMeasurementAgo(String timeAgo);

  /// No description provided for @relativeToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get relativeToday;

  /// No description provided for @relativeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get relativeYesterday;

  /// No description provided for @relativeDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'{days} days ago'**
  String relativeDaysAgo(int days);

  /// No description provided for @noTrainingYet.
  ///
  /// In en, this message translates to:
  /// **'No training yet'**
  String get noTrainingYet;

  /// No description provided for @noMeasurementYet.
  ///
  /// In en, this message translates to:
  /// **'No measurement yet'**
  String get noMeasurementYet;

  /// No description provided for @tapToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap to start'**
  String get tapToStart;

  /// No description provided for @durationSec.
  ///
  /// In en, this message translates to:
  /// **'{count}s'**
  String durationSec(int count);

  /// No description provided for @durationMin.
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String durationMin(int count);

  /// No description provided for @voiceSessionCount.
  ///
  /// In en, this message translates to:
  /// **'1 session'**
  String get voiceSessionCount;

  /// No description provided for @handMeasurementCount.
  ///
  /// In en, this message translates to:
  /// **'1 measurement'**
  String get handMeasurementCount;

  /// No description provided for @motionCompletionCount.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} reps'**
  String motionCompletionCount(int done, int total);

  /// No description provided for @medicationSetupPrompt.
  ///
  /// In en, this message translates to:
  /// **'Set up medication reminders'**
  String get medicationSetupPrompt;

  /// No description provided for @medicationSetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device only'**
  String get medicationSetupSubtitle;

  /// No description provided for @medicationNoUpcoming.
  ///
  /// In en, this message translates to:
  /// **'No upcoming reminders today'**
  String get medicationNoUpcoming;

  /// No description provided for @medicationNextDoseLabel.
  ///
  /// In en, this message translates to:
  /// **'Next dose'**
  String get medicationNextDoseLabel;

  /// No description provided for @medicationNextDoseTime.
  ///
  /// In en, this message translates to:
  /// **'{time}'**
  String medicationNextDoseTime(String time);

  /// No description provided for @medicationStatusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get medicationStatusUpcoming;

  /// No description provided for @medicationStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get medicationStatusPending;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivity;

  /// No description provided for @nonMedicalDisclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'For reference only'**
  String get nonMedicalDisclaimerTitle;

  /// No description provided for @nonMedicalDisclaimerBody.
  ///
  /// In en, this message translates to:
  /// **'Measurements shown are for rehabilitation training reference only. They are not a medical diagnosis and do not replace advice from your healthcare team.'**
  String get nonMedicalDisclaimerBody;

  /// No description provided for @voicePrepHint.
  ///
  /// In en, this message translates to:
  /// **'Sit comfortably. Hold your phone about 30 cm from your mouth.'**
  String get voicePrepHint;

  /// No description provided for @voicePrepDurationHint.
  ///
  /// In en, this message translates to:
  /// **'Practice for about {seconds} seconds'**
  String voicePrepDurationHint(int seconds);

  /// No description provided for @voicePrepEnvironmentHint.
  ///
  /// In en, this message translates to:
  /// **'Practice in a quiet room for best results'**
  String get voicePrepEnvironmentHint;

  /// No description provided for @voiceCalibratingCountdown.
  ///
  /// In en, this message translates to:
  /// **'Please stay quiet · {seconds}s'**
  String voiceCalibratingCountdown(int seconds);

  /// No description provided for @voiceElapsedLabel.
  ///
  /// In en, this message translates to:
  /// **'Practiced {seconds}s'**
  String voiceElapsedLabel(int seconds);

  /// No description provided for @voiceTargetDurationChip.
  ///
  /// In en, this message translates to:
  /// **'Goal: {seconds}s'**
  String voiceTargetDurationChip(int seconds);

  /// No description provided for @voiceLegendTarget.
  ///
  /// In en, this message translates to:
  /// **'Target volume'**
  String get voiceLegendTarget;

  /// No description provided for @voiceLegendYours.
  ///
  /// In en, this message translates to:
  /// **'Your volume'**
  String get voiceLegendYours;

  /// No description provided for @voiceShowDetail.
  ///
  /// In en, this message translates to:
  /// **'Show number'**
  String get voiceShowDetail;

  /// No description provided for @voiceHideDetail.
  ///
  /// In en, this message translates to:
  /// **'Hide number'**
  String get voiceHideDetail;

  /// No description provided for @voiceCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Practice Complete'**
  String get voiceCompletedTitle;

  /// No description provided for @voiceCompletedDurationLabel.
  ///
  /// In en, this message translates to:
  /// **'This session'**
  String get voiceCompletedDurationLabel;

  /// No description provided for @voiceCompletedTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Time at target volume'**
  String get voiceCompletedTargetLabel;

  /// No description provided for @voiceCompletedEncourageGood.
  ///
  /// In en, this message translates to:
  /// **'Great job! Keep up the habit of speaking loudly.'**
  String get voiceCompletedEncourageGood;

  /// No description provided for @voiceCompletedEncourageTryMore.
  ///
  /// In en, this message translates to:
  /// **'Good try. Aim to speak a bit louder next time.'**
  String get voiceCompletedEncourageTryMore;

  /// No description provided for @voiceRetryButton.
  ///
  /// In en, this message translates to:
  /// **'Practice Again'**
  String get voiceRetryButton;

  /// No description provided for @voiceFinishButton.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get voiceFinishButton;

  /// No description provided for @voicePracticeFooterHint.
  ///
  /// In en, this message translates to:
  /// **'This exercise encourages speaking loudly for voice training. For reference only, not a medical diagnosis.'**
  String get voicePracticeFooterHint;

  /// No description provided for @voiceSessionTooShort.
  ///
  /// In en, this message translates to:
  /// **'Session was too short and was not saved'**
  String get voiceSessionTooShort;
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
