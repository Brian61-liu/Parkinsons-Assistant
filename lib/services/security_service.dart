import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 安全服务 - 遵循 HIPAA/GDPR 医疗数据安全标准
class SecurityService {
  static const String _encryptionKeyKey = 'encryption_key_v1';
  static const String _consentAcceptedKey = 'privacy_consent_accepted';
  static const String _consentVersionKey = 'privacy_consent_version';
  
  // 当前隐私政策版本 - 更新隐私政策时需要更新此版本号
  static const String currentPrivacyVersion = '1.0.0';
  
  /// 生成安全的随机密钥
  static String generateSecureKey([int length = 32]) {
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }
  
  /// 对敏感数据进行哈希处理（单向，不可逆）
  /// 用于存储不需要解密的敏感信息（如 IP 地址用于审计）
  static String hashSensitiveData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// 对数据进行 HMAC 签名验证
  /// 确保数据完整性，防止篡改
  static String signData(String data, String key) {
    final keyBytes = utf8.encode(key);
    final dataBytes = utf8.encode(data);
    final hmac = Hmac(sha256, keyBytes);
    final digest = hmac.convert(dataBytes);
    return digest.toString();
  }
  
  /// 验证数据签名
  static bool verifySignature(String data, String signature, String key) {
    final expectedSignature = signData(data, key);
    return expectedSignature == signature;
  }
  
  /// 检查是否已接受隐私政策
  static Future<bool> hasAcceptedPrivacyPolicy() async {
    final prefs = await SharedPreferences.getInstance();
    final accepted = prefs.getBool(_consentAcceptedKey) ?? false;
    final version = prefs.getString(_consentVersionKey) ?? '';
    
    // 如果版本不匹配，需要重新同意
    return accepted && version == currentPrivacyVersion;
  }
  
  /// 记录用户同意隐私政策
  static Future<void> recordPrivacyConsent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_consentAcceptedKey, true);
    await prefs.setString(_consentVersionKey, currentPrivacyVersion);
  }
  
  /// 清除隐私同意记录（用于用户撤回同意）
  static Future<void> revokePrivacyConsent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_consentAcceptedKey);
    await prefs.remove(_consentVersionKey);
  }
  
  /// 脱敏处理邮箱地址（用于日志显示）
  static String maskEmail(String email) {
    if (email.isEmpty) return '';
    final parts = email.split('@');
    if (parts.length != 2) return '***';
    
    final localPart = parts[0];
    final domain = parts[1];
    
    String maskedLocal;
    if (localPart.length <= 2) {
      maskedLocal = '*' * localPart.length;
    } else {
      maskedLocal = '${localPart[0]}${'*' * (localPart.length - 2)}${localPart[localPart.length - 1]}';
    }
    
    return '$maskedLocal@$domain';
  }
  
  /// 脱敏处理姓名（用于日志显示）
  static String maskName(String name) {
    if (name.isEmpty) return '';
    if (name.length <= 2) return '*' * name.length;
    return '${name[0]}${'*' * (name.length - 2)}${name[name.length - 1]}';
  }
  
  /// 安全日志记录（仅在 debug 模式）
  static void secureLog(String message, {bool sensitive = false}) {
    if (kDebugMode) {
      if (sensitive) {
        debugPrint('[SECURE] [SENSITIVE DATA REDACTED]');
      } else {
        debugPrint('[SECURE] $message');
      }
    }
    // 在 release 模式下不记录任何日志
  }
  
  /// 验证数据导出请求（GDPR 数据可携带权）
  static Future<Map<String, dynamic>> prepareDataExport(Map<String, dynamic> userData) async {
    return {
      'exportedAt': DateTime.now().toIso8601String(),
      'dataVersion': '1.0',
      'userData': userData,
      'signature': signData(
        jsonEncode(userData), 
        await _getOrCreateEncryptionKey(),
      ),
    };
  }
  
  /// 获取或创建加密密钥
  static Future<String> _getOrCreateEncryptionKey() async {
    final prefs = await SharedPreferences.getInstance();
    var key = prefs.getString(_encryptionKeyKey);
    
    if (key == null || key.isEmpty) {
      key = generateSecureKey();
      await prefs.setString(_encryptionKeyKey, key);
    }
    
    return key;
  }
  
  /// 安全清除所有本地数据（账户删除时使用）
  static Future<void> secureWipeLocalData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    secureLog('All local data has been securely wiped');
  }
}
