import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'secure_storage_service.dart';

/// 安全服务 - 医疗健康数据保护，上线前需完成安全与合规审计
///
/// 本地健康数据策略（v1）：
/// - DEK（32 字节）存 iOS Keychain（`encryption_key_v1`），设备绑定、与登录态无关。
/// - SQLite 敏感 TEXT 字段用 AES-256-GCM 加密后落盘（前缀 `enc:v1:`）。
/// - 数值汇总列、SharedPreferences 目标缓存、导出 CSV、Firestore 同步载荷保持明文
///   （导出为用户主动可读；云端靠 TLS + Auth + rules）。
/// - 登出保留 DEK；删账户 / 主动清本地数据时清除 DEK。
class SecurityService {
  static const String _encryptionKeyKey = 'encryption_key_v1';
  static const String _consentAcceptedKey = 'privacy_consent_accepted';
  static const String _consentVersionKey = 'privacy_consent_version';

  /// Ciphertext prefix for field-level AES-GCM payloads.
  static const String encryptedFieldPrefix = 'enc:v1:';

  // 当前隐私政策版本 - 更新隐私政策时需要更新此版本号
  static const String currentPrivacyVersion = '1.0.0';

  static final AesGcm _aesGcm = AesGcm.with256bits();

  /// Test-only DEK override (avoids Keychain in unit tests).
  @visibleForTesting
  static String? encryptionKeyOverride;

  /// 生成安全的随机密钥（默认 32 字节，base64Url）
  static String generateSecureKey([int length = 32]) {
    final random = Random.secure();
    final values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  /// 对敏感数据进行哈希处理（单向，不可逆）
  /// 用于存储不需要解密的敏感信息（如 IP 地址用于审计）
  static String hashSensitiveData(String data) {
    final bytes = utf8.encode(data);
    final digest = crypto.sha256.convert(bytes);
    return digest.toString();
  }

  /// 对数据进行 HMAC 签名验证
  /// 确保数据完整性，防止篡改
  static String signData(String data, String key) {
    final keyBytes = utf8.encode(key);
    final dataBytes = utf8.encode(data);
    final hmac = crypto.Hmac(crypto.sha256, keyBytes);
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
      maskedLocal =
          '${localPart[0]}${'*' * (localPart.length - 2)}${localPart[localPart.length - 1]}';
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
  static Future<Map<String, dynamic>> prepareDataExport(
    Map<String, dynamic> userData,
  ) async {
    return {
      'exportedAt': DateTime.now().toIso8601String(),
      'dataVersion': '1.0',
      'userData': userData,
      'signature': signData(
        jsonEncode(userData),
        await getOrCreateDataEncryptionKey(),
      ),
    };
  }

  /// Device-bound DEK for local field encryption (Keychain-backed).
  static Future<String> getOrCreateDataEncryptionKey() async {
    if (encryptionKeyOverride != null && encryptionKeyOverride!.isNotEmpty) {
      return encryptionKeyOverride!;
    }

    final secure = SecureStorageService.instance;
    var key = await secure.getSecureString(_encryptionKeyKey);

    if (key == null || key.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      final legacy = prefs.getString(_encryptionKeyKey);
      if (legacy != null && legacy.isNotEmpty) {
        key = legacy;
        await secure.setSecureString(_encryptionKeyKey, key);
        await prefs.remove(_encryptionKeyKey);
      } else {
        key = generateSecureKey();
        await secure.setSecureString(_encryptionKeyKey, key);
      }
    }

    return key;
  }

  /// Whether [value] already looks like an encrypted field payload.
  static bool isEncryptedField(String value) =>
      value.startsWith(encryptedFieldPrefix);

  /// Encrypt a plaintext string for SQLite TEXT storage.
  static Future<String> encryptField(String plaintext) async {
    if (isEncryptedField(plaintext)) return plaintext;

    final key = await getOrCreateDataEncryptionKey();
    final secretKey = await _secretKeyFromStored(key);
    final secretBox = await _aesGcm.encrypt(
      utf8.encode(plaintext),
      secretKey: secretKey,
    );

    final packed = BytesBuilder(copy: false)
      ..add(secretBox.nonce)
      ..add(secretBox.cipherText)
      ..add(secretBox.mac.bytes);

    return '$encryptedFieldPrefix${base64Url.encode(packed.toBytes())}';
  }

  /// Decrypt a field previously written by [encryptField].
  /// Plaintext (unmigrated) values are returned unchanged.
  static Future<String> decryptField(String stored) async {
    if (!isEncryptedField(stored)) return stored;

    final payload = stored.substring(encryptedFieldPrefix.length);
    final packed = base64Url.decode(payload);
    final nonceLength = _aesGcm.nonceLength;
    final macLength = _aesGcm.macAlgorithm.macLength;

    if (packed.length < nonceLength + macLength) {
      throw FormatException('Encrypted field payload too short');
    }

    final nonce = packed.sublist(0, nonceLength);
    final macBytes = packed.sublist(packed.length - macLength);
    final cipherText = packed.sublist(nonceLength, packed.length - macLength);

    final key = await getOrCreateDataEncryptionKey();
    final secretKey = await _secretKeyFromStored(key);
    final clear = await _aesGcm.decrypt(
      SecretBox(cipherText, nonce: nonce, mac: Mac(macBytes)),
      secretKey: secretKey,
    );
    return utf8.decode(clear);
  }

  static Future<SecretKey> _secretKeyFromStored(String storedKey) async {
    final keyBytes = _decodeKeyBytes(storedKey);
    if (keyBytes.length != 32) {
      throw StateError(
        'Data encryption key must be 32 bytes, got ${keyBytes.length}',
      );
    }
    return SecretKey(keyBytes);
  }

  static Uint8List _decodeKeyBytes(String storedKey) {
    try {
      return Uint8List.fromList(base64Url.decode(storedKey));
    } catch (_) {
      // Legacy keys may have been stored with standard base64.
      return Uint8List.fromList(base64.decode(storedKey));
    }
  }

  /// Clears the local DEK (account deletion / full local wipe only).
  static Future<void> clearDataEncryptionKey() async {
    encryptionKeyOverride = null;
    await SecureStorageService.instance.removeSecure(_encryptionKeyKey);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_encryptionKeyKey);
  }

  /// 安全清除所有本地数据（账户删除时使用）
  static Future<void> secureWipeLocalData() async {
    await SecureStorageService.instance.clearAllSecure();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    encryptionKeyOverride = null;
    secureLog('All local data has been securely wiped');
  }
}
