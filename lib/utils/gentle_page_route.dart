import 'package:flutter/material.dart';

/// 用于 ThemeData.pageTransitionsTheme 的舒缓过渡构建器
class GentlePageTransitionsBuilder extends PageTransitionsBuilder {
  const GentlePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return GentlePageRoute._buildGentleTransition(
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

/// 医疗康复类 APP 专用：舒缓、稳定、平滑的页面过渡
/// 适用于对患者更友好的界面切换体验
class GentlePageRoute<T> extends PageRouteBuilder<T> {
  GentlePageRoute({
    required super.pageBuilder,
    super.settings,
    super.fullscreenDialog,
  }) : super(
          transitionDuration: const Duration(milliseconds: 420),
          reverseTransitionDuration: const Duration(milliseconds: 380),
          transitionsBuilder: _buildGentleTransition,
        );

  static Widget _buildGentleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 舒缓曲线：先快后慢，结束时不突兀
    const curve = Curves.easeOutCubic;
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
      reverseCurve: Curves.easeInCubic,
    );

    // 轻微自右向左滑入（约 8% 宽度），避免全屏猛推
    const slideBegin = Offset(0.04, 0.0);
    const slideEnd = Offset.zero;

    return SlideTransition(
      position: Tween<Offset>(begin: slideBegin, end: slideEnd).animate(curvedAnimation),
      child: FadeTransition(
        opacity: curvedAnimation,
        child: child,
      ),
    );
  }
}

/// 统一使用舒缓过渡进行 push，避免在各处重复写 PageRouteBuilder
extension GentleNavigator on NavigatorState {
  Future<T?> pushGentle<T>(Widget page) {
    return push<T>(
      GentlePageRoute<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        settings: const RouteSettings(),
      ),
    );
  }
}

/// 便捷方法：在 context 上直接 push 舒缓过渡页面
Future<T?> pushGentle<T>(BuildContext context, Widget page) {
  return Navigator.of(context).push<T>(
    GentlePageRoute<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      settings: const RouteSettings(),
    ),
  );
}
