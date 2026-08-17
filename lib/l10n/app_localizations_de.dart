// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Amplio Care';

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
  String get severityNormal => 'Geringere Bewegung';

  @override
  String get severityMild => 'Leichte Bewegung';

  @override
  String get severityModerate => 'Mäßige Bewegung';

  @override
  String get severityModerateSevere => 'Stärkere Bewegung';

  @override
  String get severitySevere => 'Höchster Bereich';

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
  String get syncing => 'Synchronisierung…';

  @override
  String get syncFailed =>
      'Synchronisierung fehlgeschlagen. Prüfen Sie Ihre Netzwerkverbindung und versuchen Sie es erneut.';

  @override
  String get syncFailedHint =>
      'Synchronisierung fehlgeschlagen — tippen zum erneuten Versuch';

  @override
  String get syncRetry => 'Erneut versuchen';

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
      'Amplio Care verpflichtet sich, Ihre Privatsphäre und Gesundheitsdaten zu schützen. Diese Richtlinie erklärt, wie wir Ihre Daten erfassen, verwenden, speichern und schützen.';

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
      'Wir schützen Ihre Daten mit den Sicherheitskontrollen unseres aktuellen Stacks:\n\n• TLS für Cloud-Anfragen\n• Firebase Authentication für angemeldete Konten\n• Firestore-Regeln, die den Zugriff auf Ihre eigenen Daten beschränken\n• AES-Verschlüsselung auf dem Gerät für sensible lokale Gesundheitsdaten (z. B. Tremor-Sensordaten und Medikamenten-Spitznamen), wobei der Schlüssel im iOS-Schlüsselbund gespeichert wird\n• Export und Kontolöschung in der App\n\nExportierte Dateien werden für Ihre eigene Verwendung in einem lesbaren Format erstellt. Eine vollständige Verschlüsselung der gesamten lokalen Datenbank wird nicht zugesichert.';

  @override
  String get medicationPrivacy => 'Optionale Medikamenten-Spitznamenliste';

  @override
  String get medicationPrivacyText =>
      'Wenn Sie die optionale Medikamenten-Spitznamenliste aktivieren, werden Spitznamen, Erinnerungszeiten und Check-ins auf diesem Gerät gespeichert. Wenn Sie angemeldet sind, können sie auch mit Ihrem Amplio Care-Cloud-Konto synchronisiert werden, damit Sie sie auf einem anderen iPhone wiederherstellen können. Optionale lokale Benachrichtigungen erscheinen nur auf diesem Gerät, wenn Sie die Benachrichtigungsberechtigung erteilen. Sie können diese Daten in der App löschen (auch durch Löschen des Kontos). Diese Funktion ist keine medizinische Beratung und wird nur dann in einen Datenexport aufgenommen, wenn Sie bei jedem Export separat zustimmen.';

  @override
  String get contactUs => 'Kontakt';

  @override
  String get contactUsText =>
      'Amplio Care wird von einem unabhängigen Einzelentwickler betrieben (Domain: ampliocare.com).\n\n• Datenschutz / Datenanfragen: privacy@ampliocare.com\n• Nutzersupport: support@ampliocare.com\n• Klinische Partnerschaften: clinical@ampliocare.com\n• Geschäftlich: hello@ampliocare.com';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsIntro => 'Einführung';

  @override
  String get termsIntroText =>
      'Diese Nutzungsbedingungen („Bedingungen“) sind ein Entwurfsvertrag für die Nutzung von Amplio Care, einem iPhone-Rehabilitationstrainer für Menschen mit Parkinson. Amplio Care wird von einem unabhängigen Einzelentwickler betrieben. Diese Bedingungen ersetzen keine professionelle Rechtsberatung.';

  @override
  String get termsAcceptance => 'Annahme';

  @override
  String get termsAcceptanceText =>
      'Durch Anmeldung, Fortsetzung als Gast oder anderweitige Nutzung von Amplio Care stimmen Sie diesen Bedingungen und der Datenschutzrichtlinie zu. Wenn Sie nicht einverstanden sind, nutzen Sie die App bitte nicht.';

  @override
  String get termsUseOfApp => 'Nutzung von Amplio Care';

  @override
  String get termsUseOfAppText =>
      'Amplio Care bietet optionale Trainingstools wie Tremormessung, Stimmübungen, Bewegungsübungen, Fortschrittsübersichten und eine optionale Medikamenten-Spitznamenliste (nur auf dem Gerät für Gäste; Sync möglich bei Anmeldung).\n\nSie stimmen zu, die App nur für rechtmäßige persönliche Zwecke zu nutzen und Sensoren, Konten oder exportierte Daten nicht so zu missbrauchen, dass andere geschädigt oder geltendes Recht verletzt wird.';

  @override
  String get termsMedicalDisclaimer => 'Keine medizinische Beratung';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio Care ist eine Wellness- und Rehabilitationshilfe. Es diagnostiziert, behandelt, heilt oder verhindert Parkinson oder andere Erkrankungen nicht.\n\nWerte, Trends, Berichte und Erinnerungen dienen nur der persönlichen Orientierung und ersetzen keinen Rat von Arzt, Physiotherapeut, Logopäden oder anderem qualifizierten Fachpersonal. Holen Sie bei medizinischen Entscheidungen professionellen Rat ein. Beenden Sie Übungen bei Schmerz, Schwindel oder unsicheren Zuständen.';

  @override
  String get termsAccounts => 'Konten und Daten';

  @override
  String get termsAccountsText =>
      'Sie können Amplio Care mit Apple Sign-In, Google Sign-In oder als Gast nutzen. Sie sind für Aktivitäten unter Ihrem angemeldeten Konto verantwortlich.\n\nSie können bestimmte Daten in der App exportieren oder löschen. Das Löschen Ihres Kontos entfernt zugehörige Cloud-Daten, die wir kontrollieren, vorbehaltlich technischer und rechtlicher Grenzen. Gast- und nur lokale Daten können bis zur Löschung nur auf Ihrem Gerät verbleiben.';

  @override
  String get termsLimitation => 'Haftungsbeschränkung';

  @override
  String get termsLimitationText =>
      'Soweit gesetzlich zulässig, stellt der Entwickler Amplio Care „wie besehen“ bereit, ohne Gewähr für unterbrechungsfreien oder fehlerfreien Betrieb.\n\nDer Entwickler haftet nicht für Verletzungen, Verluste oder Schäden aus dem Vertrauen auf Trainingswerte, verpasste Medikamentenerinnerungen, Übungsversuchen oder fehlendem App-Zugang, außer soweit die Haftung gesetzlich nicht beschränkt werden kann.';

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
      'Exportieren Sie Ihr Profil und Ihre Trainingsaufzeichnungen als CSV-Datei. Sie können sie über das Teilen-Menü des Systems speichern oder teilen. Medikamenten-Spitznamen werden nur mit Ihrer Zustimmung für diesen Export einbezogen.';

  @override
  String get export => 'Exportieren';

  @override
  String get exporting => 'Exportiere...';

  @override
  String get exportSuccess => 'Export Erfolgreich';

  @override
  String get exportSuccessMessage =>
      'Ihre CSV-Datei ist bereit. Speichern Sie sie über das Teilen-Menü in „Dateien“ oder senden Sie sie. Rohe Sensordaten werden nur als Anzahl zusammengefasst.';

  @override
  String get exportMedicationConsentTitle =>
      'Medikamenten-Spitznamen einschließen?';

  @override
  String get exportMedicationConsentBody =>
      'Trainingsaufzeichnungen werden als CSV-Datei exportiert.\n\nMedikamenten-Spitznamen, Erinnerungszeiten und Check-ins werden nur einbezogen, wenn Sie „Diesmal einschließen“ wählen. Dies ist weder ein Rezept noch eine Krankenakte.\n\nMit „Abbrechen“ stoppen Sie den Vorgang. Sie können weiterhin ohne Medikamentendaten exportieren.';

  @override
  String get exportMedicationExclude => 'Ohne Medikamentendaten exportieren';

  @override
  String get exportMedicationInclude => 'Medikamentenliste einschließen';

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
      'Löschen Sie Ihr Konto und alle zugehörigen Daten dauerhaft. Dazu gehören alle Testaufzeichnungen und persönlichen Informationen.';

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
      'Üben Sie mit klarer, kräftiger Stimme. Die Kreisgröße ändert sich mit Ihrer Lautstärke. Im Zielbereich wird der Kreis grün. Nur zur persönlichen Übung – keine medizinische Behandlung.';

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
  String get medicationList => 'Medikamentenliste';

  @override
  String get medicationListEnable => 'Medikamentenliste einrichten';

  @override
  String get medicationDisclaimer =>
      'Die Medikamentenliste von Amplio Care hilft Ihnen nur, Zeiten selbst zu erfassen. Sie ist keine medizinische Beratung und gibt keine Dosierungshinweise. Als Gast bleiben Daten nur auf diesem Gerät. Wenn Sie angemeldet sind, können Erinnerungen und Check-ins mit Ihrem Amplio Care-Konto synchronisiert werden.';

  @override
  String get medicationDisclaimerAccept => 'Ich verstehe und aktiviere';

  @override
  String get medicationLabel => 'Bezeichnung';

  @override
  String get medicationLabelHint =>
      'z. B. Nach dem Frühstück (Spitzname ist in Ordnung)';

  @override
  String get medicationTime => 'Uhrzeit';

  @override
  String get medicationTaken => 'Erledigt';

  @override
  String get medicationUndo => 'Rückgängig';

  @override
  String get medicationUndoConfirm =>
      'Heutigen Check-in für diesen Eintrag entfernen?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Heute $done/$total';
  }

  @override
  String get medicationManage => 'Verwalten';

  @override
  String get medicationAdd => 'Erinnerung hinzufügen';

  @override
  String get medicationEdit => 'Erinnerung bearbeiten';

  @override
  String get medicationClose => 'Medikamentenliste ausschalten';

  @override
  String get medicationCloseConfirm =>
      'Sie können die Liste ausblenden oder auch alle Medikamentendaten auf diesem Gerät löschen.';

  @override
  String get medicationCloseHideOnly => 'Nur ausblenden';

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
  String get medicationCollapse => 'Einklappen';

  @override
  String get medicationExpand => 'Ausklappen';

  @override
  String get medicationEmptyToday =>
      'Keine Erinnerungen für heute. Fügen Sie eine unter Verwalten hinzu.';

  @override
  String medicationCompletedAt(String time) {
    return 'Erledigt um $time';
  }

  @override
  String get medicationSave => 'Speichern';

  @override
  String get medicationDeleteReminder => 'Erinnerung löschen';

  @override
  String get medicationDeleteReminderConfirm => 'Diese Erinnerung löschen?';

  @override
  String get medicationNoReminders => 'Noch keine Erinnerungen';

  @override
  String get medicationDeleteSuccess => 'Medikamentenlistendaten gelöscht';

  @override
  String get rehabReport => 'Reha-Bericht';

  @override
  String get rehabReportDisclaimer =>
      'Nur zur Rehabilitationsreferenz. Keine medizinische Diagnose und kein Ersatz für den Rat Ihres Behandlungsteams.';

  @override
  String get reportOverallScore => 'Gesamtbewertung';

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
  String get voiceTrainingShort => 'Stimme';

  @override
  String get motionTrainingShort => 'Bewegung';

  @override
  String get tabHome => 'Start';

  @override
  String get tabPlan => 'Plan';

  @override
  String get tabData => 'Daten';

  @override
  String get tabProfile => 'Profil';

  @override
  String get comingSoon => 'Demnächst';

  @override
  String trainingStreak(int days) {
    return '$days Tage';
  }

  @override
  String get trainingStreakLabel => 'Trainingsserie';

  @override
  String get voiceClarity => 'Stimmklarheit';

  @override
  String get handStability => 'Handstabilität';

  @override
  String get movementAbility => 'Bewegungsfähigkeit';

  @override
  String get medicationReminder => 'Medikamente';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Letztes Training · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Zuletzt gemessen · $timeAgo';
  }

  @override
  String get relativeToday => 'Heute';

  @override
  String get relativeYesterday => 'Gestern';

  @override
  String relativeDaysAgo(int days) {
    return 'vor $days Tagen';
  }

  @override
  String get noTrainingYet => 'Noch kein Training';

  @override
  String get noMeasurementYet => 'Noch keine Messung';

  @override
  String get tapToStart => 'Zum Starten tippen';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 Sitzung';

  @override
  String get handMeasurementCount => '1 Messung';

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
  String get medicationNextDoseLabel => 'Nächste Einnahme';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'Demnächst';

  @override
  String get medicationStatusPending => 'Ausstehend';

  @override
  String medicationNotificationBody(String label) {
    return 'Zeit für: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Optional: Benachrichtigungen erlauben, damit Amplio Care Sie zu den von Ihnen festgelegten Zeiten erinnert. Benachrichtigungen bleiben auf diesem Gerät.';

  @override
  String get recentActivity => 'Letzte Aktivitäten';

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
  String get voiceLegendTarget => 'Ziellautstärke';

  @override
  String get voiceLegendYours => 'Ihre Lautstärke';

  @override
  String get voiceShowDetail => 'Wert anzeigen';

  @override
  String get voiceHideDetail => 'Wert ausblenden';

  @override
  String get voiceCompletedTitle => 'Übung abgeschlossen';

  @override
  String get voiceCompletedDurationLabel => 'Diese Sitzung';

  @override
  String get voiceCompletedTargetLabel => 'Zeit bei Ziellautstärke';

  @override
  String get voiceCompletedEncourageGood =>
      'Sehr gut! Behalten Sie die Gewohnheit, laut zu sprechen.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Guter Versuch. Versuchen Sie beim nächsten Mal etwas lauter zu sprechen.';

  @override
  String get voiceRetryButton => 'Erneut üben';

  @override
  String get voiceFinishButton => 'Fertig';

  @override
  String get voicePracticeFooterHint =>
      'Diese Übung fördert lautes Sprechen für das Stimmtraining. Nur zur Referenz, keine medizinische Diagnose.';

  @override
  String get voiceSessionTooShort =>
      'Die Sitzung war zu kurz und wurde nicht gespeichert';

  @override
  String get voiceProtocolPickerTitle => 'Übungsart auswählen';

  @override
  String get voiceProtocolSteady => 'Gleichmäßige Lautstärke';

  @override
  String get voiceProtocolSteadyDesc =>
      'Halten Sie ein langes „Ah“ im Ziellautstärkebereich.';

  @override
  String get voiceProtocolLadder => 'Lautstärkeleiter';

  @override
  String get voiceProtocolLadderDesc =>
      'Leise → Zielbereich → etwas kräftiger → wieder leiser.';

  @override
  String get voiceProtocolMultiSet => '3 kurze Sätze';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Drei kurze Runden mit einer kurzen Pause dazwischen.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Nur für persönliche Rehabilitationsübungen. Keine Diagnose oder Behandlung.';

  @override
  String get voiceLadderPhaseSoft => 'Phase 1: leisere Stimme';

  @override
  String get voiceLadderPhaseTarget => 'Phase 2: Ziellautstärke';

  @override
  String get voiceLadderPhaseStrong => 'Phase 3: etwas kräftiger';

  @override
  String get voiceLadderPhaseCoolDown => 'Phase 4: wieder leiser';

  @override
  String voiceLadderChip(int seconds) {
    return 'Verbleibende Phase: ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Satz $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Pause ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Pause';

  @override
  String voiceRestBody(int next, int total) {
    return 'Als Nächstes: Satz $next von $total. Entspannen Sie Ihre Stimme.';
  }

  @override
  String get tremorDurationPickerTitle => 'Sitzungsdauer';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Halten Sie das Telefon $seconds Sekunden lang still. Halten Sie Ihren Arm ruhig.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Bewegungsbereiche dienen nur der persönlichen Orientierung – nicht als medizinische Beurteilung.';

  @override
  String get planTodayTitle => 'Heutige Übungen';

  @override
  String get planTodaySubtitle =>
      'Vorschläge aus Ihren Trainingsmodulen. Zum Starten tippen.';

  @override
  String get planEmptyHint =>
      'Noch keine Vorschläge. Probieren Sie ein Training auf der Startseite aus.';

  @override
  String get planDomainHand => 'Hand';

  @override
  String get planDomainVoice => 'Stimme';

  @override
  String get planDomainMotion => 'Bewegung';

  @override
  String planGoalProgress(int done, int target) {
    return 'Heute: $done/$target Sitzungen';
  }

  @override
  String get planGoalCompleted => 'Das heutige Ziel ist erreicht. Gut gemacht.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'Diese Woche: $done/$target Sitzungen';
  }

  @override
  String get planOpenTask => 'Starten';

  @override
  String get planMotionShelvedNote =>
      'Die Bewegungserkennung ist auf manchen Telefonen eingeschränkt; Sie können den Übungsbildschirm trotzdem öffnen.';

  @override
  String get voiceProtocolClarity => 'Klare Sätze';

  @override
  String get voiceProtocolClarityDesc =>
      'Lesen Sie kurze Sätze laut vor. Die Aussprache wird nicht bewertet.';

  @override
  String get voiceClarityHint =>
      'Lesen Sie den Satz deutlich vor. Wir prüfen nur, ob Sie gesprochen haben – nicht, ob es „richtig“ war.';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Satz $current von $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Stimme erkannt – gut';

  @override
  String get voiceClarityWaitingVoice => 'Lesen Sie den Satz laut vor';

  @override
  String get voiceClarityNextPhrase => 'Nächster Satz';

  @override
  String get voiceClarityFinish => 'Beenden';

  @override
  String get voiceClarityPhrase1 => 'Guten Morgen';

  @override
  String get voiceClarityPhrase2 => 'Wie geht es Ihnen heute?';

  @override
  String get voiceClarityPhrase3 => 'Bitte reichen Sie mir das Wasser';

  @override
  String get voiceClarityPhrase4 => 'Mir geht es gut';

  @override
  String get voiceClarityPhrase5 => 'Bis morgen';

  @override
  String get handModePickerTitle => 'Übungsart';

  @override
  String get handModeStillHold => 'Ruhig halten';

  @override
  String get handModeStillHoldDesc =>
      'Halten Sie das Telefon ruhig, während die Sensoren Bewegungen messen.';

  @override
  String get handModeObjectHold => 'Gegenstand halten';

  @override
  String get handModeObjectHoldDesc =>
      'Halten Sie eine Tasse oder einen weichen Ball ruhig. Geführter Timer – keine Objekterkennung.';

  @override
  String get handModeFineMotor => 'Fingerberührungen';

  @override
  String get handModeFineMotorDesc =>
      'Berühren Sie mit dem Daumen nacheinander jeden Finger. Sie zählen die Zyklen selbst.';

  @override
  String get handGuidedDisclaimer =>
      'Geführte Übung nur zur persönlichen Rehabilitationsunterstützung. Keine medizinische Beurteilung.';

  @override
  String get handObjectHoldInstruction =>
      'Setzen Sie sich bequem hin. Halten Sie eine Tasse oder einen weichen Ball in einer Hand. Halten Sie den Gegenstand ruhig, ohne fest zuzudrücken.';

  @override
  String get handObjectHoldStart => 'Halten starten';

  @override
  String get handObjectHoldRunning => 'Weiter ruhig halten…';

  @override
  String get handObjectHoldDone => 'Halten abgeschlossen';

  @override
  String get handFineMotorInstruction =>
      'Berühren Sie mit dem Daumen nacheinander Zeige-, Mittel-, Ring- und kleinen Finger. Das ist ein Zyklus.';

  @override
  String get handFineMotorMarkCycle => 'Ich habe einen Zyklus abgeschlossen';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Zyklen: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Übung abgeschlossen';

  @override
  String get handGuidedCompleteBody =>
      'Gut gemacht. Diese Sitzung wird nur als persönliche Übung gespeichert.';

  @override
  String get dataTabTitle => 'Ihre Daten';

  @override
  String get dataTabSubtitle =>
      'Wöchentliche Übungswerte und Trends zur persönlichen Orientierung.';

  @override
  String get dataTrendsTitle => 'Diese Woche im Vergleich zur letzten Woche';

  @override
  String get dataOpenFullReport => 'Vollständigen Reha-Bericht öffnen';

  @override
  String get dataRecentSessions => 'Letzte Sitzungen';

  @override
  String dataStreakDays(int days) {
    return 'Trainingsserie: $days Tage';
  }

  @override
  String get reportShareButton => 'Bericht teilen';

  @override
  String get reportShareConsentTitle => 'Ihre Reha-Zusammenfassung teilen?';

  @override
  String get reportShareConsentBody =>
      'Dadurch wird eine Textdatei mit Ihren Übungswerten und Trends erstellt und anschließend das Teilen-Menü des Systems geöffnet (Nachrichten, Mail, Dateien usw.).\n\nNur zur persönlichen Orientierung – keine medizinische Diagnose.\n\nNachdem Sie die Datei gesendet haben, kann Amplio Care sie nicht vom Empfänger zurückholen. Sie können jetzt abbrechen oder auf dem nächsten Bildschirm kein Freigabeziel auswählen.';

  @override
  String get reportShareConsentConfirm => 'Ich verstehe – fortfahren';

  @override
  String get reportShareFileTitle => 'Amplio Care Reha-Zusammenfassung';

  @override
  String get reportShareSuccess => 'Teilen-Menü geöffnet';

  @override
  String get reportShareFailed =>
      'Der Bericht konnte nicht geteilt werden. Bitte versuchen Sie es erneut.';

  @override
  String get reportShareFooterNote =>
      'Für jedes Teilen ist Ihre Bestätigung erforderlich. Amplio Care sendet Ärzten nicht automatisch E-Mails.';

  @override
  String get profileTabTitle => 'Profil';

  @override
  String get profileGuestLabel => 'Gast';

  @override
  String get profileGuestSubtitle =>
      'Lokal angemeldet. Die Cloud-Synchronisierung ist nach der Anmeldung verfügbar.';

  @override
  String get profileSignedInLabel => 'Angemeldet';

  @override
  String get profileSectionPreferences => 'Einstellungen';

  @override
  String get profileSectionAccount => 'Konto und Daten';

  @override
  String get profileSectionLegal => 'Datenschutz und Bedingungen';

  @override
  String get accessibilitySettings => 'Bedienungshilfen';

  @override
  String get exitGuestMode => 'Gastmodus verlassen';

  @override
  String get exitGuestModeConfirm =>
      'Gastmodus verlassen? Sie müssen sich anschließend anmelden oder erneut als Gast fortfahren.';

  @override
  String get trainingReminderPageTitle => 'Übungserinnerungen';

  @override
  String get trainingReminderTitle => 'Amplio Care';

  @override
  String get trainingReminderBody =>
      'Eine kurze Übung, wenn Sie Zeit haben. Es ist in Ordnung, sie auszulassen.';

  @override
  String get trainingReminderDisclaimer =>
      'Optionale lokale Erinnerungen, kein Behandlungsplan. Sie können sie jederzeit deaktivieren. Eine verpasste Erinnerung verändert Ihre Werte nicht.';

  @override
  String get trainingReminderEnable => 'An das Üben erinnern';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Zeit $n';
  }

  @override
  String get trainingReminderAddTime => 'Zweite Zeit hinzufügen';

  @override
  String get trainingReminderRemoveTime => 'Diese Zeit entfernen';

  @override
  String get trainingReminderQuietWeekends => 'Wochenenden auslassen';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'Samstags und sonntags keine Erinnerungen.';

  @override
  String get trainingReminderPermissionDenied =>
      'Benachrichtigungen wurden nicht erlaubt. Sie können sie später in den iPhone-Einstellungen aktivieren.';

  @override
  String get planReminderOff => 'Übungserinnerung einrichten';

  @override
  String planReminderOn(String times) {
    return 'Erinnerungen: $times';
  }
}
