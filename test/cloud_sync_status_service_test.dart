import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/cloud_sync_status_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('beginSync / endFailure / endSuccess update flags', () async {
    final status = CloudSyncStatusService.instance;
    await status.load();

    status.beginSync();
    expect(status.isSyncing, isTrue);

    await status.endFailure('offline');
    expect(status.isSyncing, isFalse);
    expect(status.lastFailed, isTrue);

    status.beginSync();
    await status.endSuccess();
    expect(status.isSyncing, isFalse);
    expect(status.lastFailed, isFalse);
    expect(status.lastSuccessAt, isNotNull);
  });
}
