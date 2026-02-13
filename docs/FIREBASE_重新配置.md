# Firebase 重新配置指南（Amplio）

项目已改为新包名 **com.amplio.app**（Android 与 iOS 一致）。按下面步骤在 Firebase 控制台重新配置并替换配置文件即可。

---

## 一、在 Firebase 控制台操作

### 方式 A：沿用现有项目，只添加新应用

1. 打开 [Firebase 控制台](https://console.firebase.google.com/)，进入当前项目（如 kineo-85403）。
2. 点击 **「项目设置」**（齿轮图标）→ **「您的应用」**。
3. 点击 **「添加应用」**，选择 **Android**：
   - **Android 包名**填写：`com.amplio.app`
   - 应用昵称可填：Amplio
   - 按提示下载 **google-services.json**，保存到本项目的 `android/app/` 目录（覆盖原文件）。
4. 再点击 **「添加应用」**，选择 **iOS**：
   - **Apple 套装 ID**填写：`com.amplio.app`
   - 应用昵称可填：Amplio
   - 下载 **GoogleService-Info.plist**，在 Xcode 中放入 `ios/Runner/`（若已有该文件则覆盖）。

### 方式 B：新建一个 Firebase 项目（完全重新开始）

1. 在 [Firebase 控制台](https://console.firebase.google.com/) 点击 **「添加项目」**。
2. 项目名称填 **Amplio**（或你想要的名称），按向导完成创建。
3. 在项目概览中 **「添加应用」**：
   - **Android**：包名 `com.amplio.app` → 下载 **google-services.json** → 放到 `android/app/` 并覆盖。
   - **iOS**：套装 ID `com.amplio.app` → 下载 **GoogleService-Info.plist** → 放到 `ios/Runner/`。
4. 在 Firebase 中按需开通 **Authentication**、**Firestore** 等（与原先 Kineo 项目保持一致即可）。

---

## 二、替换项目中的配置文件

| 平台   | 从 Firebase 下载的文件        | 放到项目中的路径                    |
|--------|-------------------------------|-------------------------------------|
| Android | google-services.json          | `android/app/google-services.json`  |
| iOS     | GoogleService-Info.plist      | `ios/Runner/GoogleService-Info.plist` |

- 用新下载的文件**覆盖**原有文件。
- 当前项目里的 `google-services.json` 仍是旧包名 `com.kineo.app`，**必须**用包名为 `com.amplio.app` 的新文件替换，否则运行会报错。

---

## 三、本地已完成的修改（无需你再改）

- **Android**：`applicationId`、`namespace` 已改为 `com.amplio.app`，`MainActivity` 已移到 `com.amplio.app` 包下。
- **iOS**：`PRODUCT_BUNDLE_IDENTIFIER` 已改为 `com.amplio.app`。

你只需在 Firebase 添加/创建应用、下载上述两个配置文件并覆盖到对应路径，然后执行：

```bash
flutter clean
flutter pub get
```

再重新运行 Android/iOS 即可。

---

## 四、若使用 Firebase Authentication（如 Google 登录）

- **Android**：在 [Google Cloud 控制台](https://console.cloud.google.com/) 对应项目中，为 **OAuth 2.0 客户端 ID** 的「已授权的应用」添加新包名 `com.amplio.app` 和新的 SHA-1（如需），避免登录失败。
- **iOS**：若之前在 Apple 开发者后台配置过 URL Scheme / 关联域，包名改为 `com.amplio.app` 后，需在 Xcode 与 Apple 后台中确认 Bundle ID 与配置一致。

完成以上步骤后，Firebase 即按新应用 **Amplio**（com.amplio.app）重新配置完毕。
