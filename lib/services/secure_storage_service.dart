import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Keychain / Keystore-backed secure storage for sensitive values.
class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  static SecureStorageService get instance => _instance;

  SecureStorageService._internal();

  /// Legacy SharedPreferences prefix used by the old base64 "secure" store.
  static const String legacyPrefsPrefix = 'secure_';

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// Persist a sensitive string in platform secure storage.
  Future<void> setSecureString(String key, String value) async {
    await _storage.write(key: key, value: value);
    await _removeLegacyPrefsKey(key);
  }

  /// Read a sensitive string, migrating any legacy prefs value once.
  Future<String?> getSecureString(String key) async {
    final existing = await _storage.read(key: key);
    if (existing != null) return existing;

    final migrated = await _migrateLegacyPrefsValue(key);
    return migrated;
  }

  Future<void> removeSecure(String key) async {
    await _storage.delete(key: key);
    await _removeLegacyPrefsKey(key);
  }

  /// Clears Keychain entries written by this app and any leftover legacy prefs.
  Future<void> clearAllSecure() async {
    await _storage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    final legacyKeys = prefs
        .getKeys()
        .where((key) => key.startsWith(legacyPrefsPrefix))
        .toList(growable: false);
    for (final key in legacyKeys) {
      await prefs.remove(key);
    }
  }

  String hashData(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  bool verifyDataIntegrity(String data, String expectedHash) {
    return hashData(data) == expectedHash;
  }

  Future<String?> _migrateLegacyPrefsValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = prefs.getString('$legacyPrefsPrefix$key');
    if (encoded == null) return null;

    try {
      final value = utf8.decode(base64Decode(encoded));
      await _storage.write(key: key, value: value);
      await prefs.remove('$legacyPrefsPrefix$key');
      return value;
    } catch (e) {
      debugPrint('Secure storage legacy migrate error: $e');
      await prefs.remove('$legacyPrefsPrefix$key');
      return null;
    }
  }

  Future<void> _removeLegacyPrefsKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$legacyPrefsPrefix$key');
  }
}
