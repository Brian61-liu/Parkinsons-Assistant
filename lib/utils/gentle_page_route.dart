import 'package:flutter/cupertino.dart';

/// iOS 标准推入转场（含边缘右滑返回）。保留 `pushGentle` 名称以免大面积改调用点。
Route<T> appPageRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) {
  return CupertinoPageRoute<T>(
    builder: builder,
    settings: settings,
    fullscreenDialog: fullscreenDialog,
  );
}

extension GentleNavigator on NavigatorState {
  Future<T?> pushGentle<T>(Widget page) {
    return push<T>(appPageRoute<T>(builder: (_) => page));
  }
}

Future<T?> pushGentle<T>(BuildContext context, Widget page) {
  return Navigator.of(context).push<T>(
    appPageRoute<T>(builder: (_) => page),
  );
}
