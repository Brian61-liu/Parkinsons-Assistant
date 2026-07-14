// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Amplio';

  @override
  String get selectTraining => '수행하려는 훈련을 선택하세요';

  @override
  String get clickToStartTest => '테스트 시작을 클릭하세요';

  @override
  String get clickToStartTraining => '훈련 시작을 클릭하세요';

  @override
  String get tremorTest => '손 떨림 테스트';

  @override
  String get tremorTestTitle => '손 떨림 테스트';

  @override
  String get tremorTestInstruction => '휴대폰을 손에 들고 30초 동안 팔을 정지 상태로 유지하세요';

  @override
  String remainingTime(int time) {
    return '$time초 남음';
  }

  @override
  String get readyToTest => '테스트 시작 준비 완료';

  @override
  String get frequency => '주파수';

  @override
  String get amplitude => '진폭';

  @override
  String get waitingForData => '데이터를 기다리는 중...';

  @override
  String get startTest => '테스트 시작';

  @override
  String get stopTest => '테스트 중지';

  @override
  String get tremorTestCancelledNoSave => '테스트가 취소되었으며 기록되지 않았습니다';

  @override
  String get testCompleted => '테스트 완료';

  @override
  String averageFrequency(String frequency) {
    return '평균 주파수: $frequency Hz';
  }

  @override
  String averageAmplitude(String amplitude) {
    return '평균 진폭: $amplitude';
  }

  @override
  String maxAmplitude(String maxAmplitude) {
    return '최대 진폭: $maxAmplitude';
  }

  @override
  String get ok => '확인';

  @override
  String get sensorPermissionRequired => '테스트를 수행하려면 센서 권한이 필요합니다';

  @override
  String get language => '언어';

  @override
  String get changeLanguage => '언어 변경';

  @override
  String get selectLanguage => '언어';

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
  String get realtimeWaveform => '실시간 파형';

  @override
  String get waveformAxisTime => '시간';

  @override
  String get waveformAxisAmplitude => '진폭';

  @override
  String get waveformHint => '파형이 높을수록 손 떨림이 더 뚜렷합니다';

  @override
  String get tremorSeverity => '중증도';

  @override
  String get tremorFrequency => '주파수';

  @override
  String get avgAmplitude => '평균 진폭';

  @override
  String get maxAmp => '최대 진폭';

  @override
  String get variability => '변동성';

  @override
  String get sampleRate => '샘플링';

  @override
  String get dataPoints => '데이터';

  @override
  String get severityNormal => '정상';

  @override
  String get severityMild => '경미';

  @override
  String get severityModerate => '중등도';

  @override
  String get severityModerateSevere => '중증도';

  @override
  String get severitySevere => '심각';

  @override
  String get appSubtitle => '움직임 추적 및 분석을 위한 파킨슨 개인 도우미';

  @override
  String get signInWithGoogle => 'Google로 로그인';

  @override
  String get signInWithApple => 'Apple로 로그인';

  @override
  String get signingIn => '로그인 중...';

  @override
  String get privacyNotice => '로그인하면 서비스 약관 및 개인정보 보호정책에 동의하게 됩니다';

  @override
  String get loginError => '로그인 오류';

  @override
  String get confirm => '확인';

  @override
  String get cancel => '취소';

  @override
  String get logout => '로그아웃';

  @override
  String get logoutConfirm => '정말 로그아웃하시겠습니까?';

  @override
  String welcome(String name) {
    return '환영합니다, $name';
  }

  @override
  String get syncToCloud => '클라우드에 동기화';

  @override
  String get dataSynced => '데이터가 성공적으로 동기화되었습니다';

  @override
  String get privacyPolicy => '개인정보 보호정책';

  @override
  String get privacyPolicyIntro => '소개';

  @override
  String get privacyPolicyIntroText =>
      'Amplio는 귀하의 개인정보와 건강 데이터 보호에 최선을 다합니다. 본 정책은 정보 수집, 사용, 저장, 보호에 대해 설명합니다.';

  @override
  String get dataCollection => '수집하는 데이터';

  @override
  String get dataCollectionText =>
      '다음 데이터를 수집합니다:\n\n• 계정 정보: 이메일, 이름 (인증용)\n• 센서 데이터: 떨림 테스트 중 동작 데이터\n• 테스트 결과: 주파수, 진폭, 중증도\n\n데이터 최소화 원칙을 따릅니다.';

  @override
  String get dataUsage => '데이터 사용 방법';

  @override
  String get dataUsageText =>
      '귀하의 데이터는 다음 목적으로만 사용됩니다:\n\n• 떨림 분석 및 추적 제공\n• 건강 보고서 생성\n• 알고리즘 개선 (동의 시 익명 데이터만)';

  @override
  String get dataStorage => '데이터 저장 및 보안';

  @override
  String get dataStorageText =>
      '귀하의 데이터는 Google Firebase에 안전하게 저장됩니다.\n\n• 종단간 암호화\n• 모든 전송에 TLS 1.3\n• 엄격한 접근 제어\n• 정기 보안 감사';

  @override
  String get dataSharing => '데이터 공유';

  @override
  String get dataSharingText =>
      '귀하의 건강 데이터를 절대 판매하지 않습니다.\n\n데이터는 다음 경우에만 공유됩니다:\n• 귀하의 명시적 동의\n• 지정된 의료 제공자와 공유\n• 법적 요구 시\n\n익명화된 데이터는 연구에 사용될 수 있습니다.';

  @override
  String get userRights => '귀하의 데이터 권리';

  @override
  String get userRightsText =>
      '다음 권리가 있습니다:\n\n• 접근권: 모든 데이터 조회\n• 이동권: 데이터 내보내기\n• 삭제권: 데이터 삭제\n• 철회권: 언제든 동의 철회\n• 문의: 개인정보 관련 문의';

  @override
  String get dataSecurity => '보안 조치';

  @override
  String get dataSecurityText =>
      '다층적 보안 조치를 구현합니다:\n\n• AES-256 정적 암호화\n• TLS 1.3 전송 암호화\n• 다중 인증\n• 정기 침투 테스트\n• 포괄적 감사 로그\n• 직원 보안 교육';

  @override
  String get contactUs => '문의하기';

  @override
  String get contactUsText => '개인정보 관련 문의: privacy@kineo-app.com';

  @override
  String get lastUpdated => '최종 업데이트';

  @override
  String get version => '버전';

  @override
  String get dataManagement => '데이터 관리';

  @override
  String get gdprRights => '언제든 개인 건강 데이터에 접근, 내보내기, 삭제할 권리가 있습니다.';

  @override
  String get exportData => '데이터 내보내기';

  @override
  String get exportDataDescription => '모든 데이터의 완전한 사본을 다운로드합니다 (JSON 형식).';

  @override
  String get export => '내보내기';

  @override
  String get exporting => '내보내는 중...';

  @override
  String get exportSuccess => '내보내기 성공';

  @override
  String get exportSuccessMessage => '데이터가 클립보드에 복사되었습니다.';

  @override
  String get deleteAllRecords => '모든 테스트 기록 삭제';

  @override
  String get deleteAllRecordsDescription =>
      '모든 떨림 테스트 기록을 영구 삭제합니다. 이 작업은 취소할 수 없습니다.';

  @override
  String get deleteAllData => '모든 데이터 삭제';

  @override
  String get deleteAllDataConfirm => '모든 테스트 기록을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get delete => '삭제';

  @override
  String get deleteSuccess => '삭제 성공';

  @override
  String get deleteSuccessMessage => '모든 테스트 기록이 영구 삭제되었습니다.';

  @override
  String get deleteAccount => '계정 삭제';

  @override
  String get deleteAccountDescription => '계정과 모든 관련 데이터를 영구 삭제합니다.';

  @override
  String get deleteAccountWarning => '계정과 모든 데이터가 영구 삭제됩니다. 이 작업은 취소할 수 없습니다.';

  @override
  String get deleteAccountFinalWarning =>
      '최종 경고: 삭제 후 계정과 데이터는 영원히 사라집니다. 정말 확실합니까?';

  @override
  String get finalWarning => '최종 경고';

  @override
  String get deleteForever => '영구 삭제';

  @override
  String get continue_ => '계속';

  @override
  String get error => '오류';

  @override
  String get settings => '설정';

  @override
  String get testHistory => '기록';

  @override
  String get noTestRecords => '테스트 기록이 없습니다';

  @override
  String get noTestRecordsHint => '떨림 테스트를 완료하면 결과가 여기에 표시됩니다';

  @override
  String get testDate => '테스트 날짜';

  @override
  String get deleteRecord => '기록 삭제';

  @override
  String get deleteRecordConfirm => '이 테스트 기록을 삭제하시겠습니까?';

  @override
  String get recordDeleted => '기록이 삭제되었습니다';

  @override
  String get duration => '시간';

  @override
  String get seconds => '초';

  @override
  String get tapToCancel => '탭하여 취소';

  @override
  String get changeAvatar => '아바타 변경';

  @override
  String get selectFromGallery => '갤러리에서 선택';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get avatarUpdated => '아바타가 성공적으로 업데이트되었습니다';

  @override
  String get avatarUpdateFailed => '아바타 업데이트 실패';

  @override
  String get voiceTraining => '음성 훈련';

  @override
  String get voiceTrainingMainInstruction => '긴 소리를 지속적으로 내주세요 —— 아 ——';

  @override
  String get voiceTrainingInstruction =>
      'LSVT LOUD 치료 원칙에 따라 큰 소리로 말하세요. 원의 크기는 볼륨에 따라 실시간으로 변경됩니다. 75-85 dB에 도달하면 원이 녹색으로 변합니다.';

  @override
  String get voiceTrainingReady => '시작 준비 완료';

  @override
  String get voiceTrainingCalibrating => '환경 소음 보정 중...';

  @override
  String get voiceTrainingTooQuiet => '더 크게 말하세요!';

  @override
  String get voiceTrainingKeepGoing => '좋습니다, 계속하세요!';

  @override
  String get voiceTrainingExcellent => '훌륭합니다! 계속하세요!';

  @override
  String voiceTrainingTarget(String target) {
    return '목표: $target dB';
  }

  @override
  String voiceTrainingTargetRange(String range) {
    return '목표: $range dB';
  }

  @override
  String get startListening => '훈련 시작';

  @override
  String get stopListening => '훈련 중지';

  @override
  String get microphonePermissionRequired => '마이크 권한 필요';

  @override
  String get microphonePermissionDenied => '마이크 권한이 거부되었습니다';

  @override
  String get microphonePermissionDeniedMessage =>
      '마이크 권한이 영구적으로 거부되었습니다. 음성 훈련을 사용하려면 시스템 설정에서 마이크 권한을 활성화하세요.';

  @override
  String get microphoneError => '마이크 오류';

  @override
  String get openSettings => '설정 열기';

  @override
  String get continueAsGuest => '게스트로 계속';

  @override
  String get movementTraining => '동작 훈련';

  @override
  String get movementTrainingInstruction => '양팔을 들어 올리고 올바른 자세를 유지하세요';

  @override
  String get armsRaised => '팔이 올라갔습니다';

  @override
  String get raiseArms => '팔을 들어 올려주세요';

  @override
  String get lowerArms => '훌륭합니다! 이제 팔을 내려주세요';

  @override
  String get successCount => '성공 횟수';

  @override
  String get cameraPermissionRequired => '카메라 권한이 필요합니다';

  @override
  String get cameraPermissionDeniedMessage =>
      '카메라 권한이 거부되었습니다. 동작 훈련을 사용하려면 시스템 설정에서 카메라 권한을 활성화하세요.';

  @override
  String get setGoal => '목표 설정';

  @override
  String get reps => '회';

  @override
  String get greatJob => '훌륭합니다!';

  @override
  String get goalCompleted => '목표를 달성했습니다!';

  @override
  String get playAgain => '다시 하기';

  @override
  String get trainingHistory => '훈련 기록';

  @override
  String get noTrainingRecords => '훈련 기록 없음';

  @override
  String get noTrainingRecordsHint => '세션을 완료한 후 훈련 기록이 여기에 표시됩니다';

  @override
  String get trainingDetails => '훈련 세부 정보';

  @override
  String get goalStatus => '목표 상태';

  @override
  String get goalReached => '완료';

  @override
  String get goalNotReached => '미완료';

  @override
  String get minutes => '분';

  @override
  String get selectTrainingType => '훈련 유형 선택';

  @override
  String get armsRaisedTraining => '팔 올리기';

  @override
  String get legLiftTraining => '다리 올리기';

  @override
  String get legLiftInstruction => '한 다리를 올렸다가 내려서 한 동작을 완료하세요';

  @override
  String get lowerLegs => '다리를 내려주세요';

  @override
  String get legsRaised => '다리가 올라갔습니다';

  @override
  String get raiseLegs => '다리를 올려주세요';

  @override
  String get trainingType => '훈련 유형';

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
