// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Por favor, selecione o treinamento que deseja realizar';

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
      'A Kineo está comprometida em proteger sua privacidade e dados de saúde. Esta política explica como coletamos, usamos, armazenamos e protegemos suas informações, em conformidade com HIPAA e LGPD.';

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
  String get userRights => 'Seus Direitos (LGPD)';

  @override
  String get userRightsText =>
      'Segundo a LGPD, você tem direito a:\n\n• Acesso: Ver todos os seus dados\n• Portabilidade: Exportar seus dados\n• Exclusão: Excluir seus dados\n• Revogação: Revogar consentimento\n• Reclamação: Apresentar queixas às autoridades';

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
      'Segundo LGPD e HIPAA, você pode acessar, exportar e excluir seus dados de saúde a qualquer momento.';

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
  String get changeAvatar => 'Change Avatar';

  @override
  String get selectFromGallery => 'Select from Gallery';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get avatarUpdated => 'Avatar updated successfully';

  @override
  String get avatarUpdateFailed => 'Failed to update avatar';
}
