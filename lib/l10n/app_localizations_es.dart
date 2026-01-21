// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Por favor, seleccione el entrenamiento que desea realizar';

  @override
  String get tremorTest => 'Prueba de Temblor de Mano';

  @override
  String get gaitAssist => 'Asistencia de Ritmo de Marcha';

  @override
  String get tremorTestTitle => 'Prueba de Temblor de Mano';

  @override
  String get tremorTestInstruction =>
      'Por favor, sostenga el teléfono en su mano y mantenga el brazo quieto durante 30 segundos';

  @override
  String remainingTime(int time) {
    return 'Tiempo restante: $time segundos';
  }

  @override
  String get readyToTest => 'Listo para comenzar la prueba';

  @override
  String get frequency => 'Frecuencia';

  @override
  String get amplitude => 'Amplitud';

  @override
  String get waitingForData => 'Esperando datos...';

  @override
  String get startTest => 'Iniciar Prueba';

  @override
  String get stopTest => 'Detener Prueba';

  @override
  String get testCompleted => 'Prueba Completada';

  @override
  String averageFrequency(String frequency) {
    return 'Frecuencia Promedio: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Amplitud Promedio: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Amplitud Máxima: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Se requiere permiso de sensor para realizar la prueba';

  @override
  String get gaitAssistTitle => 'Asistencia de Ritmo de Marcha';

  @override
  String get gaitInstruction =>
      'Siga el metrónomo para el entrenamiento de marcha';

  @override
  String get tempoSpeed => 'Velocidad del Tempo (BPM)';

  @override
  String get startTraining => 'Iniciar Entrenamiento';

  @override
  String get stopTraining => 'Detener Entrenamiento';

  @override
  String get language => 'Idioma';

  @override
  String get changeLanguage => 'Cambiar Idioma';

  @override
  String get selectLanguage => 'Seleccionar Idioma';

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
}
