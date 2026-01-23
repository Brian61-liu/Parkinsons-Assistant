import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 安全存储服务
/// 用于安全地存储敏感数据
class SecureStorageService {
  static final SecureStorageService _instance = SecureStorageService._internal();
  static SecureStorageService get instance => _instance;

  SecureStorageService._internal();

  static const String _keyPrefix = 'secure_';

  /// 安全存储字符串
  Future<void> setSecureString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    // 在生产环境中，应使用 flutter_secure_storage 或类似的加密存储
    // 这里使用简单的 base64 编码作为示例
    final encoded = base64Encode(utf8.encode(value));
    await prefs.setString('$_keyPrefix$key', encoded);
  }

  /// 安全读取字符串
  Future<String?> getSecureString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString('$_keyPrefix$key');
    if (encoded == null) return null;
    
    try {
      return utf8.decode(base64Decode(encoded));
    } catch (e) {
      debugPrint('Secure storage decode error: $e');
      return null;
    }
  }

  /// 删除安全存储的值
  Future<void> removeSecure(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_keyPrefix$key');
  }

  /// 清除所有安全存储的数据
  Future<void> clearAllSecure() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_keyPrefix));
    for (final key in keys) {
      await prefs.remove(key);
    }
  }

  /// 对数据进行 SHA256 哈希
  String hashData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// 检查数据完整性
  bool verifyDataIntegrity(String data, String expectedHash) {
    final computedHash = hashData(data);
    return computedHash == expectedHash;
  }
}
