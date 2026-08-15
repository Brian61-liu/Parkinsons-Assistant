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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed =>
      'Falha na sincronização. Verifique a rede e tente novamente.';

  @override
  String get syncFailedHint =>
      'Falha na sincronização — toque para tentar de novo';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'Inicie sessão para usar a sincronização na nuvem';

  @override
  String lastSyncedAt(String time) {
    return 'Última sincronização: $time';
  }

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
      'Os seus dados são usados apenas para:\n\n• Fornecer funcionalidades de treino de reabilitação e acompanhamento do progresso\n• Mostrar resumos e relatórios na app para referência pessoal\n• Melhorar a app apenas se usarmos dados anonimizados com o seu consentimento';

  @override
  String get dataStorage => 'Armazenamento e Segurança';

  @override
  String get dataStorageText =>
      'Quando inicia sessão, a conta e os dados de treino sincronizados podem ser armazenados no Google Firebase. Dados de convidado e apenas locais permanecem no seu dispositivo.\n\n• HTTPS/TLS para o tráfego de rede para os nossos serviços na nuvem\n• Acesso limitado pela sua conta e pelas regras de segurança do Firestore\n• Pode exportar ou eliminar dados na app';

  @override
  String get dataSharing => 'Compartilhamento de Dados';

  @override
  String get dataSharingText =>
      'Não vendemos os seus dados pessoais de saúde.\n\nOs dados saem da app apenas quando:\n• Exporta ou partilha ficheiros explicitamente\n• A lei exige divulgação\n\nA app atualmente não envia dados diretamente a prestadores de cuidados de saúde.';

  @override
  String get userRights => 'Seus Direitos de Dados';

  @override
  String get userRightsText =>
      'Você tem direito a:\n\n• Acesso: Ver todos os seus dados\n• Portabilidade: Exportar seus dados\n• Exclusão: Excluir seus dados\n• Revogação: Revogar consentimento\n• Contato: Para consultas sobre privacidade';

  @override
  String get dataSecurity => 'Medidas de Segurança';

  @override
  String get dataSecurityText =>
      'Protegemos os seus dados com os controlos de segurança da nossa stack atual:\n\n• TLS para pedidos na nuvem\n• Firebase Authentication para contas com sessão iniciada\n• Regras do Firestore que restringem o acesso aos seus próprios dados\n• Exportação e eliminação de conta na app\n\nProteções mais fortes, como encriptação completa da base de dados local, ainda estão a ser melhoradas e não são apresentadas como concluídas.';

  @override
  String get medicationPrivacy => 'Lista opcional de apelidos de medicação';

  @override
  String get medicationPrivacyText =>
      'Se ativar a lista opcional de apelidos de medicação, apelidos, horários de lembrete e check-ins ficam neste dispositivo. Quando inicia sessão, também podem sincronizar com a sua conta na nuvem Amplio para os restaurar noutro iPhone. Notificações locais opcionais podem aparecer só neste dispositivo se permitir notificações. Pode apagar estes dados na app (incluindo eliminação de conta). Esta funcionalidade não é aconselhamento médico e não é incluída por predefinição na exportação de dados.';

  @override
  String get contactUs => 'Entre em Contato';

  @override
  String get contactUsText =>
      'A Amplio é operada por um programador individual independente (domínio: ampliocare.com).\n\n• Privacidade / pedidos de dados: privacy@ampliocare.com\n• Apoio ao utilizador: support@ampliocare.com\n• Parcerias clínicas: clinical@ampliocare.com\n• Negócios: hello@ampliocare.com';

  @override
  String get termsOfService => 'Termos de serviço';

  @override
  String get termsIntro => 'Introdução';

  @override
  String get termsIntroText =>
      'Estes Termos de serviço («Termos») são um rascunho de acordo para usar a Amplio, um assistente de treino de reabilitação para iPhone para pessoas que vivem com Parkinson. A Amplio é operada por um programador individual independente. Estes Termos não substituem aconselhamento jurídico profissional.';

  @override
  String get termsAcceptance => 'Aceitação';

  @override
  String get termsAcceptanceText =>
      'Ao iniciar sessão, continuar como convidado ou usar a Amplio de outra forma, aceita estes Termos e a Política de privacidade. Se não concordar, não use a app.';

  @override
  String get termsUseOfApp => 'Utilização da Amplio';

  @override
  String get termsUseOfAppText =>
      'A Amplio fornece ferramentas de treino opcionais como medição do tremor, prática de voz, prática de movimento, resumos de progresso e uma lista opcional de apelidos de medicação (no dispositivo para convidados; pode sincronizar ao iniciar sessão).\n\nAceita usar a app apenas para fins pessoais lícitos e não abusar de sensores, contas ou dados exportados de formas que prejudiquem outros ou violem a lei aplicável.';

  @override
  String get termsMedicalDisclaimer => 'Não é aconselhamento médico';

  @override
  String get termsMedicalDisclaimerText =>
      'A Amplio é uma ajuda de bem-estar e treino de reabilitação. Não diagnostica, trata, cura nem previne Parkinson ou qualquer outra condição.\n\nPontuações, tendências, relatórios e lembretes são apenas para referência pessoal e não substituem o conselho de um médico, fisioterapeuta, terapeuta da fala ou outro profissional qualificado. Procure cuidados profissionais para decisões médicas. Pare qualquer exercício que cause dor, tonturas ou condições inseguras.';

  @override
  String get termsAccounts => 'Contas e dados';

  @override
  String get termsAccountsText =>
      'Pode usar a Amplio com Apple Sign-In, Google Sign-In ou como convidado. É responsável pela atividade na sua conta com sessão iniciada.\n\nPode exportar ou eliminar certos dados na app. Eliminar a conta remove os dados na nuvem associados que controlamos, sujeitos a limites técnicos e legais. Dados de convidado e apenas locais podem permanecer só no seu dispositivo até os limpar.';

  @override
  String get termsLimitation => 'Limitação de responsabilidade';

  @override
  String get termsLimitationText =>
      'Na máxima medida permitida por lei, o programador fornece a Amplio «tal como está», sem garantias de funcionamento ininterrupto ou sem erros.\n\nO programador não é responsável por lesões, perdas ou danos decorrentes da confiança em pontuações de treino, lembretes de medicação falhados, tentativas de exercício ou incapacidade de aceder à app, exceto quando a responsabilidade não possa ser limitada por lei.';

  @override
  String get termsChanges => 'Alterações';

  @override
  String get termsChangesText =>
      'Podemos atualizar estes Termos à medida que a app evolui. A data «Última atualização» mudará então. A utilização continuada após uma atualização significa que aceita os Termos revistos. Alterações materiais devem ser revistas na app quando disponíveis.';

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
  String get exportMedicationConsentTitle => 'Include medication nicknames?';

  @override
  String get exportMedicationConsentBody =>
      'Training records will be exported as a CSV file.\n\nMedication nicknames, reminder times, and check-ins are not included unless you choose Include this time. This is not a prescription or medical record.\n\nCancel to stop. You can still export without medication data.';

  @override
  String get exportMedicationExclude => 'Export without medication';

  @override
  String get exportMedicationInclude => 'Include medication list';

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
  String get medicationListEnable => 'Configurar lista de medicação';

  @override
  String get medicationDisclaimer =>
      'A lista de medicação do Amplio só o ajuda a registar horários por conta própria. Não é aconselhamento médico e não fornece orientação de dosagem. Em modo convidado os dados ficam apenas neste dispositivo. Quando inicia sessão, lembretes e check-ins podem sincronizar com a sua conta Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Compreendo e ativo';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint =>
      'ex. Depois do pequeno-almoço (pode usar um alcunha)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm => 'Remover o registo de hoje deste item?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Hoje $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Desativar lista de medicação';

  @override
  String get medicationCloseConfirm =>
      'Pode ocultar a lista ou também apagar todos os dados de medicação neste dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Ocultar e apagar todos os dados';

  @override
  String get medicationDeleteAllData => 'Apagar dados da lista de medicação';

  @override
  String get medicationDeleteAllDataDescription =>
      'Apagar permanentemente todos os lembretes e registos de medicação neste dispositivo.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Apagar todos os dados da lista de medicação neste dispositivo? Esta ação não pode ser anulada.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'Sem lembretes para hoje. Adicione um em Gerir.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'Apagar este lembrete?';

  @override
  String get medicationNoReminders => 'Ainda sem lembretes';

  @override
  String get medicationDeleteSuccess => 'Dados da lista de medicação apagados';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'Apenas referência de reabilitação. Não é um diagnóstico médico e não substitui o aconselhamento da sua equipa de cuidados.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Objetivos de hoje: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'Esta semana: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Sequência: $days dias';
  }

  @override
  String get reportNoData => 'Ainda não há dados de treino suficientes';

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
  String get movementAbility => 'Treino de movimento';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Último treino · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Última medição · $timeAgo';
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
  String get noMeasurementYet => 'Ainda sem medição';

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
    return '$done/$total repetições';
  }

  @override
  String get medicationSetupPrompt => 'Configurar lembretes de medicação';

  @override
  String get medicationSetupSubtitle =>
      'Neste dispositivo; sincroniza ao iniciar sessão';

  @override
  String get medicationNoUpcoming => 'Sem lembretes pendentes hoje';

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
    return 'Hora de: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Opcional: permita notificações para o Amplio o lembrar nos horários definidos. As notificações ficam neste dispositivo.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'Apenas para referência';

  @override
  String get nonMedicalDisclaimerBody =>
      'As medições mostradas são apenas referência de treino de reabilitação. Não são um diagnóstico médico e não substituem o aconselhamento da sua equipa de saúde.';

  @override
  String get voicePrepHint =>
      'Sente-se confortavelmente. Segure o telemóvel a cerca de 30 cm da boca.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Pratique cerca de $seconds segundos';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Pratique numa divisão silenciosa para melhores resultados';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Mantenha-se em silêncio · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Praticado ${seconds}s';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Meta: ${seconds}s';
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
  String get voiceCompletedTitle => 'Prática concluída';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Tempo no volume alvo';

  @override
  String get voiceCompletedEncourageGood =>
      'Muito bem! Mantenha o hábito de falar em voz alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Boa tentativa. Tente falar um pouco mais alto da próxima vez.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'Este exercício incentiva falar em voz alta para treino vocal. Apenas referência, não é um diagnóstico médico.';

  @override
  String get voiceSessionTooShort =>
      'A sessão foi demasiado curta e não foi guardada';

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
  String get planGoalCompleted => 'Today’s goal is done. Nice work.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'This week: $done/$target sessions';
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

  @override
  String get profileTabTitle => 'Profile';

  @override
  String get profileGuestLabel => 'Guest';

  @override
  String get profileGuestSubtitle =>
      'Signed in locally. Cloud sync is available after you sign in.';

  @override
  String get profileSignedInLabel => 'Signed in';

  @override
  String get profileSectionPreferences => 'Preferences';

  @override
  String get profileSectionAccount => 'Account & data';

  @override
  String get profileSectionLegal => 'Privacy & terms';

  @override
  String get accessibilitySettings => 'Accessibility';

  @override
  String get exitGuestMode => 'Exit guest mode';

  @override
  String get exitGuestModeConfirm =>
      'Leave guest mode? You will need to sign in or continue as a guest again.';

  @override
  String get trainingReminderPageTitle => 'Practice reminders';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody =>
      'A short practice when you can. Missing it is fine.';

  @override
  String get trainingReminderDisclaimer =>
      'Optional local reminders, not a treatment schedule. You can turn them off anytime. Missing a reminder does not change your scores.';

  @override
  String get trainingReminderEnable => 'Remind me to practice';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Time $n';
  }

  @override
  String get trainingReminderAddTime => 'Add a second time';

  @override
  String get trainingReminderRemoveTime => 'Remove this time';

  @override
  String get trainingReminderQuietWeekends => 'Skip weekends';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'No reminders on Saturday or Sunday.';

  @override
  String get trainingReminderPermissionDenied =>
      'Notifications were not allowed. You can enable them later in iPhone Settings.';

  @override
  String get planReminderOff => 'Set a practice reminder';

  @override
  String planReminderOn(String times) {
    return 'Reminders: $times';
  }
}
