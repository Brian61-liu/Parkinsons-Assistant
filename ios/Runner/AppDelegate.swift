import FirebaseCore
import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 必须在 Flutter 引擎/插件注册之前配置 Firebase，否则会出现 [I-COR000005] No app has been configured yet
    FirebaseApp.configure()

    // 用药本地通知：前台也能展示（flutter_local_notifications）
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    let channel = FlutterMethodChannel(
      name: "com.amplio.app/share",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard call.method == "shareFile" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard
        let args = call.arguments as? [String: Any],
        let path = args["path"] as? String
      else {
        result(
          FlutterError(
            code: "BAD_ARGS",
            message: "Expected path argument",
            details: nil
          )
        )
        return
      }

      guard FileManager.default.fileExists(atPath: path) else {
        result(
          FlutterError(
            code: "NOT_FOUND",
            message: "File not found",
            details: path
          )
        )
        return
      }

      let url = URL(fileURLWithPath: path)

      DispatchQueue.main.async {
        guard let presenter = self?.topViewController() else {
          result(
            FlutterError(
              code: "NO_VC",
              message: "No view controller to present share sheet",
              details: nil
            )
          )
          return
        }

        let activity = UIActivityViewController(
          activityItems: [url],
          applicationActivities: nil
        )
        if let popover = activity.popoverPresentationController {
          popover.sourceView = presenter.view
          popover.sourceRect = CGRect(
            x: presenter.view.bounds.midX,
            y: presenter.view.bounds.midY,
            width: 1,
            height: 1
          )
          popover.permittedArrowDirections = []
        }
        presenter.present(activity, animated: true) {
          result(nil)
        }
      }
    }
  }

  private func topViewController(
    base: UIViewController? = nil
  ) -> UIViewController? {
    let root: UIViewController?
    if let base {
      root = base
    } else {
      let scenes = UIApplication.shared.connectedScenes.compactMap {
        $0 as? UIWindowScene
      }
      root =
        scenes
        .flatMap { $0.windows }
        .first { $0.isKeyWindow }?
        .rootViewController
        ?? scenes.first?.windows.first?.rootViewController
    }

    if let nav = root as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }
    if let tab = root as? UITabBarController {
      return topViewController(base: tab.selectedViewController)
    }
    if let presented = root?.presentedViewController {
      return topViewController(base: presented)
    }
    return root
  }
}
