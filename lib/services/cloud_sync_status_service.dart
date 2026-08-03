import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 云同步 UI 状态（跨页面共享）。
///
/// 手动同步与后台单条同步共用此状态，供设置项副标题与 SnackBar 展示。
class CloudSyncStatusService extends ChangeNotifier {
  CloudSyncStatusService._();
  static final CloudSyncStatusService instance = CloudSyncStatusService._();

  static const _prefsLastSuccessMs = 'cloud_sync_last_success_ms';
  static const _prefsLastFailed = 'cloud_sync_last_failed';

  bool _loaded = false;
  bool _syncing = false;
  bool _lastFailed = false;
  DateTime? _lastSuccessAt;

  bool get isLoaded => _loaded;
  bool get isSyncing => _syncing;
  bool get lastFailed => _lastFailed;
  DateTime? get lastSuccessAt => _lastSuccessAt;

  Future<void> load() async {
    if (_loaded) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final ms = prefs.getInt(_prefsLastSuccessMs);
      if (ms != null) {
        _lastSuccessAt = DateTime.fromMillisecondsSinceEpoch(ms);
      }
      _lastFailed = prefs.getBool(_prefsLastFailed) ?? false;
    } catch (e) {
      debugPrint('CloudSyncStatusService load failed: $e');
    } finally {
      _loaded = true;
      notifyListeners();
    }
  }

  void beginSync() {
    if (_syncing) return;
    _syncing = true;
    notifyListeners();
  }

  Future<void> endSuccess() async {
    _syncing = false;
    _lastFailed = false;
    _lastSuccessAt = DateTime.now();
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(
        _prefsLastSuccessMs,
        _lastSuccessAt!.millisecondsSinceEpoch,
      );
      await prefs.setBool(_prefsLastFailed, false);
    } catch (e) {
      debugPrint('CloudSyncStatusService persist success failed: $e');
    }
  }

  Future<void> endFailure([Object? error]) async {
    _syncing = false;
    _lastFailed = true;
    if (error != null) {
      debugPrint('Cloud sync failed: $error');
    }
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsLastFailed, true);
    } catch (e) {
      debugPrint('CloudSyncStatusService persist failure failed: $e');
    }
  }

  /// 后台单条同步失败时标记，不切换「同步中」以免打断手动同步 UI。
  Future<void> markBackgroundFailure([Object? error]) async {
    if (_syncing) return;
    _lastFailed = true;
    if (error != null) {
      debugPrint('Cloud sync (background) failed: $error');
    }
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefsLastFailed, true);
    } catch (e) {
      debugPrint('CloudSyncStatusService persist bg failure failed: $e');
    }
  }
}
