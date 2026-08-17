// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => '実施したいトレーニングを選択してください';

  @override
  String get clickToStartTest => 'タップしてテストを開始';

  @override
  String get clickToStartTraining => 'タップしてトレーニングを開始';

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
  String get tremorTestCancelledNoSave => 'テストを中止しました。記録は保存されません';

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
  String get waveformAxisTime => '時間';

  @override
  String get waveformAxisAmplitude => '振幅';

  @override
  String get waveformHint => '波が高いほど手の震えが目立ちます';

  @override
  String get tremorSeverity => '動きの程度';

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
  String get severityNormal => '動きが少ない';

  @override
  String get severityMild => 'わずかな動き';

  @override
  String get severityModerate => '中程度の動き';

  @override
  String get severityModerateSevere => '大きな動き';

  @override
  String get severitySevere => '最も大きい範囲';

  @override
  String get appSubtitle => 'パーキンソン病の動作追跡と分析のためのパーソナルアシスタント';

  @override
  String get signInWithGoogle => 'Google でログイン';

  @override
  String get signInWithApple => 'Apple でログイン';

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
  String get syncing => '同期中…';

  @override
  String get syncFailed => '同期に失敗しました。ネットワークを確認して再試行してください。';

  @override
  String get syncFailedHint => '同期失敗 — タップして再試行';

  @override
  String get syncRetry => '再試行';

  @override
  String get loginRequiredForSync => 'クラウド同期を使うにはサインインしてください';

  @override
  String lastSyncedAt(String time) {
    return '最終同期：$time';
  }

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicyIntro => 'はじめに';

  @override
  String get privacyPolicyIntroText =>
      'Amplioはお客様のプライバシーと健康データの保護に努めています。本ポリシーでは、情報の収集、使用、保存、保護について説明します。';

  @override
  String get dataCollection => '収集するデータ';

  @override
  String get dataCollectionText =>
      '以下のデータを収集します：\n\n• アカウント情報：メール、名前（認証用）\n• センサーデータ：振戦テスト中の動きデータ\n• テスト結果：周波数、振幅、重症度\n\nデータ最小化の原則に従います。';

  @override
  String get dataUsage => 'データの使用目的';

  @override
  String get dataUsageText =>
      'お客様のデータは以下の目的にのみ使用されます：\n\n• リハビリテーション訓練機能と進捗の提供\n• 個人参照用のアプリ内要約とレポートの表示\n• 匿名データと同意がある場合のみ、アプリ改善への利用';

  @override
  String get dataStorage => 'データの保存とセキュリティ';

  @override
  String get dataStorageText =>
      'サインインすると、アカウントと同期済みの訓練データは Google Firebase に保存される場合があります。ゲストおよび端末のみのデータは端末に残ります。\n\n• クラウド通信には HTTPS/TLS を使用\n• アクセスはアカウントと Firestore セキュリティルールで制限\n• アプリ内でデータの書き出しまたは削除が可能';

  @override
  String get dataSharing => 'データの共有';

  @override
  String get dataSharingText =>
      '個人の健康データを販売しません。\n\nデータがアプリ外に出るのは次の場合のみです：\n• お客様が明示的にファイルを書き出しまたは共有した場合\n• 法令により開示が求められる場合\n\n現時点で医療機関へ直接データを送信しません。';

  @override
  String get userRights => 'お客様のデータ権利';

  @override
  String get userRightsText =>
      '以下の権利があります：\n\n• アクセス権：すべてのデータを閲覧\n• ポータビリティ：データをエクスポート\n• 削除権：データを削除\n• 撤回権：いつでも同意を撤回\n• お問い合わせ：プライバシーに関するご質問はこちら';

  @override
  String get dataSecurity => 'セキュリティ対策';

  @override
  String get dataSecurityText =>
      '現行の技術スタックで利用可能なセキュリティ対策によりデータを保護します：\n\n• クラウド通信の TLS\n• サインイン済みアカウントの Firebase Authentication\n• 自分のデータのみにアクセスを制限する Firestore ルール\n• 振戦センサーのサンプルや服薬ニックネームなど、機密性の高いローカルの健康関連フィールドを端末上で AES 暗号化し、鍵を iOS キーチェーンに保存\n• アプリ内での書き出しとアカウント削除\n\n書き出したファイルは、ご自身で利用できる読み取り可能な形式です。ローカルデータベース全体のファイル暗号化を行っているとは表明しません。';

  @override
  String get medicationPrivacy => '任意の服薬ニックネームリスト';

  @override
  String get medicationPrivacyText =>
      '任意の服薬ニックネームリストを有効にすると、ニックネーム、リマインダー時刻、チェックインはこの端末に保存されます。サインインすると Amplio クラウドアカウントにも同期でき、別の iPhone で復元できます。通知を許可した場合、任意のローカル通知はこの端末でのみ表示されます。このデータはアプリ内で削除できます（アカウント削除を含む）。本機能は医療アドバイスではなく、書き出すたびに別途同意しない限り、服薬データは書き出しに含まれません。';

  @override
  String get contactUs => 'お問い合わせ';

  @override
  String get contactUsText =>
      'Amplio は個人の独立開発者により運営されています（ドメイン：ampliocare.com）。\n\n• プライバシー／データ請求：privacy@ampliocare.com\n• ユーザーサポート：support@ampliocare.com\n• 臨床連携：clinical@ampliocare.com\n• ビジネス：hello@ampliocare.com';

  @override
  String get termsOfService => '利用規約';

  @override
  String get termsIntro => 'はじめに';

  @override
  String get termsIntroText =>
      '本利用規約（「規約」）は、パーキンソン病とともに生きる方向けの iPhone リハビリテーション訓練アシスタント Amplio を利用するための草案合意です。Amplio は個人の独立開発者により運営されます。本規約は専門的な法律助言の代わりにはなりません。';

  @override
  String get termsAcceptance => '同意';

  @override
  String get termsAcceptanceText =>
      'サインイン、ゲストとしての継続、またはその他の方法で Amplio を利用することにより、本規約およびプライバシーポリシーに同意したものとみなします。同意しない場合はアプリを使用しないでください。';

  @override
  String get termsUseOfApp => 'Amplio の利用';

  @override
  String get termsUseOfAppText =>
      'Amplio は、振戦測定、音声練習、動作練習、進捗要約、および任意の服薬ニックネームリスト（ゲストは端末内；サインイン時は同期可）などの任意の訓練ツールを提供します。\n\nお客様は、合法的な個人目的でのみアプリを使用し、他者に害を与えたり適用法に違反したりする形でセンサー、アカウント、書き出しデータを濫用しないことに同意します。';

  @override
  String get termsMedicalDisclaimer => '医療アドバイスではありません';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio はウェルネスおよびリハビリテーション訓練の補助です。パーキンソン病やその他の疾患を診断、治療、治癒、予防しません。\n\nスコア、傾向、レポート、リマインダーは個人参照のみであり、医師、理学療法士、言語聴覚士、その他の資格ある専門家の助言に代わるものではありません。医療上の判断は専門家に相談してください。痛みやめまいを感じた場合、または安全に続けられない場合は、運動を中止してください。';

  @override
  String get termsAccounts => 'アカウントとデータ';

  @override
  String get termsAccountsText =>
      'Amplio は Apple サインイン、Google サインイン、またはゲストとして利用できます。サインインアカウント下の活動についてお客様が責任を負います。\n\nアプリ内で一部データの書き出しまたは削除が可能です。アカウント削除により、技術的・法的制限の範囲で当社が管理する関連クラウドデータは削除されます。ゲストおよび端末のみのデータは、消去するまで端末に残る場合があります。';

  @override
  String get termsLimitation => '責任の制限';

  @override
  String get termsLimitationText =>
      '法令で認められる最大限の範囲で、開発者は Amplio を「現状有姿」で提供し、中断のない、またはエラーのない動作を保証しません。\n\n訓練スコアへの依拠、服薬リマインダーの見逃し、運動の試み、またはアプリへのアクセス不能から生じる傷害、損失、損害について、法令により制限できない責任を除き、開発者は責任を負いません。';

  @override
  String get termsChanges => '変更';

  @override
  String get termsChangesText =>
      'アプリの進化に伴い本規約を更新する場合があります。更新時は「最終更新」日が変わります。更新後の継続利用は改訂規約への同意を意味します。重要な変更は、アプリ内で確認できる際に確認してください。';

  @override
  String get lastUpdated => '最終更新';

  @override
  String get version => 'バージョン';

  @override
  String get dataManagement => 'データ管理';

  @override
  String get gdprRights => 'お客様はいつでも個人健康データにアクセス、エクスポート、削除する権利があります。';

  @override
  String get exportData => 'データをエクスポート';

  @override
  String get exportDataDescription =>
      'プロフィールとトレーニング記録を CSV ファイルとして書き出します。システムの共有シートから保存または共有できます。服薬ニックネームは、その書き出し時に同意しない限り含まれません。';

  @override
  String get export => 'エクスポート';

  @override
  String get exporting => 'エクスポート中...';

  @override
  String get exportSuccess => 'エクスポート成功';

  @override
  String get exportSuccessMessage =>
      'CSV ファイルの準備ができました。共有シートから「ファイル」に保存するか送信できます。生のセンサーサンプルは件数のみが記載されます。';

  @override
  String get exportMedicationConsentTitle => '服薬ニックネームを含めますか？';

  @override
  String get exportMedicationConsentBody =>
      'トレーニング記録は CSV ファイルとして書き出されます。\n\n「今回のみ含める」を選択しない限り、服薬ニックネーム、リマインダー時刻、チェックインは含まれません。これは処方箋や医療記録ではありません。\n\nキャンセルすると書き出しを中止します。服薬データを含めずに書き出すこともできます。';

  @override
  String get exportMedicationExclude => '服薬データを含めずに書き出す';

  @override
  String get exportMedicationInclude => '服薬リストを含める';

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
      '明瞭でしっかりした声で話す練習をしてください。円の大きさは声量に応じて変化し、目標範囲に達すると緑色になります。個人練習用であり、医療行為ではありません。';

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

  @override
  String get setGoal => '目標を設定';

  @override
  String get reps => '回';

  @override
  String get greatJob => '素晴らしい！';

  @override
  String get goalCompleted => '目標を達成しました！';

  @override
  String get playAgain => 'もう一度';

  @override
  String get trainingHistory => '訓練履歴';

  @override
  String get noTrainingRecords => '訓練記録がありません';

  @override
  String get noTrainingRecordsHint => 'セッションを完了すると、訓練記録がここに表示されます';

  @override
  String get trainingDetails => '訓練詳細';

  @override
  String get goalStatus => '目標状態';

  @override
  String get goalReached => '完了';

  @override
  String get goalNotReached => '未完了';

  @override
  String get minutes => '分';

  @override
  String get selectTrainingType => '訓練タイプを選択';

  @override
  String get armsRaisedTraining => '腕上げ';

  @override
  String get legLiftTraining => '脚上げ';

  @override
  String get legLiftInstruction => '片足を上げ、その後下げて1回の動作を完了してください';

  @override
  String get lowerLegs => '脚を下げてください';

  @override
  String get legsRaised => '脚が上がっています';

  @override
  String get raiseLegs => '脚を上げてください';

  @override
  String get trainingType => '訓練タイプ';

  @override
  String get medicationList => '服薬リスト';

  @override
  String get medicationListEnable => '服薬リストを設定';

  @override
  String get medicationDisclaimer =>
      'Amplio の服薬リストは、ご自身で時間を記録するためのものです。医学的助言ではなく、用量の案内も行いません。ゲストの場合、データはこの端末のみに保存されます。サインインすると、リマインダーとチェックインを Amplio アカウントに同期できます。';

  @override
  String get medicationDisclaimerAccept => '理解して有効にする';

  @override
  String get medicationLabel => '表示名';

  @override
  String get medicationLabelHint => '例：朝食後（ニックネーム可）';

  @override
  String get medicationTime => '時刻';

  @override
  String get medicationTaken => '服用済み';

  @override
  String get medicationUndo => '元に戻す';

  @override
  String get medicationUndoConfirm => 'この項目の本日のチェックインを削除しますか？';

  @override
  String medicationTodayProgress(int done, int total) {
    return '本日 $done/$total';
  }

  @override
  String get medicationManage => '管理';

  @override
  String get medicationAdd => 'リマインダーを追加';

  @override
  String get medicationEdit => 'リマインダーを編集';

  @override
  String get medicationClose => '服薬リストをオフにする';

  @override
  String get medicationCloseConfirm => 'リストを非表示にするか、この端末の服薬データをすべて削除することもできます。';

  @override
  String get medicationCloseHideOnly => '非表示のみ';

  @override
  String get medicationCloseAndDelete => '非表示にしてすべてのデータを削除';

  @override
  String get medicationDeleteAllData => '服薬リストのデータを削除';

  @override
  String get medicationDeleteAllDataDescription =>
      'この端末上の服薬リマインダーとチェックインをすべて完全に削除します。';

  @override
  String get medicationDeleteAllDataConfirm =>
      'この端末の服薬リストデータをすべて削除しますか？この操作は元に戻せません。';

  @override
  String get medicationCollapse => '折りたたむ';

  @override
  String get medicationExpand => '展開する';

  @override
  String get medicationEmptyToday => '本日のリマインダーはありません。管理で追加してください。';

  @override
  String medicationCompletedAt(String time) {
    return '$timeに完了';
  }

  @override
  String get medicationSave => '保存';

  @override
  String get medicationDeleteReminder => 'リマインダーを削除';

  @override
  String get medicationDeleteReminderConfirm => 'このリマインダーを削除しますか？';

  @override
  String get medicationNoReminders => 'まだリマインダーがありません';

  @override
  String get medicationDeleteSuccess => '服薬リストのデータを削除しました';

  @override
  String get rehabReport => 'リハビリレポート';

  @override
  String get rehabReportDisclaimer =>
      'リハビリテーションの参考用です。医学的診断ではなく、ケアチームの助言の代わりにはなりません。';

  @override
  String get reportOverallScore => '総合スコア';

  @override
  String reportDailyProgress(int percent) {
    return '本日の目標：$percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return '今週：$percent%';
  }

  @override
  String reportStreak(int days) {
    return '連続：$days日';
  }

  @override
  String get reportNoData => 'まだ十分なトレーニングデータがありません';

  @override
  String get handTraining => '手';

  @override
  String get voiceTrainingShort => '音声';

  @override
  String get motionTrainingShort => '動作';

  @override
  String get tabHome => 'ホーム';

  @override
  String get tabPlan => 'プラン';

  @override
  String get tabData => 'データ';

  @override
  String get tabProfile => 'プロフィール';

  @override
  String get comingSoon => '近日公開';

  @override
  String trainingStreak(int days) {
    return '$days日';
  }

  @override
  String get trainingStreakLabel => '連続トレーニング';

  @override
  String get voiceClarity => '声の明瞭さ';

  @override
  String get handStability => '手の安定性';

  @override
  String get movementAbility => '動作トレーニング';

  @override
  String get medicationReminder => '服薬';

  @override
  String lastTrainingAgo(String timeAgo) {
    return '前回のトレーニング · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return '前回の測定 · $timeAgo';
  }

  @override
  String get relativeToday => '今日';

  @override
  String get relativeYesterday => '昨日';

  @override
  String relativeDaysAgo(int days) {
    return '$days日前';
  }

  @override
  String get noTrainingYet => 'まだトレーニングがありません';

  @override
  String get noMeasurementYet => 'まだ測定がありません';

  @override
  String get tapToStart => 'タップして開始';

  @override
  String durationSec(int count) {
    return '$count秒';
  }

  @override
  String durationMin(int count) {
    return '$count分';
  }

  @override
  String get voiceSessionCount => '1セッション';

  @override
  String get handMeasurementCount => '1回の測定';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total 回';
  }

  @override
  String get medicationSetupPrompt => '服薬リマインダーを設定';

  @override
  String get medicationSetupSubtitle => '端末に保存；サインインで同期';

  @override
  String get medicationNoUpcoming => '本日の予定リマインダーはありません';

  @override
  String get medicationNextDoseLabel => '次の服薬';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => '予定';

  @override
  String get medicationStatusPending => '未完了';

  @override
  String medicationNotificationBody(String label) {
    return '時間です：$label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      '任意：通知を許可すると、Amplio が設定した時刻に本機でリマインドします。通知はこの端末に留まります。';

  @override
  String get recentActivity => '最近のアクティビティ';

  @override
  String get nonMedicalDisclaimerTitle => '参考情報のみ';

  @override
  String get nonMedicalDisclaimerBody =>
      '表示される測定値はリハビリテーション訓練の参考用です。医学的診断ではなく、医療チームの助言の代わりにはなりません。';

  @override
  String get voicePrepHint => '楽な姿勢で座ってください。スマホを口から約30cm離して持ってください。';

  @override
  String voicePrepDurationHint(int seconds) {
    return '約$seconds秒練習します';
  }

  @override
  String get voicePrepEnvironmentHint => '静かな部屋で練習すると効果的です';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return '静かにしてください · 残り$seconds秒';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return '練習済み $seconds秒';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return '目標：$seconds秒';
  }

  @override
  String get voiceLegendTarget => '目標音量';

  @override
  String get voiceLegendYours => 'あなたの音量';

  @override
  String get voiceShowDetail => '数値を表示';

  @override
  String get voiceHideDetail => '数値を非表示';

  @override
  String get voiceCompletedTitle => '練習完了';

  @override
  String get voiceCompletedDurationLabel => '今回のセッション';

  @override
  String get voiceCompletedTargetLabel => '目標音量に達した時間';

  @override
  String get voiceCompletedEncourageGood => 'よくできました！大きな声で話す習慣を続けましょう。';

  @override
  String get voiceCompletedEncourageTryMore => 'いい練習です。次回はもう少し大きな声を目指しましょう。';

  @override
  String get voiceRetryButton => 'もう一度練習';

  @override
  String get voiceFinishButton => '完了';

  @override
  String get voicePracticeFooterHint =>
      'このエクササイズは音声トレーニングのため大きな声で話すことを促します。参考用であり、医学的診断ではありません。';

  @override
  String get voiceSessionTooShort => 'セッションが短すぎたため保存されませんでした';

  @override
  String get voiceProtocolPickerTitle => '練習方法を選択';

  @override
  String get voiceProtocolSteady => '一定の音量';

  @override
  String get voiceProtocolSteadyDesc => '長く「あー」と発声し、目標音量の範囲を保ちます。';

  @override
  String get voiceProtocolLadder => '音量ステップ';

  @override
  String get voiceProtocolLadderDesc => '小さめ → 目標 → 少し大きめ → 徐々に下げる。';

  @override
  String get voiceProtocolMultiSet => '短い3セット';

  @override
  String get voiceProtocolMultiSetDesc => '短い練習を3回行い、各セットの間に少し休みます。';

  @override
  String get voiceTrainingReferenceDisclaimer =>
      '個人のリハビリ練習用です。診断や治療を目的としたものではありません。';

  @override
  String get voiceLadderPhaseSoft => 'フェーズ1：小さめの声';

  @override
  String get voiceLadderPhaseTarget => 'フェーズ2：目標音量';

  @override
  String get voiceLadderPhaseStrong => 'フェーズ3：少し大きめ';

  @override
  String get voiceLadderPhaseCoolDown => 'フェーズ4：徐々に下げる';

  @override
  String voiceLadderChip(int seconds) {
    return '残り：$seconds秒';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return 'セット $current/$total · $seconds秒';
  }

  @override
  String voiceRestChip(int seconds) {
    return '休憩 $seconds秒';
  }

  @override
  String get voiceRestTitle => '休憩';

  @override
  String voiceRestBody(int next, int total) {
    return '次は全$totalセット中の$nextセット目です。声を休めてください。';
  }

  @override
  String get tremorDurationPickerTitle => '測定時間';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds秒';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return 'スマートフォンを$seconds秒間動かさずに持ち、腕を安定させてください。';
  }

  @override
  String get tremorMotionBandDisclaimer => '動きの区分は個人の参考用であり、医学的評価ではありません。';

  @override
  String get planTodayTitle => '今日の練習';

  @override
  String get planTodaySubtitle => 'トレーニング内容に基づく提案です。タップして開始します。';

  @override
  String get planEmptyHint => 'まだ提案はありません。ホームからトレーニングを試してください。';

  @override
  String get planDomainHand => '手';

  @override
  String get planDomainVoice => '音声';

  @override
  String get planDomainMotion => '動作';

  @override
  String planGoalProgress(int done, int target) {
    return '今日：$done/$targetセッション';
  }

  @override
  String get planGoalCompleted => '今日の目標を達成しました。お疲れさまでした。';

  @override
  String planWeeklyProgress(int done, int target) {
    return '今週：$done/$targetセッション';
  }

  @override
  String get planOpenTask => '開始';

  @override
  String get planMotionShelvedNote => '一部のスマートフォンでは動作検出に制限がありますが、練習画面は開けます。';

  @override
  String get voiceProtocolClarity => '明瞭なフレーズ';

  @override
  String get voiceProtocolClarityDesc => '短いフレーズを声に出して読みます。発音の採点は行いません。';

  @override
  String get voiceClarityHint =>
      'フレーズを明瞭に読んでください。発声したかどうかのみを確認し、「正しい」発音かどうかは判定しません。';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return 'フレーズ $current/$total';
  }

  @override
  String get voiceClarityVoiceDetected => '声を検出しました';

  @override
  String get voiceClarityWaitingVoice => 'フレーズを声に出してください';

  @override
  String get voiceClarityNextPhrase => '次のフレーズ';

  @override
  String get voiceClarityFinish => '終了';

  @override
  String get voiceClarityPhrase1 => 'おはようございます';

  @override
  String get voiceClarityPhrase2 => '今日の調子はいかがですか？';

  @override
  String get voiceClarityPhrase3 => 'お水を取ってください';

  @override
  String get voiceClarityPhrase4 => '元気に過ごしています';

  @override
  String get voiceClarityPhrase5 => 'また明日';

  @override
  String get handModePickerTitle => '練習方法';

  @override
  String get handModeStillHold => '静止保持';

  @override
  String get handModeStillHoldDesc => 'スマートフォンを動かさずに持ち、センサーで動きを測定します。';

  @override
  String get handModeObjectHold => '物を持つ';

  @override
  String get handModeObjectHoldDesc =>
      'カップまたは柔らかいボールを安定して持ちます。タイマーによる案内のみで、物体検出は行いません。';

  @override
  String get handModeFineMotor => '指のタップ';

  @override
  String get handModeFineMotorDesc => '親指を各指に順番に触れます。回数はご自身で数えてください。';

  @override
  String get handGuidedDisclaimer => '個人のリハビリ支援を目的としたガイド付き練習です。医学的評価ではありません。';

  @override
  String get handObjectHoldInstruction =>
      '楽な姿勢で座り、片手でカップまたは柔らかいボールを持ってください。強く握らず、安定させてください。';

  @override
  String get handObjectHoldStart => '保持を開始';

  @override
  String get handObjectHoldRunning => '安定させたまま持ってください…';

  @override
  String get handObjectHoldDone => '保持完了';

  @override
  String get handFineMotorInstruction => '親指を人差し指、中指、薬指、小指の順に触れます。ここまでで1回です。';

  @override
  String get handFineMotorMarkCycle => '1回完了';

  @override
  String handFineMotorProgress(int done, int target) {
    return '回数：$done/$target';
  }

  @override
  String get handGuidedCompleteTitle => '練習完了';

  @override
  String get handGuidedCompleteBody => 'お疲れさまでした。このセッションは個人練習としてのみ保存されます。';

  @override
  String get dataTabTitle => 'あなたのデータ';

  @override
  String get dataTabSubtitle => '個人の参考用に、週間の練習スコアと傾向を表示します。';

  @override
  String get dataTrendsTitle => '今週と先週の比較';

  @override
  String get dataOpenFullReport => 'リハビリレポート全体を開く';

  @override
  String get dataRecentSessions => '最近のセッション';

  @override
  String dataStreakDays(int days) {
    return '連続トレーニング：$days日';
  }

  @override
  String get reportShareButton => 'レポートを共有';

  @override
  String get reportShareConsentTitle => 'リハビリ概要を共有しますか？';

  @override
  String get reportShareConsentBody =>
      '練習スコアと傾向を含むテキストファイルを作成し、システムの共有シート（メッセージ、メール、ファイルなど）を開きます。\n\n個人の参考用であり、医学的診断ではありません。\n\n送信後、Amplio は受信者からファイルを回収できません。今キャンセルするか、次の画面で共有先を選ばずに閉じることができます。';

  @override
  String get reportShareConsentConfirm => '理解して続ける';

  @override
  String get reportShareFileTitle => 'Amplio Care リハビリ概要';

  @override
  String get reportShareSuccess => '共有シートを開きました';

  @override
  String get reportShareFailed => 'レポートを共有できませんでした。もう一度お試しください。';

  @override
  String get reportShareFooterNote =>
      '共有するたびに確認が必要です。Amplio が医師へ自動的にメールを送ることはありません。';

  @override
  String get profileTabTitle => 'プロフィール';

  @override
  String get profileGuestLabel => 'ゲスト';

  @override
  String get profileGuestSubtitle => '端末内で利用中です。サインインするとクラウド同期を利用できます。';

  @override
  String get profileSignedInLabel => 'サインイン済み';

  @override
  String get profileSectionPreferences => '環境設定';

  @override
  String get profileSectionAccount => 'アカウントとデータ';

  @override
  String get profileSectionLegal => 'プライバシーと利用規約';

  @override
  String get accessibilitySettings => 'アクセシビリティ';

  @override
  String get exitGuestMode => 'ゲストモードを終了';

  @override
  String get exitGuestModeConfirm =>
      'ゲストモードを終了しますか？もう一度サインインするか、ゲストとして続ける必要があります。';

  @override
  String get trainingReminderPageTitle => '練習リマインダー';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody => 'できるときに短い練習を。できない日があっても大丈夫です。';

  @override
  String get trainingReminderDisclaimer =>
      '任意のローカルリマインダーであり、治療スケジュールではありません。いつでもオフにできます。通知を見逃してもスコアには影響しません。';

  @override
  String get trainingReminderEnable => '練習をリマインド';

  @override
  String trainingReminderTimeLabel(int n) {
    return '時刻 $n';
  }

  @override
  String get trainingReminderAddTime => '2つ目の時刻を追加';

  @override
  String get trainingReminderRemoveTime => 'この時刻を削除';

  @override
  String get trainingReminderQuietWeekends => '週末は通知しない';

  @override
  String get trainingReminderQuietWeekendsHint => '土曜日と日曜日は通知しません。';

  @override
  String get trainingReminderPermissionDenied =>
      '通知が許可されませんでした。後から iPhone の「設定」で有効にできます。';

  @override
  String get planReminderOff => '練習リマインダーを設定';

  @override
  String planReminderOn(String times) {
    return 'リマインダー：$times';
  }
}
