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
  String get clickToStartTest => '탭하여 테스트 시작';

  @override
  String get clickToStartTraining => '탭하여 훈련 시작';

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
  String get tremorSeverity => '움직임 정도';

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
  String get severityNormal => '움직임이 적음';

  @override
  String get severityMild => '가벼운 움직임';

  @override
  String get severityModerate => '중간 정도의 움직임';

  @override
  String get severityModerateSevere => '움직임이 큼';

  @override
  String get severitySevere => '가장 높은 구간';

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
  String get syncing => '동기화 중…';

  @override
  String get syncFailed => '동기화에 실패했습니다. 네트워크를 확인한 후 다시 시도하세요.';

  @override
  String get syncFailedHint => '동기화 실패 — 탭하여 다시 시도';

  @override
  String get syncRetry => '다시 시도';

  @override
  String get loginRequiredForSync => '클라우드 동기화를 사용하려면 로그인하세요';

  @override
  String lastSyncedAt(String time) {
    return '마지막 동기화: $time';
  }

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
      '귀하의 데이터는 다음 목적으로만 사용됩니다:\n\n• 재활 훈련 기능 및 진행 추적 제공\n• 개인 참고용 앱 내 요약 및 보고서 표시\n• 익명 데이터와 동의가 있는 경우에만 앱 개선에 사용';

  @override
  String get dataStorage => '데이터 저장 및 보안';

  @override
  String get dataStorageText =>
      '로그인하면 계정과 동기화된 훈련 데이터가 Google Firebase에 저장될 수 있습니다. 게스트 및 기기 전용 데이터는 기기에 남습니다.\n\n• 클라우드 통신에 HTTPS/TLS 사용\n• 계정 및 Firestore 보안 규칙으로 접근 제한\n• 앱에서 데이터 내보내기 또는 삭제 가능';

  @override
  String get dataSharing => '데이터 공유';

  @override
  String get dataSharingText =>
      '개인 건강 데이터를 판매하지 않습니다.\n\n데이터가 앱 밖으로 나가는 경우는 다음과 같습니다:\n• 사용자가 명시적으로 파일을 내보내거나 공유하는 경우\n• 법률상 공개가 요구되는 경우\n\n현재 의료기관에 직접 데이터를 보내지 않습니다.';

  @override
  String get userRights => '귀하의 데이터 권리';

  @override
  String get userRightsText =>
      '다음 권리가 있습니다:\n\n• 접근권: 모든 데이터 조회\n• 이동권: 데이터 내보내기\n• 삭제권: 데이터 삭제\n• 철회권: 언제든 동의 철회\n• 문의: 개인정보 관련 문의';

  @override
  String get dataSecurity => '보안 조치';

  @override
  String get dataSecurityText =>
      '현재 기술 스택에서 제공하는 보안 조치로 데이터를 보호합니다:\n\n• 클라우드 요청용 TLS\n• 로그인 계정용 Firebase Authentication\n• 본인 데이터에만 접근하도록 제한하는 Firestore 규칙\n• 떨림 센서 샘플과 복약 닉네임 등 민감한 로컬 건강 관련 필드를 기기에서 AES로 암호화하고 키는 iOS 키체인에 저장\n• 앱 내 데이터 내보내기 및 계정 삭제\n\n내보낸 파일은 사용자가 직접 이용할 수 있도록 읽을 수 있는 형식으로 작성됩니다. 로컬 데이터베이스 전체가 파일 단위로 암호화된다고 주장하지 않습니다.';

  @override
  String get medicationPrivacy => '선택적 복약 닉네임 목록';

  @override
  String get medicationPrivacyText =>
      '선택적 복약 닉네임 목록을 켜면 닉네임, 알림 시간, 체크인은 이 기기에 저장됩니다. 로그인하면 Amplio 클라우드 계정에도 동기화되어 다른 iPhone에서 복원할 수 있습니다. 알림 권한을 허용한 경우 선택적 로컬 알림은 이 기기에서만 울립니다. 앱에서 이 데이터를 삭제할 수 있습니다(계정 삭제 포함). 이 기능은 의료 조언이 아니며, 내보낼 때마다 별도로 동의하지 않는 한 복약 데이터는 내보내기에 포함되지 않습니다.';

  @override
  String get contactUs => '문의하기';

  @override
  String get contactUsText =>
      'Amplio는 개인 독립 개발자가 운영합니다(도메인: ampliocare.com).\n\n• 개인정보/데이터 요청: privacy@ampliocare.com\n• 사용자 지원: support@ampliocare.com\n• 임상 협력: clinical@ampliocare.com\n• 비즈니스: hello@ampliocare.com';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get termsIntro => '소개';

  @override
  String get termsIntroText =>
      '본 서비스 약관(“약관”)은 파킨슨병과 함께 살아가는 분을 위한 iPhone 재활 훈련 보조 앱 Amplio 이용을 위한 초안 합의입니다. Amplio는 개인 독립 개발자가 운영합니다. 본 약관은 전문 법률 자문을 대체하지 않습니다.';

  @override
  String get termsAcceptance => '동의';

  @override
  String get termsAcceptanceText =>
      '로그인, 게스트로 계속 사용, 또는 그 밖의 방식으로 Amplio를 사용하면 본 약관 및 개인정보 처리방침에 동의한 것으로 간주됩니다. 동의하지 않으면 앱을 사용하지 마세요.';

  @override
  String get termsUseOfApp => 'Amplio 사용';

  @override
  String get termsUseOfAppText =>
      'Amplio는 떨림 측정, 음성 연습, 동작 연습, 진행 요약, 선택적 복약 닉네임 목록(게스트는 기기 내; 로그인 시 동기화 가능) 등 선택적 훈련 도구를 제공합니다.\n\n합법적인 개인 목적으로만 앱을 사용하고, 타인에게 해를 끼치거나 적용 법률을 위반하는 방식으로 센서, 계정, 내보내기 데이터를 남용하지 않을 것에 동의합니다.';

  @override
  String get termsMedicalDisclaimer => '의료 조언이 아님';

  @override
  String get termsMedicalDisclaimerText =>
      'Amplio는 웰니스 및 재활 훈련 보조 도구입니다. 파킨슨병이나 다른 질환을 진단, 치료, 치유, 예방하지 않습니다.\n\n점수, 추세, 보고서, 알림은 개인 참고용이며 의사, 물리치료사, 언어치료사 또는 기타 자격 있는 전문가의 조언을 대체하지 않습니다. 의료 결정은 전문가와 상담하세요. 통증이나 어지럼증이 생기거나 안전하게 계속할 수 없는 경우 운동을 중단하세요.';

  @override
  String get termsAccounts => '계정 및 데이터';

  @override
  String get termsAccountsText =>
      'Amplio는 Apple 로그인, Google 로그인 또는 게스트로 사용할 수 있습니다. 로그인 계정에서의 활동에 대한 책임은 사용자에게 있습니다.\n\n앱에서 일부 데이터를 내보내거나 삭제할 수 있습니다. 계정 삭제 시 기술·법적 한도 내에서 당사가 통제하는 관련 클라우드 데이터가 삭제됩니다. 게스트 및 기기 전용 데이터는 삭제할 때까지 기기에만 남을 수 있습니다.';

  @override
  String get termsLimitation => '책임의 제한';

  @override
  String get termsLimitationText =>
      '법이 허용하는 최대 범위에서 개발자는 Amplio를 “있는 그대로” 제공하며 중단 없는 또는 오류 없는 작동을 보증하지 않습니다.\n\n훈련 점수 의존, 복약 알림 누락, 운동 시도 또는 앱 접근 불능으로 인한 부상, 손실, 손해에 대해 법으로 제한할 수 없는 책임을 제외하고 개발자는 책임지지 않습니다.';

  @override
  String get termsChanges => '변경';

  @override
  String get termsChangesText =>
      '앱이 발전함에 따라 본 약관을 업데이트할 수 있습니다. 업데이트 시 “최종 업데이트” 날짜가 변경됩니다. 업데이트 후 계속 사용하면 개정 약관에 동의한 것으로 간주됩니다. 중요한 변경은 앱에서 확인할 수 있을 때 검토하세요.';

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
  String get exportDataDescription =>
      '프로필과 훈련 기록을 CSV 파일로 내보냅니다. 시스템 공유 시트에서 저장하거나 공유할 수 있습니다. 해당 내보내기에 동의하지 않는 한 복약 닉네임은 포함되지 않습니다.';

  @override
  String get export => '내보내기';

  @override
  String get exporting => '내보내는 중...';

  @override
  String get exportSuccess => '내보내기 성공';

  @override
  String get exportSuccessMessage =>
      'CSV 파일이 준비되었습니다. 공유 시트에서 파일 앱에 저장하거나 전송할 수 있습니다. 원시 센서 샘플은 개수만 요약됩니다.';

  @override
  String get exportMedicationConsentTitle => '복약 닉네임을 포함할까요?';

  @override
  String get exportMedicationConsentBody =>
      '훈련 기록은 CSV 파일로 내보내집니다.\n\n‘이번에만 포함’을 선택하지 않는 한 복약 닉네임, 알림 시간 및 체크인은 포함되지 않습니다. 이는 처방전이나 의료 기록이 아닙니다.\n\n취소하면 내보내기를 중단합니다. 복약 데이터 없이 내보낼 수도 있습니다.';

  @override
  String get exportMedicationExclude => '복약 데이터 없이 내보내기';

  @override
  String get exportMedicationInclude => '복약 목록 포함';

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
      '또렷하고 힘 있는 목소리로 말하는 연습을 하세요. 원의 크기는 음량에 따라 변하며, 목표 범위에 도달하면 초록색으로 바뀝니다. 개인 연습용이며 의료 치료가 아닙니다.';

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
  String get medicationList => '복약 목록';

  @override
  String get medicationListEnable => '복약 목록 설정';

  @override
  String get medicationDisclaimer =>
      'Amplio 복약 목록은 직접 시간을 기록하도록 돕습니다. 의학적 조언이 아니며 용량 안내를 제공하지 않습니다. 게스트는 데이터가 이 기기에만 저장됩니다. 로그인하면 알림과 체크인을 Amplio 계정에 동기화할 수 있습니다.';

  @override
  String get medicationDisclaimerAccept => '이해했으며 활성화합니다';

  @override
  String get medicationLabel => '표시 이름';

  @override
  String get medicationLabelHint => '예: 아침 식사 후(별명 사용 가능)';

  @override
  String get medicationTime => '시간';

  @override
  String get medicationTaken => '복용 완료';

  @override
  String get medicationUndo => '되돌리기';

  @override
  String get medicationUndoConfirm => '이 항목의 오늘 체크인을 삭제할까요?';

  @override
  String medicationTodayProgress(int done, int total) {
    return '오늘 $done/$total';
  }

  @override
  String get medicationManage => '관리';

  @override
  String get medicationAdd => '알림 추가';

  @override
  String get medicationEdit => '알림 수정';

  @override
  String get medicationClose => '복약 목록 끄기';

  @override
  String get medicationCloseConfirm => '목록을 숨기거나 이 기기의 모든 복약 데이터를 삭제할 수도 있습니다.';

  @override
  String get medicationCloseHideOnly => '숨기기만';

  @override
  String get medicationCloseAndDelete => '숨기고 모든 데이터 삭제';

  @override
  String get medicationDeleteAllData => '복약 목록 데이터 삭제';

  @override
  String get medicationDeleteAllDataDescription =>
      '이 기기의 모든 복약 알림과 체크인을 영구 삭제합니다.';

  @override
  String get medicationDeleteAllDataConfirm =>
      '이 기기의 복약 목록 데이터를 모두 삭제할까요? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get medicationCollapse => '접기';

  @override
  String get medicationExpand => '펼치기';

  @override
  String get medicationEmptyToday => '오늘 알림이 없습니다. 관리에서 추가하세요.';

  @override
  String medicationCompletedAt(String time) {
    return '$time에 완료';
  }

  @override
  String get medicationSave => '저장';

  @override
  String get medicationDeleteReminder => '알림 삭제';

  @override
  String get medicationDeleteReminderConfirm => '이 알림을 삭제할까요?';

  @override
  String get medicationNoReminders => '아직 알림이 없습니다';

  @override
  String get medicationDeleteSuccess => '복약 목록 데이터가 삭제되었습니다';

  @override
  String get rehabReport => '재활 보고서';

  @override
  String get rehabReportDisclaimer =>
      '재활 참고용입니다. 의학적 진단이 아니며 케어팀의 조언을 대체하지 않습니다.';

  @override
  String get reportOverallScore => '종합 점수';

  @override
  String reportDailyProgress(int percent) {
    return '오늘 목표: $percent%';
  }

  @override
  String reportWeeklyProgress(int percent) {
    return '이번 주: $percent%';
  }

  @override
  String reportStreak(int days) {
    return '연속: $days일';
  }

  @override
  String get reportNoData => '아직 훈련 데이터가 부족합니다';

  @override
  String get handTraining => '손';

  @override
  String get voiceTrainingShort => '음성';

  @override
  String get motionTrainingShort => '동작';

  @override
  String get tabHome => '홈';

  @override
  String get tabPlan => '계획';

  @override
  String get tabData => '데이터';

  @override
  String get tabProfile => '프로필';

  @override
  String get comingSoon => '출시 예정';

  @override
  String trainingStreak(int days) {
    return '$days일';
  }

  @override
  String get trainingStreakLabel => '연속 훈련';

  @override
  String get voiceClarity => '음성 명료도';

  @override
  String get handStability => '손 안정성';

  @override
  String get movementAbility => '동작 훈련';

  @override
  String get medicationReminder => '복약';

  @override
  String lastTrainingAgo(String timeAgo) {
    return '마지막 훈련 · $timeAgo';
  }

  @override
  String lastMeasurementAgo(String timeAgo) {
    return '마지막 측정 · $timeAgo';
  }

  @override
  String get relativeToday => '오늘';

  @override
  String get relativeYesterday => '어제';

  @override
  String relativeDaysAgo(int days) {
    return '$days일 전';
  }

  @override
  String get noTrainingYet => '아직 훈련 기록이 없습니다';

  @override
  String get noMeasurementYet => '아직 측정 없음';

  @override
  String get tapToStart => '탭하여 시작';

  @override
  String durationSec(int count) {
    return '$count초';
  }

  @override
  String durationMin(int count) {
    return '$count분';
  }

  @override
  String get voiceSessionCount => '1회 세션';

  @override
  String get handMeasurementCount => '1회 측정';

  @override
  String motionCompletionCount(int done, int total) {
    return '$done/$total회';
  }

  @override
  String get medicationSetupPrompt => '복약 알림 설정';

  @override
  String get medicationSetupSubtitle => '이 기기에 저장; 로그인 시 동기화';

  @override
  String get medicationNoUpcoming => '오늘 예정된 알림 없음';

  @override
  String get medicationNextDoseLabel => '다음 복약';

  @override
  String medicationNextDoseTime(String time) {
    return '$time';
  }

  @override
  String get medicationStatusUpcoming => '예정';

  @override
  String get medicationStatusPending => '대기 중';

  @override
  String medicationNotificationBody(String label) {
    return '복약 시간: $label';
  }

  @override
  String get medicationNotificationPermissionNote =>
      '선택 사항: 알림을 허용하면 Amplio가 설정한 시간에 이 기기에서 알려 줍니다. 알림은 이 기기에만 유지됩니다.';

  @override
  String get recentActivity => '최근 활동';

  @override
  String get nonMedicalDisclaimerTitle => '참고용입니다';

  @override
  String get nonMedicalDisclaimerBody =>
      '표시된 측정값은 재활 훈련 참고용입니다. 의학적 진단이 아니며 의료팀의 조언을 대체하지 않습니다.';

  @override
  String get voicePrepHint => '편하게 앉으세요. 휴대폰을 입에서 약 30cm 떨어뜨려 드세요.';

  @override
  String voicePrepDurationHint(int seconds) {
    return '약 $seconds초 동안 연습합니다';
  }

  @override
  String get voicePrepEnvironmentHint => '조용한 방에서 연습하면 더 좋습니다';

  @override
  String voiceCalibratingCountdown(int seconds) {
    return '조용히 해주세요 · $seconds초';
  }

  @override
  String voiceElapsedLabel(int seconds) {
    return '연습 $seconds초';
  }

  @override
  String voiceTargetDurationChip(int seconds) {
    return '목표: $seconds초';
  }

  @override
  String get voiceLegendTarget => '목표 음량';

  @override
  String get voiceLegendYours => '내 음량';

  @override
  String get voiceShowDetail => '수치 표시';

  @override
  String get voiceHideDetail => '수치 숨기기';

  @override
  String get voiceCompletedTitle => '연습 완료';

  @override
  String get voiceCompletedDurationLabel => '이번 세션';

  @override
  String get voiceCompletedTargetLabel => '목표 음량 도달 시간';

  @override
  String get voiceCompletedEncourageGood => '잘하셨어요! 크게 말하는 습관을 이어가세요.';

  @override
  String get voiceCompletedEncourageTryMore => '좋은 시도예요. 다음에는 조금 더 크게 말해 보세요.';

  @override
  String get voiceRetryButton => '다시 연습';

  @override
  String get voiceFinishButton => '완료';

  @override
  String get voicePracticeFooterHint =>
      '이 연습은 음성 훈련을 위해 크게 말하기를 권장합니다. 참고용이며 의학적 진단이 아닙니다.';

  @override
  String get voiceSessionTooShort => '세션이 너무 짧아 저장되지 않았습니다';

  @override
  String get voiceProtocolPickerTitle => '연습 방식 선택';

  @override
  String get voiceProtocolSteady => '일정한 음량';

  @override
  String get voiceProtocolSteadyDesc => '목표 음량 구간에서 길게 ‘아’ 소리를 냅니다.';

  @override
  String get voiceProtocolLadder => '음량 단계';

  @override
  String get voiceProtocolLadderDesc => '작게 → 목표 → 조금 더 크게 → 서서히 줄이기.';

  @override
  String get voiceProtocolMultiSet => '짧은 3세트';

  @override
  String get voiceProtocolMultiSetDesc => '짧게 세 번 연습하고 세트 사이에 잠시 쉽니다.';

  @override
  String get voiceTrainingReferenceDisclaimer => '개인 재활 연습용이며 진단이나 치료가 아닙니다.';

  @override
  String get voiceLadderPhaseSoft => '1단계: 작은 목소리';

  @override
  String get voiceLadderPhaseTarget => '2단계: 목표 음량';

  @override
  String get voiceLadderPhaseStrong => '3단계: 조금 더 크게';

  @override
  String get voiceLadderPhaseCoolDown => '4단계: 서서히 줄이기';

  @override
  String voiceLadderChip(int seconds) {
    return '단계 남은 시간: $seconds초';
  }

  @override
  String voiceSetChip(int current, int total, int seconds) {
    return '$current/$total세트 · $seconds초';
  }

  @override
  String voiceRestChip(int seconds) {
    return '휴식 $seconds초';
  }

  @override
  String get voiceRestTitle => '휴식';

  @override
  String voiceRestBody(int next, int total) {
    return '다음은 총 $total세트 중 $next세트입니다. 목소리를 편하게 쉬세요.';
  }

  @override
  String get tremorDurationPickerTitle => '측정 시간';

  @override
  String tremorDurationSeconds(int seconds) {
    return '$seconds초';
  }

  @override
  String tremorTestInstructionDynamic(int seconds) {
    return '휴대폰을 $seconds초 동안 움직이지 말고 팔을 안정적으로 유지하세요.';
  }

  @override
  String get tremorMotionBandDisclaimer => '움직임 구간은 개인 참고용이며 의학적 평가가 아닙니다.';

  @override
  String get planTodayTitle => '오늘의 연습';

  @override
  String get planTodaySubtitle => '훈련 모듈을 바탕으로 한 제안입니다. 탭하여 시작하세요.';

  @override
  String get planEmptyHint => '아직 제안이 없습니다. 홈에서 훈련을 시작해 보세요.';

  @override
  String get planDomainHand => '손';

  @override
  String get planDomainVoice => '음성';

  @override
  String get planDomainMotion => '동작';

  @override
  String planGoalProgress(int done, int target) {
    return '오늘: $done/$target회';
  }

  @override
  String get planGoalCompleted => '오늘의 목표를 달성했습니다. 잘하셨어요.';

  @override
  String planWeeklyProgress(int done, int target) {
    return '이번 주: $done/$target회';
  }

  @override
  String get planOpenTask => '시작';

  @override
  String get planMotionShelvedNote =>
      '일부 휴대폰에서는 동작 감지가 제한될 수 있지만 연습 화면은 열 수 있습니다.';

  @override
  String get voiceProtocolClarity => '명료한 문장';

  @override
  String get voiceProtocolClarityDesc => '짧은 문장을 소리 내어 읽습니다. 발음 점수는 매기지 않습니다.';

  @override
  String get voiceClarityHint =>
      '문장을 또렷하게 읽어 주세요. 말했는지만 확인하며 ‘정확한’ 발음인지는 판단하지 않습니다.';

  @override
  String voiceClarityPhraseProgress(int current, int total) {
    return '문장 $current/$total';
  }

  @override
  String get voiceClarityVoiceDetected => '음성이 감지되었습니다';

  @override
  String get voiceClarityWaitingVoice => '문장을 소리 내어 읽어 주세요';

  @override
  String get voiceClarityNextPhrase => '다음 문장';

  @override
  String get voiceClarityFinish => '마치기';

  @override
  String get voiceClarityPhrase1 => '좋은 아침이에요';

  @override
  String get voiceClarityPhrase2 => '오늘 기분은 어떠세요?';

  @override
  String get voiceClarityPhrase3 => '물 좀 건네주세요';

  @override
  String get voiceClarityPhrase4 => '저는 잘 지내고 있어요';

  @override
  String get voiceClarityPhrase5 => '내일 만나요';

  @override
  String get handModePickerTitle => '연습 방식';

  @override
  String get handModeStillHold => '가만히 들기';

  @override
  String get handModeStillHoldDesc => '센서가 움직임을 측정하는 동안 휴대폰을 움직이지 말고 잡으세요.';

  @override
  String get handModeObjectHold => '물건 들기';

  @override
  String get handModeObjectHoldDesc =>
      '컵이나 부드러운 공을 안정적으로 잡으세요. 타이머로만 안내하며 물체를 감지하지 않습니다.';

  @override
  String get handModeFineMotor => '손가락 맞대기';

  @override
  String get handModeFineMotorDesc => '엄지손가락을 다른 손가락에 차례로 맞댑니다. 횟수는 직접 세어 주세요.';

  @override
  String get handGuidedDisclaimer => '개인 재활 지원을 위한 안내 연습이며 의학적 평가가 아닙니다.';

  @override
  String get handObjectHoldInstruction =>
      '편하게 앉아 한 손으로 컵이나 부드러운 공을 잡으세요. 세게 쥐지 말고 안정적으로 유지하세요.';

  @override
  String get handObjectHoldStart => '들기 시작';

  @override
  String get handObjectHoldRunning => '안정적으로 계속 잡으세요…';

  @override
  String get handObjectHoldDone => '들기 완료';

  @override
  String get handFineMotorInstruction =>
      '엄지손가락을 검지, 중지, 약지, 새끼손가락 순서로 맞대세요. 여기까지가 1회입니다.';

  @override
  String get handFineMotorMarkCycle => '1회 완료';

  @override
  String handFineMotorProgress(int done, int target) {
    return '횟수: $done/$target';
  }

  @override
  String get handGuidedCompleteTitle => '연습 완료';

  @override
  String get handGuidedCompleteBody => '잘하셨어요. 이 세션은 개인 연습 기록으로만 저장됩니다.';

  @override
  String get dataTabTitle => '내 데이터';

  @override
  String get dataTabSubtitle => '개인 참고용 주간 연습 점수와 추세입니다.';

  @override
  String get dataTrendsTitle => '이번 주와 지난주 비교';

  @override
  String get dataOpenFullReport => '전체 재활 보고서 열기';

  @override
  String get dataRecentSessions => '최근 세션';

  @override
  String dataStreakDays(int days) {
    return '연속 훈련: $days일';
  }

  @override
  String get reportShareButton => '보고서 공유';

  @override
  String get reportShareConsentTitle => '재활 요약을 공유할까요?';

  @override
  String get reportShareConsentBody =>
      '연습 점수와 추세가 포함된 텍스트 파일을 만든 후 시스템 공유 시트(메시지, Mail, 파일 등)를 엽니다.\n\n개인 참고용이며 의학적 진단이 아닙니다.\n\n파일을 보낸 후에는 Amplio가 수신자에게서 파일을 회수할 수 없습니다. 지금 취소하거나 다음 화면에서 공유 대상을 선택하지 않고 닫을 수 있습니다.';

  @override
  String get reportShareConsentConfirm => '이해했으며 계속합니다';

  @override
  String get reportShareFileTitle => 'Amplio Care 재활 요약';

  @override
  String get reportShareSuccess => '공유 시트를 열었습니다';

  @override
  String get reportShareFailed => '보고서를 공유하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get reportShareFooterNote =>
      '공유할 때마다 확인이 필요합니다. Amplio는 의사에게 자동으로 이메일을 보내지 않습니다.';

  @override
  String get profileTabTitle => '프로필';

  @override
  String get profileGuestLabel => '게스트';

  @override
  String get profileGuestSubtitle =>
      '기기에서 사용 중입니다. 로그인하면 클라우드 동기화를 사용할 수 있습니다.';

  @override
  String get profileSignedInLabel => '로그인됨';

  @override
  String get profileSectionPreferences => '환경설정';

  @override
  String get profileSectionAccount => '계정 및 데이터';

  @override
  String get profileSectionLegal => '개인정보 및 약관';

  @override
  String get accessibilitySettings => '손쉬운 사용';

  @override
  String get exitGuestMode => '게스트 모드 종료';

  @override
  String get exitGuestModeConfirm => '게스트 모드를 종료할까요? 다시 로그인하거나 게스트로 계속해야 합니다.';

  @override
  String get trainingReminderPageTitle => '연습 알림';

  @override
  String get trainingReminderTitle => 'Amplio';

  @override
  String get trainingReminderBody => '가능할 때 짧게 연습해 보세요. 놓쳐도 괜찮습니다.';

  @override
  String get trainingReminderDisclaimer =>
      '선택적 로컬 알림이며 치료 일정이 아닙니다. 언제든 끌 수 있습니다. 알림을 놓쳐도 점수에는 영향을 주지 않습니다.';

  @override
  String get trainingReminderEnable => '연습 시간 알림';

  @override
  String trainingReminderTimeLabel(int n) {
    return '시간 $n';
  }

  @override
  String get trainingReminderAddTime => '두 번째 시간 추가';

  @override
  String get trainingReminderRemoveTime => '이 시간 삭제';

  @override
  String get trainingReminderQuietWeekends => '주말 건너뛰기';

  @override
  String get trainingReminderQuietWeekendsHint => '토요일과 일요일에는 알림을 보내지 않습니다.';

  @override
  String get trainingReminderPermissionDenied =>
      '알림이 허용되지 않았습니다. 나중에 iPhone 설정에서 활성화할 수 있습니다.';

  @override
  String get planReminderOff => '연습 알림 설정';

  @override
  String planReminderOn(String times) {
    return '알림: $times';
  }
}
