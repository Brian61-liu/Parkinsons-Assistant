# Amplio 项目上下文

> Amplio 项目的长期上下文与状态记录。`.cursor/rules/amplio-workflow.mdc` 会要求 Cursor 在处理项目任务前先阅读本文件。

## 0. 当前状态摘要

最后更新：2026-06-20（肢体动作训练修复输入层 + 改为单一保守难度，避免误测与双阈值矩阵）

状态标记：

- `[ ]` 未开始或未解决。
- `[~]` 部分解决，仍有残余风险或待验证项。
- `[x]` 已解决，并已记录验证方式。

当前仍阻塞上架的 P0 问题：

- `[x]` Sign in with Apple：已完成 Apple Developer / Xcode / Firebase 配置与 iOS 真机验证。
- `[x]` iOS Google 登录配置：Info.plist URL Scheme 已替换为真实 REVERSED_CLIENT_ID，并完成 iOS 真机登录验证。
- `[x]` Firestore rules 与云同步字段不一致。
- `[x]` 账户删除闭环未完成。
- `[x]` 隐私与医疗合规声明需要降级或补齐证明。
- `[x]` 权限用途说明需要与真实功能对齐。

非阻塞上架：用药清单 MVP（本地清单 + 手动打卡）已合入代码，见 §7 P2；待真机走查，不新增系统通知权限。

更新规则：

- 解决问题后，不要直接删除原条目。
- 将状态改为 `[x]` 或 `[~]`。
- 在条目下补充完成日期、验证方式和残余风险。
- 项目稳定后，可把已完成事项移动到“已完成事项归档”。

## 1. 产品背景

Amplio 是一个帮助帕金森患者进行康复训练的 Flutter App。

计划上架路径：

- 先上架 Apple App Store。
- 后续上架 Google Play。
- 上架地区为全球，除中国大陆。

产品定位应保持为“康复训练辅助工具”，不能声称可以诊断、治疗、治愈帕金森，也不能替代医生、物理治疗师或语言治疗师建议。

## 2. 当前技术栈

- Flutter / Dart
- Firebase Auth / Firestore
- Google Sign-In
- SQLite / `sqflite`
- `shared_preferences`
- `provider`
- `flutter_localizations`
- `sensors_plus`
- `noise_meter`
- `camera`
- `google_mlkit_pose_detection`
- `fl_chart`

## 3. 核心功能

- 用户登录与游客模式
- 手部震颤测试
- 语音训练
- 肢体动作训练
- 训练记录与趋势分析（震颤/语音/肢体完成后写入 `training_records`）
- 康复报告（设置入口，基于训练周均分；仅供参考，非医学诊断）
- 云端同步
- 数据导出与删除
- 多语言
- 无障碍和大字体设置
- 用药清单（本地、手动打卡，默认关闭 opt-in；无剂量、无云同步）

## 4. 当前高优先级问题

以下问题会影响上架、用户安全或合规可信度，优先级最高。

### 登录与平台配置

- iOS 使用 Google 登录时，通常必须同时提供 Sign in with Apple。目前 Apple 登录按钮存在但不可用。
- `ios/Runner/Info.plist` 中 Google 登录 URL Scheme 仍含 `YOUR_CLIENT_ID` 占位符，需要替换为真实 iOS Client ID。
- 需要确认 `GoogleService-Info.plist`、`google-services.json`、bundle id、application id、Firebase Auth provider 配置全部一致。

### Firebase 与云同步

- `CloudSyncService` 上传的震颤字段与 `firestore.rules` 要求不一致，云同步很可能被规则拒绝。
- `movement_training_records` 目前在 `firestore.rules` 中没有匹配规则，肢体训练同步也会失败。
- 云同步失败多为 `debugPrint`，用户没有明确反馈，也没有重试队列或同步状态。
- 账户删除目前不是完整闭环：Firestore 子集合不会随用户文档自动级联删除，Firebase Auth 用户也需要明确删除。

### 隐私与合规

- 隐私页直接显示 “HIPAA & GDPR Compliant”，但代码和流程还不足以支撑该声明。上线前应改为更保守表述，除非完成法律、安全和合规审计。
- 隐私政策、服务条款、医疗免责声明、数据处理主体、数据处理地区、联系邮箱和品牌主体需要统一。
- 数据导出目前复制到剪贴板，不适合健康数据，存在泄露风险。
- 删除、导出、撤回同意、重新同意、账户删除都需要完整用户流程和后端闭环。

### 数据安全

- 当前 `SecureStorageService` 使用 `SharedPreferences + base64`，这不是安全存储。
- 健康数据、同意记录、密钥和敏感配置不应明文或伪加密存储。
- 需要考虑 `flutter_secure_storage`、本地数据库加密、传输安全、云端访问控制、审计日志真实性。

### 医疗健康风险

- 震颤频率、振幅、严重程度等结果必须标注“仅供参考”，不能作为医学诊断依据。
- 使用 LSVT LOUD、HIPAA、GDPR 等术语前需要法务或专业审查。
- 康复动作内容需要康复治疗专业人员审核，避免对老年或行动不便用户造成跌倒、疼痛或过度训练风险。

### 测试与发布

- `test/widget_test.dart` 仍是 Flutter 计数器模板测试，与当前 App 不匹配。
- 缺少数据库 migration、训练分数写入、云同步映射、账户删除、数据导出、权限拒绝、核心页面 smoke test。
- Android release 仍使用 debug signing config，Google Play 前必须配置正式签名。
- `pubspec.yaml` 仍有模板描述，需要改为正式产品描述。

## 5. 上架前检查清单

### Apple App Store

- 提供 Sign in with Apple。
- 修正 Google 登录 iOS URL Scheme。
- 配置正确 bundle id、team、signing、capabilities。
- 补充相机、麦克风、相册权限用途说明，确保与真实用途一致。
- 准备 App Privacy Nutrition Labels。
- 准备隐私政策 URL、服务条款 URL、支持 URL。
- 明确医疗免责声明，不声明诊断或治疗效果。
- 使用真实设备完整测试登录、游客模式、权限拒绝、训练、数据删除。
- 用药清单 MVP 无需通知权限；若上架前更新隐私政策 / App Privacy Nutrition Labels，需声明可选的、仅保存在本机的用药昵称清单（见 §7 P2 用药清单相关待办）。

### Google Play

- 配置 release signing，不使用 debug key。
- 完成 Data Safety 表单。
- 核对 Android 权限是否最小化。
- 准备隐私政策 URL、服务条款 URL、支持 URL。
- 确认目标地区排除中国大陆。
- 完整测试 Android 相机、麦克风、传感器和后台行为。

### 全球化

- 默认语言建议跟随系统语言，fallback 使用英文。
- 多语言内容需要人工校对，尤其是隐私、医疗免责声明、权限说明。
- 品牌名、联系邮箱、法律主体、隐私政策域名需要一致。

## 6. 技术负责人审查原则

- 用户安全优先于功能完整度。
- 不把模拟数据、随机评分或演示数据包装成真实健康评估。
- 不夸大医疗效果，不替代医生建议。
- 所有健康数据必须可解释、可导出、可删除。
- 云端失败不能静默吞掉，关键数据操作要给用户明确反馈。
- 上架前必须用真实设备测试 iOS 和 Android。
- 新增功能优先沿用项目现有 Flutter/Firebase/SQLite 模式，避免不必要的新架构。

## 7. 建议实施优先级

### P0：上架阻塞

- [x] 补 Sign in with Apple。
  - 完成日期：2026-05-09
  - 改动：
    1. `pubspec.yaml` 新增 `sign_in_with_apple: ^7.0.1`。
    2. `lib/services/auth_service.dart` 新增 `signInWithApple()`：使用 `Random.secure()` 生成原始 nonce，传给 Apple 的是 `sha256(rawNonce)`，再用 `OAuthProvider('apple.com').credential(idToken, rawNonce, accessToken)` 走 Firebase Auth；`SignInWithAppleAuthorizationException(canceled)` 与 Google 流程一致返回 `null`；首次登录时把 `givenName + familyName` 写入 Firebase `user.displayName`（Apple 仅在首次返回 fullName）。
    3. `lib/pages/login_page.dart` 移除原 `onPressed: null` 占位按钮，新增黑底白字的 Apple 按钮（仅 iOS / macOS 显示，Android / Web 隐藏避免 web 重定向流程的复杂配置），错误处理覆盖：取消、超时/网络、未登录 Apple ID。
    4. 12 个 ARB 文件 + `AppLocalizations`/`AppLocalizationsXx` 新增 `signInWithApple` 文案。
    5. 新增 `ios/Runner/Runner.entitlements`，声明 `com.apple.developer.applesignin = [Default]`。
    6. `ios/Runner.xcodeproj/project.pbxproj` 在 Runner target 三个构建配置（Debug/Release/Profile）添加 `CODE_SIGN_ENTITLEMENTS = Runner/Runner.entitlements;`，无需在 Xcode UI 重新挂接。
  - 验证方式：
    1. iOS 真机点击 Apple 按钮 → 系统弹出原生授权 UI（Face ID / Touch ID / 密码） → 授权后 `FirebaseAuth.instance.currentUser` 非空，UID 形如 `0001....apple.com`，App 进入主页。
    2. 关闭 App 重新打开仍保持登录；登出后再次登录不会再次弹"分享 / 隐藏邮箱"选择（只在首次登录请求 fullName/email）。
    3. Firebase Console > Authentication > Users 中出现 provider = apple.com 的用户。
    4. iOS 16.0+ 真机（与 `IPHONEOS_DEPLOYMENT_TARGET = 16.0` 一致）。
  - 残余风险：无（当前上架阻塞项已解除）。
- [x] 修复 iOS Google 登录配置。
  - 完成日期：2026-05-09（含真机验证）
  - 改动：
    1. `ios/Runner/Info.plist` 的 `CFBundleURLSchemes` 由占位符 `com.googleusercontent.apps.YOUR_CLIENT_ID` 替换为 `ios/Runner/GoogleService-Info.plist` 中已存在的真实 `REVERSED_CLIENT_ID`：`com.googleusercontent.apps.1007627456579-9n96p3p073dr3ml7o8v8ma556se7u2kd`。
    2. 未修改 `lib/services/auth_service.dart` 的 Google 登录逻辑；本任务仅修复 iOS 平台回调 URL 配置。
  - 静态验证：
    1. `rg "YOUR_CLIENT_ID" ios/` 无结果。
    2. `Info.plist` 的 URL Scheme 与 `GoogleService-Info.plist` 的 `REVERSED_CLIENT_ID` 完全一致。
    3. `ios/Runner.xcodeproj/project.pbxproj` 中 Runner target 三个构建配置的 `PRODUCT_BUNDLE_IDENTIFIER` 均为 `com.amplio.app`，与 `GoogleService-Info.plist` 的 `BUNDLE_ID` 一致。
  - 真机验证（2026-05-09）：
    1. 已在 iOS 真机完成 Google 登录流程，授权后可正确回跳 App 并进入主页。
    2. Firebase Console > Authentication > Users 可见 provider = google.com 的用户记录。
    3. Google provider 已启用，登录链路可稳定复现。
  - 残余风险：无（当前上架阻塞项已解除）。
- [x] 修复 Firestore rules 与实际上传字段。
  - 完成日期：2026-05-03
  - 改动：更新 `tremor_records` 规则中 `hasAll` 字段名与数值校验字段，与 `CloudSyncService.syncTremorRecordToCloud` 实际上传字段对齐（`averageFrequency`、`maxAmplitude`、`averageAmplitude`、`duration`、`accelerometerData`、`localId`）；将 `allow update: if false` 改为 `allow update: if isOwner(userId)` 以支持 `set(merge:true)` 的幂等同步语义；新增 `movement_training_records` 完整规则块（read/create/update/delete），字段与 `syncMovementTrainingRecordToCloud` 对齐。
  - 验证方式：Firebase Console > Firestore > Rules Playground 用模拟认证用户验证：震颤记录 set 允许、肢体训练记录 set 允许、delete 允许、未认证写入拒绝、跨用户访问拒绝；真机登录后完成震颤测试和肢体训练，检查 Firebase Console 中对应子集合有新文档写入。
  - 残余风险：`AuthService.saveTremorRecord`（旧字段名 `frequency`/`amplitude`/`severity`）为死代码，未被任何页面调用，不影响当前规则，但应在后续清理中移除，避免未来被误调用时触发规则拒绝。
- [x] 完成账户删除闭环，包括 Firebase Auth 用户和所有 Firestore 子集合。
  - 完成日期：2026-05-03
  - 改动：
    1. auth_service.dart deleteAccount() 重写：改为先删 Firestore 再删 Auth 用户（修复原先登出后再删 Firestore 导致认证失效的根本错误）；新增 _deleteAllFirestoreUserData() 逐一批量删除 6 个子集合（tremor_records / movement_training_records / audit_logs / data_export_requests / settings / consent_records）再删根文档；调用 user.delete() 删除 Firebase Auth 用户；处理 requires-recent-login 异常（友好提示重新登录）。
    2. database_service.dart 新增 clearAllLocalData()：清空本地 SQLite 健康数据表（含 tremor_records、movement_training_records、training_records 等；2026-05-19 起已不含 assessment_results）。
    3. data_management_page.dart _deleteAccount()：deleteAccount() 成功后依次调用 clearAllLocalData() 和 SharedPreferences.clear()，完成本地数据全清。
  - 验证方式：删除账户后，Firebase Console > Authentication 中该用户不存在；Firestore 中 users/{uid} 及所有子集合文档不存在；App 内无法看到旧训练记录；重新安装后无任何残留数据。
  - 残余风险：Firestore 子集合删除在客户端逐批执行，若用户在删除过程中断网，子集合可能部分残留。建议后续用 Firebase Cloud Functions + Firestore TTL 做服务端级联删除兜底。
- [x] 移除或降级 “HIPAA & GDPR Compliant” 等过度声明。
  - 完成日期：2026-05-03
  - 改动：1) privacy_policy_page.dart badge 从 "HIPAA & GDPR / Compliant" 改为 "Privacy & Security / Our Commitment"；2) 全部 12 个 ARB 语言文件移除 3 类合规声明（introText、userRights 括注、gdprRights 法规前置）；3) 运行 flutter gen-l10n 重新生成所有 dart 本地化文件。
  - 验证方式：rg "HIPAA|Compliant" lib/l10n/ 返回空；隐私政策页显示 "Privacy & Security / Our Commitment"。
  - 残余风险：无。auth_service.dart 和 security_service.dart 文件头注释已同步改为保守表述（2026-05-03）。
- [x] 修正相机、麦克风、相册权限说明。
  - 完成日期：2026-05-03
  - 改动：1) iOS Info.plist 的 NSCameraUsageDescription 补充肢体动作训练姿态检测用途，NSMicrophoneUsageDescription 移除 "LSVT LOUD" 专业疗法名称（改为描述测量语音音量），三条说明均从中文改为英文（无 InfoPlist.strings 本地化文件时英文为通用 fallback）；2) Android AndroidManifest.xml 相机权限注释补充动作训练用途。
  - 验证方式：iOS 真机首次请求相机权限时弹窗说明覆盖头像和动作训练两种用途；麦克风弹窗不再出现 LSVT LOUD；相册弹窗说明清晰；Android 权限注释准确。
  - 残余风险：Info.plist 权限说明为英文单一语言，未为 12 种支持语言提供本地化 InfoPlist.strings。建议上架前补充主要市场语言（至少中文）的 InfoPlist.strings。

### P1：安全与质量

- [ ] 用真实安全存储替换 `SharedPreferences + base64`。
  - 验证方式：敏感值不再以明文或 base64 存在普通偏好存储中。
- [ ] 设计本地健康数据加密方案。
  - 验证方式：明确 SQLite 健康数据、导出文件和缓存数据的保护策略。
- [ ] 增加云同步失败反馈、重试和状态展示。
  - 验证方式：网络失败时用户能看到状态，恢复网络后可重试。
- [ ] 补齐核心单元测试、widget test 和集成测试。
  - 验证方式：测试覆盖训练分数映射、数据库 migration、云同步映射、权限拒绝和关键页面 smoke test。
- [ ] 配置 Android release signing。
  - 验证方式：release 构建不再使用 debug signing config。
- [ ] 完成隐私政策、服务条款、医疗免责声明。
  - 验证方式：App 内和商店链接可访问，法律主体、联系邮箱和品牌一致。

### P2：产品可信度

- [ ] 找康复治疗或医学专业人员审核训练动作与文案。
  - 验证方式：审核结论和必要调整记录在本文档或独立审查文档中。
- [~] 修复肢体动作训练「完全检测不到人体 / 无法计数」（举手 + 抬腿）。
  - 完成日期：2026-06-20（代码侧）
  - 根因：`lib/pages/movement_training_page.dart` 的 `_inputImageFromCameraImage()` 把 ML Kit 输入帧写死为 `InputImageRotation.rotation0deg` + `InputImageFormat.yuv420`，并把多平面字节拼接传入。iOS 真机相机帧实际为 `bgra8888`、且需要按 `sensorOrientation` 旋转，导致 ML Kit 始终解析不到 Pose（无骨架、无计数）。`_processImage()` 无异常保护，一旦 ML Kit 抛错 `_isDetecting` 会永久卡在 `true`，后续帧全部被跳过。
  - 改动（仅 `lib/pages/movement_training_page.dart`，未改 `motion_detection_service.dart` 计数算法）：
    1. `CameraController` 增加 `imageFormatGroup`：Android=`nv21`、iOS=`bgra8888`（ML Kit 要求的单平面格式）。
    2. 保存 `CameraDescription _camera`，重写 `_inputImageFromCameraImage()`：iOS 用 `sensorOrientation` 求旋转，Android 用设备方向 + 前/后摄像头补偿；图像格式由 `image.format.raw` 推导并校验平台支持格式；取首平面 `bytes`/`bytesPerRow`。
    3. `_processImage()` 增加 `try/catch/finally`，确保异常后 `_isDetecting` 一定复位；记录 `_personDetected` 与实际旋转角。
    4. `PosePainter` 重写坐标映射：移植 google_mlkit 官方示例的 `translateX/translateY`，按 `rotation` + `cameraLensDirection` 还原坐标（替代旧的固定缩放 + 手动镜像）。
    5. 新增「未检测到人体」引导提示（上半身完整入镜、保持光线充足）。
  - 静态验证：`flutter analyze lib/pages/movement_training_page.dart lib/services/motion_detection_service.dart` → No issues found（2026-06-20）。
  - 验证方式（真机，完成后可改为 `[x]`）：
    1. iOS 真机进入举手训练 → 出现黄色关键点 + 白色骨架 → 举/放手臂能稳定 +1，达到目标弹成功对话框。
    2. iOS 真机进入抬腿训练 → 出现腿部骨架 → 抬/放腿能稳定 +1。
    3. 骨架叠加层与真人位置大致对齐（前置镜像方向正确）。
    4. 条件具备时在 Android 真机复测一次（`nv21` 路径）。
  - 残余风险：
    1. 真机端到端尚未验证；ML Kit Pose 在低光、半身遮挡、深色背景下仍可能丢失人体。
    2. `PosePainter` 采用 stretch 缩放，非等比 `BoxFit.cover`，骨架叠加层在极端宽高比下可能与预览有偏移（不影响计数，计数只依赖关节角度）。
    3. FSM 阈值（`motion_detection_service.dart`）此前因从未拿到真实骨架而未经真机校准，骨架恢复后可能需要二次调参。
  - 后续调参（2026-06-20）：用户反馈输入层修好后仍存在偶发误测，改为「单一保守难度」（详见下条）。
- [~] 肢体动作训练改为单一保守难度（取消「康复增强 / 标准」双模式）。
  - 完成日期：2026-06-20
  - 改动：
    1. `lib/services/motion_detection_service.dart`：删除 `MotionSensitivity` 枚举与 `rehabPreset/standardPreset`，新增 `MotionDetectionConfig.defaultPreset()`，参数取双模式中间偏紧值（FSM 3 帧确认；`arm.reachedDeltaDeg=10`、`leg.reachedDeltaDeg=8`、`arm.minElbowExtensionDeg=100`、`leg.minKneeExtensionDeg=50`），优先减少误测。
    2. `lib/pages/movement_training_page.dart`：移除 `_sensitivity / _applySensitivityPreset` 以及顶部 `CupertinoSlidingSegmentedControl<MotionSensitivity>` 控件；`_motionConfig / _armDetector / _legDetector` 改为基于 `defaultPreset()` 的 `final/late final` 初始化。
  - 静态验证：`flutter analyze lib/pages/movement_training_page.dart lib/services/motion_detection_service.dart` → No issues found（2026-06-20）。
  - 验证方式（真机）：
    1. 训练页不再显示难度切换控件。
    2. 静止站立 5 秒、轻微调整衣服/手部不应被计数；明显完成一次抬手或抬腿才 +1。
    3. 抬腿训练正常完成 10 次 ≤ 60 秒，不出现明显漏计/连计。
  - 残余风险：
    1. 阈值仍未经康复专业人员校准，可能对幅度极小的用户不友好；如真机测试发现整体偏紧，可微调 `enter*` / `reached*` 系数。
    2. 取消双模式后，旧用户的「康复增强」偏好不再生效；当前产品未上架、无用户偏好需要迁移。
- [ ] 校准震颤、语音、动作训练算法和阈值（含 `TrainingScoreService` 映射与语音跟练计分）。
  - 验证方式：真实设备、不同年龄和不同机型下有测试记录。
- [~] 补充更完整的无障碍体验：VoiceOver/TalkBack 标签、大触控区、语音提示、低认知负担流程。
  - 完成日期：2026-05-10（代码侧）
  - 改动：
    1. `lib/pages/home_page.dart`：为设置入口、头像编辑入口、三个训练入口补充 `Semantics/Tooltip`，训练入口改为 `MergeSemantics + ExcludeSemantics` 降低读屏噪音。
    2. `lib/pages/tremor_test_page.dart`：顶部返回/历史按钮由 `44x44` 提升到 `48x48`，并补充 `Semantics/Tooltip`；历史删除入口改为 `TextButton.icon + ConstrainedBox(min 48x48)`。
    3. `lib/pages/login_page.dart`：语言按钮与 Google/Apple/游客登录按钮补充语义标签与提示。
    4. `lib/pages/voice_training_page.dart`：关键操作按钮补充语义；在开始/重试/取消/完成等节点接入语音提示调用。
    5. `lib/pages/movement_training_page.dart`：返回/历史/目标设置按钮补充语义与提示；在计数增长、目标完成、权限拒绝时增加语音提示。
    6. `lib/services/voice_assist_service.dart`：由仅 `debugPrint` 升级为系统语义播报（VoiceOver/TalkBack announce）+ 触觉反馈。
  - 验证方式：
    1. `flutter analyze`（针对本次改动文件）0 issue。
    2. 静态走查确认关键点击区域（尤其自定义按钮）最小触控区达到 `48dp`。
  - 残余风险：
    1. iOS VoiceOver 与 Android TalkBack 的真机端到端回归尚未完成，当前仍缺少“读屏焦点顺序、播报时机、复杂页面连续导航”的设备侧证据。
    2. `SemanticsService.announce` 在不同平台版本存在行为差异；后续建议在真机验证中记录是否需要节流与文案优化。
- [ ] 完成人工多语言校对。
  - 验证方式：隐私、权限、医疗免责声明和核心训练文案完成校对。
- [ ] 增加报告导出、医生分享和用户授权控制。
  - 验证方式：分享前用户明确授权，可撤回或删除分享数据。
- [~] 主页用药清单（本地、手动打卡、无剂量、无云同步、可折叠/关闭）。
  - 完成日期：2026-05-18（代码侧）
  - 改动：
    1. `lib/models/medication_reminder.dart`、`lib/models/medication_check_in.dart`：提醒项与打卡记录模型（无剂量字段）。
    2. `lib/services/database_service.dart`：SQLite v6 表 `medication_reminders` / `medication_check_ins`；`clearAllLocalData` 扩展；打卡唯一索引；90 天打卡清理。
    3. `lib/services/medication_reminder_service.dart`：opt-in 免责声明、功能开关、折叠状态（SharedPreferences）；不同步云端。
    4. `lib/widgets/home_medication_card.dart`、`lib/pages/medication_reminders_page.dart`、`lib/pages/medication_reminder_edit_page.dart`、`lib/utils/medication_disclaimer.dart`：主页清单、管理/编辑、免责声明弹窗。
    5. `lib/pages/home_page.dart`：欢迎语与训练入口之间插入卡片；设置菜单入口（功能开启后）。
    6. `lib/pages/data_management_page.dart`：独立「删除用药清单数据」。
    7. 12 个 ARB + `flutter gen-l10n`：用药清单与免责声明文案。
  - 静态验证：
    1. `flutter analyze lib/` 0 issue。
    2. 未修改 `CloudSyncService`、`auth_service.exportUserData`、`firestore.rules`；未新增 `pubspec` 通知依赖或 iOS 通知用途说明。
  - 验证方式（真机，完成后可将本条改为 `[x]`）：
    1. 新安装 → 默认仅显示「设置用药清单」→ 接受免责声明 → 添加提醒 → 主页打卡 → 折叠/展开。
    2. 管理页「关闭」→ 仅隐藏 / 隐藏并删除全部 → 重启后数据符合预期。
    3. 数据管理 → 删除用药清单数据。
    4. 删除账户 → `clearAllLocalData` 后无用药表残留。
    5. 游客与登录用户行为一致（均无云端）。
  - 残余风险：
    1. 用户仍可自愿输入真实药名；依赖昵称引导与本地删除能力。
    2. 隐私政策正文与 App Privacy 表单尚未补充用药清单段落（见下方待办）。
    3. 非中英文 10 个语言的用药文案暂以英文占位，待 P2 人工校对。
- [x] 用药清单：90 天外打卡自动清理（默认开启）。
  - 完成日期：2026-05-18
  - 改动：`MedicationReminderService.maybePurgeOldCheckIns()` 调用 `purgeMedicationCheckInsOlderThan(90)`。
  - 验证方式：代码审查 + 可在调试时人工插入旧日期打卡后验证删除行数。
- [ ] 用药清单：系统本地通知（`flutter_local_notifications` + iOS/Android 权限与用途说明）。
  - 验证方式：真机到点提醒；商店隐私与权限声明已更新。
- [ ] 用药清单：登录用户 Firestore 同步（需 `firestore.rules` + `CloudSyncService` + 失败反馈，与 P1 云同步改进一并做）。
  - 验证方式：换机后提醒与打卡可恢复；规则 Playground 通过。
- [ ] 用药清单：纳入 `exportUserData`（需单独用户同意，不可默认导出）。
  - 验证方式：导出 JSON 含用药字段仅在选择同意后；拒绝时不含。
- [ ] 用药清单：隐私政策 / App Privacy Labels 正式条文（P1 与法务对齐）。
  - 验证方式：App 内隐私页与商店提交表单一致，写明仅本机、可删除、非医疗建议。
- [ ] 用药清单：康复/医学专业人员审阅文案（含免责声明与昵称引导）。
  - 验证方式：审阅记录存档。
- [x] 移除初始评估功能（产品决策：2026-05-19）。
  - 完成日期：2026-05-19
  - 改动：删除 `AssessmentPage`、`AssessmentScoringService`、`AssessmentResult`、`OnboardingPage`；`LoadingScreen` 启动后直接进入 `AuthGate`；SQLite v7 `DROP TABLE assessment_results`；`ReportService` 基于训练周均分。
  - 验证方式：`flutter analyze lib/` 0 issue；冷启动无引导/评估路由；`rg` 无 `assessment_page` / `AssessmentResult` 引用。
  - 残余风险（2026-05-19 更新）：
    - **开发阶段不适用**：产品未上架、无老用户，不存在「升级丢失评估历史」运维问题。
    - **已缓解**：启动时清理 `onboarding_shown` / `assessment_completed` / `training_plan_cache`；`TrainingScoreService` 写入 `training_records`；`RehabReportPage` 经设置菜单进入。
    - **已移除（2026-05-19）**：主页「今日训练建议」及 `TrainingPlanService` / `TrainingPlan` 模型（产品决定暂不展示个性化计划 UI）。
    - **仍待 P2**：分数为启发式，未经康复专业人员校准；语音分数算法需真机校验。

## 已完成事项归档

- 2026-05-19：初始评估与新手引导已按产品决策整体移除（见 §7 上条）。

## 8. Git 提交工作流

强制执行规则位于 `.cursor/rules/amplio-workflow.mdc`；本节用于说明日常使用方法。

### 日常流程

1. Cursor 修改代码，运行与改动相关的分析和测试，然后汇报结果。
2. 用户检查代码并自行测试：满意可点击 **Keep**，不满意可使用 **Undo** 或要求继续修改。
3. 用户完全满意后，在对话中回复“确认提交”。
4. Cursor 检查全部差异，排除敏感信息与无关改动，再按实际功能范围创建一个或多个本地提交（commits）。
5. 每个提交的摘要（Summary）和说明（Description）使用英文，并简短准确地说明实际改动。
6. 用户在 GitHub Desktop 检查本地提交，然后手动点击 **Push origin**。

### 关键说明

- **Keep**：仅保留文件改动，不等于允许创建 commit。
- **Undo**：用于撤销尚未提交的文件改动；如果已经创建 commit，应先说明情况，不要直接 Push。
- **确认提交**：明确授权 Cursor 执行 `git add` 和 `git commit`，但不授权 Push。
- **Push origin**：只有用户在 GitHub Desktop 中手动执行，Cursor 不执行 `git push`。
- 未经用户明确要求，Cursor 不修改已有 commit，不改写 Git 历史，也不执行强制推送。

## 9. 新对话启动提示

项目规则设置为自动应用。正常情况下，新开对话后不需要再提醒 Cursor 阅读本文档，可以直接描述任务，例如：

```text
请检查当前最高优先级的未完成问题，并给出处理建议。
```

或者：

```text
请修复语音训练页面的问题，完成后先让我检查，不要提交。
```

如果项目规则被禁用、删除或未加载，再明确要求 Cursor 先阅读 `docs/AMPLIO_PROJECT_CONTEXT.md`。
