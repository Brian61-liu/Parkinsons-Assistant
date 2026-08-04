import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

/// Widget 测试用：固定返回给定权限状态，并记录是否打开设置。
class FakePermissionHandlerPlatform extends PermissionHandlerPlatform {
  FakePermissionHandlerPlatform({
    this.status = PermissionStatus.denied,
  });

  PermissionStatus status;
  bool openSettingsCalled = false;

  @override
  Future<PermissionStatus> checkPermissionStatus(Permission permission) async =>
      status;

  @override
  Future<ServiceStatus> checkServiceStatus(Permission permission) async =>
      ServiceStatus.enabled;

  @override
  Future<bool> openAppSettings() async {
    openSettingsCalled = true;
    return true;
  }

  @override
  Future<Map<Permission, PermissionStatus>> requestPermissions(
    List<Permission> permissions,
  ) async {
    return {for (final p in permissions) p: status};
  }

  @override
  Future<bool> shouldShowRequestPermissionRationale(
    Permission permission,
  ) async =>
      false;
}
