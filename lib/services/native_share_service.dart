import 'package:flutter/services.dart';

/// Shares a local file via iOS UIActivityViewController (no share_plus pod).
class NativeShareService {
  NativeShareService._();

  static const MethodChannel _channel = MethodChannel('com.amplio.app/share');

  static Future<void> shareFile({
    required String path,
    String? subject,
  }) async {
    await _channel.invokeMethod<void>('shareFile', {
      'path': path,
      'subject': ?subject,
    });
  }
}
