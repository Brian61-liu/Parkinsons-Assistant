// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Veuillez sélectionner l\'entraînement que vous souhaitez effectuer';

  @override
  String get clickToStartTest => 'Cliquez pour commencer le test';

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
  String get privacyPolicy => 'Politique de Confidentialité';

  @override
  String get privacyPolicyIntro => 'Introduction';

  @override
  String get privacyPolicyIntroText =>
      'Kineo s\'engage à protéger votre vie privée et vos données de santé. Cette politique explique comment nous collectons, utilisons, stockons et protégeons vos informations, conformément à HIPAA et GDPR.';

  @override
  String get dataCollection => 'Données Collectées';

  @override
  String get dataCollectionText =>
      'Nous collectons les données suivantes :\n\n• Compte : Email, nom (authentification)\n• Capteurs : Données de mouvement pendant les tests\n• Résultats : Fréquence, amplitude, sévérité\n\nNous suivons le principe de minimisation des données.';

  @override
  String get dataUsage => 'Utilisation des Données';

  @override
  String get dataUsageText =>
      'Vos données sont utilisées uniquement pour :\n\n• Fournir l\'analyse et le suivi des tremblements\n• Générer des rapports de santé\n• Améliorer nos algorithmes (données anonymisées avec consentement)';

  @override
  String get dataStorage => 'Stockage et Sécurité';

  @override
  String get dataStorageText =>
      'Vos données sont stockées en sécurité sur Google Firebase.\n\n• Chiffrement de bout en bout\n• TLS 1.3 pour toutes les transmissions\n• Contrôles d\'accès stricts\n• Audits de sécurité réguliers';

  @override
  String get dataSharing => 'Partage des Données';

  @override
  String get dataSharingText =>
      'Nous ne vendons JAMAIS vos données de santé.\n\nLes données sont partagées uniquement :\n• Avec votre consentement explicite\n• Avec les prestataires de soins désignés\n• Lorsque la loi l\'exige\n\nLes données anonymisées peuvent être utilisées pour la recherche.';

  @override
  String get userRights => 'Vos Droits (RGPD)';

  @override
  String get userRightsText =>
      'Selon le RGPD, vous avez le droit de :\n\n• Accès : Consulter toutes vos données\n• Portabilité : Exporter vos données\n• Effacement : Supprimer vos données\n• Retrait : Retirer votre consentement\n• Réclamation : Porter plainte auprès des autorités';

  @override
  String get dataSecurity => 'Mesures de Sécurité';

  @override
  String get dataSecurityText =>
      'Nous mettons en œuvre plusieurs couches de sécurité :\n\n• Chiffrement AES-256 au repos\n• TLS 1.3 en transit\n• Authentification multifacteur\n• Tests de pénétration réguliers\n• Journaux d\'audit complets\n• Formation sécurité des employés';

  @override
  String get contactUs => 'Nous Contacter';

  @override
  String get contactUsText =>
      'Questions de confidentialité : privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Dernière mise à jour';

  @override
  String get version => 'Version';

  @override
  String get dataManagement => 'Gestion des Données';

  @override
  String get gdprRights =>
      'Selon RGPD et HIPAA, vous pouvez accéder, exporter et supprimer vos données de santé à tout moment.';

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
  String get selectTrainingType => 'Select Training Type';

  @override
  String get armsRaisedTraining => 'Arms Raised';

  @override
  String get fistClenchTraining => 'Fist Clench';

  @override
  String get legLiftTraining => 'Leg Lift';

  @override
  String get fistClenchInstruction =>
      'Please clench your fists, then open them to complete one action';

  @override
  String get legLiftInstruction =>
      'Please lift one leg, then lower it to complete one action';

  @override
  String get openFists => 'Please open your hands';

  @override
  String get lowerLegs => 'Please lower your legs';

  @override
  String get fistsClenched => 'Fists Clenched';

  @override
  String get legsRaised => 'Legs Raised';

  @override
  String get clenchFists => 'Please Clench Your Fists';

  @override
  String get raiseLegs => 'Please Raise Your Legs';

  @override
  String get trainingType => 'Training Type';
}
