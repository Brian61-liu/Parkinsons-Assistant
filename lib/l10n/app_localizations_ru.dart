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
  String get tremorSeverity => 'Диапазон движений';

  @override
  String get tremorFrequency => 'Частота';

  @override
  String get avgAmplitude => 'Ср. Ампл.';

  @override
  String get maxAmp => 'Макс Ампл.';

  @override
  String get variability => 'Изменчив.';

  @override
  String get sampleRate => 'Частота дискретизации';

  @override
  String get dataPoints => 'Точки данных';

  @override
  String get severityNormal => 'Более слабое движение';

  @override
  String get severityMild => 'Слабое движение';

  @override
  String get severityModerate => 'Умеренное движение';

  @override
  String get severityModerateSevere => 'Более сильное движение';

  @override
  String get severitySevere => 'Самый высокий диапазон';

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
  String get syncing => 'Синхронизация…';

  @override
  String get syncFailed =>
      'Сбой синхронизации. Проверьте сеть и попробуйте снова.';

  @override
  String get syncFailedHint => 'Сбой синхронизации — нажмите, чтобы повторить';

  @override
  String get syncRetry => 'Повторить';

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
      'Мы защищаем ваши данные с помощью средств безопасности, доступных в текущем техническом стеке:\n\n• TLS для облачных запросов\n• Firebase Authentication для вошедших в систему аккаунтов\n• Правила Firestore, ограничивающие доступ только вашими данными\n• Шифрование AES на устройстве для конфиденциальных локальных медицинских данных, таких как образцы датчика тремора и условные названия лекарств, при этом ключ хранится в Связке ключей iOS\n• Экспорт данных и удаление аккаунта в приложении\n\nЭкспортируемые файлы записываются в читаемом формате для вашего использования. Мы не заявляем о полном шифровании файла всей локальной базы данных.';

  @override
  String get medicationPrivacy =>
      'Необязательный список условных названий лекарств';

  @override
  String get medicationPrivacyText =>
      'Если вы включите необязательный список условных названий лекарств, условные названия, время напоминаний и отметки будут храниться на этом устройстве. После входа они также могут синхронизироваться с вашим облачным аккаунтом Amplio, чтобы их можно было восстановить на другом iPhone. Необязательные локальные уведомления могут появляться на этом устройстве, только если вы разрешите их. Эти данные можно удалить в приложении, в том числе при удалении аккаунта. Эта функция не является медицинской рекомендацией, а данные не включаются в экспорт, если вы отдельно не дадите согласие при каждом экспорте.';

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
      'Amplio предоставляет необязательные инструменты тренировки, такие как измерение тремора, голосовые упражнения, упражнения на движение, сводки прогресса и необязательный список условных названий лекарств (на устройстве для гостей; синхронизация возможна при входе).\n\nВы соглашаетесь использовать приложение только в законных личных целях и не злоупотреблять датчиками, аккаунтами или экспортированными данными способами, вредящими другим или нарушающими применимое право.';

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
      'Экспортируйте профиль и записи тренировок в файл CSV. Его можно сохранить или отправить через системное меню «Поделиться». Условные названия лекарств не включаются без вашего согласия для конкретного экспорта.';

  @override
  String get export => 'Экспорт';

  @override
  String get exporting => 'Экспорт...';

  @override
  String get exportSuccess => 'Экспорт Успешен';

  @override
  String get exportSuccessMessage =>
      'Файл CSV готов. Используйте меню «Поделиться», чтобы сохранить его в «Файлы» или отправить. Необработанные образцы датчиков представлены только их количеством.';

  @override
  String get exportMedicationConsentTitle =>
      'Включить условные названия лекарств?';

  @override
  String get exportMedicationConsentBody =>
      'Записи тренировок будут экспортированы в файл CSV.\n\nУсловные названия лекарств, время напоминаний и отметки не включаются, если вы не выберете «Включить в этот раз». Это не рецепт и не медицинская карта.\n\nНажмите «Отмена», чтобы остановить экспорт. Экспорт без данных о лекарствах по-прежнему доступен.';

  @override
  String get exportMedicationExclude =>
      'Экспортировать без данных о лекарствах';

  @override
  String get exportMedicationInclude => 'Включить список лекарств';

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
      'Тренируйтесь говорить чётким, сильным голосом. Размер круга меняется в зависимости от громкости. При достижении целевого диапазона круг становится зелёным. Только для личной практики — не является лечением.';

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
  String get medicationList => 'Список лекарств';

  @override
  String get medicationListEnable => 'Настроить список лекарств';

  @override
  String get medicationDisclaimer =>
      'Список лекарств Amplio помогает только самостоятельно отмечать время приёма. Это не медицинская рекомендация и не содержит указаний по дозировке. В гостевом режиме данные хранятся только на этом устройстве. При входе напоминания и отметки могут синхронизироваться с вашим аккаунтом Amplio.';

  @override
  String get medicationDisclaimerAccept => 'Понимаю и включаю';

  @override
  String get medicationLabel => 'Название';

  @override
  String get medicationLabelHint =>
      'например, после завтрака (можно использовать условное название)';

  @override
  String get medicationTime => 'Время';

  @override
  String get medicationTaken => 'Принято';

  @override
  String get medicationUndo => 'Отменить';

  @override
  String get medicationUndoConfirm =>
      'Удалить сегодняшнюю отметку для этого пункта?';

  @override
  String medicationTodayProgress(int done, int total) {
    return 'Сегодня $done/$total';
  }

  @override
  String get medicationManage => 'Управление';

  @override
  String get medicationAdd => 'Добавить напоминание';

  @override
  String get medicationEdit => 'Изменить напоминание';

  @override
  String get medicationClose => 'Отключить список лекарств';

  @override
  String get medicationCloseConfirm =>
      'Можно скрыть список или также удалить все данные о лекарствах на этом устройстве.';

  @override
  String get medicationCloseHideOnly => 'Только скрыть';

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
  String get medicationCollapse => 'Свернуть';

  @override
  String get medicationExpand => 'Развернуть';

  @override
  String get medicationEmptyToday =>
      'Нет напоминаний на сегодня. Добавьте в разделе «Управление».';

  @override
  String medicationCompletedAt(String time) {
    return 'Отмечено в $time';
  }

  @override
  String get medicationSave => 'Сохранить';

  @override
  String get medicationDeleteReminder => 'Удалить напоминание';

  @override
  String get medicationDeleteReminderConfirm => 'Удалить это напоминание?';

  @override
  String get medicationNoReminders => 'Пока нет напоминаний';

  @override
  String get medicationDeleteSuccess => 'Данные списка лекарств удалены';

  @override
  String get rehabReport => 'Отчёт о реабилитации';

  @override
  String get rehabReportDisclaimer =>
      'Только для справки о реабилитации. Не является медицинским диагнозом и не заменяет рекомендации ваших лечащих специалистов.';

  @override
  String get reportOverallScore => 'Общая оценка';

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
  String get handTraining => 'Рука';

  @override
  String get voiceTrainingShort => 'Голос';

  @override
  String get motionTrainingShort => 'Движение';

  @override
  String get tabHome => 'Главная';

  @override
  String get tabPlan => 'План';

  @override
  String get tabData => 'Данные';

  @override
  String get tabProfile => 'Профиль';

  @override
  String get comingSoon => 'Скоро';

  @override
  String trainingStreak(int days) {
    return '$days дн.';
  }

  @override
  String get trainingStreakLabel => 'Серия тренировок';

  @override
  String get voiceClarity => 'Чёткость речи';

  @override
  String get handStability => 'Стабильность руки';

  @override
  String get movementAbility => 'Двигательная активность';

  @override
  String get medicationReminder => 'Лекарства';

  @override
  String lastTrainingAgo(String timeAgo) {
    return 'Последняя тренировка · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return 'Последнее измерение · $timeAgo';
  }

  @override
  String get relativeToday => 'Сегодня';

  @override
  String get relativeYesterday => 'Вчера';

  @override
  String relativeDaysAgo(int days) {
    return '$days дн. назад';
  }

  @override
  String get noTrainingYet => 'Тренировок пока нет';

  @override
  String get noMeasurementYet => 'Ещё нет измерений';

  @override
  String get tapToStart => 'Нажмите, чтобы начать';

  @override
  String durationSec(int count) {
    return '$count с';
  }

  @override
  String durationMin(int count) {
    return '$count мин';
  }

  @override
  String get voiceSessionCount => '1 сеанс';

  @override
  String get handMeasurementCount => '1 измерение';

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
  String get medicationNextDoseLabel => 'Следующий приём';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => 'Скоро';

  @override
  String get medicationStatusPending => 'Ожидается';

  @override
  String medicationNotificationBody(String label) {
    return 'Время для: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      'По желанию: разрешите уведомления, чтобы Amplio напоминал в заданное вами время. Уведомления остаются на этом устройстве.';

  @override
  String get recentActivity => 'Недавняя активность';

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
  String get voiceLegendTarget => 'Целевая громкость';

  @override
  String get voiceLegendYours => 'Ваша громкость';

  @override
  String get voiceShowDetail => 'Показать значение';

  @override
  String get voiceHideDetail => 'Скрыть значение';

  @override
  String get voiceCompletedTitle => 'Практика завершена';

  @override
  String get voiceCompletedDurationLabel => 'Эта сессия';

  @override
  String get voiceCompletedTargetLabel => 'Время на целевой громкости';

  @override
  String get voiceCompletedEncourageGood =>
      'Отлично! Продолжайте привычку говорить громко.';

  @override
  String get voiceCompletedEncourageTryMore =>
      'Хорошая попытка. В следующий раз постарайтесь говорить чуть громче.';

  @override
  String get voiceRetryButton => 'Повторить';

  @override
  String get voiceFinishButton => 'Готово';

  @override
  String get voicePracticeFooterHint =>
      'Это упражнение побуждает говорить громко для голосовой тренировки. Только для справки, не медицинский диагноз.';

  @override
  String get voiceSessionTooShort =>
      'Сеанс был слишком коротким и не был сохранён';

  @override
  String get voiceProtocolPickerTitle => 'Выберите формат тренировки';

  @override
  String get voiceProtocolSteady => 'Ровная громкость';

  @override
  String get voiceProtocolSteadyDesc =>
      'Тяните долгий звук «А-а» в целевом диапазоне громкости.';

  @override
  String get voiceProtocolLadder => 'Лестница громкости';

  @override
  String get voiceProtocolLadderDesc =>
      'Тихо → целевой уровень → немного громче → постепенно тише.';

  @override
  String get voiceProtocolMultiSet => '3 коротких подхода';

  @override
  String get voiceProtocolMultiSetDesc =>
      'Три коротких подхода с небольшим отдыхом между ними.';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      'Только для личной реабилитационной практики. Не является диагностикой или лечением.';

  @override
  String get voiceLadderPhaseSoft => 'Этап 1: более тихий голос';

  @override
  String get voiceLadderPhaseTarget => 'Этап 2: целевая громкость';

  @override
  String get voiceLadderPhaseStrong => 'Этап 3: немного громче';

  @override
  String get voiceLadderPhaseCoolDown => 'Этап 4: постепенно тише';

  @override
  String voiceLadderChip(int seconds) {
    return 'До конца этапа: $seconds с';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'Подход $current/$total · $seconds с';
  }

  @override
  String voiceRestChip(int seconds) {
    return 'Отдых: $seconds с';
  }

  @override
  String get voiceRestTitle => 'Отдых';

  @override
  String voiceRestBody(int next, int total) {
    return 'Далее: подход $next из $total. Расслабьте голос.';
  }

  @override
  String get tremorDurationPickerTitle => 'Длительность сеанса';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'Держите телефон неподвижно в течение $seconds секунд. Старайтесь не двигать рукой.';
  }

  @override
  String get tremorMotionBandDisclaimer =>
      'Диапазоны движения предназначены только для личного ознакомления и не являются медицинской оценкой.';

  @override
  String get planTodayTitle => 'Тренировка на сегодня';

  @override
  String get planTodaySubtitle =>
      'Рекомендации из ваших тренировочных модулей. Нажмите, чтобы начать.';

  @override
  String get planEmptyHint =>
      'Рекомендаций пока нет. Попробуйте начать тренировку на главной странице.';

  @override
  String get planDomainHand => 'Рука';

  @override
  String get planDomainVoice => 'Голос';

  @override
  String get planDomainMotion => 'Движение';

  @override
  String planGoalProgress(int done, int target) {
    return 'Сегодня: $done/$target сеансов';
  }

  @override
  String get planGoalCompleted => 'Цель на сегодня выполнена. Отличная работа.';

  @override
  String planWeeklyProgress(int done, int target) {
    return 'На этой неделе: $done/$target сеансов';
  }

  @override
  String get planOpenTask => 'Начать';

  @override
  String get planMotionShelvedNote =>
      'На некоторых телефонах распознавание движений ограничено, но экран тренировки всё равно можно открыть.';

  @override
  String get voiceProtocolClarity => 'Чёткие фразы';

  @override
  String get voiceProtocolClarityDesc =>
      'Прочитайте короткие фразы вслух. Произношение не оценивается.';

  @override
  String get voiceClarityHint =>
      'Прочитайте фразу чётко. Мы проверяем только наличие голоса, а не «правильность» произношения.';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'Фраза $current из $total';
  }

  @override
  String get voiceClarityVoiceDetected => 'Голос распознан — отлично';

  @override
  String get voiceClarityWaitingVoice => 'Произнесите фразу вслух';

  @override
  String get voiceClarityNextPhrase => 'Следующая фраза';

  @override
  String get voiceClarityFinish => 'Завершить';

  @override
  String get voiceClarityPhrase1 => 'Доброе утро';

  @override
  String get voiceClarityPhrase2 => 'Как вы сегодня?';

  @override
  String get voiceClarityPhrase3 => 'Передайте, пожалуйста, воду';

  @override
  String get voiceClarityPhrase4 => 'У меня всё хорошо';

  @override
  String get voiceClarityPhrase5 => 'До завтра';

  @override
  String get handModePickerTitle => 'Формат тренировки';

  @override
  String get handModeStillHold => 'Неподвижное удержание';

  @override
  String get handModeStillHoldDesc =>
      'Держите телефон неподвижно, пока датчики измеряют движение.';

  @override
  String get handModeObjectHold => 'Удержание предмета';

  @override
  String get handModeObjectHoldDesc =>
      'Неподвижно держите чашку или мягкий мяч. Работает только таймер, распознавания предмета нет.';

  @override
  String get handModeFineMotor => 'Касания пальцев';

  @override
  String get handModeFineMotorDesc =>
      'Поочерёдно касайтесь большим пальцем остальных пальцев. Считайте циклы самостоятельно.';

  @override
  String get handGuidedDisclaimer =>
      'Упражнение предназначено только для личной поддержки реабилитации. Не является медицинской оценкой.';

  @override
  String get handObjectHoldInstruction =>
      'Сядьте удобно. Удерживайте чашку или мягкий мяч одной рукой. Держите предмет неподвижно, не сжимая его сильно.';

  @override
  String get handObjectHoldStart => 'Начать удержание';

  @override
  String get handObjectHoldRunning => 'Продолжайте держать неподвижно…';

  @override
  String get handObjectHoldDone => 'Удержание завершено';

  @override
  String get handFineMotorInstruction =>
      'Коснитесь большим пальцем указательного, среднего, безымянного пальца, затем мизинца. Это один цикл.';

  @override
  String get handFineMotorMarkCycle => 'Я завершил один цикл';

  @override
  String handFineMotorProgress(int done, int target) {
    return 'Циклы: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => 'Тренировка завершена';

  @override
  String get handGuidedCompleteBody =>
      'Отличная работа. Этот сеанс сохранён только как личная тренировка.';

  @override
  String get dataTabTitle => 'Ваши данные';

  @override
  String get dataTabSubtitle =>
      'Недельные оценки и тенденции тренировок для личного ознакомления.';

  @override
  String get dataTrendsTitle => 'Эта неделя и прошлая неделя';

  @override
  String get dataOpenFullReport => 'Открыть полный отчёт о реабилитации';

  @override
  String get dataRecentSessions => 'Недавние сеансы';

  @override
  String dataStreakDays(int days) {
    return 'Серия тренировок: $days дн.';
  }

  @override
  String get reportShareButton => 'Поделиться отчётом';

  @override
  String get reportShareConsentTitle => 'Поделиться сводкой реабилитации?';

  @override
  String get reportShareConsentBody =>
      'Будет создан текстовый файл с оценками и тенденциями ваших тренировок, после чего откроется системное меню «Поделиться» («Сообщения», «Почта», «Файлы» и другие приложения).\n\nТолько для личного ознакомления — не является медицинским диагнозом.\n\nПосле отправки Amplio не сможет отозвать файл у получателя. Вы можете отменить действие сейчас или не выбирать получателя на следующем экране.';

  @override
  String get reportShareConsentConfirm => 'Понимаю — продолжить';

  @override
  String get reportShareFileTitle => 'Сводка реабилитации Amplio Care';

  @override
  String get reportShareSuccess => 'Меню «Поделиться» открыто';

  @override
  String get reportShareFailed =>
      'Не удалось поделиться отчётом. Попробуйте ещё раз.';

  @override
  String get reportShareFooterNote =>
      'Для каждой отправки требуется ваше подтверждение. Amplio не отправляет отчёты врачам автоматически.';

  @override
  String get profileTabTitle => 'Профиль';

  @override
  String get profileGuestLabel => 'Гость';

  @override
  String get profileGuestSubtitle =>
      'Вы вошли локально. Облачная синхронизация станет доступна после входа в аккаунт.';

  @override
  String get profileSignedInLabel => 'Выполнен вход';

  @override
  String get profileSectionPreferences => 'Настройки';

  @override
  String get profileSectionAccount => 'Аккаунт и данные';

  @override
  String get profileSectionLegal => 'Конфиденциальность и условия';

  @override
  String get accessibilitySettings => 'Универсальный доступ';

  @override
  String get exitGuestMode => 'Выйти из гостевого режима';

  @override
  String get exitGuestModeConfirm =>
      'Выйти из гостевого режима? Вам потребуется войти в аккаунт или снова продолжить как гость.';

  @override
  String get trainingReminderPageTitle => 'Напоминания о тренировках';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody =>
      'Небольшая тренировка, когда вам удобно. Ничего страшного, если вы её пропустите.';

  @override
  String get trainingReminderDisclaimer =>
      'Необязательные локальные напоминания, а не расписание лечения. Их можно отключить в любое время. Пропущенное напоминание не влияет на оценки.';

  @override
  String get trainingReminderEnable => 'Напоминать о тренировке';

  @override
  String trainingReminderTimeLabel(int n) {
    return 'Время $n';
  }

  @override
  String get trainingReminderAddTime => 'Добавить второе время';

  @override
  String get trainingReminderRemoveTime => 'Удалить это время';

  @override
  String get trainingReminderQuietWeekends => 'Пропускать выходные';

  @override
  String get trainingReminderQuietWeekendsHint =>
      'Не напоминать в субботу и воскресенье.';

  @override
  String get trainingReminderPermissionDenied =>
      'Уведомления не разрешены. Их можно включить позже в настройках iPhone.';

  @override
  String get planReminderOff => 'Настроить напоминание о тренировке';

  @override
  String planReminderOn(String times) {
    return 'Напоминания: $times';
  }
}
