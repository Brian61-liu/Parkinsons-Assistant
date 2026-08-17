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
  String get severityNormal => 'Mouvement plus faible';

  @override
  String get severityMild => 'Mouvement léger';

  @override
  String get severityModerate => 'Mouvement modéré';

  @override
  String get severityModerateSevere => 'Mouvement plus marqué';

  @override
  String get severitySevere => 'Niveau le plus élevé';

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
  String get syncing => 'Synchronisation…';

  @override
  String get syncFailed =>
      'Échec de la synchronisation. Vérifiez votre réseau et réessayez.';

  @override
  String get syncFailedHint =>
      'Échec de la synchronisation — appuyez pour réessayer';

  @override
  String get syncRetry => 'Réessayer';

  @override
  String get loginRequiredForSync =>
      'Veuillez vous connecter pour utiliser la synchronisation cloud';

  @override
  String lastSyncedAt(String time) {
    return 'Dernière synchronisation : $time';
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
      'Nous protégeons vos données avec les contrôles de sécurité de notre pile actuelle :\n\n• TLS pour les requêtes cloud\n• Firebase Authentication pour les comptes connectés\n• Règles Firestore limitant l’accès à vos propres données\n• Chiffrement AES sur l’appareil pour les données de santé locales sensibles (comme les échantillons des capteurs de tremblement et les surnoms de médicaments), avec la clé stockée dans le trousseau iOS\n• Export et suppression de compte dans l’application\n\nLes fichiers exportés sont écrits dans un format lisible pour votre propre usage. Nous ne prétendons pas que l’intégralité de la base de données locale est chiffrée.';

  @override
  String get medicationPrivacy => 'Liste facultative de surnoms de médicaments';

  @override
  String get medicationPrivacyText =>
      'Si vous activez la liste facultative de surnoms de médicaments, les surnoms, heures de rappel et validations sont stockés sur cet appareil. Lorsque vous êtes connecté, ils peuvent aussi se synchroniser avec votre compte cloud Amplio afin de les restaurer sur un autre iPhone. Des notifications locales facultatives peuvent s’afficher uniquement sur cet appareil si vous autorisez les notifications. Vous pouvez supprimer ces données dans l’application (y compris en supprimant votre compte). Cette fonctionnalité n’est pas un avis médical et n’est incluse dans l’export des données que si vous donnez séparément votre accord à chaque exportation.';

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
      'Amplio fournit des outils d’entraînement facultatifs tels que la mesure du tremblement, la pratique vocale, la pratique du mouvement, les résumés de progrès et une liste facultative de surnoms de médicaments (sur l’appareil pour les invités ; synchronisation possible si connecté).\n\nVous acceptez d’utiliser l’application uniquement à des fins personnelles licites et de ne pas abuser des capteurs, comptes ou données exportées d’une manière nuisible à autrui ou contraire à la loi applicable.';

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
      'Exportez votre profil et vos séances d’entraînement dans un fichier CSV. Vous pouvez l’enregistrer ou le partager depuis la feuille de partage du système. Les surnoms de médicaments ne sont inclus qu’avec votre accord pour cette exportation.';

  @override
  String get export => 'Exporter';

  @override
  String get exporting => 'Exportation...';

  @override
  String get exportSuccess => 'Export Réussi';

  @override
  String get exportSuccessMessage =>
      'Votre fichier CSV est prêt. Utilisez la feuille de partage pour l’enregistrer dans Fichiers ou l’envoyer. Les échantillons bruts des capteurs sont uniquement résumés par leur nombre.';

  @override
  String get exportMedicationConsentTitle =>
      'Inclure les surnoms de médicaments ?';

  @override
  String get exportMedicationConsentBody =>
      'Les séances d’entraînement seront exportées dans un fichier CSV.\n\nLes surnoms de médicaments, les heures de rappel et les validations ne sont inclus que si vous choisissez « Inclure cette fois ». Il ne s’agit ni d’une ordonnance ni d’un dossier médical.\n\nAnnulez pour arrêter. Vous pouvez toujours exporter sans les données de médicaments.';

  @override
  String get exportMedicationExclude => 'Exporter sans données de médicaments';

  @override
  String get exportMedicationInclude => 'Inclure la liste de médicaments';

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
      'Supprimez définitivement votre compte et toutes les données associées, notamment les résultats de tests et les informations personnelles.';

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
      'Entraînez-vous à parler d’une voix claire et forte. La taille du cercle varie avec votre volume. Dans la plage cible, il devient vert. Pour un entraînement personnel uniquement — pas un traitement médical.';

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
  String get medicationList => 'Liste de médicaments';

  @override
  String get medicationListEnable => 'Configurer la liste de médicaments';

  @override
  String get medicationDisclaimer =>
      'La liste de médicaments d\'Amplio vous aide seulement à suivre les horaires par vous-même. Ce n\'est pas un avis médical et elle ne fournit pas de conseils de dosage. En mode invité, les données restent uniquement sur cet appareil. Lorsque vous êtes connecté, rappels et validations peuvent se synchroniser avec votre compte Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Je comprends et j\'active';

  @override
  String get medicationLabel => 'Libellé';

  @override
  String get medicationLabelHint =>
      'ex. Après le petit-déjeuner (un surnom convient)';

  @override
  String get medicationTime => 'Heure';

  @override
  String get medicationTaken => 'Pris';

  @override
  String get medicationUndo => 'Annuler';

  @override
  String get medicationUndoConfirm =>
      'Supprimer le pointage d\'aujourd\'hui pour cet élément ?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Aujourd\'hui $done/$total';
  }

  @override
  String get medicationManage => 'Gérer';

  @override
  String get medicationAdd => 'Ajouter un rappel';

  @override
  String get medicationEdit => 'Modifier le rappel';

  @override
  String get medicationClose => 'Désactiver la liste de médicaments';

  @override
  String get medicationCloseConfirm =>
      'Vous pouvez masquer la liste ou aussi supprimer toutes les données de médicaments sur cet appareil.';

  @override
  String get medicationCloseHideOnly => 'Masquer uniquement';

  @override
  String get medicationCloseAndDelete =>
      'Masquer et supprimer toutes les données';

  @override
  String get medicationDeleteAllData =>
      'Supprimer les données de la liste de médicaments';

  @override
  String get medicationDeleteAllDataDescription =>
      'Supprimer définitivement tous les rappels et pointages de médicaments sur cet appareil.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Supprimer toutes les données de la liste de médicaments sur cet appareil ? Cette action est irréversible.';

  @override
  String get medicationCollapse => 'Réduire';

  @override
  String get medicationExpand => 'Développer';

  @override
  String get medicationEmptyToday =>
      'Aucun rappel pour aujourd\'hui. Ajoutez-en un dans Gérer.';

  @override
  String medicationCompletedAt(String time) {
    return 'Effectué à $time';
  }

  @override
  String get medicationSave => 'Enregistrer';

  @override
  String get medicationDeleteReminder => 'Supprimer le rappel';

  @override
  String get medicationDeleteReminderConfirm => 'Supprimer ce rappel ?';

  @override
  String get medicationNoReminders => 'Aucun rappel pour le moment';

  @override
  String get medicationDeleteSuccess =>
      'Données de la liste de médicaments supprimées';

  @override
  String get rehabReport => 'Rapport de rééducation';

  @override
  String get rehabReportDisclaimer =>
      'Référence de rééducation uniquement. Pas un diagnostic médical et ne remplace pas les conseils de votre équipe de soins.';

  @override
  String get reportOverallScore => 'Score global';

  @override
  String reportDailyProgress(int percent) {
    return 'Objectifs du jour : $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'Cette semaine : $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Série : $days jours';
  }

  @override
  String get reportNoData => 'Pas encore assez de données d\'entraînement';

  @override
  String get handTraining => 'Main';

  @override
  String get voiceTrainingShort => 'Voix';

  @override
  String get motionTrainingShort => 'Mouvement';

  @override
  String get tabHome => 'Accueil';

  @override
  String get tabPlan => 'Plan';

  @override
  String get tabData => 'Données';

  @override
  String get tabProfile => 'Profil';

  @override
  String get comingSoon => 'Bientôt disponible';

  @override
  String trainingStreak(int days) {
    return '$days jours';
  }

  @override
  String get trainingStreakLabel => 'Série d’entraînements';

  @override
  String get voiceClarity => 'Clarté de la voix';

  @override
  String get handStability => 'Stabilité de la main';

  @override
  String get movementAbility => 'Capacité de mouvement';

  @override
  String get medicationReminder => 'Médicaments';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Dernier entraînement · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Dernière mesure · $timeAgo';
  }

  @override
  String get relativeToday => 'Aujourd’hui';

  @override
  String get relativeYesterday => 'Hier';

  @override
  String relativeDaysAgo(int days) {
    return 'Il y a $days jours';
  }

  @override
  String get noTrainingYet => 'Aucun entraînement pour le moment';

  @override
  String get noMeasurementYet => 'Pas encore de mesure';

  @override
  String get tapToStart => 'Appuyez pour commencer';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 séance';

  @override
  String get handMeasurementCount => '1 mesure';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total répétitions';
  }

  @override
  String get medicationSetupPrompt => 'Configurer les rappels de médicaments';

  @override
  String get medicationSetupSubtitle => 'Sur cet appareil ; sync si connecté';

  @override
  String get medicationNoUpcoming => 'Aucun rappel à venir aujourd\'hui';

  @override
  String get medicationNextDoseLabel => 'Prochaine prise';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'À venir';

  @override
  String get medicationStatusPending => 'En attente';

  @override
  String medicationNotificationBody(String label) {
    return 'C\'est l\'heure : $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Facultatif : autorisez les notifications pour qu\'Amplio vous rappelle aux heures définies. Les notifications restent sur cet appareil.';

  @override
  String get recentActivity => 'Activité récente';

  @override
  String get nonMedicalDisclaimerTitle => 'À titre indicatif uniquement';

  @override
  String get nonMedicalDisclaimerBody =>
      'Les mesures affichées sont uniquement une référence d\'entraînement de rééducation. Elles ne constituent pas un diagnostic médical et ne remplacent pas les conseils de votre équipe de soins.';

  @override
  String get voicePrepHint =>
      'Asseyez-vous confortablement. Tenez le téléphone à environ 30 cm de votre bouche.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Entraînez-vous pendant environ $seconds secondes';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Entraînez-vous dans une pièce calme pour de meilleurs résultats';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Veuillez rester silencieux · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Pratiqué ${seconds}s';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Objectif : ${seconds}s';
  }

  @override
  String get voiceLegendTarget => 'Volume cible';

  @override
  String get voiceLegendYours => 'Votre volume';

  @override
  String get voiceShowDetail => 'Afficher la valeur';

  @override
  String get voiceHideDetail => 'Masquer la valeur';

  @override
  String get voiceCompletedTitle => 'Entraînement terminé';

  @override
  String get voiceCompletedDurationLabel => 'Cette séance';

  @override
  String get voiceCompletedTargetLabel => 'Temps au volume cible';

  @override
  String get voiceCompletedEncourageGood =>
      'Excellent ! Continuez à parler fort régulièrement.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Bon essai. Essayez de parler un peu plus fort la prochaine fois.';

  @override
  String get voiceRetryButton => 'Recommencer';

  @override
  String get voiceFinishButton => 'Terminer';

  @override
  String get voicePracticeFooterHint =>
      'Cet exercice encourage à parler fort pour l\'entraînement vocal. Référence uniquement, pas un diagnostic médical.';

  @override
  String get voiceSessionTooShort =>
      'La séance était trop courte et n\'a pas été enregistrée';

  @override
  String get voiceProtocolPickerTitle => 'Choisissez un type d’exercice';

  @override
  String get voiceProtocolSteady => 'Volume constant';

  @override
  String get voiceProtocolSteadyDesc =>
      'Maintenez un long « Ah » dans la plage de volume cible.';

  @override
  String get voiceProtocolLadder => 'Échelle de volume';

  @override
  String get voiceProtocolLadderDesc =>
      'Doux → cible → un peu plus fort → redescendre.';

  @override
  String get voiceProtocolMultiSet => '3 séries courtes';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Trois courtes séries séparées par une brève pause.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Uniquement pour un entraînement personnel de rééducation. Ni diagnostic ni traitement.';

  @override
  String get voiceLadderPhaseSoft => 'Phase 1 : voix plus douce';

  @override
  String get voiceLadderPhaseTarget => 'Phase 2 : volume cible';

  @override
  String get voiceLadderPhaseStrong => 'Phase 3 : un peu plus fort';

  @override
  String get voiceLadderPhaseCoolDown => 'Phase 4 : redescendre';

  @override
  String voiceLadderChip(int seconds) {
    return 'Temps restant dans la phase : ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Série $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Repos ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Repos';

  @override
  String voiceRestBody(int next, int total) {
    return 'Ensuite : série $next sur $total. Détendez votre voix.';
  }

  @override
  String get tremorDurationPickerTitle => 'Durée de la séance';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Tenez votre téléphone immobile pendant $seconds secondes. Gardez votre bras stable.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Les niveaux de mouvement sont fournis à titre personnel uniquement — il ne s’agit pas d’une évaluation médicale.';

  @override
  String get planTodayTitle => 'Exercices du jour';

  @override
  String get planTodaySubtitle =>
      'Suggestions issues de vos modules d’entraînement. Appuyez pour commencer.';

  @override
  String get planEmptyHint =>
      'Aucune suggestion pour le moment. Essayez un entraînement depuis l’accueil.';

  @override
  String get planDomainHand => 'Main';

  @override
  String get planDomainVoice => 'Voix';

  @override
  String get planDomainMotion => 'Mouvement';

  @override
  String planGoalProgress(int done, int target) {
    return 'Aujourd’hui : $done/$target séances';
  }

  @override
  String get planGoalCompleted => 'L’objectif du jour est atteint. Bravo.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'Cette semaine : $done/$target séances';
  }

  @override
  String get planOpenTask => 'Commencer';

  @override
  String get planMotionShelvedNote =>
      'La détection des mouvements est limitée sur certains téléphones ; vous pouvez tout de même ouvrir l’écran d’exercice.';

  @override
  String get voiceProtocolClarity => 'Phrases claires';

  @override
  String get voiceProtocolClarityDesc =>
      'Lisez de courtes phrases à voix haute. La prononciation n’est pas évaluée.';

  @override
  String get voiceClarityHint =>
      'Lisez clairement la phrase. Nous vérifions seulement que vous avez parlé — pas si c’était « correct ».';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Phrase $current sur $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Voix détectée — très bien';

  @override
  String get voiceClarityWaitingVoice => 'Lisez la phrase à voix haute';

  @override
  String get voiceClarityNextPhrase => 'Phrase suivante';

  @override
  String get voiceClarityFinish => 'Terminer';

  @override
  String get voiceClarityPhrase1 => 'Bonjour';

  @override
  String get voiceClarityPhrase2 => 'Comment allez-vous aujourd’hui ?';

  @override
  String get voiceClarityPhrase3 => 'Veuillez me passer l’eau';

  @override
  String get voiceClarityPhrase4 => 'Je vais bien';

  @override
  String get voiceClarityPhrase5 => 'À demain';

  @override
  String get handModePickerTitle => 'Type d’exercice';

  @override
  String get handModeStillHold => 'Tenue immobile';

  @override
  String get handModeStillHoldDesc =>
      'Tenez le téléphone immobile pendant que les capteurs mesurent le mouvement.';

  @override
  String get handModeObjectHold => 'Tenue d’un objet';

  @override
  String get handModeObjectHoldDesc =>
      'Tenez une tasse ou une balle souple immobile. Minuteur guidé — aucune détection d’objet.';

  @override
  String get handModeFineMotor => 'Toucher des doigts';

  @override
  String get handModeFineMotorDesc =>
      'Touchez chaque doigt avec le pouce. Vous comptez vous-même les cycles.';

  @override
  String get handGuidedDisclaimer =>
      'Exercice guidé uniquement pour soutenir votre rééducation personnelle. Il ne s’agit pas d’une évaluation médicale.';

  @override
  String get handObjectHoldInstruction =>
      'Asseyez-vous confortablement. Tenez une tasse ou une balle souple dans une main. Gardez-la immobile sans serrer fort.';

  @override
  String get handObjectHoldStart => 'Commencer la tenue';

  @override
  String get handObjectHoldRunning => 'Continuez à tenir l’objet immobile…';

  @override
  String get handObjectHoldDone => 'Tenue terminée';

  @override
  String get handFineMotorInstruction =>
      'Touchez successivement l’index, le majeur, l’annulaire puis l’auriculaire avec votre pouce. Cela constitue un cycle.';

  @override
  String get handFineMotorMarkCycle => 'J’ai terminé un cycle';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Cycles : $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Exercice terminé';

  @override
  String get handGuidedCompleteBody =>
      'Bravo. Cette séance est enregistrée uniquement comme exercice personnel.';

  @override
  String get dataTabTitle => 'Vos données';

  @override
  String get dataTabSubtitle =>
      'Scores et tendances hebdomadaires des exercices, à titre personnel.';

  @override
  String get dataTrendsTitle =>
      'Cette semaine par rapport à la semaine dernière';

  @override
  String get dataOpenFullReport => 'Ouvrir le rapport de rééducation complet';

  @override
  String get dataRecentSessions => 'Séances récentes';

  @override
  String dataStreakDays(int days) {
    return 'Série d’entraînements : $days jours';
  }

  @override
  String get reportShareButton => 'Partager le rapport';

  @override
  String get reportShareConsentTitle =>
      'Partager votre résumé de rééducation ?';

  @override
  String get reportShareConsentBody =>
      'Cette action crée un fichier texte contenant vos scores et tendances d’exercice, puis ouvre la feuille de partage du système (Messages, Mail, Fichiers, etc.).\n\nÀ titre personnel uniquement — ce n’est pas un diagnostic médical.\n\nUne fois le fichier envoyé, Amplio ne peut pas le récupérer auprès du destinataire. Vous pouvez annuler maintenant ou ne sélectionner aucune destination de partage à l’écran suivant.';

  @override
  String get reportShareConsentConfirm => 'J’ai compris — continuer';

  @override
  String get reportShareFileTitle => 'Résumé de rééducation Amplio Care';

  @override
  String get reportShareSuccess => 'Feuille de partage ouverte';

  @override
  String get reportShareFailed =>
      'Impossible de partager le rapport. Veuillez réessayer.';

  @override
  String get reportShareFooterNote =>
      'Votre confirmation est requise à chaque partage. Amplio n’envoie aucun e-mail automatiquement aux médecins.';

  @override
  String get profileTabTitle => 'Profil';

  @override
  String get profileGuestLabel => 'Invité';

  @override
  String get profileGuestSubtitle =>
      'Connexion locale. La synchronisation cloud est disponible après votre connexion.';

  @override
  String get profileSignedInLabel => 'Connecté';

  @override
  String get profileSectionPreferences => 'Préférences';

  @override
  String get profileSectionAccount => 'Compte et données';

  @override
  String get profileSectionLegal => 'Confidentialité et conditions';

  @override
  String get accessibilitySettings => 'Accessibilité';

  @override
  String get exitGuestMode => 'Quitter le mode invité';

  @override
  String get exitGuestModeConfirm =>
      'Quitter le mode invité ? Vous devrez vous connecter ou continuer à nouveau en tant qu’invité.';

  @override
  String get trainingReminderPageTitle => 'Rappels d’exercice';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody =>
      'Un court exercice lorsque vous le pouvez. Ce n’est pas grave si vous le manquez.';

  @override
  String get trainingReminderDisclaimer =>
      'Rappels locaux facultatifs, et non programme de traitement. Vous pouvez les désactiver à tout moment. Manquer un rappel ne modifie pas vos scores.';

  @override
  String get trainingReminderEnable => 'Me rappeler de m’entraîner';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Heure $n';
  }

  @override
  String get trainingReminderAddTime => 'Ajouter une deuxième heure';

  @override
  String get trainingReminderRemoveTime => 'Supprimer cette heure';

  @override
  String get trainingReminderQuietWeekends => 'Ignorer les week-ends';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'Aucun rappel le samedi ou le dimanche.';

  @override
  String get trainingReminderPermissionDenied =>
      'Les notifications n’ont pas été autorisées. Vous pourrez les activer plus tard dans les réglages de l’iPhone.';

  @override
  String get planReminderOff => 'Définir un rappel d’exercice';

  @override
  String planReminderOn(String times) {
    return 'Rappels : $times';
  }
}
