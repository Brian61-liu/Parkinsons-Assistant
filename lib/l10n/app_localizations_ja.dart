// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Kineo';

  @override
  String get selectTraining => '実施したいトレーニングを選択してください';

  @override
  String get clickToStartTest => 'クリックしてテストを開始';

  @override
  String get tremorTest => '手の震えテスト';

  @override
  String get tremorTestTitle => '手の震えテスト';

  @override
  String get tremorTestInstruction => 'スマートフォンを手に持ち、30秒間腕を静止させてください';

  @override
  String remainingTime(int time) {
    return '残り $time秒';
  }

  @override
  String get readyToTest => 'テスト開始準備完了';

  @override
  String get frequency => '周波数';

  @override
  String get amplitude => '振幅';

  @override
  String get waitingForData => 'データを待っています...';

  @override
  String get startTest => 'テスト開始';

  @override
  String get stopTest => 'テスト停止';

  @override
  String get testCompleted => 'テスト完了';

  @override
  String averageFrequency(String frequency) {
    return '平均周波数: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '平均振幅: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '最大振幅: $maxAmplitude';
  }

  @override
  String get ok => 'OK';

  @override
  String get sensorPermissionRequired => 'テストを実施するにはセンサーの許可が必要です';

  @override
  String get language => '言語';

  @override
  String get changeLanguage => '言語を変更';

  @override
  String get selectLanguage => '言語';

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
  String get realtimeWaveform => 'リアルタイム波形';

  @override
  String get tremorSeverity => '重症度';

  @override
  String get tremorFrequency => '周波数';

  @override
  String get avgAmplitude => '平均振幅';

  @override
  String get maxAmp => '最大振幅';

  @override
  String get variability => '変動性';

  @override
  String get sampleRate => 'サンプル';

  @override
  String get dataPoints => 'データ';

  @override
  String get severityNormal => '正常';

  @override
  String get severityMild => '軽度';

  @override
  String get severityModerate => '中度';

  @override
  String get severityModerateSevere => '中重度';

  @override
  String get severitySevere => '重度';

  @override
  String get appSubtitle => 'パーキンソン病の動作追跡と分析のためのパーソナルアシスタント';

  @override
  String get signInWithGoogle => 'Google でログイン';

  @override
  String get signingIn => 'ログイン中...';

  @override
  String get privacyNotice => 'サインインすることで、利用規約とプライバシーポリシーに同意したことになります';

  @override
  String get loginError => 'ログインエラー';

  @override
  String get confirm => '確認';

  @override
  String get cancel => 'キャンセル';

  @override
  String get logout => 'ログアウト';

  @override
  String get logoutConfirm => '本当にログアウトしますか？';

  @override
  String welcome(String name) {
    return 'ようこそ、$name';
  }

  @override
  String get syncToCloud => 'クラウドに同期';

  @override
  String get dataSynced => 'データが正常に同期されました';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicyIntro => 'はじめに';

  @override
  String get privacyPolicyIntroText =>
      'Kineoはお客様のプライバシーと健康データの保護に努めています。本ポリシーでは、HIPAAおよびGDPRに準拠した情報の収集、使用、保存、保護について説明します。';

  @override
  String get dataCollection => '収集するデータ';

  @override
  String get dataCollectionText =>
      '以下のデータを収集します：\n\n• アカウント情報：メール、名前（認証用）\n• センサーデータ：振戦テスト中の動きデータ\n• テスト結果：周波数、振幅、重症度\n\nデータ最小化の原則に従います。';

  @override
  String get dataUsage => 'データの使用目的';

  @override
  String get dataUsageText =>
      'お客様のデータは以下の目的でのみ使用されます：\n\n• 振戦分析と追跡の提供\n• 健康レポートの生成\n• アルゴリズムの改善（同意を得た匿名データのみ）';

  @override
  String get dataStorage => 'データの保存とセキュリティ';

  @override
  String get dataStorageText =>
      'お客様のデータはGoogle Firebaseに安全に保存されます。\n\n• エンドツーエンド暗号化\n• TLS 1.3によるすべての通信\n• 厳格なアクセス制御\n• 定期的なセキュリティ監査';

  @override
  String get dataSharing => 'データの共有';

  @override
  String get dataSharingText =>
      'お客様の健康データを販売することは決してありません。\n\nデータは以下の場合のみ共有されます：\n• お客様の明示的な同意がある場合\n• 指定された医療提供者との共有\n• 法律で要求された場合\n\n匿名化されたデータは研究に使用される場合があります。';

  @override
  String get userRights => 'お客様の権利（GDPR）';

  @override
  String get userRightsText =>
      'GDPRに基づき、以下の権利があります：\n\n• アクセス権：すべてのデータを閲覧\n• ポータビリティ：データをエクスポート\n• 削除権：データを削除\n• 撤回権：いつでも同意を撤回\n• 苦情申立権：監督機関への申立て';

  @override
  String get dataSecurity => 'セキュリティ対策';

  @override
  String get dataSecurityText =>
      '多層的なセキュリティ対策を実施：\n\n• AES-256静的暗号化\n• TLS 1.3転送暗号化\n• 多要素認証\n• 定期的な侵入テスト\n• 包括的な監査ログ\n• 従業員セキュリティ研修';

  @override
  String get contactUs => 'お問い合わせ';

  @override
  String get contactUsText => 'プライバシーに関するお問い合わせ：privacy@kineo-app.com';

  @override
  String get lastUpdated => '最終更新';

  @override
  String get version => 'バージョン';

  @override
  String get dataManagement => 'データ管理';

  @override
  String get gdprRights =>
      'GDPRおよびHIPAAに基づき、お客様はいつでも個人健康データにアクセス、エクスポート、削除する権利があります。';

  @override
  String get exportData => 'データをエクスポート';

  @override
  String get exportDataDescription => 'すべてのデータの完全なコピーをダウンロードします（JSON形式）。';

  @override
  String get export => 'エクスポート';

  @override
  String get exporting => 'エクスポート中...';

  @override
  String get exportSuccess => 'エクスポート成功';

  @override
  String get exportSuccessMessage => 'データがクリップボードにコピーされました。';

  @override
  String get deleteAllRecords => 'すべてのテスト記録を削除';

  @override
  String get deleteAllRecordsDescription =>
      'すべての振戦テスト記録を永久に削除します。この操作は取り消せません。';

  @override
  String get deleteAllData => 'すべてのデータを削除';

  @override
  String get deleteAllDataConfirm => 'すべてのテスト記録を削除しますか？この操作は元に戻せません。';

  @override
  String get delete => '削除';

  @override
  String get deleteSuccess => '削除成功';

  @override
  String get deleteSuccessMessage => 'すべてのテスト記録が永久に削除されました。';

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get deleteAccountDescription => 'アカウントとすべての関連データを永久に削除します。';

  @override
  String get deleteAccountWarning => 'アカウントとすべてのデータが永久に削除されます。この操作は取り消せません。';

  @override
  String get deleteAccountFinalWarning =>
      '最終警告：削除後、アカウントとデータは永久に失われます。本当によろしいですか？';

  @override
  String get finalWarning => '最終警告';

  @override
  String get deleteForever => '永久に削除';

  @override
  String get continue_ => '続行';

  @override
  String get error => 'エラー';

  @override
  String get settings => '設定';

  @override
  String get testHistory => '履歴';

  @override
  String get noTestRecords => 'テスト記録がありません';

  @override
  String get noTestRecordsHint => '振戦テストを完了すると、結果がここに表示されます';

  @override
  String get testDate => 'テスト日';

  @override
  String get deleteRecord => '記録を削除';

  @override
  String get deleteRecordConfirm => 'このテスト記録を削除しますか？';

  @override
  String get recordDeleted => '記録が削除されました';

  @override
  String get duration => '時間';

  @override
  String get seconds => '秒';

  @override
  String get tapToCancel => 'タップでキャンセル';

  @override
  String get changeAvatar => 'アバターを変更';

  @override
  String get selectFromGallery => 'ギャラリーから選択';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get avatarUpdated => 'アバターが正常に更新されました';

  @override
  String get avatarUpdateFailed => 'アバターの更新に失敗しました';

  @override
  String get voiceTraining => '音声訓練';

  @override
  String get voiceTrainingMainInstruction => '長い音を続けて発音してください —— あ ——';

  @override
  String get voiceTrainingInstruction =>
      'LSVT LOUD療法の原則に基づき、大きな声で話してください。円のサイズは音量に応じてリアルタイムで変化します。75-85 dBに達すると、円が緑色になります。';

  @override
  String get voiceTrainingReady => '準備完了';

  @override
  String get voiceTrainingCalibrating => '環境ノイズを校正中...';

  @override
  String get voiceTrainingTooQuiet => 'もっと大きな声で！';

  @override
  String get voiceTrainingKeepGoing => 'いいですね、続けてください！';

  @override
  String get voiceTrainingExcellent => '素晴らしい！その調子！';

  @override
  String voiceTrainingTarget(String target) {
    return '目標: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return '目標: $range dB';
  }

  @override
  String get startListening => '訓練を開始';

  @override
  String get stopListening => '訓練を停止';

  @override
  String get microphonePermissionRequired => 'マイクの許可が必要です';

  @override
  String get microphonePermissionDenied => 'マイクの許可が拒否されました';

  @override
  String get microphonePermissionDeniedMessage =>
      'マイクの許可が永続的に拒否されました。音声訓練を使用するには、システム設定でマイクの許可を有効にしてください。';

  @override
  String get microphoneError => 'マイクエラー';

  @override
  String get openSettings => '設定を開く';

  @override
  String get continueAsGuest => 'ゲストとして続ける';

  @override
  String get movementTraining => '動作訓練';

  @override
  String get movementTrainingInstruction => '両腕を上げて、正しい姿勢を保ってください';

  @override
  String get armsRaised => '腕が上がっています';

  @override
  String get raiseArms => '腕を上げてください';

  @override
  String get lowerArms => '素晴らしい！腕を下げてください';

  @override
  String get successCount => '成功回数';

  @override
  String get cameraPermissionRequired => 'カメラの許可が必要です';

  @override
  String get cameraPermissionDeniedMessage =>
      'カメラの許可が拒否されました。動作訓練を使用するには、システム設定でカメラの許可を有効にしてください。';
}
