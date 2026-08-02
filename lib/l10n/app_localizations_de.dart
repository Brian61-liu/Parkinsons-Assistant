// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Bitte wählen Sie das Training aus, das Sie durchführen möchten';

  @override
  String get clickToStartTest => 'Klicken Sie, um den Test zu starten';

  @override
  String get clickToStartTraining => 'Klicken Sie, um das Training zu starten';

  @override
  String get tremorTest => 'Handzitter-Test';

  @override
  String get tremorTestTitle => 'Handzitter-Test';

  @override
  String get tremorTestInstruction =>
      'Bitte halten Sie das Telefon in der Hand und halten Sie den Arm 30 Sekunden lang still';

  @override
  String remainingTime(int time) {
    return '${time}s verbleibend';
  }

  @override
  String get readyToTest => 'Bereit, den Test zu starten';

  @override
  String get frequency => 'Frequenz';

  @override
  String get amplitude => 'Amplitude';

  @override
  String get waitingForData => 'Warten auf Daten...';

  @override
  String get startTest => 'Test Starten';

  @override
  String get stopTest => 'Test Stoppen';

  @override
  String get tremorTestCancelledNoSave =>
      'Test abgebrochen, Aufzeichnung nicht gespeichert';

  @override
  String get testCompleted => 'Test Abgeschlossen';

  @override
  String averageFrequency(String frequency) {
    return 'Durchschnittliche Frequenz: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Durchschnittliche Amplitude: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Maximale Amplitude: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Sensorberechtigung erforderlich, um den Test durchzuführen';

  @override
  String get language => 'Sprache';

  @override
  String get changeLanguage => 'Sprache Ändern';

  @override
  String get selectLanguage => 'Sprache';

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
  String get realtimeWaveform => 'Echtzeit-Welle';

  @override
  String get waveformAxisTime => 'Zeit';

  @override
  String get waveformAxisAmplitude => 'Amplitude';

  @override
  String get waveformHint => 'Höhere Welle = stärkeres Händezittern';

  @override
  String get tremorSeverity => 'Schweregrad';

  @override
  String get tremorFrequency => 'Frequenz';

  @override
  String get avgAmplitude => 'Ø Amplitude';

  @override
  String get maxAmp => 'Max Amplitude';

  @override
  String get variability => 'Variabilität';

  @override
  String get sampleRate => 'Abtastrate';

  @override
  String get dataPoints => 'Punkte';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Leicht';

  @override
  String get severityModerate => 'Mäßig';

  @override
  String get severityModerateSevere => 'Mäßig-Schwer';

  @override
  String get severitySevere => 'Schwer';

  @override
  String get appSubtitle =>
      'Ihr persönlicher Parkinson-Assistent für Bewegungsverfolgung und -analyse';

  @override
  String get signInWithGoogle => 'Mit Google anmelden';

  @override
  String get signInWithApple => 'Mit Apple anmelden';

  @override
  String get signingIn => 'Anmeldung...';

  @override
  String get privacyNotice =>
      'Mit der Anmeldung stimmen Sie unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';

  @override
  String get loginError => 'Anmeldefehler';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get logout => 'Abmelden';

  @override
  String get logoutConfirm =>
      'Sind Sie sicher, dass Sie sich abmelden möchten?';

  @override
  String welcome(String name) {
    return 'Willkommen, $name';
  }

  @override
  String get syncToCloud => 'In Cloud synchronisieren';

  @override
  String get dataSynced => 'Daten erfolgreich synchronisiert';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicyIntro => 'Einführung';

  @override
  String get privacyPolicyIntroText =>
      'Amplio verpflichtet sich, Ihre Privatsphäre und Gesundheitsdaten zu schützen. Diese Richtlinie erklärt, wie wir Ihre Daten erfassen, verwenden, speichern und schützen.';

  @override
  String get dataCollection => 'Erfasste Daten';

  @override
  String get dataCollectionText =>
      'Wir erfassen folgende Daten:\n\n• Kontodaten: E-Mail, Name (Authentifizierung)\n• Sensordaten: Bewegungsdaten während Tests\n• Testergebnisse: Frequenz, Amplitude, Schweregrad\n\nWir folgen dem Prinzip der Datenminimierung.';

  @override
  String get dataUsage => 'Datenverwendung';

  @override
  String get dataUsageText =>
      'Your data is used solely for:\n\n• Providing rehabilitation training features and progress tracking\n• Showing in-app summaries and reports for your personal reference\n• Improving the app only if we use anonymized data with your consent';

  @override
  String get dataStorage => 'Datenspeicherung und Sicherheit';

  @override
  String get dataStorageText =>
      'When you sign in, account and synced training data may be stored with Google Firebase. Guest and local-only data stay on your device.\n\n• HTTPS/TLS for network traffic to our cloud services\n• Access limited by your account and Firestore security rules\n• You can export or delete data from the app';

  @override
  String get dataSharing => 'Datenweitergabe';

  @override
  String get dataSharingText =>
      'We do not sell your personal health data.\n\nData leaves the app only when:\n• You explicitly export or share files yourself\n• The law requires disclosure\n\nThe app does not currently send data directly to healthcare providers.';

  @override
  String get userRights => 'Ihre Datenschutzrechte';

  @override
  String get userRightsText =>
      'Sie haben das Recht auf:\n\n• Auskunft: Alle Ihre Daten einsehen\n• Portabilität: Daten exportieren\n• Löschung: Daten löschen\n• Widerruf: Einwilligung jederzeit widerrufen\n• Kontakt: Bei Datenschutzfragen kontaktieren Sie uns';

  @override
  String get dataSecurity => 'Sicherheitsmaßnahmen';

  @override
  String get dataSecurityText =>
      'We protect your data with the security controls available in our current stack:\n\n• TLS for cloud requests\n• Firebase Authentication for signed-in accounts\n• Firestore rules that restrict access to your own data\n• In-app export and account deletion\n\nStronger protections such as full local database encryption are still being improved and are not claimed as complete.';

  @override
  String get contactUs => 'Kontakt';

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
  String get lastUpdated => 'Zuletzt aktualisiert';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Datenverwaltung';

  @override
  String get gdprRights =>
      'Sie können jederzeit auf Ihre Gesundheitsdaten zugreifen, sie exportieren und löschen.';

  @override
  String get exportData => 'Meine Daten Exportieren';

  @override
  String get exportDataDescription =>
      'Laden Sie eine vollständige Kopie aller Daten herunter (JSON-Format).';

  @override
  String get export => 'Exportieren';

  @override
  String get exporting => 'Exportiere...';

  @override
  String get exportSuccess => 'Export Erfolgreich';

  @override
  String get exportSuccessMessage =>
      'Ihre Daten wurden in die Zwischenablage kopiert.';

  @override
  String get deleteAllRecords => 'Alle Aufzeichnungen Löschen';

  @override
  String get deleteAllRecordsDescription =>
      'Alle Zittertestaufzeichnungen dauerhaft löschen. Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get deleteAllData => 'Alle Daten Löschen';

  @override
  String get deleteAllDataConfirm =>
      'Möchten Sie wirklich alle Aufzeichnungen löschen? Diese Aktion ist unwiderruflich.';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteSuccess => 'Löschen Erfolgreich';

  @override
  String get deleteSuccessMessage =>
      'Alle Aufzeichnungen wurden dauerhaft gelöscht.';

  @override
  String get deleteAccount => 'Konto Löschen';

  @override
  String get deleteAccountDescription =>
      'Konto und alle zugehörigen Daten dauerhaft löschen.';

  @override
  String get deleteAccountWarning =>
      'Ihr Konto und alle Daten werden dauerhaft gelöscht. Diese Aktion ist unwiderruflich.';

  @override
  String get deleteAccountFinalWarning =>
      'Letzte Warnung: Nach dem Löschen sind Konto und Daten für immer verloren. Sind Sie sicher?';

  @override
  String get finalWarning => 'Letzte Warnung';

  @override
  String get deleteForever => 'Dauerhaft Löschen';

  @override
  String get continue_ => 'Fortfahren';

  @override
  String get error => 'Fehler';

  @override
  String get settings => 'Einstellungen';

  @override
  String get testHistory => 'Verlauf';

  @override
  String get noTestRecords => 'Keine Testaufzeichnungen';

  @override
  String get noTestRecordsHint =>
      'Führen Sie einen Zittertest durch, um Ihre Ergebnisse hier zu sehen';

  @override
  String get testDate => 'Testdatum';

  @override
  String get deleteRecord => 'Aufzeichnung Löschen';

  @override
  String get deleteRecordConfirm =>
      'Möchten Sie diese Testaufzeichnung wirklich löschen?';

  @override
  String get recordDeleted => 'Aufzeichnung gelöscht';

  @override
  String get duration => 'Dauer';

  @override
  String get seconds => 's';

  @override
  String get tapToCancel => 'Zum Abbrechen tippen';

  @override
  String get changeAvatar => 'Avatar Ändern';

  @override
  String get selectFromGallery => 'Aus Galerie Auswählen';

  @override
  String get takePhoto => 'Foto Aufnehmen';

  @override
  String get avatarUpdated => 'Avatar erfolgreich aktualisiert';

  @override
  String get avatarUpdateFailed => 'Avatar konnte nicht aktualisiert werden';

  @override
  String get voiceTraining => 'Stimmtraining';

  @override
  String get voiceTrainingMainInstruction =>
      'Bitte halten Sie einen langen Ton — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Basierend auf den Prinzipien der LSVT LOUD-Therapie, bitte laut sprechen. Die Größe des Kreises ändert sich in Echtzeit basierend auf Ihrer Lautstärke. Wenn er 75-85 dB erreicht, wird der Kreis grün.';

  @override
  String get voiceTrainingReady => 'Bereit zum Starten';

  @override
  String get voiceTrainingCalibrating =>
      'Umgebungsgeräusche werden kalibriert...';

  @override
  String get voiceTrainingTooQuiet => 'Lauter sprechen!';

  @override
  String get voiceTrainingKeepGoing => 'Gut, weiter so!';

  @override
  String get voiceTrainingExcellent => 'Ausgezeichnet! Weiter so!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Ziel: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Ziel: $range dB';
  }

  @override
  String get startListening => 'Training Starten';

  @override
  String get stopListening => 'Training Stoppen';

  @override
  String get microphonePermissionRequired =>
      'Mikrofonberechtigung Erforderlich';

  @override
  String get microphonePermissionDenied => 'Mikrofonberechtigung verweigert';

  @override
  String get microphonePermissionDeniedMessage =>
      'Die Mikrofonberechtigung wurde dauerhaft verweigert. Bitte aktivieren Sie die Mikrofonberechtigung in den Systemeinstellungen, um das Stimmtraining zu verwenden.';

  @override
  String get microphoneError => 'Mikrofonfehler';

  @override
  String get openSettings => 'Einstellungen Öffnen';

  @override
  String get continueAsGuest => 'Als Gast fortfahren';

  @override
  String get movementTraining => 'Bewegungstraining';

  @override
  String get movementTrainingInstruction =>
      'Bitte heben Sie beide Arme und halten Sie die richtige Haltung';

  @override
  String get armsRaised => 'Arme Gehoben';

  @override
  String get raiseArms => 'Bitte Arme Heben';

  @override
  String get lowerArms => 'Großartig! Bitte Arme Senken';

  @override
  String get successCount => 'Erfolgsanzahl';

  @override
  String get cameraPermissionRequired => 'Kamera-Berechtigung Erforderlich';

  @override
  String get cameraPermissionDeniedMessage =>
      'Kamera-Berechtigung wurde verweigert. Bitte aktivieren Sie die Kamera-Berechtigung in den Systemeinstellungen, um Bewegungstraining zu verwenden.';

  @override
  String get setGoal => 'Ziel Festlegen';

  @override
  String get reps => 'Wiederholungen';

  @override
  String get greatJob => 'Großartig!';

  @override
  String get goalCompleted => 'Sie haben Ihr Ziel erreicht!';

  @override
  String get playAgain => 'Nochmal Spielen';

  @override
  String get trainingHistory => 'Trainingsverlauf';

  @override
  String get noTrainingRecords => 'Keine Trainingsaufzeichnungen';

  @override
  String get noTrainingRecordsHint =>
      'Ihre Trainingsaufzeichnungen werden hier angezeigt, nachdem Sie eine Sitzung abgeschlossen haben';

  @override
  String get trainingDetails => 'Trainingsdetails';

  @override
  String get goalStatus => 'Zielstatus';

  @override
  String get goalReached => 'Abgeschlossen';

  @override
  String get goalNotReached => 'Nicht Abgeschlossen';

  @override
  String get minutes => 'Min';

  @override
  String get selectTrainingType => 'Trainingsart Auswählen';

  @override
  String get armsRaisedTraining => 'Arme Heben';

  @override
  String get legLiftTraining => 'Bein Heben';

  @override
  String get legLiftInstruction =>
      'Bitte heben Sie ein Bein, dann senken Sie es, um eine Bewegung abzuschließen';

  @override
  String get lowerLegs => 'Bitte senken Sie Ihre Beine';

  @override
  String get legsRaised => 'Beine Gehoben';

  @override
  String get raiseLegs => 'Bitte Heben Sie Ihre Beine';

  @override
  String get trainingType => 'Trainingsart';

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
