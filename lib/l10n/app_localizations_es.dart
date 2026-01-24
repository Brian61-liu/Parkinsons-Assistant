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
  String get tremorTestTitle => 'Prueba de Temblor de Mano';

  @override
  String get tremorTestInstruction =>
      'Por favor, sostenga el teléfono en su mano y mantenga el brazo quieto durante 30 segundos';

  @override
  String remainingTime(int time) {
    return '${time}s restante';
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
  String get language => 'Idioma';

  @override
  String get changeLanguage => 'Cambiar Idioma';

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
  String get tremorSeverity => 'Severidad';

  @override
  String get tremorFrequency => 'Frecuencia';

  @override
  String get avgAmplitude => 'Amplitud Media';

  @override
  String get maxAmp => 'Amplitud Máx';

  @override
  String get variability => 'Variabilidad';

  @override
  String get sampleRate => 'Frecuencia';

  @override
  String get dataPoints => 'Puntos';

  @override
  String get severityNormal => 'Normal';

  @override
  String get severityMild => 'Leve';

  @override
  String get severityModerate => 'Moderado';

  @override
  String get severityModerateSevere => 'Mod-Severo';

  @override
  String get severitySevere => 'Severo';

  @override
  String get appSubtitle =>
      'Tu asistente personal de Parkinson para seguimiento y análisis de movimientos';

  @override
  String get signInWithGoogle => 'Iniciar con Google';

  @override
  String get signingIn => 'Iniciando...';

  @override
  String get privacyNotice =>
      'Al iniciar sesión, aceptas nuestros Términos de Servicio y Política de Privacidad';

  @override
  String get loginError => 'Error de Inicio de Sesión';

  @override
  String get confirm => 'Confirmar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get logout => 'Cerrar Sesión';

  @override
  String get logoutConfirm => '¿Estás seguro de que quieres cerrar sesión?';

  @override
  String welcome(String name) {
    return 'Bienvenido, $name';
  }

  @override
  String get syncToCloud => 'Sincronizar en la Nube';

  @override
  String get dataSynced => 'Datos sincronizados con éxito';

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get privacyPolicyIntro => 'Introducción';

  @override
  String get privacyPolicyIntroText =>
      'Kineo se compromete a proteger su privacidad y datos de salud. Esta política explica cómo recopilamos, usamos, almacenamos y protegemos su información, cumpliendo con HIPAA y RGPD.';

  @override
  String get dataCollection => 'Datos que Recopilamos';

  @override
  String get dataCollectionText =>
      'Recopilamos los siguientes datos:\n\n• Cuenta: Email, nombre (autenticación)\n• Sensores: Datos de movimiento durante pruebas\n• Resultados: Frecuencia, amplitud, severidad\n\nSeguimos el principio de minimización de datos.';

  @override
  String get dataUsage => 'Uso de Datos';

  @override
  String get dataUsageText =>
      'Sus datos se usan únicamente para:\n\n• Proporcionar análisis y seguimiento de temblores\n• Generar informes de salud\n• Mejorar algoritmos (datos anónimos con consentimiento)';

  @override
  String get dataStorage => 'Almacenamiento y Seguridad';

  @override
  String get dataStorageText =>
      'Sus datos se almacenan de forma segura en Google Firebase.\n\n• Cifrado de extremo a extremo\n• TLS 1.3 para todas las transmisiones\n• Controles de acceso estrictos\n• Auditorías de seguridad regulares';

  @override
  String get dataSharing => 'Compartir Datos';

  @override
  String get dataSharingText =>
      'NUNCA vendemos sus datos de salud.\n\nLos datos solo se comparten:\n• Con su consentimiento explícito\n• Con proveedores de salud designados\n• Cuando la ley lo requiere\n\nLos datos anónimos pueden usarse para investigación.';

  @override
  String get userRights => 'Sus Derechos (RGPD)';

  @override
  String get userRightsText =>
      'Según el RGPD, tiene derecho a:\n\n• Acceso: Ver todos sus datos\n• Portabilidad: Exportar sus datos\n• Supresión: Eliminar sus datos\n• Retiro: Retirar consentimiento\n• Reclamación: Presentar quejas ante autoridades';

  @override
  String get dataSecurity => 'Medidas de Seguridad';

  @override
  String get dataSecurityText =>
      'Implementamos múltiples capas de seguridad:\n\n• Cifrado AES-256 en reposo\n• TLS 1.3 en tránsito\n• Autenticación multifactor\n• Pruebas de penetración regulares\n• Registros de auditoría completos\n• Formación de seguridad para empleados';

  @override
  String get contactUs => 'Contáctenos';

  @override
  String get contactUsText => 'Consultas de privacidad: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Última actualización';

  @override
  String get version => 'Versión';

  @override
  String get dataManagement => 'Gestión de Datos';

  @override
  String get gdprRights =>
      'Según RGPD e HIPAA, puede acceder, exportar y eliminar sus datos de salud en cualquier momento.';

  @override
  String get exportData => 'Exportar mis Datos';

  @override
  String get exportDataDescription =>
      'Descargue una copia completa de todos sus datos (formato JSON).';

  @override
  String get export => 'Exportar';

  @override
  String get exporting => 'Exportando...';

  @override
  String get exportSuccess => 'Exportación Exitosa';

  @override
  String get exportSuccessMessage =>
      'Sus datos han sido copiados al portapapeles.';

  @override
  String get deleteAllRecords => 'Eliminar Todos los Registros';

  @override
  String get deleteAllRecordsDescription =>
      'Elimine permanentemente todos sus registros de pruebas. Esta acción no se puede deshacer.';

  @override
  String get deleteAllData => 'Eliminar Todos los Datos';

  @override
  String get deleteAllDataConfirm =>
      '¿Está seguro de eliminar todos los registros? Esta acción es irreversible.';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteSuccess => 'Eliminación Exitosa';

  @override
  String get deleteSuccessMessage =>
      'Todos sus registros han sido eliminados permanentemente.';

  @override
  String get deleteAccount => 'Eliminar Cuenta';

  @override
  String get deleteAccountDescription =>
      'Elimine permanentemente su cuenta y todos los datos asociados.';

  @override
  String get deleteAccountWarning =>
      'Su cuenta y todos los datos serán eliminados permanentemente. Esta acción es irreversible.';

  @override
  String get deleteAccountFinalWarning =>
      'Última advertencia: Después de eliminar, su cuenta y datos se perderán para siempre. ¿Está seguro?';

  @override
  String get finalWarning => 'Última Advertencia';

  @override
  String get deleteForever => 'Eliminar Permanentemente';

  @override
  String get continue_ => 'Continuar';

  @override
  String get error => 'Error';

  @override
  String get settings => 'Configuración';

  @override
  String get testHistory => 'Historial';

  @override
  String get noTestRecords => 'No hay registros de pruebas';

  @override
  String get noTestRecordsHint =>
      'Complete una prueba de temblor para ver sus resultados aquí';

  @override
  String get testDate => 'Fecha de Prueba';

  @override
  String get deleteRecord => 'Eliminar Registro';

  @override
  String get deleteRecordConfirm =>
      '¿Está seguro de eliminar este registro de prueba?';

  @override
  String get recordDeleted => 'Registro eliminado';

  @override
  String get duration => 'Duración';

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
