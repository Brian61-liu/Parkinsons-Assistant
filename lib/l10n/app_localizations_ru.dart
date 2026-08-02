// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining =>
      'Пожалуйста, выберите упражнение, которое хотите выполнить';

  @override
  String get clickToStartTest => 'Нажмите, чтобы начать тест';

  @override
  String get clickToStartTraining => 'Нажмите, чтобы начать тренировку';

  @override
  String get tremorTest => 'Тест на Тремор Рук';

  @override
  String get tremorTestTitle => 'Тест на Тремор Рук';

  @override
  String get tremorTestInstruction =>
      'Пожалуйста, держите телефон в руке и держите руку неподвижно в течение 30 секунд';

  @override
  String remainingTime(int time) {
    return 'Осталось $timeс';
  }

  @override
  String get readyToTest => 'Готов к началу теста';

  @override
  String get frequency => 'Частота';

  @override
  String get amplitude => 'Амплитуда';

  @override
  String get waitingForData => 'Ожидание данных...';

  @override
  String get startTest => 'Начать Тест';

  @override
  String get stopTest => 'Остановить Тест';

  @override
  String get tremorTestCancelledNoSave => 'Тест отменён, запись не сохранена';

  @override
  String get testCompleted => 'Тест Завершен';

  @override
  String averageFrequency(String frequency) {
    return 'Средняя Частота: $frequency Гц';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Средняя Амплитуда: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Максимальная Амплитуда: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Для выполнения теста требуется разрешение датчика';

  @override
  String get language => 'Язык';

  @override
  String get changeLanguage => 'Изменить Язык';

  @override
  String get selectLanguage => 'Язык';

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
  String get realtimeWaveform => 'Волна';

  @override
  String get waveformAxisTime => 'Время';

  @override
  String get waveformAxisAmplitude => 'Амплитуда';

  @override
  String get waveformHint => 'Чем выше волна — тем заметнее дрожание руки';

  @override
  String get tremorSeverity => 'Тяжесть';

  @override
  String get tremorFrequency => 'Частота';

  @override
  String get avgAmplitude => 'Ср. Ампл.';

  @override
  String get maxAmp => 'Макс Ампл.';

  @override
  String get variability => 'Изменчив.';

  @override
  String get sampleRate => 'Частота';

  @override
  String get dataPoints => 'Данные';

  @override
  String get severityNormal => 'Норма';

  @override
  String get severityMild => 'Легко';

  @override
  String get severityModerate => 'Умеренно';

  @override
  String get severityModerateSevere => 'Ум-Тяжело';

  @override
  String get severitySevere => 'Тяжело';

  @override
  String get appSubtitle =>
      'Ваш персональный помощник при болезни Паркинсона для отслеживания и анализа движений';

  @override
  String get signInWithGoogle => 'Войти через Google';

  @override
  String get signInWithApple => 'Войти через Apple';

  @override
  String get signingIn => 'Вход...';

  @override
  String get privacyNotice =>
      'Входя, вы соглашаетесь с нашими Условиями обслуживания и Политикой конфиденциальности';

  @override
  String get loginError => 'Ошибка Входа';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get cancel => 'Отмена';

  @override
  String get logout => 'Выйти';

  @override
  String get logoutConfirm => 'Вы уверены, что хотите выйти?';

  @override
  String welcome(String name) {
    return 'Добро пожаловать, $name';
  }

  @override
  String get syncToCloud => 'Синхронизация с облаком';

  @override
  String get dataSynced => 'Данные успешно синхронизированы';

  @override
  String get privacyPolicy => 'Политика Конфиденциальности';

  @override
  String get privacyPolicyIntro => 'Введение';

  @override
  String get privacyPolicyIntroText =>
      'Amplio стремится защитить вашу конфиденциальность и данные о здоровье. Эта политика объясняет, как мы собираем, используем, храним и защищаем вашу информацию.';

  @override
  String get dataCollection => 'Собираемые Данные';

  @override
  String get dataCollectionText =>
      'Мы собираем следующие данные:\n\n• Аккаунт: Email, имя (аутентификация)\n• Сенсоры: Данные движения во время тестов\n• Результаты: Частота, амплитуда, тяжесть\n\nМы следуем принципу минимизации данных.';

  @override
  String get dataUsage => 'Использование Данных';

  @override
  String get dataUsageText =>
      'Ваши данные используются исключительно для:\n\n• Предоставления функций реабилитационных тренировок и отслеживания прогресса\n• Показа сводок и отчётов в приложении для личного ознакомления\n• Улучшения приложения только при использовании обезличенных данных с вашего согласия';

  @override
  String get dataStorage => 'Хранение и Безопасность';

  @override
  String get dataStorageText =>
      'При входе данные аккаунта и синхронизированные тренировочные данные могут храниться в Google Firebase. Гостевые и только локальные данные остаются на устройстве.\n\n• HTTPS/TLS для сетевого трафика к облачным сервисам\n• Доступ ограничен вашим аккаунтом и правилами безопасности Firestore\n• Вы можете экспортировать или удалить данные в приложении';

  @override
  String get dataSharing => 'Обмен Данными';

  @override
  String get dataSharingText =>
      'Мы не продаём ваши персональные данные о здоровье.\n\nДанные покидают приложение только когда:\n• Вы явно экспортируете или делитесь файлами сами\n• Закон требует раскрытия\n\nПриложение сейчас не отправляет данные напрямую поставщикам медицинских услуг.';

  @override
  String get userRights => 'Ваши Права на Данные';

  @override
  String get userRightsText =>
      'У вас есть право на:\n\n• Доступ: Просмотр всех данных\n• Переносимость: Экспорт данных\n• Удаление: Удаление данных\n• Отзыв: Отзыв согласия\n• Контакт: По вопросам конфиденциальности';

  @override
  String get dataSecurity => 'Меры Безопасности';

  @override
  String get dataSecurityText =>
      'Мы защищаем ваши данные средствами безопасности текущего стека:\n\n• TLS для облачных запросов\n• Firebase Authentication для вошедших аккаунтов\n• Правила Firestore, ограничивающие доступ вашими данными\n• Экспорт и удаление аккаунта в приложении\n\nБолее сильные меры, такие как полное шифрование локальной базы, всё ещё улучшаются и не заявляются как завершённые.';

  @override
  String get medicationPrivacy => 'Необязательный список прозвищ лекарств';

  @override
  String get medicationPrivacyText =>
      'Если вы включите необязательный список прозвищ лекарств, прозвища, время напоминаний и отметки хранятся только на этом устройстве. Необязательные локальные уведомления могут появляться только на этом устройстве при разрешении уведомлений; они не отправляются на наши серверы. Эти данные можно удалить в приложении. Функция не является медицинской рекомендацией и по умолчанию не включается в экспорт данных.';

  @override
  String get contactUs => 'Связаться с Нами';

  @override
  String get contactUsText =>
      'Amplio управляется независимым индивидуальным разработчиком (домен: ampliocare.com).\n\n• Конфиденциальность / запросы данных: privacy@ampliocare.com\n• Поддержка пользователей: support@ampliocare.com\n• Клинические партнёрства: clinical@ampliocare.com\n• Бизнес: hello@ampliocare.com';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String get termsIntro => 'Введение';

  @override
  String get termsIntroText =>
      'Настоящие Условия использования («Условия») — черновик соглашения об использовании Amplio, iPhone-помощника реабилитационных тренировок для людей с болезнью Паркинсона. Amplio управляется независимым индивидуальным разработчиком. Эти Условия не заменяют профессиональную юридическую консультацию.';

  @override
  String get termsAcceptance => 'Принятие';

  @override
  String get termsAcceptanceText =>
      'Входя в аккаунт, продолжая как гость или иным образом используя Amplio, вы соглашаетесь с этими Условиями и Политикой конфиденциальности. Если вы не согласны, не используйте приложение.';

  @override
  String get termsUseOfApp => 'Использование Amplio';

  @override
  String get termsUseOfAppText =>
      'Amplio предоставляет необязательные инструменты тренировки, такие как измерение тремора, голосовые упражнения, упражнения на движение, сводки прогресса и необязательный список прозвищ лекарств на устройстве.\n\nВы соглашаетесь использовать приложение только в законных личных целях и не злоупотреблять датчиками, аккаунтами или экспортированными данными способами, вредящими другим или нарушающими применимое право.';

  @override
  String get termsMedicalDisclaimer => 'Не медицинская рекомендация';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio — вспомогательное средство для оздоровления и реабилитационных тренировок. Оно не диагностирует, не лечит, не излечивает и не предотвращает болезнь Паркинсона или любое другое состояние.\n\nОценки, тенденции, отчёты и напоминания предназначены только для личного ознакомления и не заменяют совет врача, физиотерапевта, логопеда или другого квалифицированного специалиста. За медицинскими решениями обращайтесь к специалистам. Прекратите упражнение при боли, головокружении или небезопасных условиях.';

  @override
  String get termsAccounts => 'Аккаунты и данные';

  @override
  String get termsAccountsText =>
      'Вы можете использовать Amplio через Apple Sign-In, Google Sign-In или как гость. Вы несёте ответственность за активность под своим вошедшим аккаунтом.\n\nВы можете экспортировать или удалить определённые данные в приложении. Удаление аккаунта удаляет связанные облачные данные, которыми мы управляем, с учётом технических и правовых ограничений. Гостевые и только локальные данные могут оставаться только на устройстве, пока вы их не очистите.';

  @override
  String get termsLimitation => 'Ограничение ответственности';

  @override
  String get termsLimitationText =>
      'В максимальной степени, дозволенной законом, разработчик предоставляет Amplio «как есть» без гарантий бесперебойной или безошибочной работы.\n\nРазработчик не несёт ответственности за травмы, убытки или ущерб вследствие доверия к тренировочным оценкам, пропущенных напоминаний о лекарствах, попыток упражнений или невозможности получить доступ к приложению, кроме случаев, когда ответственность не может быть ограничена законом.';

  @override
  String get termsChanges => 'Изменения';

  @override
  String get termsChangesText =>
      'Мы можем обновлять эти Условия по мере развития приложения. Дата «Последнее обновление» при этом изменится. Продолжение использования после обновления означает принятие пересмотренных Условий. Существенные изменения следует просматривать в приложении, когда они доступны.';

  @override
  String get lastUpdated => 'Последнее обновление';

  @override
  String get version => 'Версия';

  @override
  String get dataManagement => 'Управление Данными';

  @override
  String get gdprRights =>
      'Вы можете получить доступ, экспортировать и удалить свои данные о здоровье в любое время.';

  @override
  String get exportData => 'Экспорт Моих Данных';

  @override
  String get exportDataDescription =>
      'Загрузите полную копию всех ваших данных (формат JSON).';

  @override
  String get export => 'Экспорт';

  @override
  String get exporting => 'Экспорт...';

  @override
  String get exportSuccess => 'Экспорт Успешен';

  @override
  String get exportSuccessMessage => 'Ваши данные скопированы в буфер обмена.';

  @override
  String get deleteAllRecords => 'Удалить Все Записи';

  @override
  String get deleteAllRecordsDescription =>
      'Навсегда удалите все записи тестов. Это действие нельзя отменить.';

  @override
  String get deleteAllData => 'Удалить Все Данные';

  @override
  String get deleteAllDataConfirm =>
      'Вы уверены, что хотите удалить все записи? Это действие необратимо.';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteSuccess => 'Удаление Успешно';

  @override
  String get deleteSuccessMessage => 'Все записи были навсегда удалены.';

  @override
  String get deleteAccount => 'Удалить Аккаунт';

  @override
  String get deleteAccountDescription =>
      'Навсегда удалите свой аккаунт и все связанные данные.';

  @override
  String get deleteAccountWarning =>
      'Ваш аккаунт и все данные будут удалены навсегда. Это действие необратимо.';

  @override
  String get deleteAccountFinalWarning =>
      'Последнее предупреждение: После удаления аккаунт и данные будут потеряны навсегда. Вы уверены?';

  @override
  String get finalWarning => 'Последнее Предупреждение';

  @override
  String get deleteForever => 'Удалить Навсегда';

  @override
  String get continue_ => 'Продолжить';

  @override
  String get error => 'Ошибка';

  @override
  String get settings => 'Настройки';

  @override
  String get testHistory => 'История';

  @override
  String get noTestRecords => 'Нет записей тестов';

  @override
  String get noTestRecordsHint =>
      'Завершите тест на тремор, чтобы увидеть результаты здесь';

  @override
  String get testDate => 'Дата теста';

  @override
  String get deleteRecord => 'Удалить запись';

  @override
  String get deleteRecordConfirm =>
      'Вы уверены, что хотите удалить эту запись теста?';

  @override
  String get recordDeleted => 'Запись удалена';

  @override
  String get duration => 'Длительность';

  @override
  String get seconds => 'с';

  @override
  String get tapToCancel => 'Нажмите для отмены';

  @override
  String get changeAvatar => 'Изменить Аватар';

  @override
  String get selectFromGallery => 'Выбрать из Галереи';

  @override
  String get takePhoto => 'Сделать Фото';

  @override
  String get avatarUpdated => 'Аватар успешно обновлён';

  @override
  String get avatarUpdateFailed => 'Не удалось обновить аватар';

  @override
  String get voiceTraining => 'Голосовая Тренировка';

  @override
  String get voiceTrainingMainInstruction =>
      'Пожалуйста, удерживайте длинный звук — Ах —';

  @override
  String get voiceTrainingInstruction =>
      'Основываясь на принципах терапии LSVT LOUD, пожалуйста, говорите громко. Размер круга будет изменяться в реальном времени в зависимости от вашей громкости. Когда он достигнет 75-85 дБ, круг станет зелёным.';

  @override
  String get voiceTrainingReady => 'Готов к началу';

  @override
  String get voiceTrainingCalibrating => 'Калибровка фонового шума...';

  @override
  String get voiceTrainingTooQuiet => 'Говорите громче!';

  @override
  String get voiceTrainingKeepGoing => 'Хорошо, продолжайте!';

  @override
  String get voiceTrainingExcellent => 'Отлично! Продолжайте!';

  @override
  String voiceTrainingTarget(String target) {
    return 'Цель: $target дБ';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return 'Цель: $range дБ';
  }

  @override
  String get startListening => 'Начать Тренировку';

  @override
  String get stopListening => 'Остановить Тренировку';

  @override
  String get microphonePermissionRequired => 'Требуется Разрешение Микрофона';

  @override
  String get microphonePermissionDenied => 'Разрешение микрофона отклонено';

  @override
  String get microphonePermissionDeniedMessage =>
      'Разрешение микрофона было отклонено навсегда. Пожалуйста, включите разрешение микрофона в настройках системы, чтобы использовать голосовую тренировку.';

  @override
  String get microphoneError => 'Ошибка микрофона';

  @override
  String get openSettings => 'Открыть Настройки';

  @override
  String get continueAsGuest => 'Продолжить как гость';

  @override
  String get movementTraining => 'Тренировка Движений';

  @override
  String get movementTrainingInstruction =>
      'Пожалуйста, поднимите обе руки и сохраните правильную осанку';

  @override
  String get armsRaised => 'Руки Подняты';

  @override
  String get raiseArms => 'Пожалуйста, Поднимите Руки';

  @override
  String get lowerArms => 'Отлично! Теперь Опустите Руки';

  @override
  String get successCount => 'Количество Успехов';

  @override
  String get cameraPermissionRequired => 'Требуется Разрешение Камеры';

  @override
  String get cameraPermissionDeniedMessage =>
      'Разрешение камеры было отклонено. Пожалуйста, включите разрешение камеры в настройках системы для использования тренировки движений.';

  @override
  String get setGoal => 'Установить Цель';

  @override
  String get reps => 'повторений';

  @override
  String get greatJob => 'Отличная Работа!';

  @override
  String get goalCompleted => 'Вы достигли своей цели!';

  @override
  String get playAgain => 'Играть Снова';

  @override
  String get trainingHistory => 'История Тренировок';

  @override
  String get noTrainingRecords => 'Нет Записей Тренировок';

  @override
  String get noTrainingRecordsHint =>
      'Ваши записи тренировок появятся здесь после завершения сессии';

  @override
  String get trainingDetails => 'Детали Тренировки';

  @override
  String get goalStatus => 'Статус Цели';

  @override
  String get goalReached => 'Завершено';

  @override
  String get goalNotReached => 'Не Завершено';

  @override
  String get minutes => 'мин';

  @override
  String get selectTrainingType => 'Выбрать Тип Тренировки';

  @override
  String get armsRaisedTraining => 'Поднятие Рук';

  @override
  String get legLiftTraining => 'Поднятие Ног';

  @override
  String get legLiftInstruction =>
      'Пожалуйста, поднимите одну ногу, затем опустите её, чтобы завершить одно действие';

  @override
  String get lowerLegs => 'Пожалуйста, опустите ноги';

  @override
  String get legsRaised => 'Ноги Подняты';

  @override
  String get raiseLegs => 'Пожалуйста, Поднимите Ноги';

  @override
  String get trainingType => 'Тип Тренировки';

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
