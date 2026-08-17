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
  String get severityNormal => 'Movimento ridotto';

  @override
  String get severityMild => 'Movimento lieve';

  @override
  String get severityModerate => 'Movimento moderato';

  @override
  String get severityModerateSevere => 'Movimento più marcato';

  @override
  String get severitySevere => 'Livello più alto';

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
  String get syncing => 'Sincronizzazione…';

  @override
  String get syncFailed =>
      'Sincronizzazione non riuscita. Controlla la rete e riprova.';

  @override
  String get syncFailedHint =>
      'Sincronizzazione non riuscita — tocca per riprovare';

  @override
  String get syncRetry => 'Riprova';

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
      'Proteggiamo i tuoi dati con i controlli di sicurezza del nostro stack attuale:\n\n• TLS per le richieste cloud\n• Firebase Authentication per gli account connessi\n• Regole Firestore che limitano l’accesso ai tuoi dati\n• Crittografia AES sul dispositivo per i dati sanitari locali sensibili (come i campioni dei sensori del tremore e i soprannomi dei farmaci), con la chiave conservata nel Portachiavi iOS\n• Esportazione ed eliminazione dell’account nell’app\n\nI file esportati vengono scritti in un formato leggibile per uso personale. Non dichiariamo che l’intero database locale sia completamente crittografato.';

  @override
  String get medicationPrivacy => 'Elenco opzionale di soprannomi farmaci';

  @override
  String get medicationPrivacyText =>
      'Se attivi l’elenco opzionale di soprannomi dei farmaci, i soprannomi, gli orari dei promemoria e i check-in vengono memorizzati su questo dispositivo. Se accedi, possono anche sincronizzarsi con il tuo account cloud Amplio per essere ripristinati su un altro iPhone. Le notifiche locali opzionali compaiono solo su questo dispositivo se concedi il permesso per le notifiche. Puoi eliminare questi dati nell’app (anche eliminando l’account). Questa funzione non è un consiglio medico e viene inclusa nell’esportazione dei dati solo se dai un consenso separato ogni volta che esporti.';

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
      'Esporta il profilo e le registrazioni degli allenamenti in un file CSV. Puoi salvarlo o condividerlo dal pannello di condivisione del sistema. I soprannomi dei farmaci sono inclusi solo con il tuo consenso per quella esportazione.';

  @override
  String get export => 'Esporta';

  @override
  String get exporting => 'Esportazione...';

  @override
  String get exportSuccess => 'Esportazione Riuscita';

  @override
  String get exportSuccessMessage =>
      'Il file CSV è pronto. Usa il pannello di condivisione per salvarlo in File o inviarlo. I campioni grezzi dei sensori sono riepilogati solo come conteggio.';

  @override
  String get exportMedicationConsentTitle =>
      'Includere i soprannomi dei farmaci?';

  @override
  String get exportMedicationConsentBody =>
      'Le registrazioni degli allenamenti verranno esportate in un file CSV.\n\nI soprannomi dei farmaci, gli orari dei promemoria e i check-in vengono inclusi solo se scegli «Includi questa volta». Non si tratta di una prescrizione né di una cartella clinica.\n\nAnnulla per interrompere. Puoi comunque esportare senza i dati sui farmaci.';

  @override
  String get exportMedicationExclude => 'Esporta senza dati sui farmaci';

  @override
  String get exportMedicationInclude => 'Includi elenco farmaci';

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
      'Elimina definitivamente il tuo account e tutti i dati associati, inclusi i risultati dei test e le informazioni personali.';

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
      'Esercitati a parlare con voce chiara e forte. La dimensione del cerchio cambia con il volume. Quando raggiungi l’intervallo obiettivo, il cerchio diventa verde. Solo per esercizio personale — non è un trattamento medico.';

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
  String get medicationList => 'Elenco farmaci';

  @override
  String get medicationListEnable => 'Configura elenco farmaci';

  @override
  String get medicationDisclaimer =>
      'L\'elenco farmaci di Amplio ti aiuta solo a registrare gli orari da solo. Non è un consiglio medico e non fornisce indicazioni sul dosaggio. Come ospite i dati restano solo su questo dispositivo. Se accedi, promemoria e check-in possono sincronizzarsi con il tuo account Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Ho capito e attivo';

  @override
  String get medicationLabel => 'Etichetta';

  @override
  String get medicationLabelHint =>
      'es. Dopo colazione (va bene un soprannome)';

  @override
  String get medicationTime => 'Ora';

  @override
  String get medicationTaken => 'Assunto';

  @override
  String get medicationUndo => 'Annulla';

  @override
  String get medicationUndoConfirm =>
      'Rimuovere il check-in di oggi per questa voce?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Oggi $done/$total';
  }

  @override
  String get medicationManage => 'Gestisci';

  @override
  String get medicationAdd => 'Aggiungi promemoria';

  @override
  String get medicationEdit => 'Modifica promemoria';

  @override
  String get medicationClose => 'Disattiva elenco farmaci';

  @override
  String get medicationCloseConfirm =>
      'Puoi nascondere l\'elenco oppure anche eliminare tutti i dati sui farmaci su questo dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Nascondi soltanto';

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
  String get medicationCollapse => 'Comprimi';

  @override
  String get medicationExpand => 'Espandi';

  @override
  String get medicationEmptyToday =>
      'Nessun promemoria per oggi. Aggiungine uno in Gestisci.';

  @override
  String medicationCompletedAt(String time) {
    return 'Fatto alle $time';
  }

  @override
  String get medicationSave => 'Salva';

  @override
  String get medicationDeleteReminder => 'Elimina promemoria';

  @override
  String get medicationDeleteReminderConfirm => 'Eliminare questo promemoria?';

  @override
  String get medicationNoReminders => 'Ancora nessun promemoria';

  @override
  String get medicationDeleteSuccess => 'Dati elenco farmaci eliminati';

  @override
  String get rehabReport => 'Rapporto riabilitativo';

  @override
  String get rehabReportDisclaimer =>
      'Solo riferimento riabilitativo. Non è una diagnosi medica e non sostituisce il consiglio del tuo team di cura.';

  @override
  String get reportOverallScore => 'Punteggio complessivo';

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
  String get handTraining => 'Mano';

  @override
  String get voiceTrainingShort => 'Voce';

  @override
  String get motionTrainingShort => 'Movimento';

  @override
  String get tabHome => 'Home';

  @override
  String get tabPlan => 'Piano';

  @override
  String get tabData => 'Dati';

  @override
  String get tabProfile => 'Profilo';

  @override
  String get comingSoon => 'Prossimamente';

  @override
  String trainingStreak(int days) {
    return '$days giorni';
  }

  @override
  String get trainingStreakLabel => 'Serie di allenamenti';

  @override
  String get voiceClarity => 'Chiarezza della voce';

  @override
  String get handStability => 'Stabilità della mano';

  @override
  String get movementAbility => 'Capacità di movimento';

  @override
  String get medicationReminder => 'Farmaci';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Ultimo allenamento · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Ultima misurazione · $timeAgo';
  }

  @override
  String get relativeToday => 'Oggi';

  @override
  String get relativeYesterday => 'Ieri';

  @override
  String relativeDaysAgo(int days) {
    return '$days giorni fa';
  }

  @override
  String get noTrainingYet => 'Ancora nessun allenamento';

  @override
  String get noMeasurementYet => 'Ancora nessuna misurazione';

  @override
  String get tapToStart => 'Tocca per iniziare';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 sessione';

  @override
  String get handMeasurementCount => '1 misurazione';

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
  String get medicationNextDoseLabel => 'Prossima assunzione';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'In arrivo';

  @override
  String get medicationStatusPending => 'In sospeso';

  @override
  String medicationNotificationBody(String label) {
    return 'È ora di: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Opzionale: consenti le notifiche così Amplio può ricordarti agli orari impostati. Le notifiche restano su questo dispositivo.';

  @override
  String get recentActivity => 'Attività recente';

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
  String get voiceLegendTarget => 'Volume obiettivo';

  @override
  String get voiceLegendYours => 'Il tuo volume';

  @override
  String get voiceShowDetail => 'Mostra valore';

  @override
  String get voiceHideDetail => 'Nascondi valore';

  @override
  String get voiceCompletedTitle => 'Esercizio completato';

  @override
  String get voiceCompletedDurationLabel => 'Questa sessione';

  @override
  String get voiceCompletedTargetLabel => 'Tempo al volume obiettivo';

  @override
  String get voiceCompletedEncourageGood =>
      'Ottimo lavoro! Continua l\'abitudine di parlare a voce alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Buon tentativo. La prossima volta prova a parlare un po\' più forte.';

  @override
  String get voiceRetryButton => 'Esercitati di nuovo';

  @override
  String get voiceFinishButton => 'Fine';

  @override
  String get voicePracticeFooterHint =>
      'Questo esercizio incoraggia a parlare a voce alta per l\'allenamento vocale. Solo riferimento, non una diagnosi medica.';

  @override
  String get voiceSessionTooShort =>
      'La sessione era troppo breve e non è stata salvata';

  @override
  String get voiceProtocolPickerTitle => 'Scegli uno stile di esercizio';

  @override
  String get voiceProtocolSteady => 'Volume costante';

  @override
  String get voiceProtocolSteadyDesc =>
      'Mantieni una «Ah» lunga nell’intervallo di volume obiettivo.';

  @override
  String get voiceProtocolLadder => 'Scala del volume';

  @override
  String get voiceProtocolLadderDesc =>
      'Piano → obiettivo → un po’ più forte → diminuisci.';

  @override
  String get voiceProtocolMultiSet => '3 serie brevi';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Tre brevi serie con una piccola pausa tra una e l’altra.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Solo per esercizio riabilitativo personale. Non è una diagnosi né un trattamento.';

  @override
  String get voiceLadderPhaseSoft => 'Fase 1: voce più bassa';

  @override
  String get voiceLadderPhaseTarget => 'Fase 2: volume obiettivo';

  @override
  String get voiceLadderPhaseStrong => 'Fase 3: un po’ più forte';

  @override
  String get voiceLadderPhaseCoolDown => 'Fase 4: diminuisci';

  @override
  String voiceLadderChip(int seconds) {
    return 'Tempo rimanente nella fase: ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Serie $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Pausa ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Pausa';

  @override
  String voiceRestBody(int next, int total) {
    return 'Prossima: serie $next di $total. Rilassa la voce.';
  }

  @override
  String get tremorDurationPickerTitle => 'Durata della sessione';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Tieni fermo il telefono per $seconds secondi. Mantieni stabile il braccio.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Le fasce di movimento sono solo per riferimento personale — non sono una valutazione medica.';

  @override
  String get planTodayTitle => 'Esercizi di oggi';

  @override
  String get planTodaySubtitle =>
      'Suggerimenti dai tuoi moduli di allenamento. Tocca per iniziare.';

  @override
  String get planEmptyHint =>
      'Ancora nessun suggerimento. Prova un allenamento dalla Home.';

  @override
  String get planDomainHand => 'Mano';

  @override
  String get planDomainVoice => 'Voce';

  @override
  String get planDomainMotion => 'Movimento';

  @override
  String planGoalProgress(int done, int target) {
    return 'Oggi: $done/$target sessioni';
  }

  @override
  String get planGoalCompleted =>
      'L’obiettivo di oggi è stato raggiunto. Ottimo lavoro.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'Questa settimana: $done/$target sessioni';
  }

  @override
  String get planOpenTask => 'Inizia';

  @override
  String get planMotionShelvedNote =>
      'Il rilevamento del movimento è limitato su alcuni telefoni; puoi comunque aprire la schermata dell’esercizio.';

  @override
  String get voiceProtocolClarity => 'Frasi chiare';

  @override
  String get voiceProtocolClarityDesc =>
      'Leggi brevi frasi ad alta voce. La pronuncia non viene valutata.';

  @override
  String get voiceClarityHint =>
      'Leggi chiaramente la frase. Controlliamo solo che tu abbia parlato — non se era «corretta».';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Frase $current di $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Voce rilevata — bene';

  @override
  String get voiceClarityWaitingVoice => 'Leggi la frase ad alta voce';

  @override
  String get voiceClarityNextPhrase => 'Frase successiva';

  @override
  String get voiceClarityFinish => 'Termina';

  @override
  String get voiceClarityPhrase1 => 'Buongiorno';

  @override
  String get voiceClarityPhrase2 => 'Come stai oggi?';

  @override
  String get voiceClarityPhrase3 => 'Per favore, passami l’acqua';

  @override
  String get voiceClarityPhrase4 => 'Sto bene';

  @override
  String get voiceClarityPhrase5 => 'A domani';

  @override
  String get handModePickerTitle => 'Stile di esercizio';

  @override
  String get handModeStillHold => 'Tieni fermo';

  @override
  String get handModeStillHoldDesc =>
      'Tieni fermo il telefono mentre i sensori misurano il movimento.';

  @override
  String get handModeObjectHold => 'Tieni un oggetto';

  @override
  String get handModeObjectHoldDesc =>
      'Tieni ferma una tazza o una palla morbida. Timer guidato — nessun rilevamento degli oggetti.';

  @override
  String get handModeFineMotor => 'Tocchi delle dita';

  @override
  String get handModeFineMotorDesc =>
      'Tocca ogni dito con il pollice. Conta tu i cicli.';

  @override
  String get handGuidedDisclaimer =>
      'Esercizio guidato solo come supporto riabilitativo personale. Non è una valutazione medica.';

  @override
  String get handObjectHoldInstruction =>
      'Siediti comodamente. Tieni una tazza o una palla morbida in una mano. Mantienila ferma senza stringere forte.';

  @override
  String get handObjectHoldStart => 'Inizia a tenere';

  @override
  String get handObjectHoldRunning => 'Continua a tenere fermo…';

  @override
  String get handObjectHoldDone => 'Esercizio completato';

  @override
  String get handFineMotorInstruction =>
      'Tocca con il pollice l’indice, il medio, l’anulare e poi il mignolo. Questo è un ciclo.';

  @override
  String get handFineMotorMarkCycle => 'Ho completato un ciclo';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Cicli: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Esercizio completato';

  @override
  String get handGuidedCompleteBody =>
      'Ottimo lavoro. Questa sessione viene salvata solo come esercizio personale.';

  @override
  String get dataTabTitle => 'I tuoi dati';

  @override
  String get dataTabSubtitle =>
      'Punteggi e tendenze settimanali degli esercizi per riferimento personale.';

  @override
  String get dataTrendsTitle => 'Questa settimana rispetto alla scorsa';

  @override
  String get dataOpenFullReport => 'Apri il rapporto riabilitativo completo';

  @override
  String get dataRecentSessions => 'Sessioni recenti';

  @override
  String dataStreakDays(int days) {
    return 'Serie di allenamenti: $days giorni';
  }

  @override
  String get reportShareButton => 'Condividi rapporto';

  @override
  String get reportShareConsentTitle =>
      'Condividere il riepilogo riabilitativo?';

  @override
  String get reportShareConsentBody =>
      'Questa operazione crea un file di testo con i punteggi e le tendenze degli esercizi, quindi apre il pannello di condivisione del sistema (Messaggi, Mail, File ecc.).\n\nSolo per riferimento personale — non è una diagnosi medica.\n\nDopo l’invio, Amplio non può recuperare il file dal destinatario. Puoi annullare ora oppure non scegliere alcuna destinazione nella schermata successiva.';

  @override
  String get reportShareConsentConfirm => 'Ho capito — continua';

  @override
  String get reportShareFileTitle => 'Riepilogo riabilitativo Amplio Care';

  @override
  String get reportShareSuccess => 'Pannello di condivisione aperto';

  @override
  String get reportShareFailed =>
      'Impossibile condividere il rapporto. Riprova.';

  @override
  String get reportShareFooterNote =>
      'È necessaria la tua conferma a ogni condivisione. Amplio non invia automaticamente e-mail ai medici.';

  @override
  String get profileTabTitle => 'Profilo';

  @override
  String get profileGuestLabel => 'Ospite';

  @override
  String get profileGuestSubtitle =>
      'Accesso locale. La sincronizzazione cloud è disponibile dopo l’accesso.';

  @override
  String get profileSignedInLabel => 'Accesso effettuato';

  @override
  String get profileSectionPreferences => 'Preferenze';

  @override
  String get profileSectionAccount => 'Account e dati';

  @override
  String get profileSectionLegal => 'Privacy e termini';

  @override
  String get accessibilitySettings => 'Accessibilità';

  @override
  String get exitGuestMode => 'Esci dalla modalità ospite';

  @override
  String get exitGuestModeConfirm =>
      'Uscire dalla modalità ospite? Dovrai accedere o continuare nuovamente come ospite.';

  @override
  String get trainingReminderPageTitle => 'Promemoria per gli esercizi';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody =>
      'Un breve esercizio quando puoi. Non fa niente se lo salti.';

  @override
  String get trainingReminderDisclaimer =>
      'Promemoria locali facoltativi, non un programma terapeutico. Puoi disattivarli in qualsiasi momento. Saltare un promemoria non modifica i punteggi.';

  @override
  String get trainingReminderEnable => 'Ricordami di esercitarmi';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Ora $n';
  }

  @override
  String get trainingReminderAddTime => 'Aggiungi un secondo orario';

  @override
  String get trainingReminderRemoveTime => 'Rimuovi questo orario';

  @override
  String get trainingReminderQuietWeekends => 'Salta i fine settimana';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'Nessun promemoria il sabato o la domenica.';

  @override
  String get trainingReminderPermissionDenied =>
      'Le notifiche non sono state autorizzate. Puoi attivarle in seguito nelle Impostazioni di iPhone.';

  @override
  String get planReminderOff => 'Imposta un promemoria per gli esercizi';

  @override
  String planReminderOn(String times) {
    return 'Promemoria: $times';
  }
}
