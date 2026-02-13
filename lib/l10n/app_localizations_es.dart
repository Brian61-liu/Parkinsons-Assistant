// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Por favor, seleccione el entrenamiento que desea realizar';

  @override
  String get clickToStartTest => 'Haga clic para comenzar la prueba';

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
      'Amplio se compromete a proteger su privacidad y datos de salud. Esta política explica cómo recopilamos, usamos, almacenamos y protegemos su información, cumpliendo con HIPAA y RGPD.';

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
  String get changeAvatar => 'Cambiar Avatar';

  @override
  String get selectFromGallery => 'Seleccionar de la Galería';

  @override
  String get takePhoto => 'Tomar Foto';

  @override
  String get avatarUpdated => 'Avatar actualizado exitosamente';

  @override
  String get avatarUpdateFailed => 'Error al actualizar el avatar';

  @override
  String get voiceTraining => 'Entrenamiento de Voz';

  @override
  String get voiceTrainingMainInstruction =>
      'Por favor, sostenga un sonido largo — Ah —';

  @override
  String get voiceTrainingInstruction =>
      'Basado en los principios de la terapia LSVT LOUD, por favor hable en voz alta. El tamaño del círculo cambiará en tiempo real según su volumen. Cuando alcance 75-85 dB, el círculo se volverá verde.';

  @override
  String get voiceTrainingReady => 'Listo para comenzar';

  @override
  String get voiceTrainingCalibrating => 'Calibrando el ruido ambiental...';

  @override
  String get voiceTrainingTooQuiet => '¡Hable más fuerte!';

  @override
  String get voiceTrainingKeepGoing => '¡Bien, siga esforzándose!';

  @override
  String get voiceTrainingExcellent => '¡Excelente! ¡Manténgalo!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Objetivo: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Objetivo: $range dB';
  }

  @override
  String get startListening => 'Iniciar Entrenamiento';

  @override
  String get stopListening => 'Detener Entrenamiento';

  @override
  String get microphonePermissionRequired => 'Se Requiere Permiso de Micrófono';

  @override
  String get microphonePermissionDenied => 'Permiso de micrófono denegado';

  @override
  String get microphonePermissionDeniedMessage =>
      'El permiso del micrófono ha sido denegado permanentemente. Por favor, habilite el permiso del micrófono en la configuración del sistema para usar el entrenamiento de voz.';

  @override
  String get microphoneError => 'Error del micrófono';

  @override
  String get openSettings => 'Abrir Configuración';

  @override
  String get continueAsGuest => 'Continuar como invitado';

  @override
  String get movementTraining => 'Entrenamiento de Movimiento';

  @override
  String get movementTrainingInstruction =>
      'Por favor levante ambos brazos y mantenga la postura correcta';

  @override
  String get armsRaised => 'Brazos Levantados';

  @override
  String get raiseArms => 'Por Favor Levante los Brazos';

  @override
  String get lowerArms => '¡Excelente! Ahora Baje los Brazos';

  @override
  String get successCount => 'Conteo de Éxitos';

  @override
  String get cameraPermissionRequired => 'Permiso de Cámara Requerido';

  @override
  String get cameraPermissionDeniedMessage =>
      'El permiso de cámara ha sido denegado. Por favor habilite el permiso de cámara en la configuración del sistema para usar el entrenamiento de movimiento.';

  @override
  String get setGoal => 'Establecer Objetivo';

  @override
  String get reps => 'repeticiones';

  @override
  String get greatJob => '¡Excelente!';

  @override
  String get goalCompleted => '¡Has completado tu objetivo!';

  @override
  String get playAgain => 'Jugar de Nuevo';

  @override
  String get trainingHistory => 'Historial de Entrenamiento';

  @override
  String get noTrainingRecords => 'Sin Registros de Entrenamiento';

  @override
  String get noTrainingRecordsHint =>
      'Sus registros de entrenamiento aparecerán aquí después de completar una sesión';

  @override
  String get trainingDetails => 'Detalles del Entrenamiento';

  @override
  String get goalStatus => 'Estado del Objetivo';

  @override
  String get goalReached => 'Completado';

  @override
  String get goalNotReached => 'No Completado';

  @override
  String get minutes => 'min';

  @override
  String get selectTrainingType => 'Seleccionar Tipo de Entrenamiento';

  @override
  String get armsRaisedTraining => 'Brazos Levantados';

  @override
  String get legLiftTraining => 'Elevación de Piernas';

  @override
  String get legLiftInstruction =>
      'Por favor levante una pierna, luego bájela para completar una acción';

  @override
  String get lowerLegs => 'Por favor baje las piernas';

  @override
  String get legsRaised => 'Piernas Levantadas';

  @override
  String get raiseLegs => 'Por Favor Levante las Piernas';

  @override
  String get trainingType => 'Tipo de Entrenamiento';
}
