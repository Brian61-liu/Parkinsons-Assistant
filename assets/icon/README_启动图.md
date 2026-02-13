# 启动图 Logo 说明

## 柔和过渡效果

若希望启动画面上 logo 与白色背景过渡更柔和，可单独做一张**带柔和边缘**的图：

1. **推荐尺寸**：1024×1024 或 512×512（PNG，透明或白底）
2. **做法示例**：
   - 在 Figma/Photoshop 等工具中，给 logo 加**外发光**（颜色接近白或浅灰），或
   - 在 logo 外围做**从透明到白的渐变**，让边缘自然融进背景
3. **保存为**：`splash_logo.png`，放在本目录（`assets/icon/`）
4. **修改配置**：在项目根目录 `pubspec.yaml` 的 `flutter_native_splash` 里，把 `image` 和 `image_dark` 改为 `assets/icon/splash_logo.png`，`android_12` 下的 `image` / `image_dark` 同样改为该路径
5. **重新生成**：在终端执行 `dart run flutter_native_splash:create`

未使用 `splash_logo.png` 时，启动图会使用 `app_icon.png`（白底 + 居中图标）。
