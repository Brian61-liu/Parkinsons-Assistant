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
  String get clickToStartTraining => 'Haga clic para comenzar el entrenamiento';

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
  String get tremorTestCancelledNoSave =>
      'Prueba cancelada, registro no guardado';

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
  String get waveformAxisTime => 'Tiempo';

  @override
  String get waveformAxisAmplitude => 'Amplitud';

  @override
  String get waveformHint => 'Onda más alta = temblor más notable';

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
  String get signInWithApple => 'Iniciar con Apple';

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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed =>
      'Error de sincronización. Compruebe la red e inténtelo de nuevo.';

  @override
  String get syncFailedHint =>
      'Error de sincronización — toque para reintentar';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'Inicie sesión para usar la sincronización en la nube';

  @override
  String lastSyncedAt(String time) {
    return 'Última sincronización: $time';
  }

  @override
  String get privacyPolicy => 'Política de Privacidad';

  @override
  String get privacyPolicyIntro => 'Introducción';

  @override
  String get privacyPolicyIntroText =>
      'Amplio se compromete a proteger su privacidad y datos de salud. Esta política explica cómo recopilamos, usamos, almacenamos y protegemos su información.';

  @override
  String get dataCollection => 'Datos que Recopilamos';

  @override
  String get dataCollectionText =>
      'Recopilamos los siguientes datos:\n\n• Cuenta: Email, nombre (autenticación)\n• Sensores: Datos de movimiento durante pruebas\n• Resultados: Frecuencia, amplitud, severidad\n\nSeguimos el principio de minimización de datos.';

  @override
  String get dataUsage => 'Uso de Datos';

  @override
  String get dataUsageText =>
      'Sus datos se usan únicamente para:\n\n• Proporcionar funciones de entrenamiento de rehabilitación y seguimiento del progreso\n• Mostrar resúmenes e informes en la app para su referencia personal\n• Mejorar la app solo si usamos datos anonimizados con su consentimiento';

  @override
  String get dataStorage => 'Almacenamiento y Seguridad';

  @override
  String get dataStorageText =>
      'Al iniciar sesión, la cuenta y los datos de entrenamiento sincronizados pueden almacenarse en Google Firebase. Los datos de invitado y solo locales permanecen en su dispositivo.\n\n• HTTPS/TLS para el tráfico de red hacia nuestros servicios en la nube\n• Acceso limitado por su cuenta y las reglas de seguridad de Firestore\n• Puede exportar o eliminar datos desde la app';

  @override
  String get dataSharing => 'Compartir Datos';

  @override
  String get dataSharingText =>
      'No vendemos sus datos personales de salud.\n\nLos datos salen de la app solo cuando:\n• Usted exporta o comparte archivos explícitamente\n• La ley exige la divulgación\n\nLa app actualmente no envía datos directamente a proveedores de atención sanitaria.';

  @override
  String get userRights => 'Sus Derechos de Datos';

  @override
  String get userRightsText =>
      'Tiene derecho a:\n\n• Acceso: Ver todos sus datos\n• Portabilidad: Exportar sus datos\n• Supresión: Eliminar sus datos\n• Retiro: Retirar consentimiento\n• Contacto: Para consultas de privacidad';

  @override
  String get dataSecurity => 'Medidas de Seguridad';

  @override
  String get dataSecurityText =>
      'Protegemos sus datos con los controles de seguridad de nuestra pila actual:\n\n• TLS para solicitudes en la nube\n• Firebase Authentication para cuentas conectadas\n• Reglas de Firestore que restringen el acceso a sus propios datos\n• Exportación y eliminación de cuenta en la app\n\nProtecciones más fuertes, como el cifrado completo de la base de datos local, siguen mejorándose y no se presentan como completas.';

  @override
  String get medicationPrivacy => 'Lista opcional de apodos de medicación';

  @override
  String get medicationPrivacyText =>
      'Si activa la lista opcional de apodos de medicación, los apodos, horas de recordatorio y registros se guardan en este dispositivo. Si inicia sesión, también pueden sincronizarse con su cuenta en la nube de Amplio para restaurarlos en otro iPhone. Las notificaciones locales opcionales solo se muestran en este dispositivo si concede el permiso. Puede eliminar estos datos en la app (incluida la eliminación de cuenta). Esta función no es consejo médico y no se incluye por defecto en la exportación de datos.';

  @override
  String get contactUs => 'Contáctenos';

  @override
  String get contactUsText =>
      'Amplio es operado por un desarrollador individual independiente (dominio: ampliocare.com).\n\n• Privacidad / solicitudes de datos: privacy@ampliocare.com\n• Soporte al usuario: support@ampliocare.com\n• Colaboraciones clínicas: clinical@ampliocare.com\n• Negocios: hello@ampliocare.com';

  @override
  String get termsOfService => 'Términos del servicio';

  @override
  String get termsIntro => 'Introducción';

  @override
  String get termsIntroText =>
      'Estos Términos del servicio («Términos») son un borrador de acuerdo para usar Amplio, un asistente de entrenamiento de rehabilitación para iPhone para personas que viven con Parkinson. Amplio es operado por un desarrollador individual independiente. Estos Términos no sustituyen el asesoramiento jurídico profesional.';

  @override
  String get termsAcceptance => 'Aceptación';

  @override
  String get termsAcceptanceText =>
      'Al iniciar sesión, continuar como invitado o usar Amplio de otro modo, acepta estos Términos y la Política de privacidad. Si no está de acuerdo, no use la app.';

  @override
  String get termsUseOfApp => 'Uso de Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio ofrece herramientas de entrenamiento opcionales como medición del temblor, práctica de voz, práctica de movimiento, resúmenes de progreso y una lista opcional de apodos de medicación (solo en el dispositivo para invitados; puede sincronizarse al iniciar sesión).\n\nAcepta usar la app solo con fines personales lícitos y no abusar de sensores, cuentas o datos exportados de formas que perjudiquen a otros o violen la ley aplicable.';

  @override
  String get termsMedicalDisclaimer => 'No es consejo médico';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio es una ayuda de bienestar y entrenamiento de rehabilitación. No diagnostica, trata, cura ni previene el Parkinson ni ninguna otra afección.\n\nLas puntuaciones, tendencias, informes y recordatorios son solo de referencia personal y no sustituyen el consejo de un médico, fisioterapeuta, logopeda u otro profesional cualificado. Busque atención profesional para decisiones médicas. Detenga cualquier ejercicio que cause dolor, mareo o condiciones inseguras.';

  @override
  String get termsAccounts => 'Cuentas y datos';

  @override
  String get termsAccountsText =>
      'Puede usar Amplio con Apple Sign-In, Google Sign-In o como invitado. Usted es responsable de la actividad bajo su cuenta conectada.\n\nPuede exportar o eliminar ciertos datos en la app. Eliminar su cuenta elimina los datos en la nube asociados que controlamos, con sujeción a límites técnicos y legales. Los datos de invitado y solo locales pueden permanecer solo en su dispositivo hasta que los borre.';

  @override
  String get termsLimitation => 'Limitación de responsabilidad';

  @override
  String get termsLimitationText =>
      'En la máxima medida permitida por la ley, el desarrollador proporciona Amplio «tal cual», sin garantías de funcionamiento ininterrumpido o sin errores.\n\nEl desarrollador no es responsable de lesiones, pérdidas o daños derivados de confiar en puntuaciones de entrenamiento, recordatorios de medicación omitidos, intentos de ejercicio o la imposibilidad de acceder a la app, salvo cuando la responsabilidad no pueda limitarse por ley.';

  @override
  String get termsChanges => 'Cambios';

  @override
  String get termsChangesText =>
      'Podemos actualizar estos Términos a medida que evoluciona la app. La fecha de «Última actualización» cambiará entonces. El uso continuado tras una actualización significa que acepta los Términos revisados. Los cambios materiales deben revisarse en la app cuando estén disponibles.';

  @override
  String get lastUpdated => 'Última actualización';

  @override
  String get version => 'Versión';

  @override
  String get dataManagement => 'Gestión de Datos';

  @override
  String get gdprRights =>
      'Puede acceder, exportar y eliminar sus datos de salud en cualquier momento.';

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

  @override
  String get medicationList => 'Medication list';

  @override
  String get medicationListEnable => 'Configurar lista de medicación';

  @override
  String get medicationDisclaimer =>
      'La lista de medicación de Amplio solo le ayuda a registrar horarios por su cuenta. No es consejo médico y no ofrece orientación sobre dosis. En modo invitado los datos permanecen solo en este dispositivo. Si inicia sesión, los recordatorios y registros pueden sincronizarse con su cuenta Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Entiendo y activo';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint =>
      'p. ej. Después del desayuno (puede usar un apodo)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm =>
      '¿Quitar el registro de hoy de este elemento?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Hoy $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Desactivar lista de medicación';

  @override
  String get medicationCloseConfirm =>
      'Puede ocultar la lista o también eliminar todos los datos de medicación de este dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Ocultar y eliminar todos los datos';

  @override
  String get medicationDeleteAllData =>
      'Eliminar datos de la lista de medicación';

  @override
  String get medicationDeleteAllDataDescription =>
      'Eliminar permanentemente todos los recordatorios y registros de medicación de este dispositivo.';

  @override
  String get medicationDeleteAllDataConfirm =>
      '¿Eliminar todos los datos de la lista de medicación de este dispositivo? Esta acción no se puede deshacer.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'No hay recordatorios para hoy. Añada uno en Gestionar.';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => '¿Eliminar este recordatorio?';

  @override
  String get medicationNoReminders => 'Aún no hay recordatorios';

  @override
  String get medicationDeleteSuccess =>
      'Datos de la lista de medicación eliminados';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'Solo como referencia de rehabilitación. No es un diagnóstico médico y no sustituye el consejo de su equipo de atención.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Objetivos de hoy: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'Esta semana: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Racha: $days días';
  }

  @override
  String get reportNoData => 'Aún no hay suficientes datos de entrenamiento';

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
  String get movementAbility => 'Entrenamiento de movimiento';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Último entrenamiento · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Última medición · $timeAgo';
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
  String get noMeasurementYet => 'Aún sin medición';

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
    return '$done/$total repeticiones';
  }

  @override
  String get medicationSetupPrompt => 'Configurar recordatorios de medicación';

  @override
  String get medicationSetupSubtitle =>
      'En este dispositivo; se sincroniza al iniciar sesión';

  @override
  String get medicationNoUpcoming => 'No hay recordatorios pendientes hoy';

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
      'Opcional: permita notificaciones para que Amplio le recuerde a las horas que configure. Las notificaciones permanecen en este dispositivo.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'Solo como referencia';

  @override
  String get nonMedicalDisclaimerBody =>
      'Las mediciones mostradas son solo una referencia de entrenamiento de rehabilitación. No son un diagnóstico médico y no sustituyen el consejo de su equipo sanitario.';

  @override
  String get voicePrepHint =>
      'Siéntese cómodamente. Mantenga el teléfono a unos 30 cm de la boca.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Practique unos $seconds segundos';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Practique en una habitación silenciosa para mejores resultados';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Permanezca en silencio · ${seconds}s';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Practicado ${seconds}s';
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
  String get voiceCompletedTitle => 'Práctica completada';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Tiempo en volumen objetivo';

  @override
  String get voiceCompletedEncourageGood =>
      '¡Muy bien! Mantenga el hábito de hablar en voz alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Buen intento. Intente hablar un poco más alto la próxima vez.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'Este ejercicio fomenta hablar en voz alta para el entrenamiento de la voz. Solo como referencia, no es un diagnóstico médico.';

  @override
  String get voiceSessionTooShort =>
      'La sesión fue demasiado corta y no se guardó';

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
}
