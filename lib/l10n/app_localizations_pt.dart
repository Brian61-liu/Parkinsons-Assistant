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
  String get selectLanguage => 'Selecionar Idioma';

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
}
