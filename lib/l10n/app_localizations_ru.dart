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
  String get syncing => 'Syncing…';

  @override
  String get syncFailed =>
      'Сбой синхронизации. Проверьте сеть и попробуйте снова.';

  @override
  String get syncFailedHint => 'Сбой синхронизации — нажмите, чтобы повторить';

  @override
  String get syncRetry => 'Retry';

  @override
  String get loginRequiredForSync =>
      'Войдите в аккаунт, чтобы использовать облачную синхронизацию';

  @override
  String lastSyncedAt(String time) {
    return 'Последняя синхронизация: $time';
  }

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
      'Если вы включите необязательный список прозвищ лекарств, прозвища, время напоминаний и отметки хранятся на этом устройстве. При входе они также могут синхронизироваться с облачным аккаунтом Amplio для восстановления на другом iPhone. Необязательные локальные уведомления могут появляться только на этом устройстве при разрешении уведомлений. Эти данные можно удалить в приложении (включая удаление аккаунта). Функция не является медицинской рекомендацией и по умолчанию не включается в экспорт данных.';

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
      'Amplio предоставляет необязательные инструменты тренировки, такие как измерение тремора, голосовые упражнения, упражнения на движение, сводки прогресса и необязательный список прозвищ лекарств (на устройстве для гостей; синхронизация возможна при входе).\n\nВы соглашаетесь использовать приложение только в законных личных целях и не злоупотреблять датчиками, аккаунтами или экспортированными данными способами, вредящими другим или нарушающими применимое право.';

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
  String get medicationListEnable => 'Настроить список лекарств';

  @override
  String get medicationDisclaimer =>
      'Список лекарств Amplio помогает только самостоятельно отмечать время приёма. Это не медицинская рекомендация и не содержит указаний по дозировке. В гостевом режиме данные хранятся только на этом устройстве. При входе напоминания и отметки могут синхронизироваться с вашим аккаунтом Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Понимаю и включаю';

  @override
  String get medicationLabel => 'Label';

  @override
  String get medicationLabelHint =>
      'напр. После завтрака (можно использовать прозвище)';

  @override
  String get medicationTime => 'Time';

  @override
  String get medicationTaken => 'Taken';

  @override
  String get medicationUndo => 'Undo';

  @override
  String get medicationUndoConfirm =>
      'Удалить сегодняшнюю отметку для этого пункта?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Сегодня $done/$total';
  }

  @override
  String get medicationManage => 'Manage';

  @override
  String get medicationAdd => 'Add reminder';

  @override
  String get medicationEdit => 'Edit reminder';

  @override
  String get medicationClose => 'Отключить список лекарств';

  @override
  String get medicationCloseConfirm =>
      'Можно скрыть список или также удалить все данные о лекарствах на этом устройстве.';

  @override
  String get medicationCloseHideOnly => 'Hide only';

  @override
  String get medicationCloseAndDelete => 'Скрыть и удалить все данные';

  @override
  String get medicationDeleteAllData => 'Удалить данные списка лекарств';

  @override
  String get medicationDeleteAllDataDescription =>
      'Навсегда удалить все напоминания и отметки о лекарствах на этом устройстве.';

  @override
  String get medicationDeleteAllDataConfirm =>
      'Удалить все данные списка лекарств на этом устройстве? Это действие нельзя отменить.';

  @override
  String get medicationCollapse => 'Collapse';

  @override
  String get medicationExpand => 'Expand';

  @override
  String get medicationEmptyToday =>
      'Нет напоминаний на сегодня. Добавьте в разделе «Управление».';

  @override
  String medicationCompletedAt(String time) {
    return 'Done at $time';
  }

  @override
  String get medicationSave => 'Save';

  @override
  String get medicationDeleteReminder => 'Delete reminder';

  @override
  String get medicationDeleteReminderConfirm => 'Удалить это напоминание?';

  @override
  String get medicationNoReminders => 'Пока нет напоминаний';

  @override
  String get medicationDeleteSuccess => 'Данные списка лекарств удалены';

  @override
  String get rehabReport => 'Rehab report';

  @override
  String get rehabReportDisclaimer =>
      'Только для реабилитационной справки. Не является медицинским диагнозом и не заменяет рекомендации вашей команды ухода.';

  @override
  String get reportOverallScore => 'Overall score';

  @override
  String reportDailyProgress(int percent) {
    return 'Цели на сегодня: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return 'На этой неделе: $percent%';
  }

  @override
  String reportStreak(int days) {
    return 'Серия: $days дн.';
  }

  @override
  String get reportNoData => 'Пока недостаточно данных тренировок';

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
  String get movementAbility => 'Тренировка движений';

  @override
  String get medicationReminder => 'Medication';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Последняя тренировка · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Последнее измерение · $timeAgo';
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
  String get noMeasurementYet => 'Ещё нет измерений';

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
    return '$done/$total повт.';
  }

  @override
  String get medicationSetupPrompt => 'Настроить напоминания о лекарствах';

  @override
  String get medicationSetupSubtitle =>
      'На устройстве; синхронизация при входе';

  @override
  String get medicationNoUpcoming => 'Сегодня нет предстоящих напоминаний';

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
    return 'Время для: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'По желанию: разрешите уведомления, чтобы Amplio напоминал в заданное вами время. Уведомления остаются на этом устройстве.';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get nonMedicalDisclaimerTitle => 'Только для справки';

  @override
  String get nonMedicalDisclaimerBody =>
      'Показанные измерения предназначены только как справка для реабилитационных тренировок. Они не являются медицинским диагнозом и не заменяют рекомендации вашей медицинской команды.';

  @override
  String get voicePrepHint =>
      'Сядьте удобно. Держите телефон примерно в 30 см от рта.';

  @override
  String voicePrepDurationHint(int seconds) {
    return 'Практикуйтесь около $seconds с';
  }

  @override
  String get voicePrepEnvironmentHint =>
      'Занимайтесь в тихой комнате для лучших результатов';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return 'Пожалуйста, сохраняйте тишину · $secondsс';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return 'Практиковались $secondsс';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return 'Цель: $secondsс';
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
  String get voiceCompletedTitle => 'Практика завершена';

  @override
  String get voiceCompletedDurationLabel => 'This session';

  @override
  String get voiceCompletedTargetLabel => 'Время на целевой громкости';

  @override
  String get voiceCompletedEncourageGood =>
      'Отлично! Продолжайте привычку говорить громко.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Хорошая попытка. В следующий раз постарайтесь говорить чуть громче.';

  @override
  String get voiceRetryButton => 'Practice Again';

  @override
  String get voiceFinishButton => 'Done';

  @override
  String get voicePracticeFooterHint =>
      'Это упражнение побуждает говорить громко для голосовой тренировки. Только для справки, не медицинский диагноз.';

  @override
  String get voiceSessionTooShort =>
      'Сеанс был слишком коротким и не был сохранён';

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
