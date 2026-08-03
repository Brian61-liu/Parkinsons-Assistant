// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Veuillez sélectionner l\'entraînement que vous souhaitez effectuer';

  @override
  String get clickToStartTest => 'Cliquez pour commencer le test';

  @override
  String get clickToStartTraining => 'Cliquez pour commencer l\'entraînement';

  @override
  String get tremorTest => 'Test de Tremblement de Main';

  @override
  String get tremorTestTitle => 'Test de Tremblement de Main';

  @override
  String get tremorTestInstruction =>
      'Veuillez tenir le téléphone dans votre main et garder le bras immobile pendant 30 secondes';

  @override
  String remainingTime(int time) {
    return '${time}s restant';
  }

  @override
  String get readyToTest => 'Prêt à commencer le test';

  @override
  String get frequency => 'Fréquence';

  @override
  String get amplitude => 'Amplitude';

  @override
  String get waitingForData => 'En attente de données...';

  @override
  String get startTest => 'Démarrer le Test';

  @override
  String get stopTest => 'Arrêter le Test';

  @override
  String get tremorTestCancelledNoSave =>
      'Test annulé, enregistrement non sauvegardé';

  @override
  String get testCompleted => 'Test Terminé';

  @override
  String averageFrequency(String frequency) {
    return 'Fréquence Moyenne : $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Amplitude Moyenne : $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Amplitude Maximale : $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Autorisation de capteur requise pour effectuer le test';

  @override
  String get language => 'Langue';

  @override
  String get changeLanguage => 'Changer de Langue';

  @override
  String get selectLanguage => 'Langue';

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
  String get realtimeWaveform => 'Forme d\'Onde';

  @override
  String get waveformAxisTime => 'Temps';

  @override
  String get waveformAxisAmplitude => 'Amplitude';

  @override
  String get waveformHint => 'Onde plus haute = tremblement plus visible';

  @override
  String get tremorSeverity => 'Sévérité';

  @override
  String get tremorFrequency => 'Fréquence';

  @override
  String get avgAmplitude => 'Amp. Moyenne';

  @override
  String get maxAmp => 'Amp. Max';

  @override
  String get variability => 'Variabilité';

  @override
  String get sampleRate => 'Échantillon';

  @override
  String get dataPoints => 'Points';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Léger';

  @override
  String get severityModerate => 'Modéré';

  @override
  String get severityModerateSevere => 'Mod-Sévère';

  @override
  String get severitySevere => 'Sévère';

  @override
  String get appSubtitle =>
      'Votre assistant Parkinson personnel pour le suivi et l\'analyse des mouvements';

  @override
  String get signInWithGoogle => 'Connexion Google';

  @override
  String get signInWithApple => 'Connexion Apple';

  @override
  String get signingIn => 'Connexion...';

  @override
  String get privacyNotice =>
      'En vous connectant, vous acceptez nos Conditions d\'utilisation et notre Politique de confidentialité';

  @override
  String get loginError => 'Erreur de Connexion';

  @override
  String get confirm => 'Confirmer';

  @override
  String get cancel => 'Annuler';

  @override
  String get logout => 'Déconnexion';

  @override
  String get logoutConfirm => 'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String welcome(String name) {
    return 'Bienvenue, $name';
  }

  @override
  String get syncToCloud => 'Synchroniser dans le Cloud';

  @override
  String get dataSynced => 'Données synchronisées avec succès';

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
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get privacyPolicyIntro => 'Introduction';

  @override
  String get privacyPolicyIntroText =>
      'Amplio s\'engage à protéger votre vie privée et vos données de santé. Cette politique explique comment nous collectons, utilisons, stockons et protégeons vos informations.';

  @override
  String get dataCollection => 'Données Collectées';

  @override
  String get dataCollectionText =>
      'Nous collectons les données suivantes :\n\n• Compte : Email, nom (authentification)\n• Capteurs : Données de mouvement pendant les tests\n• Résultats : Fréquence, amplitude, sévérité\n\nNous suivons le principe de minimisation des données.';

  @override
  String get dataUsage => 'Utilisation des Données';

  @override
  String get dataUsageText =>
      'Vos données sont utilisées uniquement pour :\n\n• Fournir les fonctionnalités d’entraînement de rééducation et le suivi des progrès\n• Afficher des résumés et rapports dans l’application pour votre référence personnelle\n• Améliorer l’application uniquement avec des données anonymisées et votre consentement';

  @override
  String get dataStorage => 'Stockage et Sécurité';

  @override
  String get dataStorageText =>
      'Lorsque vous vous connectez, les données de compte et d’entraînement synchronisées peuvent être stockées avec Google Firebase. Les données invité et locales restent sur votre appareil.\n\n• HTTPS/TLS pour le trafic réseau vers nos services cloud\n• Accès limité par votre compte et les règles de sécurité Firestore\n• Vous pouvez exporter ou supprimer des données depuis l’application';

  @override
  String get dataSharing => 'Partage des Données';

  @override
  String get dataSharingText =>
      'Nous ne vendons pas vos données de santé personnelles.\n\nLes données quittent l’application uniquement lorsque :\n• Vous exportez ou partagez explicitement des fichiers vous-même\n• La loi exige une divulgation\n\nL’application n’envoie actuellement pas de données directement aux prestataires de soins.';

  @override
  String get userRights => 'Vos Droits sur les Données';

  @override
  String get userRightsText =>
      'Vous avez le droit de :\n\n• Accès : Consulter toutes vos données\n• Portabilité : Exporter vos données\n• Effacement : Supprimer vos données\n• Retrait : Retirer votre consentement\n• Contact : Pour toute question relative à la vie privée';

  @override
  String get dataSecurity => 'Mesures de Sécurité';

  @override
  String get dataSecurityText =>
      'Nous protégeons vos données avec les contrôles de sécurité de notre pile actuelle :\n\n• TLS pour les requêtes cloud\n• Firebase Authentication pour les comptes connectés\n• Règles Firestore limitant l’accès à vos propres données\n• Export et suppression de compte dans l’application\n\nDes protections plus fortes, comme le chiffrement complet de la base locale, sont encore en cours d’amélioration et ne sont pas présentées comme achevées.';

  @override
  String get medicationPrivacy => 'Liste facultative de surnoms de médicaments';

  @override
  String get medicationPrivacyText =>
      'Si vous activez la liste facultative de surnoms de médicaments, les surnoms, heures de rappel et validations sont stockés uniquement sur cet appareil. Des notifications locales facultatives peuvent s’afficher uniquement sur cet appareil si vous autorisez les notifications ; elles ne sont pas envoyées à nos serveurs. Vous pouvez supprimer ces données dans l’application. Cette fonctionnalité n’est pas un avis médical et n’est pas incluse par défaut dans l’export des données.';

  @override
  String get contactUs => 'Nous Contacter';

  @override
  String get contactUsText =>
      'Amplio est exploité par un développeur individuel indépendant (domaine : ampliocare.com).\n\n• Confidentialité / demandes de données : privacy@ampliocare.com\n• Assistance utilisateur : support@ampliocare.com\n• Partenariats cliniques : clinical@ampliocare.com\n• Affaires : hello@ampliocare.com';

  @override
  String get termsOfService => 'Conditions d’utilisation';

  @override
  String get termsIntro => 'Introduction';

  @override
  String get termsIntroText =>
      'Ces Conditions d’utilisation (« Conditions ») constituent un projet d’accord pour l’utilisation d’Amplio, un assistant d’entraînement de rééducation sur iPhone pour les personnes vivant avec la maladie de Parkinson. Amplio est exploité par un développeur individuel indépendant. Ces Conditions ne remplacent pas un conseil juridique professionnel.';

  @override
  String get termsAcceptance => 'Acceptation';

  @override
  String get termsAcceptanceText =>
      'En vous connectant, en continuant en tant qu’invité ou en utilisant autrement Amplio, vous acceptez ces Conditions et la Politique de confidentialité. Si vous n’acceptez pas, veuillez ne pas utiliser l’application.';

  @override
  String get termsUseOfApp => 'Utilisation d’Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio fournit des outils d’entraînement facultatifs tels que la mesure du tremblement, la pratique vocale, la pratique du mouvement, les résumés de progrès et une liste facultative de surnoms de médicaments sur l’appareil.\n\nVous acceptez d’utiliser l’application uniquement à des fins personnelles licites et de ne pas abuser des capteurs, comptes ou données exportées d’une manière nuisible à autrui ou contraire à la loi applicable.';

  @override
  String get termsMedicalDisclaimer => 'Pas un avis médical';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio est une aide au bien-être et à l’entraînement de rééducation. Il ne diagnostique, traite, guérit ni ne prévient la maladie de Parkinson ou toute autre affection.\n\nLes scores, tendances, rapports et rappels sont uniquement destinés à une référence personnelle et ne remplacent pas l’avis d’un médecin, kinésithérapeute, orthophoniste ou autre professionnel qualifié. Consultez un professionnel pour les décisions médicales. Arrêtez tout exercice causant douleur, vertiges ou conditions dangereuses.';

  @override
  String get termsAccounts => 'Comptes et données';

  @override
  String get termsAccountsText =>
      'Vous pouvez utiliser Amplio avec Apple Sign-In, Google Sign-In ou en tant qu’invité. Vous êtes responsable de l’activité sous votre compte connecté.\n\nVous pouvez exporter ou supprimer certaines données dans l’application. La suppression de votre compte retire les données cloud associées que nous contrôlons, sous réserve des limites techniques et légales. Les données invité et locales uniquement peuvent rester uniquement sur votre appareil jusqu’à ce que vous les effaciez.';

  @override
  String get termsLimitation => 'Limitation de responsabilité';

  @override
  String get termsLimitationText =>
      'Dans toute la mesure permise par la loi, le développeur fournit Amplio « en l’état », sans garantie de fonctionnement ininterrompu ou sans erreur.\n\nLe développeur n’est pas responsable des blessures, pertes ou dommages résultant de la confiance accordée aux scores d’entraînement, de rappels de médicaments manqués, de tentatives d’exercice ou de l’impossibilité d’accéder à l’application, sauf lorsque la responsabilité ne peut être limitée par la loi.';

  @override
  String get termsChanges => 'Modifications';

  @override
  String get termsChangesText =>
      'Nous pouvons mettre à jour ces Conditions à mesure que l’application évolue. La date « Dernière mise à jour » changera alors. L’utilisation continue après une mise à jour signifie que vous acceptez les Conditions révisées. Les changements importants doivent être consultés dans l’application lorsqu’ils sont disponibles.';

  @override
  String get lastUpdated => 'Dernière mise à jour';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Gestion des Données';

  @override
  String get gdprRights =>
      'Vous pouvez accéder, exporter et supprimer vos données de santé à tout moment.';

  @override
  String get exportData => 'Exporter mes Données';

  @override
  String get exportDataDescription =>
      'Téléchargez une copie complète de toutes vos données (format JSON).';

  @override
  String get export => 'Exporter';

  @override
  String get exporting => 'Exportation...';

  @override
  String get exportSuccess => 'Export Réussi';

  @override
  String get exportSuccessMessage =>
      'Vos données ont été copiées dans le presse-papiers.';

  @override
  String get deleteAllRecords => 'Supprimer Tous les Enregistrements';

  @override
  String get deleteAllRecordsDescription =>
      'Supprimez définitivement tous vos enregistrements de tests. Cette action est irréversible.';

  @override
  String get deleteAllData => 'Supprimer Toutes les Données';

  @override
  String get deleteAllDataConfirm =>
      'Voulez-vous vraiment supprimer tous les enregistrements ? Cette action est irréversible.';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteSuccess => 'Suppression Réussie';

  @override
  String get deleteSuccessMessage =>
      'Tous vos enregistrements ont été supprimés définitivement.';

  @override
  String get deleteAccount => 'Supprimer le Compte';

  @override
  String get deleteAccountDescription =>
      'Supprimez définitivement votre compte et toutes les données associées.';

  @override
  String get deleteAccountWarning =>
      'Votre compte et toutes les données seront supprimés définitivement. Cette action est irréversible.';

  @override
  String get deleteAccountFinalWarning =>
      'Dernier avertissement : Après suppression, votre compte et données seront perdus à jamais. Êtes-vous sûr ?';

  @override
  String get finalWarning => 'Dernier Avertissement';

  @override
  String get deleteForever => 'Supprimer Définitivement';

  @override
  String get continue_ => 'Continuer';

  @override
  String get error => 'Erreur';

  @override
  String get settings => 'Paramètres';

  @override
  String get testHistory => 'Historique';

  @override
  String get noTestRecords => 'Aucun enregistrement de test';

  @override
  String get noTestRecordsHint =>
      'Effectuez un test de tremblement pour voir vos résultats ici';

  @override
  String get testDate => 'Date du Test';

  @override
  String get deleteRecord => 'Supprimer l\'Enregistrement';

  @override
  String get deleteRecordConfirm =>
      'Êtes-vous sûr de vouloir supprimer cet enregistrement ?';

  @override
  String get recordDeleted => 'Enregistrement supprimé';

  @override
  String get duration => 'Durée';

  @override
  String get seconds => 's';

  @override
  String get tapToCancel => 'Appuyez pour annuler';

  @override
  String get changeAvatar => 'Changer l\'Avatar';

  @override
  String get selectFromGallery => 'Sélectionner dans la Galerie';

  @override
  String get takePhoto => 'Prendre une Photo';

  @override
  String get avatarUpdated => 'Avatar mis à jour avec succès';

  @override
  String get avatarUpdateFailed => 'Échec de la mise à jour de l\'avatar';

  @override
  String get voiceTraining => 'Entraînement Vocal';

  @override
  String get voiceTrainingMainInstruction =>
      'Veuillez maintenir un son long — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Basé sur les principes de la thérapie LSVT LOUD, veuillez parler fort. La taille du cercle changera en temps réel selon votre volume. Lorsqu\'il atteint 75-85 dB, le cercle deviendra vert.';

  @override
  String get voiceTrainingReady => 'Prêt à commencer';

  @override
  String get voiceTrainingCalibrating => 'Calibration du bruit ambiant...';

  @override
  String get voiceTrainingTooQuiet => 'Parlez plus fort !';

  @override
  String get voiceTrainingKeepGoing => 'Bien, continuez !';

  @override
  String get voiceTrainingExcellent => 'Excellent ! Maintenez !';

  @override
  String voiceTrainingTarget(String target) {
    return 'Objectif : $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Objectif : $range dB';
  }

  @override
  String get startListening => 'Démarrer l\'Entraînement';

  @override
  String get stopListening => 'Arrêter l\'Entraînement';

  @override
  String get microphonePermissionRequired =>
      'Autorisation du Microphone Requise';

  @override
  String get microphonePermissionDenied => 'Autorisation du microphone refusée';

  @override
  String get microphonePermissionDeniedMessage =>
      'L\'autorisation du microphone a été refusée de façon permanente. Veuillez activer l\'autorisation du microphone dans les paramètres système pour utiliser l\'entraînement vocal.';

  @override
  String get microphoneError => 'Erreur du microphone';

  @override
  String get openSettings => 'Ouvrir les Paramètres';

  @override
  String get continueAsGuest => 'Continuer en tant qu\'invité';

  @override
  String get movementTraining => 'Entraînement de Mouvement';

  @override
  String get movementTrainingInstruction =>
      'Veuillez lever les deux bras et maintenir une posture correcte';

  @override
  String get armsRaised => 'Bras Levés';

  @override
  String get raiseArms => 'Veuillez Lever les Bras';

  @override
  String get lowerArms => 'Excellent ! Maintenant Baissez les Bras';

  @override
  String get successCount => 'Nombre de Succès';

  @override
  String get cameraPermissionRequired => 'Autorisation de Caméra Requise';

  @override
  String get cameraPermissionDeniedMessage =>
      'L\'autorisation de la caméra a été refusée. Veuillez activer l\'autorisation de la caméra dans les paramètres du système pour utiliser l\'entraînement de mouvement.';

  @override
  String get setGoal => 'Définir l\'Objectif';

  @override
  String get reps => 'répétitions';

  @override
  String get greatJob => 'Excellent Travail!';

  @override
  String get goalCompleted => 'Vous avez atteint votre objectif!';

  @override
  String get playAgain => 'Rejouer';

  @override
  String get trainingHistory => 'Historique d\'Entraînement';

  @override
  String get noTrainingRecords => 'Aucun Enregistrement d\'Entraînement';

  @override
  String get noTrainingRecordsHint =>
      'Vos enregistrements d\'entraînement apparaîtront ici après avoir terminé une session';

  @override
  String get trainingDetails => 'Détails de l\'Entraînement';

  @override
  String get goalStatus => 'Statut de l\'Objectif';

  @override
  String get goalReached => 'Terminé';

  @override
  String get goalNotReached => 'Non Terminé';

  @override
  String get minutes => 'min';

  @override
  String get selectTrainingType => 'Sélectionner le Type d\'Entraînement';

  @override
  String get armsRaisedTraining => 'Bras Levés';

  @override
  String get legLiftTraining => 'Soulèvement de Jambes';

  @override
  String get legLiftInstruction =>
      'Veuillez lever une jambe, puis la baisser pour compléter une action';

  @override
  String get lowerLegs => 'Veuillez baisser les jambes';

  @override
  String get legsRaised => 'Jambes Levées';

  @override
  String get raiseLegs => 'Veuillez Lever les Jambes';

  @override
  String get trainingType => 'Type d\'Entraînement';

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
