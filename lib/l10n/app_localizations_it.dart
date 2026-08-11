// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Si prega di selezionare l\'allenamento che si desidera eseguire';

  @override
  String get clickToStartTest => 'Fai clic per avviare il test';

  @override
  String get clickToStartTraining => 'Fai clic per avviare l\'allenamento';

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
  String get tremorTestCancelledNoSave => 'Test annullato, record non salvato';

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
  String get waveformAxisTime => 'Tempo';

  @override
  String get waveformAxisAmplitude => 'Ampiezza';

  @override
  String get waveformHint => 'Onda più alta = tremore più evidente';

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
  String get signInWithApple => 'Accedi con Apple';

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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed =>
      'Sincronizzazione non riuscita. Controlla la rete e riprova.';

  @override
  String get syncFailedHint =>
      'Sincronizzazione non riuscita — tocca per riprovare';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'Accedi per usare la sincronizzazione cloud';

  @override
  String lastSyncedAt(String time) {
    return 'Ultima sincronizzazione: $time';
  }

  @override
  String get privacyPolicy => 'Informativa sulla Privacy';

  @override
  String get privacyPolicyIntro => 'Introduzione';

  @override
  String get privacyPolicyIntroText =>
      'Amplio si impegna a proteggere la tua privacy e i dati sulla salute. Questa politica spiega come raccogliamo, usiamo, archiviamo e proteggiamo le tue informazioni.';

  @override
  String get dataCollection => 'Dati che Raccogliamo';

  @override
  String get dataCollectionText =>
      'Raccogliamo i seguenti dati:\n\n• Account: Email, nome (autenticazione)\n• Sensori: Dati di movimento durante i test\n• Risultati: Frequenza, ampiezza, gravità\n\nSeguiamo il principio di minimizzazione dei dati.';

  @override
  String get dataUsage => 'Uso dei Dati';

  @override
  String get dataUsageText =>
      'I tuoi dati sono usati esclusivamente per:\n\n• Fornire funzionalità di allenamento riabilitativo e monitoraggio dei progressi\n• Mostrare riepiloghi e report in-app per riferimento personale\n• Migliorare l’app solo se usiamo dati anonimizzati con il tuo consenso';

  @override
  String get dataStorage => 'Archiviazione e Sicurezza';

  @override
  String get dataStorageText =>
      'Quando accedi, i dati dell’account e di allenamento sincronizzati possono essere archiviati con Google Firebase. I dati ospite e solo locali restano sul tuo dispositivo.\n\n• HTTPS/TLS per il traffico di rete verso i nostri servizi cloud\n• Accesso limitato dal tuo account e dalle regole di sicurezza Firestore\n• Puoi esportare o eliminare i dati dall’app';

  @override
  String get dataSharing => 'Condivisione Dati';

  @override
  String get dataSharingText =>
      'Non vendiamo i tuoi dati personali sulla salute.\n\nI dati lasciano l’app solo quando:\n• Esporti o condividi esplicitamente i file tu stesso\n• La legge richiede la divulgazione\n\nL’app attualmente non invia dati direttamente ai fornitori di assistenza sanitaria.';

  @override
  String get userRights => 'I Tuoi Diritti sui Dati';

  @override
  String get userRightsText =>
      'Hai il diritto di:\n\n• Accesso: Visualizzare tutti i tuoi dati\n• Portabilità: Esportare i tuoi dati\n• Cancellazione: Eliminare i tuoi dati\n• Revoca: Revocare il consenso\n• Contatto: Per qualsiasi domanda sulla privacy';

  @override
  String get dataSecurity => 'Misure di Sicurezza';

  @override
  String get dataSecurityText =>
      'Proteggiamo i tuoi dati con i controlli di sicurezza del nostro stack attuale:\n\n• TLS per le richieste cloud\n• Firebase Authentication per gli account connessi\n• Regole Firestore che limitano l’accesso ai tuoi dati\n• Esportazione ed eliminazione account in-app\n\nProtezioni più forti come la crittografia completa del database locale sono ancora in miglioramento e non sono dichiarate complete.';

  @override
  String get medicationPrivacy => 'Elenco opzionale di soprannomi farmaci';

  @override
  String get medicationPrivacyText =>
      'Se attivi l’elenco opzionale di soprannomi farmaci, soprannomi, orari dei promemoria e check-in restano su questo dispositivo. Se accedi, possono anche sincronizzarsi con il tuo account cloud Amplio per ripristinarli su un altro iPhone. Le notifiche locali opzionali compaiono solo su questo dispositivo se concedi il permesso. Puoi eliminare questi dati nell’app (inclusa l’eliminazione dell’account). Questa funzione non è un consiglio medico e non è inclusa per impostazione predefinita nell’esportazione dei dati.';

  @override
  String get contactUs => 'Contattaci';

  @override
  String get contactUsText =>
      'Amplio è gestito da uno sviluppatore individuale indipendente (dominio: ampliocare.com).\n\n• Privacy / richieste dati: privacy@ampliocare.com\n• Supporto utente: support@ampliocare.com\n• Partnership cliniche: clinical@ampliocare.com\n• Affari: hello@ampliocare.com';

  @override
  String get termsOfService => 'Termini di servizio';

  @override
  String get termsIntro => 'Introduzione';

  @override
  String get termsIntroText =>
      'Questi Termini di servizio («Termini») sono una bozza di accordo per l’uso di Amplio, un assistente di allenamento riabilitativo per iPhone per persone che convivono con il Parkinson. Amplio è gestito da uno sviluppatore individuale indipendente. Questi Termini non sostituiscono una consulenza legale professionale.';

  @override
  String get termsAcceptance => 'Accettazione';

  @override
  String get termsAcceptanceText =>
      'Accedendo, continuando come ospite o usando altrimenti Amplio, accetti questi Termini e l’Informativa sulla privacy. Se non sei d’accordo, non usare l’app.';

  @override
  String get termsUseOfApp => 'Uso di Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio fornisce strumenti di allenamento opzionali come misurazione del tremore, pratica vocale, pratica del movimento, riepiloghi dei progressi e un elenco opzionale di soprannomi farmaci (solo sul dispositivo per gli ospiti; sync possibile se accedi).\n\nAccetti di usare l’app solo per scopi personali leciti e di non abusare di sensori, account o dati esportati in modi che danneggino altri o violino la legge applicabile.';

  @override
  String get termsMedicalDisclaimer => 'Non è consiglio medico';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio è un ausilio per il benessere e l’allenamento riabilitativo. Non diagnostica, tratta, cura né previene il Parkinson o qualsiasi altra condizione.\n\nPunteggi, tendenze, report e promemoria sono solo per riferimento personale e non sostituiscono il consiglio di un medico, fisioterapista, logopedista o altro professionista qualificato. Rivolgiti a un professionista per decisioni mediche. Interrompi qualsiasi esercizio che causi dolore, vertigini o condizioni non sicure.';

  @override
  String get termsAccounts => 'Account e dati';

  @override
  String get termsAccountsText =>
      'Puoi usare Amplio con Apple Sign-In, Google Sign-In o come ospite. Sei responsabile dell’attività sotto il tuo account connesso.\n\nPuoi esportare o eliminare alcuni dati nell’app. L’eliminazione dell’account rimuove i dati cloud associati che controlliamo, entro i limiti tecnici e legali. I dati ospite e solo locali possono restare solo sul tuo dispositivo finché non li cancelli.';

  @override
  String get termsLimitation => 'Limitazione di responsabilità';

  @override
  String get termsLimitationText =>
      'Nella misura massima consentita dalla legge, lo sviluppatore fornisce Amplio «così com’è», senza garanzie di funzionamento ininterrotto o senza errori.\n\nLo sviluppatore non è responsabile per lesioni, perdite o danni derivanti dall’affidamento sui punteggi di allenamento, promemoria farmaci mancati, tentativi di esercizio o impossibilità di accedere all’app, salvo dove la responsabilità non possa essere limitata dalla legge.';

  @override
  String get termsChanges => 'Modifiche';

  @override
  String get termsChangesText =>
      'Possiamo aggiornare questi Termini con l’evoluzione dell’app. La data «Ultimo aggiornamento» cambierà allora. L’uso continuato dopo un aggiornamento significa che accetti i Termini rivisti. Le modifiche sostanziali dovrebbero essere riesaminate nell’app quando disponibili.';

  @override
  String get lastUpdated => 'Ultimo aggiornamento';

  @override
  String get version => 'Versione';

  @override
  String get dataManagement => 'Gestione Dati';

  @override
  String get gdprRights =>
      'Puoi accedere, esportare ed eliminare i tuoi dati sanitari in qualsiasi momento.';

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

  @override
  String get changeAvatar => 'Cambia Avatar';

  @override
  String get selectFromGallery => 'Seleziona dalla Galleria';

  @override
  String get takePhoto => 'Scatta Foto';

  @override
  String get avatarUpdated => 'Avatar aggiornato con successo';

  @override
  String get avatarUpdateFailed => 'Impossibile aggiornare l\'avatar';

  @override
  String get voiceTraining => 'Allenamento Vocale';

  @override
  String get voiceTrainingMainInstruction =>
      'Per favore, mantieni un suono lungo — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Basato sui principi della terapia LSVT LOUD, si prega di parlare ad alta voce. La dimensione del cerchio cambierà in tempo reale in base al volume. Quando raggiunge 75-85 dB, il cerchio diventerà verde.';

  @override
  String get voiceTrainingReady => 'Pronto per iniziare';

  @override
  String get voiceTrainingCalibrating =>
      'Calibrazione del rumore ambientale...';

  @override
  String get voiceTrainingTooQuiet => 'Parla più forte!';

  @override
  String get voiceTrainingKeepGoing => 'Bene, continua!';

  @override
  String get voiceTrainingExcellent => 'Eccellente! Continua!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Obiettivo: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Obiettivo: $range dB';
  }

  @override
  String get startListening => 'Inizia Allenamento';

  @override
  String get stopListening => 'Ferma Allenamento';

  @override
  String get microphonePermissionRequired =>
      'Autorizzazione Microfono Richiesta';

  @override
  String get microphonePermissionDenied => 'Autorizzazione microfono negata';

  @override
  String get microphonePermissionDeniedMessage =>
      'L\'autorizzazione del microfono è stata negata permanentemente. Si prega di abilitare l\'autorizzazione del microfono nelle impostazioni di sistema per utilizzare l\'allenamento vocale.';

  @override
  String get microphoneError => 'Errore microfono';

  @override
  String get openSettings => 'Apri Impostazioni';

  @override
  String get continueAsGuest => 'Continua come ospite';

  @override
  String get movementTraining => 'Allenamento di Movimento';

  @override
  String get movementTrainingInstruction =>
      'Si prega di alzare entrambe le braccia e mantenere la postura corretta';

  @override
  String get armsRaised => 'Braccia Alzate';

  @override
  String get raiseArms => 'Si Prega di Alzare le Braccia';

  @override
  String get lowerArms => 'Ottimo! Ora Abbassate le Braccia';

  @override
  String get successCount => 'Conteggio Successi';

  @override
  String get cameraPermissionRequired => 'Autorizzazione Fotocamera Richiesta';

  @override
  String get cameraPermissionDeniedMessage =>
      'L\'autorizzazione della fotocamera è stata negata. Si prega di abilitare l\'autorizzazione della fotocamera nelle impostazioni di sistema per utilizzare l\'allenamento di movimento.';

  @override
  String get setGoal => 'Imposta Obiettivo';

  @override
  String get reps => 'ripetizioni';

  @override
  String get greatJob => 'Ottimo Lavoro!';

  @override
  String get goalCompleted => 'Hai completato il tuo obiettivo!';

  @override
  String get playAgain => 'Rigioca';

  @override
  String get trainingHistory => 'Cronologia Allenamento';

  @override
  String get noTrainingRecords => 'Nessun Registro di Allenamento';

  @override
  String get noTrainingRecordsHint =>
      'I tuoi registri di allenamento appariranno qui dopo aver completato una sessione';

  @override
  String get trainingDetails => 'Dettagli Allenamento';

  @override
  String get goalStatus => 'Stato Obiettivo';

  @override
  String get goalReached => 'Completato';

  @override
  String get goalNotReached => 'Non Completato';

  @override
  String get minutes => 'min';

  @override
  String get selectTrainingType => 'Seleziona Tipo di Allenamento';

  @override
  String get armsRaisedTraining => 'Braccia Alzate';

  @override
  String get legLiftTraining => 'Sollevamento Gambe';

  @override
  String get legLiftInstruction =>
      'Si prega di sollevare una gamba, poi abbassarla per completare un\'azione';

  @override
  String get lowerLegs => 'Si prega di abbassare le gambe';

  @override
  String get legsRaised => 'Gambe Sollevate';

  @override
  String get raiseLegs => 'Si Prega di Sollevare le Gambe';

  @override
  String get trainingType => 'Tipo di Allenamento';

  @override
  String get medicationList => 'Medication list';

  @override
  String get medicationListEnable => 'Configura elenco farmaci';

  @override
  String get medicationDisclaimer =>
      'L\'elenco farmaci di Amplio ti aiuta solo a registrare gli orari da solo. Non è un consiglio medico e non fornisce indicazioni sul dosaggio. Come ospite i dati restano solo su questo dispositivo. Se accedi, promemoria e check-in possono sincronizzarsi con il tuo account Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Ho capito e attivo';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint =>
      'es. Dopo colazione (va bene un soprannome)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm =>
      'Rimuovere il check-in di oggi per questa voce?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Oggi $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Disattiva elenco farmaci';

  @override
  String get medicationCloseConfirm =>
      'Puoi nascondere l\'elenco oppure anche eliminare tutti i dati sui farmaci su questo dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Nascondi ed elimina tutti i dati';

  @override
  String get medicationDeleteAllData => 'Elimina dati elenco farmaci';

  @override
  String get medicationDeleteAllDataDescription =>
      'Elimina definitivamente tutti i promemoria e i check-in dei farmaci su questo dispositivo.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Eliminare tutti i dati dell\'elenco farmaci su questo dispositivo? L\'operazione non può essere annullata.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'Nessun promemoria per oggi. Aggiungine uno in Gestisci.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'Eliminare questo promemoria?';

  @override
  String get medicationNoReminders => 'Ancora nessun promemoria';

  @override
  String get medicationDeleteSuccess => 'Dati elenco farmaci eliminati';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'Solo riferimento riabilitativo. Non è una diagnosi medica e non sostituisce il consiglio del tuo team di cura.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Obiettivi di oggi: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'Questa settimana: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Serie: $days giorni';
  }

  @override
  String get reportNoData => 'Dati di allenamento ancora insufficienti';

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
  String get movementAbility => 'Allenamento del movimento';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Ultimo allenamento · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Ultima misurazione · $timeAgo';
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
  String get noMeasurementYet => 'Ancora nessuna misurazione';

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
    return '$done/$total ripetizioni';
  }

  @override
  String get medicationSetupPrompt => 'Configura promemoria farmaci';

  @override
  String get medicationSetupSubtitle => 'Su questo dispositivo; sync se accedi';

  @override
  String get medicationNoUpcoming => 'Nessun promemoria in arrivo oggi';

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
    return 'È ora di: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Opzionale: consenti le notifiche così Amplio può ricordarti agli orari impostati. Le notifiche restano su questo dispositivo.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'Solo a scopo di riferimento';

  @override
  String get nonMedicalDisclaimerBody =>
      'Le misurazioni mostrate sono solo un riferimento per l\'allenamento riabilitativo. Non sono una diagnosi medica e non sostituiscono il consiglio del tuo team sanitario.';

  @override
  String get voicePrepHint =>
      'Siediti comodamente. Tieni il telefono a circa 30 cm dalla bocca.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Esercitati per circa $seconds secondi';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Esercitati in una stanza silenziosa per risultati migliori';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Resta in silenzio · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Esercitato ${seconds}s';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Obiettivo: ${seconds}s';
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
  String get voiceCompletedTitle => 'Esercizio completato';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Tempo al volume obiettivo';

  @override
  String get voiceCompletedEncourageGood =>
      'Ottimo lavoro! Continua l\'abitudine di parlare a voce alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Buon tentativo. La prossima volta prova a parlare un po\' più forte.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'Questo esercizio incoraggia a parlare a voce alta per l\'allenamento vocale. Solo riferimento, non una diagnosi medica.';

  @override
  String get voiceSessionTooShort =>
      'La sessione era troppo breve e non è stata salvata';

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
