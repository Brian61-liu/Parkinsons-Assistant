// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => 'يرجى اختيار التدريب الذي تريد القيام به';

  @override
  String get tremorTest => 'اختبار رعشة اليد';

  @override
  String get tremorTestTitle => 'اختبار رعشة اليد';

  @override
  String get tremorTestInstruction =>
      'يرجى حمل الهاتف في يدك والحفاظ على الذراع ثابتة لمدة 30 ثانية';

  @override
  String remainingTime(int time) {
    return 'الوقت المتبقي: $time ثانية';
  }

  @override
  String get readyToTest => 'جاهز لبدء الاختبار';

  @override
  String get frequency => 'التردد';

  @override
  String get amplitude => 'السعة';

  @override
  String get waitingForData => 'في انتظار البيانات...';

  @override
  String get startTest => 'بدء الاختبار';

  @override
  String get stopTest => 'إيقاف الاختبار';

  @override
  String get testCompleted => 'اكتمل الاختبار';

  @override
  String averageFrequency(String frequency) {
    return 'متوسط التردد: $frequency هرتز';
  }

  @override
  String averageAmplitude(String amplitude) {
    return 'متوسط السعة: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return 'السعة القصوى: $maxAmplitude';
  }

  @override
  String get ok => 'حسناً';

  @override
  String get sensorPermissionRequired => 'يتطلب إذن المستشعر لإجراء الاختبار';

  @override
  String get language => 'اللغة';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get selectLanguage => 'اختر اللغة';

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
  String get realtimeWaveform => 'الموجة';

  @override
  String get tremorSeverity => 'الشدة';

  @override
  String get tremorFrequency => 'التردد';

  @override
  String get avgAmplitude => 'متوسط السعة';

  @override
  String get maxAmp => 'السعة القصوى';

  @override
  String get variability => 'التباين';

  @override
  String get sampleRate => 'العينة';

  @override
  String get dataPoints => 'البيانات';

  @override
  String get severityNormal => 'طبيعي';

  @override
  String get severityMild => 'خفيف';

  @override
  String get severityModerate => 'معتدل';

  @override
  String get severityModerateSevere => 'متوسط-شديد';

  @override
  String get severitySevere => 'شديد';
}
