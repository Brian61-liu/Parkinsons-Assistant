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
  String get selectLanguage => 'Lingua';

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
  String get signingIn => 'Accesso...';

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
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get privacyPolicyIntro => 'Introduzione';

  @override
  String get privacyPolicyIntroText =>
      'Kineo si impegna a proteggere la tua privacy e i dati sulla salute. Questa politica spiega come raccogliamo, usiamo, archiviamo e proteggiamo le tue informazioni, in conformità con HIPAA e GDPR.';

  @override
  String get dataCollection => 'Dati che Raccogliamo';

  @override
  String get dataCollectionText =>
      'Raccogliamo i seguenti dati:\n\n• Account: Email, nome (autenticazione)\n• Sensori: Dati di movimento durante i test\n• Risultati: Frequenza, ampiezza, gravità\n\nSeguiamo il principio di minimizzazione dei dati.';

  @override
  String get dataUsage => 'Uso dei Dati';

  @override
  String get dataUsageText =>
      'I tuoi dati vengono utilizzati solo per:\n\n• Fornire analisi e tracciamento dei tremori\n• Generare rapporti sulla salute\n• Migliorare gli algoritmi (dati anonimi con consenso)';

  @override
  String get dataStorage => 'Archiviazione e Sicurezza';

  @override
  String get dataStorageText =>
      'I tuoi dati sono archiviati in modo sicuro su Google Firebase.\n\n• Crittografia end-to-end\n• TLS 1.3 per tutte le trasmissioni\n• Controlli di accesso rigorosi\n• Audit di sicurezza regolari';

  @override
  String get dataSharing => 'Condivisione Dati';

  @override
  String get dataSharingText =>
      'Non vendiamo MAI i tuoi dati sulla salute.\n\nI dati vengono condivisi solo:\n• Con il tuo consenso esplicito\n• Con i fornitori sanitari designati\n• Quando richiesto dalla legge\n\nI dati anonimi possono essere usati per la ricerca.';

  @override
  String get userRights => 'I Tuoi Diritti (GDPR)';

  @override
  String get userRightsText =>
      'Ai sensi del GDPR, hai il diritto di:\n\n• Accesso: Visualizzare tutti i tuoi dati\n• Portabilità: Esportare i tuoi dati\n• Cancellazione: Eliminare i tuoi dati\n• Revoca: Revocare il consenso\n• Reclamo: Presentare reclami alle autorità';

  @override
  String get dataSecurity => 'Misure di Sicurezza';

  @override
  String get dataSecurityText =>
      'Implementiamo più livelli di sicurezza:\n\n• Crittografia AES-256 a riposo\n• TLS 1.3 in transito\n• Autenticazione multifattore\n• Test di penetrazione regolari\n• Log di audit completi\n• Formazione sulla sicurezza dei dipendenti';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get contactUsText => 'Domande sulla privacy: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Ultimo aggiornamento';

  @override
  String get version => 'Versione';

  @override
  String get dataManagement => 'Gestione Dati';

  @override
  String get gdprRights =>
      'Secondo GDPR e HIPAA, puoi accedere, esportare ed eliminare i tuoi dati sanitari in qualsiasi momento.';

  @override
  String get exportData => 'Esporta i Miei Dati';

  @override
  String get exportDataDescription =>
      'Scarica una copia completa di tutti i tuoi dati (formato JSON).';

  @override
  String get export => 'Esporta';

  @override
  String get exporting => 'Esportazione...';

  @override
  String get exportSuccess => 'Esportazione Riuscita';

  @override
  String get exportSuccessMessage =>
      'I tuoi dati sono stati copiati negli appunti.';

  @override
  String get deleteAllRecords => 'Elimina Tutte le Registrazioni';

  @override
  String get deleteAllRecordsDescription =>
      'Elimina permanentemente tutte le registrazioni dei test. Questa azione non può essere annullata.';

  @override
  String get deleteAllData => 'Elimina Tutti i Dati';

  @override
  String get deleteAllDataConfirm =>
      'Sei sicuro di voler eliminare tutte le registrazioni? Questa azione è irreversibile.';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteSuccess => 'Eliminazione Riuscita';

  @override
  String get deleteSuccessMessage =>
      'Tutte le registrazioni sono state eliminate permanentemente.';

  @override
  String get deleteAccount => 'Elimina Account';

  @override
  String get deleteAccountDescription =>
      'Elimina permanentemente il tuo account e tutti i dati associati.';

  @override
  String get deleteAccountWarning =>
      'Il tuo account e tutti i dati verranno eliminati permanentemente. Questa azione è irreversibile.';

  @override
  String get deleteAccountFinalWarning =>
      'Ultimo avviso: Dopo l\'eliminazione, account e dati saranno persi per sempre. Sei sicuro?';

  @override
  String get finalWarning => 'Ultimo Avviso';

  @override
  String get deleteForever => 'Elimina per Sempre';

  @override
  String get continue_ => 'Continua';

  @override
  String get error => 'Errore';

  @override
  String get settings => 'Impostazioni';

  @override
  String get testHistory => 'Cronologia';

  @override
  String get noTestRecords => 'Nessun record di test';

  @override
  String get noTestRecordsHint =>
      'Completa un test di tremore per vedere i tuoi risultati qui';

  @override
  String get testDate => 'Data del Test';

  @override
  String get deleteRecord => 'Elimina Record';

  @override
  String get deleteRecordConfirm =>
      'Sei sicuro di voler eliminare questo record di test?';

  @override
  String get recordDeleted => 'Record eliminato';

  @override
  String get duration => 'Durata';

  @override
  String get seconds => 's';

  @override
  String get tapToCancel => 'Tocca per annullare';
}
