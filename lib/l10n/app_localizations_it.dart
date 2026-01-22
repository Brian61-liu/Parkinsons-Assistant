// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining =>
      'Si prega di selezionare l\'allenamento che si desidera eseguire';

  @override
  String get tremorTest => 'Test del Tremore della Mano';

  @override
  String get tremorTestTitle => 'Test del Tremore della Mano';

  @override
  String get tremorTestInstruction =>
      'Si prega di tenere il telefono in mano e mantenere il braccio fermo per 30 secondi';

  @override
  String remainingTime(int time) {
    return 'Tempo rimanente: $time secondi';
  }

  @override
  String get readyToTest => 'Pronto per iniziare il test';

  @override
  String get frequency => 'Frequenza';

  @override
  String get amplitude => 'Ampiezza';

  @override
  String get waitingForData => 'In attesa di dati...';

  @override
  String get startTest => 'Avvia Test';

  @override
  String get stopTest => 'Ferma Test';

  @override
  String get testCompleted => 'Test Completato';

  @override
  String averageFrequency(String frequency) {
    return 'Frequenza Media: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'Ampiezza Media: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'Ampiezza Massima: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired =>
      'Autorizzazione sensore richiesta per eseguire il test';

  @override
  String get language => 'Lingua';

  @override
  String get changeLanguage => 'Cambia Lingua';

  @override
  String get selectLanguage => 'Seleziona Lingua';

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
