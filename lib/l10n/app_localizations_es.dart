// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Amplio Care';

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
  String get severityNormal => 'Movimiento bajo';

  @override
  String get severityMild => 'Movimiento leve';

  @override
  String get severityModerate => 'Movimiento moderado';

  @override
  String get severityModerateSevere => 'Movimiento elevado';

  @override
  String get severitySevere => 'Nivel de movimiento más alto';

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
  String get syncing => 'Sincronizando…';

  @override
  String get syncFailed =>
      'Error de sincronización. Compruebe la red e inténtelo de nuevo.';

  @override
  String get syncFailedHint =>
      'Error de sincronización — toque para reintentar';

  @override
  String get syncRetry => 'Reintentar';

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
      'Amplio Care se compromete a proteger su privacidad y datos de salud. Esta política explica cómo recopilamos, usamos, almacenamos y protegemos su información.';

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
      'Protegemos sus datos con los controles de seguridad disponibles en nuestra arquitectura actual:\n\n• TLS para las solicitudes a la nube\n• Firebase Authentication para las cuentas con sesión iniciada\n• Reglas de Firestore que restringen el acceso a sus propios datos\n• Cifrado AES en el dispositivo para los campos de salud locales sensibles (como las muestras del sensor de temblor y los apodos de medicación), con la clave almacenada en el llavero de iOS\n• Exportación y eliminación de cuentas desde la app\n\nLos archivos que exporta se guardan en un formato legible para su propio uso. No afirmamos que toda la base de datos local esté cifrada.';

  @override
  String get medicationPrivacy => 'Lista opcional de apodos de medicación';

  @override
  String get medicationPrivacyText =>
      'Si activa la lista opcional de apodos de medicación, los apodos, las horas de los recordatorios y los registros se guardan en este dispositivo. Cuando inicia sesión, también pueden sincronizarse con su cuenta en la nube de Amplio Care para restaurarlos en otro iPhone. Las notificaciones locales opcionales solo pueden mostrarse en este dispositivo si concede el permiso para enviar notificaciones. Puede eliminar estos datos desde la app, incluso al eliminar la cuenta. Esta función no es consejo médico y no se incluye en la exportación de datos salvo que dé su consentimiento por separado cada vez que exporte.';

  @override
  String get contactUs => 'Contáctenos';

  @override
  String get contactUsText =>
      'Amplio Care es operado por un desarrollador individual independiente (dominio: ampliocare.com).\n\n• Privacidad / solicitudes de datos: privacy@ampliocare.com\n• Soporte al usuario: support@ampliocare.com\n• Colaboraciones clínicas: clinical@ampliocare.com\n• Negocios: hello@ampliocare.com';

  @override
  String get termsOfService => 'Términos del servicio';

  @override
  String get termsIntro => 'Introducción';

  @override
  String get termsIntroText =>
      'Estos Términos del servicio («Términos») son un borrador de acuerdo para usar Amplio Care, un asistente de entrenamiento de rehabilitación para iPhone para personas que viven con Parkinson. Amplio Care es operado por un desarrollador individual independiente. Estos Términos no sustituyen el asesoramiento jurídico profesional.';

  @override
  String get termsAcceptance => 'Aceptación';

  @override
  String get termsAcceptanceText =>
      'Al iniciar sesión, continuar como invitado o usar Amplio Care de otro modo, acepta estos Términos y la Política de privacidad. Si no está de acuerdo, no use la app.';

  @override
  String get termsUseOfApp => 'Uso de Amplio Care';

  @override
  String get termsUseOfAppText =>
      'Amplio Care ofrece herramientas de entrenamiento opcionales como medición del temblor, práctica de voz, práctica de movimiento, resúmenes de progreso y una lista opcional de apodos de medicación (solo en el dispositivo para invitados; puede sincronizarse al iniciar sesión).\n\nAcepta usar la app solo con fines personales lícitos y no abusar de sensores, cuentas o datos exportados de formas que perjudiquen a otros o violen la ley aplicable.';

  @override
  String get termsMedicalDisclaimer => 'No es consejo médico';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio Care es una ayuda de bienestar y entrenamiento de rehabilitación. No diagnostica, trata, cura ni previene el Parkinson ni ninguna otra afección.\n\nLas puntuaciones, tendencias, informes y recordatorios son solo de referencia personal y no sustituyen el consejo de un médico, fisioterapeuta, logopeda u otro profesional cualificado. Busque atención profesional para decisiones médicas. Detenga cualquier ejercicio que cause dolor, mareo o condiciones inseguras.';

  @override
  String get termsAccounts => 'Cuentas y datos';

  @override
  String get termsAccountsText =>
      'Puede usar Amplio Care con Apple Sign-In, Google Sign-In o como invitado. Usted es responsable de la actividad bajo su cuenta conectada.\n\nPuede exportar o eliminar ciertos datos en la app. Eliminar su cuenta elimina los datos en la nube asociados que controlamos, con sujeción a límites técnicos y legales. Los datos de invitado y solo locales pueden permanecer solo en su dispositivo hasta que los borre.';

  @override
  String get termsLimitation => 'Limitación de responsabilidad';

  @override
  String get termsLimitationText =>
      'En la máxima medida permitida por la ley, el desarrollador proporciona Amplio Care «tal cual», sin garantías de funcionamiento ininterrumpido o sin errores.\n\nEl desarrollador no es responsable de lesiones, pérdidas o daños derivados de confiar en puntuaciones de entrenamiento, recordatorios de medicación omitidos, intentos de ejercicio o la imposibilidad de acceder a la app, salvo cuando la responsabilidad no pueda limitarse por ley.';

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
      'Exporte su perfil y sus registros de entrenamiento como archivo CSV. Puede guardarlo o compartirlo desde la hoja para compartir del sistema. Los apodos de medicación no se incluyen salvo que dé su consentimiento para esa exportación.';

  @override
  String get export => 'Exportar';

  @override
  String get exporting => 'Exportando...';

  @override
  String get exportSuccess => 'Exportación Exitosa';

  @override
  String get exportSuccessMessage =>
      'Su archivo CSV está listo. Use la hoja para compartir para guardarlo en Archivos o enviarlo. Las muestras sin procesar del sensor solo se resumen mediante su cantidad.';

  @override
  String get exportMedicationConsentTitle =>
      '¿Incluir los apodos de medicación?';

  @override
  String get exportMedicationConsentBody =>
      'Los registros de entrenamiento se exportarán como archivo CSV.\n\nLos apodos de medicación, las horas de los recordatorios y los registros no se incluyen salvo que elija Incluir esta vez. Esto no es una receta ni un historial médico.\n\nPulse Cancelar para detenerse. También puede exportar sin datos de medicación.';

  @override
  String get exportMedicationExclude => 'Exportar sin datos de medicación';

  @override
  String get exportMedicationInclude => 'Incluir la lista de medicación';

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
      'Practique hablando con una voz clara y fuerte. El tamaño del círculo cambia según su volumen. Al alcanzar el intervalo objetivo, el círculo se vuelve verde. Solo para práctica personal; no es un tratamiento médico.';

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
  String get medicationList => 'Lista de medicación';

  @override
  String get medicationListEnable => 'Configurar lista de medicación';

  @override
  String get medicationDisclaimer =>
      'La lista de medicación de Amplio Care solo le ayuda a registrar horarios por su cuenta. No es consejo médico y no ofrece orientación sobre dosis. En modo invitado los datos permanecen solo en este dispositivo. Si inicia sesión, los recordatorios y registros pueden sincronizarse con su cuenta Amplio Care.';

  @override
  String get medicationDisclaimerAccept => 'Entiendo y activo';

  @override
  String get medicationLabel => 'Etiqueta';

  @override
  String get medicationLabelHint =>
      'p. ej. Después del desayuno (puede usar un apodo)';

  @override
  String get medicationTime => 'Hora';

  @override
  String get medicationTaken => 'Tomado';

  @override
  String get medicationUndo => 'Deshacer';

  @override
  String get medicationUndoConfirm =>
      '¿Quitar el registro de hoy de este elemento?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Hoy $done/$total';
  }

  @override
  String get medicationManage => 'Gestionar';

  @override
  String get medicationAdd => 'Añadir recordatorio';

  @override
  String get medicationEdit => 'Editar recordatorio';

  @override
  String get medicationClose => 'Desactivar lista de medicación';

  @override
  String get medicationCloseConfirm =>
      'Puede ocultar la lista o también eliminar todos los datos de medicación de este dispositivo.';

  @override
  String get medicationCloseHideOnly => 'Solo ocultar';

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
  String get medicationCollapse => 'Contraer';

  @override
  String get medicationExpand => 'Expandir';

  @override
  String get medicationEmptyToday =>
      'No hay recordatorios para hoy. Añada uno en Gestionar.';

  @override
  String medicationCompletedAt(String time) {
    return 'Registrado a las $time';
  }

  @override
  String get medicationSave => 'Guardar';

  @override
  String get medicationDeleteReminder => 'Eliminar recordatorio';

  @override
  String get medicationDeleteReminderConfirm => '¿Eliminar este recordatorio?';

  @override
  String get medicationNoReminders => 'Aún no hay recordatorios';

  @override
  String get medicationDeleteSuccess =>
      'Datos de la lista de medicación eliminados';

  @override
  String get rehabReport => 'Informe de rehabilitación';

  @override
  String get rehabReportDisclaimer =>
      'Solo como referencia de rehabilitación. No es un diagnóstico médico y no sustituye el consejo de su equipo de atención.';

  @override
  String get reportOverallScore => 'Puntuación global';

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
  String get handTraining => 'Mano';

  @override
  String get voiceTrainingShort => 'Voz';

  @override
  String get motionTrainingShort => 'Movimiento';

  @override
  String get tabHome => 'Inicio';

  @override
  String get tabPlan => 'Plan';

  @override
  String get tabData => 'Datos';

  @override
  String get tabProfile => 'Perfil';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String trainingStreak(int days) {
    return '$days días';
  }

  @override
  String get trainingStreakLabel => 'Racha de entrenamiento';

  @override
  String get voiceClarity => 'Claridad de la voz';

  @override
  String get handStability => 'Estabilidad de la mano';

  @override
  String get movementAbility => 'Entrenamiento de movimiento';

  @override
  String get medicationReminder => 'Medicación';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Último entrenamiento · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Última medición · $timeAgo';
  }

  @override
  String get relativeToday => 'Hoy';

  @override
  String get relativeYesterday => 'Ayer';

  @override
  String relativeDaysAgo(int days) {
    return 'Hace $days días';
  }

  @override
  String get noTrainingYet => 'Aún no hay entrenamientos';

  @override
  String get noMeasurementYet => 'Aún sin medición';

  @override
  String get tapToStart => 'Toque para empezar';

  @override
  String durationSec(int count) {
    return '${count}s';
  }

  @override
  String durationMin(int count) {
    return '$count min';
  }

  @override
  String get voiceSessionCount => '1 sesión';

  @override
  String get handMeasurementCount => '1 medición';

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
  String get medicationNextDoseLabel => 'Próxima toma';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'Próximo';

  @override
  String get medicationStatusPending => 'Pendiente';

  @override
  String medicationNotificationBody(String label) {
    return 'Hora de: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'Opcional: permita notificaciones para que Amplio Care le recuerde a las horas que configure. Las notificaciones permanecen en este dispositivo.';

  @override
  String get recentActivity => 'Actividad reciente';

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
  String get voiceLegendTarget => 'Volumen objetivo';

  @override
  String get voiceLegendYours => 'Su volumen';

  @override
  String get voiceShowDetail => 'Mostrar valor';

  @override
  String get voiceHideDetail => 'Ocultar valor';

  @override
  String get voiceCompletedTitle => 'Práctica completada';

  @override
  String get voiceCompletedDurationLabel => 'Esta sesión';

  @override
  String get voiceCompletedTargetLabel => 'Tiempo en volumen objetivo';

  @override
  String get voiceCompletedEncourageGood =>
      '¡Muy bien! Mantenga el hábito de hablar en voz alta.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Buen intento. Intente hablar un poco más alto la próxima vez.';

  @override
  String get voiceRetryButton => 'Practicar de nuevo';

  @override
  String get voiceFinishButton => 'Finalizar';

  @override
  String get voicePracticeFooterHint =>
      'Este ejercicio fomenta hablar en voz alta para el entrenamiento de la voz. Solo como referencia, no es un diagnóstico médico.';

  @override
  String get voiceSessionTooShort =>
      'La sesión fue demasiado corta y no se guardó';

  @override
  String get voiceProtocolPickerTitle => 'Elija un tipo de práctica';

  @override
  String get voiceProtocolSteady => 'Volumen constante';

  @override
  String get voiceProtocolSteadyDesc =>
      'Mantenga un «Ah» largo dentro del intervalo de volumen objetivo.';

  @override
  String get voiceProtocolLadder => 'Escala de volumen';

  @override
  String get voiceProtocolLadderDesc =>
      'Suave → objetivo → un poco más fuerte → reduzca gradualmente.';

  @override
  String get voiceProtocolMultiSet => '3 series cortas';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Tres rondas cortas con un breve descanso entre ellas.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Solo para práctica personal de rehabilitación. No es un diagnóstico ni un tratamiento.';

  @override
  String get voiceLadderPhaseSoft => 'Fase 1: voz más suave';

  @override
  String get voiceLadderPhaseTarget => 'Fase 2: volumen objetivo';

  @override
  String get voiceLadderPhaseStrong => 'Fase 3: un poco más fuerte';

  @override
  String get voiceLadderPhaseCoolDown => 'Fase 4: reduzca gradualmente';

  @override
  String voiceLadderChip(int seconds) {
    return 'Tiempo restante de la fase: ${seconds}s';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Serie $current/$total · ${seconds}s';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Descanso ${seconds}s';
  }

  @override
  String get voiceRestTitle => 'Descanso';

  @override
  String voiceRestBody(int next, int total) {
    return 'A continuación: serie $next de $total. Relaje la voz.';
  }

  @override
  String get tremorDurationPickerTitle => 'Duración de la sesión';

  @override
  String tremorDurationSeconds(int seconds) {
    return '${seconds}s';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Mantenga el teléfono inmóvil durante $seconds segundos. Mantenga el brazo estable.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Los niveles de movimiento son solo para referencia personal; no constituyen una evaluación médica.';

  @override
  String get planTodayTitle => 'Práctica de hoy';

  @override
  String get planTodaySubtitle =>
      'Sugerencias de sus módulos de entrenamiento. Toque para empezar.';

  @override
  String get planEmptyHint =>
      'Aún no hay sugerencias. Pruebe un entrenamiento desde Inicio.';

  @override
  String get planDomainHand => 'Mano';

  @override
  String get planDomainVoice => 'Voz';

  @override
  String get planDomainMotion => 'Movimiento';

  @override
  String planGoalProgress(int done, int target) {
    return 'Hoy: $done/$target sesiones';
  }

  @override
  String get planGoalCompleted =>
      'Ha completado el objetivo de hoy. Buen trabajo.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'Esta semana: $done/$target sesiones';
  }

  @override
  String get planOpenTask => 'Empezar';

  @override
  String get planMotionShelvedNote =>
      'La detección de movimiento es limitada en algunos teléfonos; aun así puede abrir la pantalla de práctica.';

  @override
  String get voiceProtocolClarity => 'Frases claras';

  @override
  String get voiceProtocolClarityDesc =>
      'Lea frases cortas en voz alta. No se evalúa la pronunciación.';

  @override
  String get voiceClarityHint =>
      'Lea la frase con claridad. Solo comprobamos que haya hablado, no si lo hizo «correctamente».';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Frase $current de $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Voz detectada — muy bien';

  @override
  String get voiceClarityWaitingVoice => 'Lea la frase en voz alta';

  @override
  String get voiceClarityNextPhrase => 'Siguiente frase';

  @override
  String get voiceClarityFinish => 'Finalizar';

  @override
  String get voiceClarityPhrase1 => 'Buenos días';

  @override
  String get voiceClarityPhrase2 => '¿Cómo está hoy?';

  @override
  String get voiceClarityPhrase3 => 'Páseme el agua, por favor';

  @override
  String get voiceClarityPhrase4 => 'Estoy bien';

  @override
  String get voiceClarityPhrase5 => 'Hasta mañana';

  @override
  String get handModePickerTitle => 'Tipo de práctica';

  @override
  String get handModeStillHold => 'Mantener inmóvil';

  @override
  String get handModeStillHoldDesc =>
      'Mantenga el teléfono inmóvil mientras los sensores miden el movimiento.';

  @override
  String get handModeObjectHold => 'Sostener un objeto';

  @override
  String get handModeObjectHoldDesc =>
      'Mantenga estable una taza o una pelota blanda. Temporizador guiado; no se detecta el objeto.';

  @override
  String get handModeFineMotor => 'Toques con los dedos';

  @override
  String get handModeFineMotorDesc =>
      'Toque cada dedo con el pulgar. Usted cuenta los ciclos.';

  @override
  String get handGuidedDisclaimer =>
      'Práctica guiada solo como apoyo para la rehabilitación personal. No es una evaluación médica.';

  @override
  String get handObjectHoldInstruction =>
      'Siéntese cómodamente. Sostenga una taza o una pelota blanda con una mano. Manténgala estable sin apretar con fuerza.';

  @override
  String get handObjectHoldStart => 'Empezar a sostener';

  @override
  String get handObjectHoldRunning => 'Siga manteniéndolo estable…';

  @override
  String get handObjectHoldDone => 'Ejercicio completado';

  @override
  String get handFineMotorInstruction =>
      'Toque con el pulgar el índice, el corazón, el anular y después el meñique. Eso cuenta como un ciclo.';

  @override
  String get handFineMotorMarkCycle => 'He completado un ciclo';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Ciclos: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Práctica completada';

  @override
  String get handGuidedCompleteBody =>
      'Buen trabajo. Esta sesión se guarda únicamente como práctica personal.';

  @override
  String get dataTabTitle => 'Sus datos';

  @override
  String get dataTabSubtitle =>
      'Puntuaciones y tendencias semanales de práctica para referencia personal.';

  @override
  String get dataTrendsTitle => 'Esta semana frente a la anterior';

  @override
  String get dataOpenFullReport =>
      'Abrir el informe de rehabilitación completo';

  @override
  String get dataRecentSessions => 'Sesiones recientes';

  @override
  String dataStreakDays(int days) {
    return 'Racha de entrenamiento: $days días';
  }

  @override
  String get reportShareButton => 'Compartir informe';

  @override
  String get reportShareConsentTitle =>
      '¿Compartir su resumen de rehabilitación?';

  @override
  String get reportShareConsentBody =>
      'Esto crea un archivo de texto con sus puntuaciones y tendencias de práctica y después abre la hoja para compartir del sistema (Mensajes, Mail, Archivos, etc.).\n\nSolo para referencia personal; no es un diagnóstico médico.\n\nUna vez enviado el archivo, Amplio Care no puede recuperarlo del destinatario. Puede cancelar ahora o no seleccionar ningún destino en la pantalla siguiente.';

  @override
  String get reportShareConsentConfirm => 'Entiendo; continuar';

  @override
  String get reportShareFileTitle => 'Resumen de rehabilitación de Amplio Care';

  @override
  String get reportShareSuccess => 'Se abrió la hoja para compartir';

  @override
  String get reportShareFailed =>
      'No se pudo compartir el informe. Inténtelo de nuevo.';

  @override
  String get reportShareFooterNote =>
      'Cada vez que comparta se requerirá su confirmación. Amplio Care no envía correos automáticamente a los médicos.';

  @override
  String get profileTabTitle => 'Perfil';

  @override
  String get profileGuestLabel => 'Invitado';

  @override
  String get profileGuestSubtitle =>
      'Sesión iniciada localmente. La sincronización en la nube estará disponible cuando inicie sesión.';

  @override
  String get profileSignedInLabel => 'Sesión iniciada';

  @override
  String get profileSectionPreferences => 'Preferencias';

  @override
  String get profileSectionAccount => 'Cuenta y datos';

  @override
  String get profileSectionLegal => 'Privacidad y términos';

  @override
  String get accessibilitySettings => 'Accesibilidad';

  @override
  String get exitGuestMode => 'Salir del modo invitado';

  @override
  String get exitGuestModeConfirm =>
      '¿Salir del modo invitado? Tendrá que iniciar sesión o volver a continuar como invitado.';

  @override
  String get trainingReminderPageTitle => 'Recordatorios de práctica';

  @override
  String get trainingReminderTitle => 'Amplio Care';

  @override
  String get trainingReminderBody =>
      'Haga una práctica breve cuando pueda. No pasa nada si se la salta.';

  @override
  String get trainingReminderDisclaimer =>
      'Recordatorios locales opcionales; no constituyen un horario de tratamiento. Puede desactivarlos en cualquier momento. Omitir un recordatorio no modifica sus puntuaciones.';

  @override
  String get trainingReminderEnable => 'Recordarme que practique';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Hora $n';
  }

  @override
  String get trainingReminderAddTime => 'Añadir una segunda hora';

  @override
  String get trainingReminderRemoveTime => 'Eliminar esta hora';

  @override
  String get trainingReminderQuietWeekends => 'Omitir los fines de semana';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'No habrá recordatorios los sábados ni los domingos.';

  @override
  String get trainingReminderPermissionDenied =>
      'No se permitieron las notificaciones. Puede activarlas más adelante en Ajustes del iPhone.';

  @override
  String get planReminderOff => 'Configurar un recordatorio de práctica';

  @override
  String planReminderOn(String times) {
    return 'Recordatorios: $times';
  }
}
