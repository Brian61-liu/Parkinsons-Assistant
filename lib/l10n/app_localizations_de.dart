// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Bitte wählen Sie das Training aus, das Sie durchführen möchten';

  @override
  String get clickToStartTest => 'Klicken Sie, um den Test zu starten';

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
      'Kineo verpflichtet sich, Ihre Privatsphäre und Gesundheitsdaten zu schützen. Diese Richtlinie erklärt, wie wir Ihre Daten gemäß HIPAA und DSGVO erfassen, verwenden, speichern und schützen.';

  @override
  String get dataCollection => 'Erfasste Daten';

  @override
  String get dataCollectionText =>
      'Wir erfassen folgende Daten:\n\n• Kontodaten: E-Mail, Name (Authentifizierung)\n• Sensordaten: Bewegungsdaten während Tests\n• Testergebnisse: Frequenz, Amplitude, Schweregrad\n\nWir folgen dem Prinzip der Datenminimierung.';

  @override
  String get dataUsage => 'Datenverwendung';

  @override
  String get dataUsageText =>
      'Ihre Daten werden ausschließlich verwendet für:\n\n• Zitteranalyse und -verfolgung\n• Erstellung von Gesundheitsberichten\n• Algorithmusverbesserung (nur anonymisierte Daten mit Zustimmung)';

  @override
  String get dataStorage => 'Datenspeicherung und Sicherheit';

  @override
  String get dataStorageText =>
      'Ihre Daten werden sicher auf Google Firebase gespeichert.\n\n• Ende-zu-Ende-Verschlüsselung\n• TLS 1.3 für alle Übertragungen\n• Strenge Zugriffskontrollen\n• Regelmäßige Sicherheitsaudits';

  @override
  String get dataSharing => 'Datenweitergabe';

  @override
  String get dataSharingText =>
      'Wir verkaufen NIEMALS Ihre Gesundheitsdaten.\n\nDaten werden nur weitergegeben:\n• Mit Ihrer ausdrücklichen Zustimmung\n• An von Ihnen benannte Gesundheitsdienstleister\n• Wenn gesetzlich vorgeschrieben\n\nAnonymisierte Daten können für Forschung verwendet werden.';

  @override
  String get userRights => 'Ihre Rechte (DSGVO)';

  @override
  String get userRightsText =>
      'Gemäß DSGVO haben Sie das Recht auf:\n\n• Auskunft: Alle Ihre Daten einsehen\n• Portabilität: Daten exportieren\n• Löschung: Daten löschen\n• Widerruf: Einwilligung jederzeit widerrufen\n• Beschwerde: Bei Behörden beschweren';

  @override
  String get dataSecurity => 'Sicherheitsmaßnahmen';

  @override
  String get dataSecurityText =>
      'Wir implementieren mehrschichtige Sicherheit:\n\n• AES-256 Ruheverschlüsselung\n• TLS 1.3 Übertragungsverschlüsselung\n• Multi-Faktor-Authentifizierung\n• Regelmäßige Penetrationstests\n• Umfassende Audit-Protokolle\n• Mitarbeiter-Sicherheitsschulung';

  @override
  String get contactUs => 'Kontakt';

  @override
  String get contactUsText => 'Datenschutzanfragen: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Zuletzt aktualisiert';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Datenverwaltung';

  @override
  String get gdprRights =>
      'Gemäß DSGVO und HIPAA können Sie jederzeit auf Ihre Gesundheitsdaten zugreifen, sie exportieren und löschen.';

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
  String get movementTraining => 'Movement Training';

  @override
  String get movementTrainingInstruction =>
      'Please raise both arms and maintain proper posture';

  @override
  String get armsRaised => 'Arms Raised';

  @override
  String get raiseArms => 'Please Raise Arms';

  @override
  String get successCount => 'Success Count';

  @override
  String get cameraPermissionRequired => 'Camera Permission Required';

  @override
  String get cameraPermissionDeniedMessage =>
      'Camera permission has been denied. Please enable camera permission in system settings to use movement training.';
}
