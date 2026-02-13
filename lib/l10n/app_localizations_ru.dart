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
      'Amplio стремится защитить вашу конфиденциальность и данные о здоровье. Эта политика объясняет, как мы собираем, используем, храним и защищаем вашу информацию в соответствии с HIPAA и GDPR.';

  @override
  String get dataCollection => 'Собираемые Данные';

  @override
  String get dataCollectionText =>
      'Мы собираем следующие данные:\n\n• Аккаунт: Email, имя (аутентификация)\n• Сенсоры: Данные движения во время тестов\n• Результаты: Частота, амплитуда, тяжесть\n\nМы следуем принципу минимизации данных.';

  @override
  String get dataUsage => 'Использование Данных';

  @override
  String get dataUsageText =>
      'Ваши данные используются только для:\n\n• Анализа и отслеживания тремора\n• Создания отчётов о здоровье\n• Улучшения алгоритмов (анонимные данные с согласия)';

  @override
  String get dataStorage => 'Хранение и Безопасность';

  @override
  String get dataStorageText =>
      'Ваши данные надёжно хранятся в Google Firebase.\n\n• Сквозное шифрование\n• TLS 1.3 для всех передач\n• Строгий контроль доступа\n• Регулярные аудиты безопасности';

  @override
  String get dataSharing => 'Обмен Данными';

  @override
  String get dataSharingText =>
      'Мы НИКОГДА не продаём ваши данные о здоровье.\n\nДанные передаются только:\n• С вашего явного согласия\n• Назначенным медицинским провайдерам\n• По требованию закона\n\nАнонимные данные могут использоваться для исследований.';

  @override
  String get userRights => 'Ваши Права (GDPR)';

  @override
  String get userRightsText =>
      'Согласно GDPR, у вас есть право на:\n\n• Доступ: Просмотр всех данных\n• Переносимость: Экспорт данных\n• Удаление: Удаление данных\n• Отзыв: Отзыв согласия\n• Жалобу: Жалоба в органы';

  @override
  String get dataSecurity => 'Меры Безопасности';

  @override
  String get dataSecurityText =>
      'Мы внедряем многоуровневую безопасность:\n\n• Шифрование AES-256 в покое\n• TLS 1.3 при передаче\n• Многофакторная аутентификация\n• Регулярное тестирование на проникновение\n• Полные журналы аудита\n• Обучение безопасности сотрудников';

  @override
  String get contactUs => 'Связаться с Нами';

  @override
  String get contactUsText =>
      'Вопросы конфиденциальности: privacy@kineo-app.com';

  @override
  String get lastUpdated => 'Последнее обновление';

  @override
  String get version => 'Версия';

  @override
  String get dataManagement => 'Управление Данными';

  @override
  String get gdprRights =>
      'Согласно GDPR и HIPAA, вы можете получить доступ, экспортировать и удалить свои данные о здоровье в любое время.';

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
}
