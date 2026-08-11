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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed =>
      'Synchronisierung fehlgeschlagen. Prüfen Sie Ihre Netzwerkverbindung und versuchen Sie es erneut.';

  @override
  String get syncFailedHint =>
      'Synchronisierung fehlgeschlagen — tippen zum erneuten Versuch';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'Bitte melden Sie sich an, um die Cloud-Synchronisierung zu nutzen';

  @override
  String lastSyncedAt(String time) {
    return 'Zuletzt synchronisiert: $time';
  }

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
      'Ihre Daten werden ausschließlich verwendet für:\n\n• Bereitstellung von Rehabilitationsfunktionen und Fortschrittsverfolgung\n• Anzeige von Zusammenfassungen und Berichten in der App zur persönlichen Orientierung\n• Verbesserung der App nur bei anonymisierten Daten und Ihrer Einwilligung';

  @override
  String get dataStorage => 'Datenspeicherung und Sicherheit';

  @override
  String get dataStorageText =>
      'Wenn Sie sich anmelden, können Konto- und synchronisierte Trainingsdaten bei Google Firebase gespeichert werden. Gast- und nur lokale Daten bleiben auf Ihrem Gerät.\n\n• HTTPS/TLS für den Netzverkehr zu unseren Cloud-Diensten\n• Zugriff beschränkt durch Ihr Konto und Firestore-Sicherheitsregeln\n• Sie können Daten in der App exportieren oder löschen';

  @override
  String get dataSharing => 'Datenweitergabe';

  @override
  String get dataSharingText =>
      'Wir verkaufen Ihre persönlichen Gesundheitsdaten nicht.\n\nDaten verlassen die App nur, wenn:\n• Sie Dateien ausdrücklich selbst exportieren oder teilen\n• das Gesetz eine Offenlegung verlangt\n\nDie App sendet derzeit keine Daten direkt an Gesundheitsdienstleister.';

  @override
  String get userRights => 'Ihre Datenschutzrechte';

  @override
  String get userRightsText =>
      'Sie haben das Recht auf:\n\n• Auskunft: Alle Ihre Daten einsehen\n• Portabilität: Daten exportieren\n• Löschung: Daten löschen\n• Widerruf: Einwilligung jederzeit widerrufen\n• Kontakt: Bei Datenschutzfragen kontaktieren Sie uns';

  @override
  String get dataSecurity => 'Sicherheitsmaßnahmen';

  @override
  String get dataSecurityText =>
      'Wir schützen Ihre Daten mit den Sicherheitskontrollen unseres aktuellen Stacks:\n\n• TLS für Cloud-Anfragen\n• Firebase Authentication für angemeldete Konten\n• Firestore-Regeln, die den Zugriff auf Ihre eigenen Daten beschränken\n• Export und Kontolöschung in der App\n\nStärkere Schutzmaßnahmen wie die vollständige lokale Datenbankverschlüsselung werden noch verbessert und nicht als abgeschlossen dargestellt.';

  @override
  String get medicationPrivacy => 'Optionale Medikamenten-Spitznamenliste';

  @override
  String get medicationPrivacyText =>
      'Wenn Sie die optionale Medikamenten-Spitznamenliste aktivieren, werden Spitznamen, Erinnerungszeiten und Check-ins auf diesem Gerät gespeichert. Wenn Sie angemeldet sind, können sie auch mit Ihrem Amplio-Cloud-Konto synchronisiert werden, damit Sie sie auf einem anderen iPhone wiederherstellen können. Optionale lokale Benachrichtigungen erscheinen nur auf diesem Gerät bei erteilter Berechtigung. Sie können diese Daten in der App löschen (einschließlich Kontolöschung). Diese Funktion ist keine medizinische Beratung und ist standardmäßig nicht im Datenexport enthalten.';

  @override
  String get contactUs => 'Kontakt';

  @override
  String get contactUsText =>
      'Amplio wird von einem unabhängigen Einzelentwickler betrieben (Domain: ampliocare.com).\n\n• Datenschutz / Datenanfragen: privacy@ampliocare.com\n• Nutzersupport: support@ampliocare.com\n• Klinische Partnerschaften: clinical@ampliocare.com\n• Geschäftlich: hello@ampliocare.com';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsIntro => 'Einführung';

  @override
  String get termsIntroText =>
      'Diese Nutzungsbedingungen („Bedingungen“) sind ein Entwurfsvertrag für die Nutzung von Amplio, einem iPhone-Rehabilitationstrainer für Menschen mit Parkinson. Amplio wird von einem unabhängigen Einzelentwickler betrieben. Diese Bedingungen ersetzen keine professionelle Rechtsberatung.';

  @override
  String get termsAcceptance => 'Annahme';

  @override
  String get termsAcceptanceText =>
      'Durch Anmeldung, Fortsetzung als Gast oder anderweitige Nutzung von Amplio stimmen Sie diesen Bedingungen und der Datenschutzrichtlinie zu. Wenn Sie nicht einverstanden sind, nutzen Sie die App bitte nicht.';

  @override
  String get termsUseOfApp => 'Nutzung von Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio bietet optionale Trainingstools wie Tremormessung, Stimmübungen, Bewegungsübungen, Fortschrittsübersichten und eine optionale Medikamenten-Spitznamenliste (nur auf dem Gerät für Gäste; Sync möglich bei Anmeldung).\n\nSie stimmen zu, die App nur für rechtmäßige persönliche Zwecke zu nutzen und Sensoren, Konten oder exportierte Daten nicht so zu missbrauchen, dass andere geschädigt oder geltendes Recht verletzt wird.';

  @override
  String get termsMedicalDisclaimer => 'Keine medizinische Beratung';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio ist eine Wellness- und Rehabilitationshilfe. Es diagnostiziert, behandelt, heilt oder verhindert Parkinson oder andere Erkrankungen nicht.\n\nWerte, Trends, Berichte und Erinnerungen dienen nur der persönlichen Orientierung und ersetzen keinen Rat von Arzt, Physiotherapeut, Logopäden oder anderem qualifizierten Fachpersonal. Holen Sie bei medizinischen Entscheidungen professionellen Rat ein. Beenden Sie Übungen bei Schmerz, Schwindel oder unsicheren Zuständen.';

  @override
  String get termsAccounts => 'Konten und Daten';

  @override
  String get termsAccountsText =>
      'Sie können Amplio mit Apple Sign-In, Google Sign-In oder als Gast nutzen. Sie sind für Aktivitäten unter Ihrem angemeldeten Konto verantwortlich.\n\nSie können bestimmte Daten in der App exportieren oder löschen. Das Löschen Ihres Kontos entfernt zugehörige Cloud-Daten, die wir kontrollieren, vorbehaltlich technischer und rechtlicher Grenzen. Gast- und nur lokale Daten können bis zur Löschung nur auf Ihrem Gerät verbleiben.';

  @override
  String get termsLimitation => 'Haftungsbeschränkung';

  @override
  String get termsLimitationText =>
      'Soweit gesetzlich zulässig, stellt der Entwickler Amplio „wie besehen“ bereit, ohne Gewähr für unterbrechungsfreien oder fehlerfreien Betrieb.\n\nDer Entwickler haftet nicht für Verletzungen, Verluste oder Schäden aus dem Vertrauen auf Trainingswerte, verpasste Medikamentenerinnerungen, Übungsversuchen oder fehlendem App-Zugang, außer soweit die Haftung gesetzlich nicht beschränkt werden kann.';

  @override
  String get termsChanges => 'Änderungen';

  @override
  String get termsChangesText =>
      'Wir können diese Bedingungen mit der Weiterentwicklung der App aktualisieren. Das Datum „Zuletzt aktualisiert“ ändert sich dann. Die fortgesetzte Nutzung nach einer Aktualisierung bedeutet Annahme der geänderten Bedingungen. Wesentliche Änderungen sollten in der App geprüft werden, sobald verfügbar.';

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
  String get medicationListEnable => 'Medikamentenliste einrichten';

  @override
  String get medicationDisclaimer =>
      'Die Medikamentenliste von Amplio hilft Ihnen nur, Zeiten selbst zu erfassen. Sie ist keine medizinische Beratung und gibt keine Dosierungshinweise. Als Gast bleiben Daten nur auf diesem Gerät. Wenn Sie angemeldet sind, können Erinnerungen und Check-ins mit Ihrem Amplio-Konto synchronisiert werden.';

  @override
  String get medicationDisclaimerAccept => 'Ich verstehe und aktiviere';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint =>
      'z. B. Nach dem Frühstück (Spitzname ist in Ordnung)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm =>
      'Heutigen Check-in für diesen Eintrag entfernen?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Heute $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Medikamentenliste ausschalten';

  @override
  String get medicationCloseConfirm =>
      'Sie können die Liste ausblenden oder auch alle Medikamentendaten auf diesem Gerät löschen.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Ausblenden und alle Daten löschen';

  @override
  String get medicationDeleteAllData => 'Medikamentenlistendaten löschen';

  @override
  String get medicationDeleteAllDataDescription =>
      'Alle Medikamentenerinnerungen und Check-ins auf diesem Gerät dauerhaft löschen.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Alle Medikamentenlistendaten auf diesem Gerät löschen? Dies kann nicht rückgängig gemacht werden.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'Keine Erinnerungen für heute. Fügen Sie eine unter Verwalten hinzu.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'Diese Erinnerung löschen?';

  @override
  String get medicationNoReminders => 'Noch keine Erinnerungen';

  @override
  String get medicationDeleteSuccess => 'Medikamentenlistendaten gelöscht';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'Nur zur Rehabilitationsreferenz. Keine medizinische Diagnose und kein Ersatz für den Rat Ihres Behandlungsteams.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Heutige Ziele: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'Diese Woche: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Serie: $days Tage';
  }

  @override
  String get reportNoData => 'Noch nicht genug Trainingsdaten';

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
  String get movementAbility => 'Bewegungstraining';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Letztes Training · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Zuletzt gemessen · $timeAgo';
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
  String get noMeasurementYet => 'Noch keine Messung';

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
    return '$done/$total Wiederholungen';
  }

  @override
  String get medicationSetupPrompt => 'Medikamentenerinnerungen einrichten';

  @override
  String get medicationSetupSubtitle => 'Auf diesem Gerät; Sync bei Anmeldung';

  @override
  String get medicationNoUpcoming => 'Heute keine anstehenden Erinnerungen';

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
    return 'Zeit für: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Optional: Benachrichtigungen erlauben, damit Amplio Sie zu den von Ihnen festgelegten Zeiten erinnert. Benachrichtigungen bleiben auf diesem Gerät.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'Nur zur Referenz';

  @override
  String get nonMedicalDisclaimerBody =>
      'Angezeigte Messwerte dienen nur der Rehabilitationsreferenz. Sie sind keine medizinische Diagnose und ersetzen nicht den Rat Ihres Gesundheitsteams.';

  @override
  String get voicePrepHint =>
      'Sitzen Sie bequem. Halten Sie das Telefon etwa 30 cm vom Mund entfernt.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Üben Sie etwa $seconds Sekunden';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Üben Sie in einem ruhigen Raum für beste Ergebnisse';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Bitte ruhig bleiben · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Geübt ${seconds}s';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Ziel: ${seconds}s';
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
  String get voiceCompletedTitle => 'Übung abgeschlossen';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Zeit bei Ziellautstärke';

  @override
  String get voiceCompletedEncourageGood =>
      'Sehr gut! Behalten Sie die Gewohnheit, laut zu sprechen.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Guter Versuch. Versuchen Sie beim nächsten Mal etwas lauter zu sprechen.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'Diese Übung fördert lautes Sprechen für das Stimmtraining. Nur zur Referenz, keine medizinische Diagnose.';

  @override
  String get voiceSessionTooShort =>
      'Die Sitzung war zu kurz und wurde nicht gespeichert';

  @override
  String get voiceProtocolPickerTitle => 'Choose a practice style';

  @override
  String get voiceProtocolSteady => 'Steady volume';

  @override
  String get voiceProtocolSteadyDesc =>
      'Sustain a long “Ah” in the target volume zone.';

  @override
  String get voiceProtocolLadder => 'Volume ladder';

  @override
  String get voiceProtocolLadderDesc =>
      'Soft → target → a bit stronger → ease down.';

  @override
  String get voiceProtocolMultiSet => '3 short sets';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Three short rounds with a brief rest between.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'For personal rehabilitation practice only. Not a diagnosis or treatment.';

  @override
  String get voiceLadderPhaseSoft => 'Phase 1: softer voice';

  @override
  String get voiceLadderPhaseTarget => 'Phase 2: target volume';

  @override
  String get voiceLadderPhaseStrong => 'Phase 3: a bit stronger';

  @override
  String get voiceLadderPhaseCoolDown => 'Phase 4: ease down';

  @override
  String voiceLadderChip(int seconds) {
    return 'Phase left: ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Set $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Rest ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Rest';

  @override
  String voiceRestBody(int next, int total) {
    return 'Next: set $next of $total. Relax your voice.';
  }

  @override
  String get tremorDurationPickerTitle => 'Session length';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Hold your phone still for $seconds seconds. Keep your arm steady.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Motion bands are for personal reference only — not a medical assessment.';

  @override
  String get planTodayTitle => 'Today’s practice';

  @override
  String get planTodaySubtitle =>
      'Suggested from your training modules. Tap to start.';

  @override
  String get planEmptyHint => 'No suggestions yet. Try a training from Home.';

  @override
  String get planDomainHand => 'Hand';

  @override
  String get planDomainVoice => 'Voice';

  @override
  String get planDomainMotion => 'Movement';

  @override
  String planGoalProgress(int done, int target) {
    return 'Today: $done/$target sessions';
  }

  @override
  String get planOpenTask => 'Start';

  @override
  String get planMotionShelvedNote =>
      'Movement detection is limited on some phones; you can still open the practice screen.';

  @override
  String get voiceProtocolClarity => 'Clear phrases';

  @override
  String get voiceProtocolClarityDesc =>
      'Read short phrases aloud. No pronunciation scoring.';

  @override
  String get voiceClarityHint =>
      'Read the phrase clearly. We only check that you spoke — not whether it was “correct”.';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Phrase $current of $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Voice detected — nice';

  @override
  String get voiceClarityWaitingVoice => 'Speak the phrase aloud';

  @override
  String get voiceClarityNextPhrase => 'Next phrase';

  @override
  String get voiceClarityFinish => 'Finish';

  @override
  String get voiceClarityPhrase1 => 'Good morning';

  @override
  String get voiceClarityPhrase2 => 'How are you today?';

  @override
  String get voiceClarityPhrase3 => 'Please pass the water';

  @override
  String get voiceClarityPhrase4 => 'I am doing well';

  @override
  String get voiceClarityPhrase5 => 'See you tomorrow';

  @override
  String get handModePickerTitle => 'Practice style';

  @override
  String get handModeStillHold => 'Still hold';

  @override
  String get handModeStillHoldDesc =>
      'Hold the phone still while sensors measure motion.';

  @override
  String get handModeObjectHold => 'Object hold';

  @override
  String get handModeObjectHoldDesc =>
      'Hold a cup or soft ball steady. Guided timer — no object detection.';

  @override
  String get handModeFineMotor => 'Finger taps';

  @override
  String get handModeFineMotorDesc =>
      'Tap thumb to each finger. You count the cycles.';

  @override
  String get handGuidedDisclaimer =>
      'Guided practice for personal rehab support only. Not a medical assessment.';

  @override
  String get handObjectHoldInstruction =>
      'Sit comfortably. Hold a cup or soft ball in one hand. Keep it steady without squeezing hard.';

  @override
  String get handObjectHoldStart => 'Start hold';

  @override
  String get handObjectHoldRunning => 'Keep holding steadily…';

  @override
  String get handObjectHoldDone => 'Hold complete';

  @override
  String get handFineMotorInstruction =>
      'Touch your thumb to index, middle, ring, then pinky. That is one cycle.';

  @override
  String get handFineMotorMarkCycle => 'I finished one cycle';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Cycles: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Practice complete';

  @override
  String get handGuidedCompleteBody =>
      'Nice work. This session is saved as personal practice only.';

  @override
  String get dataTabTitle => 'Your data';

  @override
  String get dataTabSubtitle =>
      'Weekly practice scores and trends for personal reference.';

  @override
  String get dataTrendsTitle => 'This week vs last week';

  @override
  String get dataOpenFullReport => 'Open full rehab report';

  @override
  String get dataRecentSessions => 'Recent sessions';

  @override
  String dataStreakDays(int days) {
    return 'Training streak: $days days';
  }

  @override
  String get reportShareButton => 'Share report';

  @override
  String get reportShareConsentTitle => 'Share your rehab summary?';

  @override
  String get reportShareConsentBody =>
      'This creates a text file with your practice scores and trends, then opens the system share sheet (Messages, Mail, Files, etc.).\n\nFor personal reference only — not a medical diagnosis.\n\nOnce you send the file, Amplio cannot recall it from the recipient. You can cancel now, or decline any share target on the next screen.';

  @override
  String get reportShareConsentConfirm => 'I understand — continue';

  @override
  String get reportShareFileTitle => 'Amplio Care rehab summary';

  @override
  String get reportShareSuccess => 'Share sheet opened';

  @override
  String get reportShareFailed =>
      'Could not share the report. Please try again.';

  @override
  String get reportShareFooterNote =>
      'Sharing requires your confirmation each time. Amplio does not email doctors automatically.';
}
