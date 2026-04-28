# Amplio Project Context

> 给 Cursor 新对话使用的项目上下文。新开会话时可直接让 Agent 先阅读本文件，再继续开发或审查。

## 0. 当前状态摘要

最后更新：2026-04-28

状态标记：

- `[ ]` 未开始或未解决。
- `[~]` 部分解决，仍有残余风险或待验证项。
- `[x]` 已解决，并已记录验证方式。

当前仍阻塞上架的 P0 问题：

- `[ ]` Sign in with Apple 未完成。
- `[ ]` iOS Google 登录配置仍需核对并替换占位符。
- `[ ]` Firestore rules 与云同步字段不一致。
- `[ ]` 账户删除闭环未完成。
- `[ ]` 隐私与医疗合规声明需要降级或补齐证明。
- `[ ]` 初始评估存在随机模拟评分。
- `[ ]` 权限用途说明需要与真实功能对齐。

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
- 初始能力评估
- 个性化训练计划
- 训练记录与趋势分析
- 康复报告
- 云端同步
- 数据导出与删除
- 多语言
- 无障碍和大字体设置

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

- 初始能力评估目前存在随机模拟评分，不适合上线。必须改为真实评估、明确标注演示，或从上线版本移除。
- 震颤频率、振幅、严重程度等结果必须标注“仅供参考”，不能作为医学诊断依据。
- 使用 LSVT LOUD、HIPAA、GDPR 等术语前需要法务或专业审查。
- 康复动作内容需要康复治疗专业人员审核，避免对老年或行动不便用户造成跌倒、疼痛或过度训练风险。

### 测试与发布

- `test/widget_test.dart` 仍是 Flutter 计数器模板测试，与当前 App 不匹配。
- 缺少数据库 migration、训练计划生成、云同步映射、账户删除、数据导出、权限拒绝、核心页面 smoke test。
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

- [ ] 补 Sign in with Apple。
  - 验证方式：iOS 真机可使用 Apple 登录并完成 Firebase Auth。
- [ ] 修复 iOS Google 登录配置。
  - 验证方式：`Info.plist` URL Scheme 不再包含占位符，iOS 真机 Google 登录成功。
- [ ] 修复 Firestore rules 与实际上传字段。
  - 验证方式：震颤记录和肢体训练记录均可在真实登录用户下成功同步、读取和删除。
- [ ] 完成账户删除闭环，包括 Firebase Auth 用户和所有 Firestore 子集合。
  - 验证方式：删除账户后，Firebase Auth 用户不存在，Firestore 用户文档和子集合数据不存在，本地敏感数据已清理。
- [ ] 移除或降级 “HIPAA & GDPR Compliant” 等过度声明。
  - 验证方式：隐私页、ARB 多语言文案和商店描述不再未经证明地宣称合规。
- [ ] 处理随机模拟评估，改为真实逻辑、显式演示标记或从上线版移除。
  - 验证方式：用户不会把随机分数理解为真实健康评估。
- [ ] 修正相机、麦克风、相册权限说明。
  - 验证方式：iOS `Info.plist` 和 Android 权限说明覆盖头像、语音训练、动作训练等真实用途。

### P1：安全与质量

- [ ] 用真实安全存储替换 `SharedPreferences + base64`。
  - 验证方式：敏感值不再以明文或 base64 存在普通偏好存储中。
- [ ] 设计本地健康数据加密方案。
  - 验证方式：明确 SQLite 健康数据、导出文件和缓存数据的保护策略。
- [ ] 增加云同步失败反馈、重试和状态展示。
  - 验证方式：网络失败时用户能看到状态，恢复网络后可重试。
- [ ] 补齐核心单元测试、widget test 和集成测试。
  - 验证方式：测试覆盖训练计划、数据库 migration、云同步映射、权限拒绝和关键页面 smoke test。
- [ ] 配置 Android release signing。
  - 验证方式：release 构建不再使用 debug signing config。
- [ ] 完成隐私政策、服务条款、医疗免责声明。
  - 验证方式：App 内和商店链接可访问，法律主体、联系邮箱和品牌一致。

### P2：产品可信度

- [ ] 找康复治疗或医学专业人员审核训练动作与文案。
  - 验证方式：审核结论和必要调整记录在本文档或独立审查文档中。
- [ ] 校准震颤、语音、动作训练算法和阈值。
  - 验证方式：真实设备、不同年龄和不同机型下有测试记录。
- [ ] 补充更完整的无障碍体验：VoiceOver/TalkBack 标签、大触控区、语音提示、低认知负担流程。
  - 验证方式：iOS VoiceOver 和 Android TalkBack 下可完成核心流程。
- [ ] 完成人工多语言校对。
  - 验证方式：隐私、权限、医疗免责声明和核心训练文案完成校对。
- [ ] 增加报告导出、医生分享和用户授权控制。
  - 验证方式：分享前用户明确授权，可撤回或删除分享数据。

## 已完成事项归档

当前暂无已完成事项。完成 P0/P1/P2 条目后，将重要事项按日期归档到这里。

## 8. 新对话启动提示

新开 Cursor 对话时，可直接使用下面这句话：

```text
请先阅读 docs/AMPLIO_PROJECT_CONTEXT.md。你现在是 Amplio 的技术负责人和审查员，请基于该文档继续帮助我开发、审查和准备上架。
```

如果是要处理具体问题，可以补充：

```text
请先阅读 docs/AMPLIO_PROJECT_CONTEXT.md，然后优先处理 P0 中的第一个未完成项。
```
