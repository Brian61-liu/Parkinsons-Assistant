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
  String get severityNormal => 'Movimento reduzido';

  @override
  String get severityMild => 'Movimento ligeiro';

  @override
  String get severityModerate => 'Movimento moderado';

  @override
  String get severityModerateSevere => 'Movimento elevado';

  @override
  String get severitySevere => 'Nível de movimento mais elevado';

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
  String get syncing => 'A sincronizar…';

  @override
  String get syncFailed =>
      'Falha na sincronização. Verifique a rede e tente novamente.';

  @override
  String get syncFailedHint =>
      'Falha na sincronização — toque para tentar de novo';

  @override
  String get syncRetry => 'Tentar novamente';

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
      'Protegemos os seus dados com os controlos de segurança disponíveis na nossa arquitetura atual:\n\n• TLS para pedidos à nuvem\n• Firebase Authentication para contas com sessão iniciada\n• Regras do Firestore que restringem o acesso aos seus próprios dados\n• Encriptação AES no dispositivo para campos de saúde locais sensíveis (como amostras do sensor de tremor e alcunhas de medicação), com a chave guardada no Porta-chaves do iOS\n• Exportação na app e eliminação da conta\n\nOs ficheiros exportados são guardados num formato legível para utilização própria. Não alegamos que toda a base de dados local esteja encriptada.';

  @override
  String get medicationPrivacy => 'Lista opcional de apelidos de medicação';

  @override
  String get medicationPrivacyText =>
      'Se ativar a lista opcional de alcunhas de medicação, as alcunhas, os horários dos lembretes e os registos ficam guardados neste dispositivo. Quando inicia sessão, também podem ser sincronizados com a sua conta Amplio na nuvem, para que os possa restaurar noutro iPhone. As notificações locais opcionais só podem ser apresentadas neste dispositivo se permitir as notificações. Pode apagar estes dados na app, incluindo ao eliminar a conta. Esta funcionalidade não é aconselhamento médico e não é incluída na exportação de dados, a menos que dê consentimento separado sempre que exportar.';

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
      'Exporte o seu perfil e os registos de treino como um ficheiro CSV. Pode guardá-lo ou partilhá-lo através da folha de partilha do sistema. As alcunhas de medicação não são incluídas, a menos que dê consentimento para essa exportação.';

  @override
  String get export => 'Exportar';

  @override
  String get exporting => 'Exportando...';

  @override
  String get exportSuccess => 'Exportação Bem-sucedida';

  @override
  String get exportSuccessMessage =>
      'O seu ficheiro CSV está pronto. Utilize a folha de partilha para o guardar em Ficheiros ou enviá-lo. As amostras brutas dos sensores são resumidas apenas pela contagem.';

  @override
  String get exportMedicationConsentTitle => 'Incluir alcunhas de medicação?';

  @override
  String get exportMedicationConsentBody =>
      'Os registos de treino serão exportados como um ficheiro CSV.\n\nAs alcunhas de medicação, os horários dos lembretes e os registos não são incluídos, a menos que escolha Incluir desta vez. Isto não é uma receita nem um registo médico.\n\nSelecione Cancelar para parar. Também pode exportar sem dados de medicação.';

  @override
  String get exportMedicationExclude => 'Exportar sem dados de medicação';

  @override
  String get exportMedicationInclude => 'Incluir lista de medicação';

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
      'Pratique falar com uma voz clara e forte. O tamanho do círculo muda com o seu volume. Ao atingir o intervalo-alvo, o círculo fica verde. Apenas para prática pessoal; não é um tratamento médico.';

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
  String get medicationList => 'Lista de medicação';

  @override
  String get medicationListEnable => 'Configurar lista de medicação';

  @override
  String get medicationDisclaimer =>
      'A lista de medicação do Amplio só o ajuda a registar horários por conta própria. Não é aconselhamento médico e não fornece orientação de dosagem. Em modo convidado os dados ficam apenas neste dispositivo. Quando inicia sessão, lembretes e check-ins podem sincronizar com a sua conta Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Compreendo e ativo';

  @override
  String get medicationLabel => 'Etiqueta';

  @override
  String get medicationLabelHint =>
      'ex. Depois do pequeno-almoço (pode usar um alcunha)';

  @override
  String get medicationTime => 'Hora';

  @override
  String get medicationTaken => 'Tomado';

  @override
  String get medicationUndo => 'Anular';

  @override
  String get medicationUndoConfirm => 'Remover o registo de hoje deste item?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Hoje $done/$total';
  }

  @override
  String get medicationManage => 'Gerir';

  @override
  String get medicationAdd => 'Adicionar lembrete';

  @override
  String get medicationEdit => 'Editar lembrete';

  @override
  String get medicationClose => 'Desativar lista de medicação';

  @override
  String get medicationCloseConfirm =>
      'Pode ocultar a lista ou também apagar todos os dados de medicação neste dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Ocultar apenas';

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
  String get medicationCollapse => 'Recolher';

  @override
  String get medicationExpand => 'Expandir';

  @override
  String get medicationEmptyToday =>
      'Sem lembretes para hoje. Adicione um em Gerir.';

  @override
  String medicationCompletedAt(String time) {
    return 'Registado às $time';
  }

  @override
  String get medicationSave => 'Guardar';

  @override
  String get medicationDeleteReminder => 'Apagar lembrete';

  @override
  String get medicationDeleteReminderConfirm => 'Apagar este lembrete?';

  @override
  String get medicationNoReminders => 'Ainda sem lembretes';

  @override
  String get medicationDeleteSuccess => 'Dados da lista de medicação apagados';

  @override
  String get rehabReport => 'Relatório de reabilitação';

  @override
  String get rehabReportDisclaimer =>
      'Apenas referência de reabilitação. Não é um diagnóstico médico e não substitui o aconselhamento da sua equipa de cuidados.';

  @override
  String get reportOverallScore => 'Pontuação global';

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
  String get handTraining => 'Mão';

  @override
  String get voiceTrainingShort => 'Voz';

  @override
  String get motionTrainingShort => 'Movimento';

  @override
  String get tabHome => 'Início';

  @override
  String get tabPlan => 'Plano';

  @override
  String get tabData => 'Dados';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get comingSoon => 'Brevemente';

  @override
  String trainingStreak(int days) {
    return '$days dias';
  }

  @override
  String get trainingStreakLabel => 'Sequência de treino';

  @override
  String get voiceClarity => 'Clareza da voz';

  @override
  String get handStability => 'Estabilidade da mão';

  @override
  String get movementAbility => 'Treino de movimento';

  @override
  String get medicationReminder => 'Medicação';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Último treino · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Última medição · $timeAgo';
  }

  @override
  String get relativeToday => 'Hoje';

  @override
  String get relativeYesterday => 'Ontem';

  @override
  String relativeDaysAgo(int days) {
    return 'Há $days dias';
  }

  @override
  String get noTrainingYet => 'Ainda sem treinos';

  @override
  String get noMeasurementYet => 'Ainda sem medição';

  @override
  String get tapToStart => 'Toque para iniciar';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 sessão';

  @override
  String get handMeasurementCount => '1 medição';

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
  String get medicationNextDoseLabel => 'Próxima toma';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'Próximo';

  @override
  String get medicationStatusPending => 'Pendente';

  @override
  String medicationNotificationBody(String label) {
    return 'Hora de: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Opcional: permita notificações para o Amplio o lembrar nos horários definidos. As notificações ficam neste dispositivo.';

  @override
  String get recentActivity => 'Atividade recente';

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
  String get voiceLegendTarget => 'Volume-alvo';

  @override
  String get voiceLegendYours => 'O seu volume';

  @override
  String get voiceShowDetail => 'Mostrar valor';

  @override
  String get voiceHideDetail => 'Ocultar valor';

  @override
  String get voiceCompletedTitle => 'Prática concluída';

  @override
  String get voiceCompletedDurationLabel => 'Esta sessão';

  @override
  String get voiceCompletedTargetLabel => 'Tempo no volume alvo';

  @override
  String get voiceCompletedEncourageGood =>
      'Muito bem! Mantenha o hábito de falar em voz alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Boa tentativa. Tente falar um pouco mais alto da próxima vez.';

  @override
  String get voiceRetryButton => 'Praticar novamente';

  @override
  String get voiceFinishButton => 'Concluir';

  @override
  String get voicePracticeFooterHint =>
      'Este exercício incentiva falar em voz alta para treino vocal. Apenas referência, não é um diagnóstico médico.';

  @override
  String get voiceSessionTooShort =>
      'A sessão foi demasiado curta e não foi guardada';

  @override
  String get voiceProtocolPickerTitle => 'Escolha um tipo de prática';

  @override
  String get voiceProtocolSteady => 'Volume constante';

  @override
  String get voiceProtocolSteadyDesc =>
      'Mantenha um «Ah» longo dentro do intervalo de volume-alvo.';

  @override
  String get voiceProtocolLadder => 'Escala de volume';

  @override
  String get voiceProtocolLadderDesc =>
      'Suave → alvo → um pouco mais forte → reduza gradualmente.';

  @override
  String get voiceProtocolMultiSet => '3 séries curtas';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Três rondas curtas com um breve descanso entre elas.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Apenas para prática pessoal de reabilitação. Não é um diagnóstico nem um tratamento.';

  @override
  String get voiceLadderPhaseSoft => 'Fase 1: voz mais suave';

  @override
  String get voiceLadderPhaseTarget => 'Fase 2: volume-alvo';

  @override
  String get voiceLadderPhaseStrong => 'Fase 3: um pouco mais forte';

  @override
  String get voiceLadderPhaseCoolDown => 'Fase 4: reduza gradualmente';

  @override
  String voiceLadderChip(int seconds) {
    return 'Tempo restante da fase: ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Série $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Descanso ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Descanso';

  @override
  String voiceRestBody(int next, int total) {
    return 'A seguir: série $next de $total. Relaxe a voz.';
  }

  @override
  String get tremorDurationPickerTitle => 'Duração da sessão';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Mantenha o telemóvel imóvel durante $seconds segundos. Mantenha o braço estável.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Os níveis de movimento destinam-se apenas a referência pessoal — não são uma avaliação médica.';

  @override
  String get planTodayTitle => 'Prática de hoje';

  @override
  String get planTodaySubtitle =>
      'Sugestões dos seus módulos de treino. Toque para iniciar.';

  @override
  String get planEmptyHint =>
      'Ainda não há sugestões. Experimente um treino no Início.';

  @override
  String get planDomainHand => 'Mão';

  @override
  String get planDomainVoice => 'Voz';

  @override
  String get planDomainMotion => 'Movimento';

  @override
  String planGoalProgress(int done, int target) {
    return 'Hoje: $done/$target sessões';
  }

  @override
  String get planGoalCompleted => 'Concluiu o objetivo de hoje. Bom trabalho.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'Esta semana: $done/$target sessões';
  }

  @override
  String get planOpenTask => 'Iniciar';

  @override
  String get planMotionShelvedNote =>
      'A deteção de movimento é limitada em alguns telemóveis; ainda assim, pode abrir o ecrã de prática.';

  @override
  String get voiceProtocolClarity => 'Frases claras';

  @override
  String get voiceProtocolClarityDesc =>
      'Leia frases curtas em voz alta. A pronúncia não é avaliada.';

  @override
  String get voiceClarityHint =>
      'Leia a frase com clareza. Verificamos apenas se falou, não se o fez «corretamente».';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Frase $current de $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Voz detetada — muito bem';

  @override
  String get voiceClarityWaitingVoice => 'Leia a frase em voz alta';

  @override
  String get voiceClarityNextPhrase => 'Frase seguinte';

  @override
  String get voiceClarityFinish => 'Concluir';

  @override
  String get voiceClarityPhrase1 => 'Bom dia';

  @override
  String get voiceClarityPhrase2 => 'Como está hoje?';

  @override
  String get voiceClarityPhrase3 => 'Passe-me a água, por favor';

  @override
  String get voiceClarityPhrase4 => 'Estou bem';

  @override
  String get voiceClarityPhrase5 => 'Até amanhã';

  @override
  String get handModePickerTitle => 'Tipo de prática';

  @override
  String get handModeStillHold => 'Manter imóvel';

  @override
  String get handModeStillHoldDesc =>
      'Mantenha o telemóvel imóvel enquanto os sensores medem o movimento.';

  @override
  String get handModeObjectHold => 'Segurar um objeto';

  @override
  String get handModeObjectHoldDesc =>
      'Mantenha uma chávena ou uma bola macia estável. Temporizador guiado; sem deteção do objeto.';

  @override
  String get handModeFineMotor => 'Toques com os dedos';

  @override
  String get handModeFineMotorDesc =>
      'Toque em cada dedo com o polegar. Conte os ciclos.';

  @override
  String get handGuidedDisclaimer =>
      'Prática guiada apenas para apoio à reabilitação pessoal. Não é uma avaliação médica.';

  @override
  String get handObjectHoldInstruction =>
      'Sente-se confortavelmente. Segure uma chávena ou uma bola macia com uma mão. Mantenha-a estável sem apertar com força.';

  @override
  String get handObjectHoldStart => 'Começar a segurar';

  @override
  String get handObjectHoldRunning => 'Continue a manter o objeto estável…';

  @override
  String get handObjectHoldDone => 'Exercício concluído';

  @override
  String get handFineMotorInstruction =>
      'Toque com o polegar no indicador, médio, anelar e depois no mindinho. Isso corresponde a um ciclo.';

  @override
  String get handFineMotorMarkCycle => 'Concluí um ciclo';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Ciclos: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Prática concluída';

  @override
  String get handGuidedCompleteBody =>
      'Bom trabalho. Esta sessão é guardada apenas como prática pessoal.';

  @override
  String get dataTabTitle => 'Os seus dados';

  @override
  String get dataTabSubtitle =>
      'Pontuações e tendências semanais de prática para referência pessoal.';

  @override
  String get dataTrendsTitle => 'Esta semana em comparação com a anterior';

  @override
  String get dataOpenFullReport => 'Abrir relatório de reabilitação completo';

  @override
  String get dataRecentSessions => 'Sessões recentes';

  @override
  String dataStreakDays(int days) {
    return 'Sequência de treino: $days dias';
  }

  @override
  String get reportShareButton => 'Partilhar relatório';

  @override
  String get reportShareConsentTitle =>
      'Partilhar o seu resumo de reabilitação?';

  @override
  String get reportShareConsentBody =>
      'Isto cria um ficheiro de texto com as suas pontuações e tendências de prática e, em seguida, abre a folha de partilha do sistema (Mensagens, Mail, Ficheiros, etc.).\n\nApenas para referência pessoal — não é um diagnóstico médico.\n\nDepois de enviar o ficheiro, a Amplio não pode recuperá-lo junto do destinatário. Pode cancelar agora ou não selecionar qualquer destino de partilha no ecrã seguinte.';

  @override
  String get reportShareConsentConfirm => 'Compreendo — continuar';

  @override
  String get reportShareFileTitle => 'Resumo de reabilitação do Amplio Care';

  @override
  String get reportShareSuccess => 'Folha de partilha aberta';

  @override
  String get reportShareFailed =>
      'Não foi possível partilhar o relatório. Tente novamente.';

  @override
  String get reportShareFooterNote =>
      'Cada partilha requer a sua confirmação. A Amplio não envia automaticamente emails a médicos.';

  @override
  String get profileTabTitle => 'Perfil';

  @override
  String get profileGuestLabel => 'Convidado';

  @override
  String get profileGuestSubtitle =>
      'Sessão iniciada localmente. A sincronização na nuvem fica disponível depois de iniciar sessão.';

  @override
  String get profileSignedInLabel => 'Sessão iniciada';

  @override
  String get profileSectionPreferences => 'Preferências';

  @override
  String get profileSectionAccount => 'Conta e dados';

  @override
  String get profileSectionLegal => 'Privacidade e termos';

  @override
  String get accessibilitySettings => 'Acessibilidade';

  @override
  String get exitGuestMode => 'Sair do modo de convidado';

  @override
  String get exitGuestModeConfirm =>
      'Sair do modo de convidado? Terá de iniciar sessão ou continuar novamente como convidado.';

  @override
  String get trainingReminderPageTitle => 'Lembretes de prática';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody =>
      'Faça uma prática breve quando puder. Não faz mal se não a fizer.';

  @override
  String get trainingReminderDisclaimer =>
      'Lembretes locais opcionais, não um horário de tratamento. Pode desativá-los a qualquer momento. Ignorar um lembrete não altera as suas pontuações.';

  @override
  String get trainingReminderEnable => 'Lembrar-me de praticar';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Hora $n';
  }

  @override
  String get trainingReminderAddTime => 'Adicionar uma segunda hora';

  @override
  String get trainingReminderRemoveTime => 'Remover esta hora';

  @override
  String get trainingReminderQuietWeekends => 'Ignorar fins de semana';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'Não haverá lembretes ao sábado nem ao domingo.';

  @override
  String get trainingReminderPermissionDenied =>
      'As notificações não foram permitidas. Pode ativá-las mais tarde nas Definições do iPhone.';

  @override
  String get planReminderOff => 'Configurar um lembrete de prática';

  @override
  String planReminderOn(String times) {
    return 'Lembretes: $times';
  }
}
