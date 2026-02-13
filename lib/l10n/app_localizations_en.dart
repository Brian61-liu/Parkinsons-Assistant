// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => 'Please select the training you want to perform';

  @override
  String get clickToStartTest => 'Click to start test';

  @override
  String get tremorTest => 'Hand Tremor Test';

  @override
  String get tremorTestTitle => 'Hand Tremor Test';

  @override
  String get tremorTestInstruction =>
      'Please hold your phone in your hand and keep your arm still for 30 seconds';

  @override
  String remainingTime(int time) {
    return 'Remaining: ${time}s';
  }

  @override
  String get readyToTest => 'Ready to start test';

  @override
  String get frequency => 'Frequency';

  @override
  String get amplitude => 'Amplitude';

  @override
  String get waitingForData => 'Waiting for data...';

  @override
  String get startTest => 'Start Test';

  @override
  String get stopTest => 'Stop Test';

  @override
  String get testCompleted => 'Test Completed';

  @override
  String averageFrequency(String frequency) {
    return 'Average Frequency: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Average Amplitude: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Max Amplitude: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Sensor permission required to perform test';

  @override
  String get language => 'Language';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get selectLanguage => 'Language';

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
  String get realtimeWaveform => 'Real-time Waveform';

  @override
  String get tremorSeverity => 'Tremor Severity';

  @override
  String get tremorFrequency => 'Tremor Frequency';

  @override
  String get avgAmplitude => 'Avg Amplitude';

  @override
  String get maxAmp => 'Max Amplitude';

  @override
  String get variability => 'Variability';

  @override
  String get sampleRate => 'Sample Rate';

  @override
  String get dataPoints => 'Data Points';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Mild';

  @override
  String get severityModerate => 'Moderate';

  @override
  String get severityModerateSevere => 'Moderate-Severe';

  @override
  String get severitySevere => 'Severe';

  @override
  String get appSubtitle =>
      'Your personal Parkinson\'s assistant for movement tracking and analysis';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get signingIn => 'Signing in...';

  @override
  String get privacyNotice =>
      'By signing in, you agree to our Terms of Service and Privacy Policy';

  @override
  String get loginError => 'Login Error';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirm => 'Are you sure you want to logout?';

  @override
  String welcome(String name) {
    return 'Welcome, $name';
  }

  @override
  String get syncToCloud => 'Sync to Cloud';

  @override
  String get dataSynced => 'Data synced successfully';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyIntro => 'Introduction';

  @override
  String get privacyPolicyIntroText =>
      'Amplio is committed to protecting your privacy and the security of your personal health data. This policy explains how we collect, use, store, and protect your information in compliance with HIPAA and GDPR regulations.';

  @override
  String get dataCollection => 'Data We Collect';

  @override
  String get dataCollectionText =>
      'We collect the following data:\n\n• Account info: Email, name (for authentication)\n• Sensor data: Movement data during tremor tests\n• Test results: Frequency, amplitude, severity\n\nWe follow data minimization principles.';

  @override
  String get dataUsage => 'How We Use Your Data';

  @override
  String get dataUsageText =>
      'Your data is used solely for:\n\n• Providing tremor analysis and tracking\n• Generating health reports for you and providers\n• Improving algorithms (anonymized, with consent)';

  @override
  String get dataStorage => 'Data Storage & Security';

  @override
  String get dataStorageText =>
      'Your data is stored securely on Google Firebase.\n\n• End-to-end encryption\n• TLS 1.3 for all transmissions\n• Strict access controls\n• Regular security audits';

  @override
  String get dataSharing => 'Data Sharing';

  @override
  String get dataSharingText =>
      'We NEVER sell your personal health data.\n\nData is only shared:\n• With your explicit consent\n• With healthcare providers you designate\n• When required by law\n\nAnonymized data may be used for research.';

  @override
  String get userRights => 'Your Rights (GDPR)';

  @override
  String get userRightsText =>
      'Under GDPR, you have the right to:\n\n• Access: View all your data\n• Portability: Export your data\n• Erasure: Delete your data\n• Withdraw: Revoke consent anytime\n• Complain: Lodge complaints with authorities';

  @override
  String get dataSecurity => 'Security Measures';

  @override
  String get dataSecurityText =>
      'We implement multiple security layers:\n\n• AES-256 encryption at rest\n• TLS 1.3 for data in transit\n• Multi-factor authentication\n• Regular penetration testing\n• Comprehensive audit logging\n• Employee security training';

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

  @override
  String get testHistory => 'History';

  @override
  String get noTestRecords => 'No test records yet';

  @override
  String get noTestRecordsHint =>
      'Complete a tremor test to see your results here';

  @override
  String get testDate => 'Test Date';

  @override
  String get deleteRecord => 'Delete Record';

  @override
  String get deleteRecordConfirm =>
      'Are you sure you want to delete this test record?';

  @override
  String get recordDeleted => 'Record deleted';

  @override
  String get duration => 'Duration';

  @override
  String get seconds => 's';

  @override
  String get tapToCancel => 'Tap to cancel';

  @override
  String get changeAvatar => 'Change Avatar';

  @override
  String get selectFromGallery => 'Select from Gallery';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get avatarUpdated => 'Avatar updated successfully';

  @override
  String get avatarUpdateFailed => 'Failed to update avatar';

  @override
  String get voiceTraining => 'Voice Training';

  @override
  String get voiceTrainingMainInstruction =>
      'Please sustain a long sound — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Based on LSVT LOUD therapy principles, please speak loudly. The circle size will change in real-time based on your volume. When it reaches 75-85 dB, the circle will turn green.';

  @override
  String get voiceTrainingReady => 'Ready to start';

  @override
  String get voiceTrainingCalibrating => 'Calibrating environmental noise...';

  @override
  String get voiceTrainingTooQuiet => 'Speak louder!';

  @override
  String get voiceTrainingKeepGoing => 'Good, keep pushing!';

  @override
  String get voiceTrainingExcellent => 'Excellent! Keep it up!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Target: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Target: $range dB';
  }

  @override
  String get startListening => 'Start Training';

  @override
  String get stopListening => 'Stop Training';

  @override
  String get microphonePermissionRequired => 'Microphone Permission Required';

  @override
  String get microphonePermissionDenied => 'Microphone permission denied';

  @override
  String get microphonePermissionDeniedMessage =>
      'Microphone permission has been permanently denied. Please enable microphone permission in system settings to use voice training.';

  @override
  String get microphoneError => 'Microphone error';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get continueAsGuest => 'Continue as Guest';

  @override
  String get movementTraining => 'Movement Training';

  @override
  String get movementTrainingInstruction =>
      'Please raise both arms and maintain proper posture';

  @override
  String get armsRaised => 'Arms Raised';

  @override
  String get raiseArms => 'Please Raise Arms';

  @override
  String get lowerArms => 'Great! Now Lower Your Arms';

  @override
  String get successCount => 'Success Count';

  @override
  String get cameraPermissionRequired => 'Camera Permission Required';

  @override
  String get cameraPermissionDeniedMessage =>
      'Camera permission has been denied. Please enable camera permission in system settings to use movement training.';

  @override
  String get setGoal => 'Set Goal';

  @override
  String get reps => 'reps';

  @override
  String get greatJob => 'Great Job!';

  @override
  String get goalCompleted => 'You\'ve completed your goal!';

  @override
  String get playAgain => 'Play Again';

  @override
  String get trainingHistory => 'Training History';

  @override
  String get noTrainingRecords => 'No Training Records';

  @override
  String get noTrainingRecordsHint =>
      'Your training records will appear here after completing a session';

  @override
  String get trainingDetails => 'Training Details';

  @override
  String get goalStatus => 'Goal Status';

  @override
  String get goalReached => 'Completed';

  @override
  String get goalNotReached => 'Not Completed';

  @override
  String get minutes => 'min';

  @override
  String get selectTrainingType => 'Select Training Type';

  @override
  String get armsRaisedTraining => 'Arms Raised';

  @override
  String get legLiftTraining => 'Leg Lift';

  @override
  String get legLiftInstruction =>
      'Please lift one leg, then lower it to complete one action';

  @override
  String get lowerLegs => 'Please lower your legs';

  @override
  String get legsRaised => 'Legs Raised';

  @override
  String get raiseLegs => 'Please Raise Your Legs';

  @override
  String get trainingType => 'Training Type';
}
