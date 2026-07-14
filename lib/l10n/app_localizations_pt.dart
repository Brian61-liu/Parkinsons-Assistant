// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Por favor, selecione o treinamento que deseja realizar';

  @override
  String get clickToStartTest => 'Clique para iniciar o teste';

  @override
  String get clickToStartTraining => 'Clique para iniciar o treino';

  @override
  String get tremorTest => 'Teste de Tremor de Mão';

  @override
  String get tremorTestTitle => 'Teste de Tremor de Mão';

  @override
  String get tremorTestInstruction =>
      'Por favor, segure o telefone na mão e mantenha o braço parado por 30 segundos';

  @override
  String remainingTime(int time) {
    return '${time}s restante';
  }

  @override
  String get readyToTest => 'Pronto para iniciar o teste';

  @override
  String get frequency => 'Frequência';

  @override
  String get amplitude => 'Amplitude';

  @override
  String get waitingForData => 'Aguardando dados...';

  @override
  String get startTest => 'Iniciar Teste';

  @override
  String get stopTest => 'Parar Teste';

  @override
  String get tremorTestCancelledNoSave => 'Teste cancelado, registro não salvo';

  @override
  String get testCompleted => 'Teste Concluído';

  @override
  String averageFrequency(String frequency) {
    return 'Frequência Média: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Amplitude Média: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Amplitude Máxima: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Permissão de sensor necessária para realizar o teste';

  @override
  String get language => 'Idioma';

  @override
  String get changeLanguage => 'Alterar Idioma';

  @override
  String get selectLanguage => 'Idioma';

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
  String get realtimeWaveform => 'Forma de Onda';

  @override
  String get waveformAxisTime => 'Tempo';

  @override
  String get waveformAxisAmplitude => 'Amplitude';

  @override
  String get waveformHint => 'Onda mais alta = tremor mais visível';

  @override
  String get tremorSeverity => 'Severidade';

  @override
  String get tremorFrequency => 'Frequência';

  @override
  String get avgAmplitude => 'Amp. Média';

  @override
  String get maxAmp => 'Amp. Máxima';

  @override
  String get variability => 'Variabilidade';

  @override
  String get sampleRate => 'Amostra';

  @override
  String get dataPoints => 'Pontos';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Leve';

  @override
  String get severityModerate => 'Moderado';

  @override
  String get severityModerateSevere => 'Mod-Grave';

  @override
  String get severitySevere => 'Grave';

  @override
  String get appSubtitle =>
      'Seu assistente pessoal de Parkinson para rastreamento e análise de movimentos';

  @override
  String get signInWithGoogle => 'Entrar com Google';

  @override
  String get signInWithApple => 'Entrar com Apple';

  @override
  String get signingIn => 'Entrando...';

  @override
  String get privacyNotice =>
      'Ao entrar, você concorda com nossos Termos de Serviço e Política de Privacidade';

  @override
  String get loginError => 'Erro de Login';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get logout => 'Sair';

  @override
  String get logoutConfirm => 'Tem certeza de que deseja sair?';

  @override
  String welcome(String name) {
    return 'Bem-vindo, $name';
  }

  @override
  String get syncToCloud => 'Sincronizar na Nuvem';

  @override
  String get dataSynced => 'Dados sincronizados com sucesso';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get privacyPolicyIntro => 'Introdução';

  @override
  String get privacyPolicyIntroText =>
      'A Amplio está comprometida em proteger sua privacidade e dados de saúde. Esta política explica como coletamos, usamos, armazenamos e protegemos suas informações.';

  @override
  String get dataCollection => 'Dados que Coletamos';

  @override
  String get dataCollectionText =>
      'Coletamos os seguintes dados:\n\n• Conta: Email, nome (autenticação)\n• Sensores: Dados de movimento durante testes\n• Resultados: Frequência, amplitude, severidade\n\nSeguimos o princípio de minimização de dados.';

  @override
  String get dataUsage => 'Uso dos Dados';

  @override
  String get dataUsageText =>
      'Seus dados são usados apenas para:\n\n• Fornecer análise e rastreamento de tremores\n• Gerar relatórios de saúde\n• Melhorar algoritmos (dados anônimos com consentimento)';

  @override
  String get dataStorage => 'Armazenamento e Segurança';

  @override
  String get dataStorageText =>
      'Seus dados são armazenados com segurança no Google Firebase.\n\n• Criptografia de ponta a ponta\n• TLS 1.3 para todas as transmissões\n• Controles de acesso rigorosos\n• Auditorias de segurança regulares';

  @override
  String get dataSharing => 'Compartilhamento de Dados';

  @override
  String get dataSharingText =>
      'NUNCA vendemos seus dados de saúde.\n\nDados são compartilhados apenas:\n• Com seu consentimento explícito\n• Com provedores de saúde designados\n• Quando exigido por lei\n\nDados anônimos podem ser usados para pesquisa.';

  @override
  String get userRights => 'Seus Direitos de Dados';

  @override
  String get userRightsText =>
      'Você tem direito a:\n\n• Acesso: Ver todos os seus dados\n• Portabilidade: Exportar seus dados\n• Exclusão: Excluir seus dados\n• Revogação: Revogar consentimento\n• Contato: Para consultas sobre privacidade';

  @override
  String get dataSecurity => 'Medidas de Segurança';

  @override
  String get dataSecurityText =>
      'Implementamos múltiplas camadas de segurança:\n\n• Criptografia AES-256 em repouso\n• TLS 1.3 em trânsito\n• Autenticação multifator\n• Testes de penetração regulares\n• Logs de auditoria completos\n• Treinamento de segurança para funcionários';

  @override
  String get contactUs => 'Entre em Contato';

  @override
  String get contactUsText => 'Consultas de privacidade: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Última atualização';

  @override
  String get version => 'Versão';

  @override
  String get dataManagement => 'Gestão de Dados';

  @override
  String get gdprRights =>
      'Você pode acessar, exportar e excluir seus dados de saúde a qualquer momento.';

  @override
  String get exportData => 'Exportar Meus Dados';

  @override
  String get exportDataDescription =>
      'Baixe uma cópia completa de todos os seus dados (formato JSON).';

  @override
  String get export => 'Exportar';

  @override
  String get exporting => 'Exportando...';

  @override
  String get exportSuccess => 'Exportação Bem-sucedida';

  @override
  String get exportSuccessMessage =>
      'Seus dados foram copiados para a área de transferência.';

  @override
  String get deleteAllRecords => 'Excluir Todos os Registros';

  @override
  String get deleteAllRecordsDescription =>
      'Exclua permanentemente todos os registros de testes. Esta ação não pode ser desfeita.';

  @override
  String get deleteAllData => 'Excluir Todos os Dados';

  @override
  String get deleteAllDataConfirm =>
      'Tem certeza de que deseja excluir todos os registros? Esta ação é irreversível.';

  @override
  String get delete => 'Excluir';

  @override
  String get deleteSuccess => 'Exclusão Bem-sucedida';

  @override
  String get deleteSuccessMessage =>
      'Todos os registros foram excluídos permanentemente.';

  @override
  String get deleteAccount => 'Excluir Conta';

  @override
  String get deleteAccountDescription =>
      'Exclua permanentemente sua conta e todos os dados associados.';

  @override
  String get deleteAccountWarning =>
      'Sua conta e todos os dados serão excluídos permanentemente. Esta ação é irreversível.';

  @override
  String get deleteAccountFinalWarning =>
      'Último aviso: Após a exclusão, sua conta e dados serão perdidos para sempre. Tem certeza?';

  @override
  String get finalWarning => 'Último Aviso';

  @override
  String get deleteForever => 'Excluir Permanentemente';

  @override
  String get continue_ => 'Continuar';

  @override
  String get error => 'Erro';

  @override
  String get settings => 'Configurações';

  @override
  String get testHistory => 'Histórico';

  @override
  String get noTestRecords => 'Nenhum registro de teste';

  @override
  String get noTestRecordsHint =>
      'Complete um teste de tremor para ver seus resultados aqui';

  @override
  String get testDate => 'Data do Teste';

  @override
  String get deleteRecord => 'Excluir Registro';

  @override
  String get deleteRecordConfirm =>
      'Tem certeza de que deseja excluir este registro de teste?';

  @override
  String get recordDeleted => 'Registro excluído';

  @override
  String get duration => 'Duração';

  @override
  String get seconds => 's';

  @override
  String get tapToCancel => 'Toque para cancelar';

  @override
  String get changeAvatar => 'Alterar Avatar';

  @override
  String get selectFromGallery => 'Selecionar da Galeria';

  @override
  String get takePhoto => 'Tirar Foto';

  @override
  String get avatarUpdated => 'Avatar atualizado com sucesso';

  @override
  String get avatarUpdateFailed => 'Falha ao atualizar o avatar';

  @override
  String get voiceTraining => 'Treinamento de Voz';

  @override
  String get voiceTrainingMainInstruction =>
      'Por favor, sustenha um som longo — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Com base nos princípios da terapia LSVT LOUD, por favor fale alto. O tamanho do círculo mudará em tempo real com base no seu volume. Quando atingir 75-85 dB, o círculo ficará verde.';

  @override
  String get voiceTrainingReady => 'Pronto para começar';

  @override
  String get voiceTrainingCalibrating => 'Calibrando ruído ambiental...';

  @override
  String get voiceTrainingTooQuiet => 'Fale mais alto!';

  @override
  String get voiceTrainingKeepGoing => 'Bom, continue!';

  @override
  String get voiceTrainingExcellent => 'Excelente! Continue!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Meta: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Meta: $range dB';
  }

  @override
  String get startListening => 'Iniciar Treinamento';

  @override
  String get stopListening => 'Parar Treinamento';

  @override
  String get microphonePermissionRequired =>
      'Permissão de Microfone Necessária';

  @override
  String get microphonePermissionDenied => 'Permissão de microfone negada';

  @override
  String get microphonePermissionDeniedMessage =>
      'A permissão do microfone foi negada permanentemente. Por favor, habilite a permissão do microfone nas configurações do sistema para usar o treinamento de voz.';

  @override
  String get microphoneError => 'Erro do microfone';

  @override
  String get openSettings => 'Abrir Configurações';

  @override
  String get continueAsGuest => 'Continuar como convidado';

  @override
  String get movementTraining => 'Treino de Movimento';

  @override
  String get movementTrainingInstruction =>
      'Por favor, levante ambos os braços e mantenha a postura correta';

  @override
  String get armsRaised => 'Braços Levantados';

  @override
  String get raiseArms => 'Por Favor Levante os Braços';

  @override
  String get lowerArms => 'Ótimo! Agora Abaixe os Braços';

  @override
  String get successCount => 'Contagem de Sucessos';

  @override
  String get cameraPermissionRequired => 'Permissão de Câmera Necessária';

  @override
  String get cameraPermissionDeniedMessage =>
      'A permissão da câmera foi negada. Por favor, habilite a permissão da câmera nas configurações do sistema para usar o treino de movimento.';

  @override
  String get setGoal => 'Definir Objetivo';

  @override
  String get reps => 'repetições';

  @override
  String get greatJob => 'Ótimo Trabalho!';

  @override
  String get goalCompleted => 'Você completou seu objetivo!';

  @override
  String get playAgain => 'Jogar Novamente';

  @override
  String get trainingHistory => 'Histórico de Treino';

  @override
  String get noTrainingRecords => 'Sem Registros de Treino';

  @override
  String get noTrainingRecordsHint =>
      'Seus registros de treino aparecerão aqui após completar uma sessão';

  @override
  String get trainingDetails => 'Detalhes do Treino';

  @override
  String get goalStatus => 'Status do Objetivo';

  @override
  String get goalReached => 'Concluído';

  @override
  String get goalNotReached => 'Não Concluído';

  @override
  String get minutes => 'min';

  @override
  String get selectTrainingType => 'Selecionar Tipo de Treino';

  @override
  String get armsRaisedTraining => 'Braços Levantados';

  @override
  String get legLiftTraining => 'Elevação de Pernas';

  @override
  String get legLiftInstruction =>
      'Por favor, levante uma perna, depois abaixe-a para completar uma ação';

  @override
  String get lowerLegs => 'Por favor, abaixe as pernas';

  @override
  String get legsRaised => 'Pernas Levantadas';

  @override
  String get raiseLegs => 'Por Favor Levante as Pernas';

  @override
  String get trainingType => 'Tipo de Treino';

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
