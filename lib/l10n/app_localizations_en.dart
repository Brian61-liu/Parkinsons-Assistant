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
  String get clickToStartTraining => 'Click to start training';

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
  String get tremorTestCancelledNoSave => 'Test cancelled, record not saved';

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
  String get waveformAxisTime => 'Time';

  @override
  String get waveformAxisAmplitude => 'Amplitude';

  @override
  String get waveformHint => 'Higher wave = more noticeable hand tremor';

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
  String get signInWithApple => 'Sign in with Apple';

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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed => 'Sync failed. Check your network and try again.';

  @override
  String get syncFailedHint => 'Sync failed — tap to retry';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync => 'Please sign in to use cloud sync';

  @override
  String lastSyncedAt(String time) {
    return 'Last synced: $time';
  }

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicyIntro => 'Introduction';

  @override
  String get privacyPolicyIntroText =>
      'Amplio is committed to protecting your privacy and the security of your personal health data. This policy explains how we collect, use, store, and protect your information.';

  @override
  String get dataCollection => 'Data We Collect';

  @override
  String get dataCollectionText =>
      'We collect the following data:\n\n• Account info: Email, name (for authentication)\n• Sensor data: Movement data during tremor tests\n• Test results: Frequency, amplitude, severity\n\nWe follow data minimization principles.';

  @override
  String get dataUsage => 'How We Use Your Data';

  @override
  String get dataUsageText =>
      'Your data is used solely for:\n\n• Providing rehabilitation training features and progress tracking\n• Showing in-app summaries and reports for your personal reference\n• Improving the app only if we use anonymized data with your consent';

  @override
  String get dataStorage => 'Data Storage & Security';

  @override
  String get dataStorageText =>
      'When you sign in, account and synced training data may be stored with Google Firebase. Guest and local-only data stay on your device.\n\n• HTTPS/TLS for network traffic to our cloud services\n• Access limited by your account and Firestore security rules\n• You can export or delete data from the app';

  @override
  String get dataSharing => 'Data Sharing';

  @override
  String get dataSharingText =>
      'We do not sell your personal health data.\n\nData leaves the app only when:\n• You explicitly export or share files yourself\n• The law requires disclosure\n\nThe app does not currently send data directly to healthcare providers.';

  @override
  String get userRights => 'Your Data Rights';

  @override
  String get userRightsText =>
      'You have the right to:\n\n• Access: View all your data\n• Portability: Export your data\n• Erasure: Delete your data\n• Withdraw: Revoke consent anytime\n• Contact: For any privacy inquiries';

  @override
  String get dataSecurity => 'Security Measures';

  @override
  String get dataSecurityText =>
      'We protect your data with the security controls available in our current stack:\n\n• TLS for cloud requests\n• Firebase Authentication for signed-in accounts\n• Firestore rules that restrict access to your own data\n• On-device AES encryption for sensitive local health fields (such as tremor sensor samples and medication nicknames), with the key stored in the iOS Keychain\n• In-app export and account deletion\n\nFiles you export are written in a readable format for your own use. Full-file encryption of the entire local database is not claimed.';

  @override
  String get medicationPrivacy => 'Optional medication nickname list';

  @override
  String get medicationPrivacyText =>
      'If you enable the optional medication nickname list, nicknames, reminder times, and check-ins are stored only on this device. Optional local notifications may fire on this device only if you allow notification permission; they are not sent to our servers. You can delete this data in the app. This feature is not medical advice and is not included in data export by default.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactUsText =>
      'Amplio is operated by an independent individual developer (domain: ampliocare.com).\n\n• Privacy / data requests: privacy@ampliocare.com\n• User support: support@ampliocare.com\n• Clinical partnerships: clinical@ampliocare.com\n• Business: hello@ampliocare.com';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get termsIntro => 'Introduction';

  @override
  String get termsIntroText =>
      'These Terms of Service (\"Terms\") are a draft agreement for using Amplio, an iPhone rehabilitation training assistant for people living with Parkinson\'s disease. Amplio is operated by an independent individual developer. These Terms are not a substitute for professional legal advice.';

  @override
  String get termsAcceptance => 'Acceptance';

  @override
  String get termsAcceptanceText =>
      'By signing in, continuing as a guest, or otherwise using Amplio, you agree to these Terms and to the Privacy Policy. If you do not agree, please do not use the app.';

  @override
  String get termsUseOfApp => 'Using Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio provides optional training tools such as tremor measurement, voice practice, movement practice, progress summaries, and an optional on-device medication nickname list.\n\nYou agree to use the app only for lawful personal purposes and not to misuse sensors, accounts, or exported data in ways that harm others or violate applicable law.';

  @override
  String get termsMedicalDisclaimer => 'Not medical advice';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio is a wellness and rehabilitation training aid. It does not diagnose, treat, cure, or prevent Parkinson\'s disease or any other condition.\n\nScores, trends, reports, and reminders are for personal reference only and do not replace advice from a doctor, physical therapist, speech therapist, or other qualified professional. Seek professional care for medical decisions. Stop any exercise that causes pain, dizziness, or unsafe conditions.';

  @override
  String get termsAccounts => 'Accounts and data';

  @override
  String get termsAccountsText =>
      'You may use Amplio with Apple Sign-In, Google Sign-In, or as a guest. You are responsible for activity under your signed-in account.\n\nYou may export or delete certain data in the app. Deleting your account removes associated cloud data we control, subject to technical and legal limits. Guest and local-only data may remain only on your device until you clear them.';

  @override
  String get termsLimitation => 'Limitation of liability';

  @override
  String get termsLimitationText =>
      'To the fullest extent permitted by law, the developer provides Amplio \"as is\" without warranties of uninterrupted or error-free operation.\n\nThe developer is not liable for injuries, losses, or damages arising from reliance on training scores, missed medication reminders, exercise attempts, or inability to access the app, except where liability cannot be limited by law.';

  @override
  String get termsChanges => 'Changes';

  @override
  String get termsChangesText =>
      'We may update these Terms as the app evolves. The \"Last Updated\" date will change when we do. Continued use after an update means you accept the revised Terms. Material changes should be reviewed in the app when available.';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Data Management';

  @override
  String get gdprRights =>
      'You can access, export, and delete your personal health data at any time.';

  @override
  String get exportData => 'Export My Data';

  @override
  String get exportDataDescription =>
      'Export your profile and training records as a CSV file. You can save or share it from the system share sheet. Medication list is not included by default.';

  @override
  String get export => 'Export';

  @override
  String get exporting => 'Exporting...';

  @override
  String get exportSuccess => 'Export Successful';

  @override
  String get exportSuccessMessage =>
      'Your CSV file is ready. Use the share sheet to save it to Files or send it. Raw sensor samples are summarized by count only.';

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

  @override
  String get medicationList => 'Medication list';

  @override
  String get medicationListEnable => 'Set up medication list';

  @override
  String get medicationDisclaimer =>
      'Amplio\'s medication list only helps you track times on your own. It is not medical advice and does not provide dosing guidance. All data stays on this device only.';

  @override
  String get medicationDisclaimerAccept => 'I understand and enable';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint => 'e.g. After breakfast (nickname is fine)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm => 'Remove today\'s check-in for this item?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Today $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Turn off medication list';

  @override
  String get medicationCloseConfirm =>
      'You can hide the list or also delete all medication data on this device.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Hide and delete all data';

  @override
  String get medicationDeleteAllData => 'Delete medication list data';

  @override
  String get medicationDeleteAllDataDescription =>
      'Permanently delete all medication reminders and check-ins on this device.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Delete all medication list data on this device? This cannot be undone.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'No reminders for today. Add one in Manage.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'Delete this reminder?';

  @override
  String get medicationNoReminders => 'No reminders yet';

  @override
  String get medicationDeleteSuccess => 'Medication list data deleted';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'For rehabilitation reference only. Not a medical diagnosis and does not replace advice from your care team.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Today\'s goals: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'This week: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Streak: $days days';
  }

  @override
  String get reportNoData => 'Not enough training data yet';

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
  String get movementAbility => 'Movement Ability';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Last training · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Last measured · $timeAgo';
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
  String get noMeasurementYet => 'No measurement yet';

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
    return '$done/$total reps';
  }

  @override
  String get medicationSetupPrompt => 'Set up medication reminders';

  @override
  String get medicationSetupSubtitle => 'Saved on this device only';

  @override
  String get medicationNoUpcoming => 'No upcoming reminders today';

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
    return 'Time for: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Optional: allow notifications so Amplio can remind you at the times you set. Notifications stay on this device.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'For reference only';

  @override
  String get nonMedicalDisclaimerBody =>
      'Measurements shown are for rehabilitation training reference only. They are not a medical diagnosis and do not replace advice from your healthcare team.';

  @override
  String get voicePrepHint =>
      'Sit comfortably. Hold your phone about 30 cm from your mouth.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Practice for about $seconds seconds';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Practice in a quiet room for best results';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Please stay quiet · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Practiced ${seconds}s';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Goal: ${seconds}s';
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
  String get voiceCompletedTitle => 'Practice Complete';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Time at target volume';

  @override
  String get voiceCompletedEncourageGood =>
      'Great job! Keep up the habit of speaking loudly.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Good try. Aim to speak a bit louder next time.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'This exercise encourages speaking loudly for voice training. For reference only, not a medical diagnosis.';

  @override
  String get voiceSessionTooShort => 'Session was too short and was not saved';
}
