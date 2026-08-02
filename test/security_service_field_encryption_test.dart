import 'package:flutter_test/flutter_test.dart';
import 'package:parkinson_new/services/security_service.dart';

void main() {
  setUp(() {
    SecurityService.encryptionKeyOverride = SecurityService.generateSecureKey();
  });

  tearDown(() {
    SecurityService.encryptionKeyOverride = null;
  });

  test('encryptField round-trips UTF-8 plaintext', () async {
    const plaintext = '1.23,4.56,7.89,昵称';
    final encrypted = await SecurityService.encryptField(plaintext);

    expect(encrypted, startsWith(SecurityService.encryptedFieldPrefix));
    expect(encrypted, isNot(contains('1.23')));
    expect(encrypted, isNot(contains('昵称')));

    final decrypted = await SecurityService.decryptField(encrypted);
    expect(decrypted, plaintext);
  });

  test('encryptField is idempotent for already-encrypted values', () async {
    final once = await SecurityService.encryptField('abc');
    final twice = await SecurityService.encryptField(once);
    expect(twice, once);
  });

  test('decryptField leaves plaintext migration values unchanged', () async {
    const legacy = '0.1,0.2,0.3';
    final decrypted = await SecurityService.decryptField(legacy);
    expect(decrypted, legacy);
  });

  test('wrong DEK cannot decrypt ciphertext', () async {
    final encrypted = await SecurityService.encryptField('secret-samples');
    SecurityService.encryptionKeyOverride = SecurityService.generateSecureKey();

    await expectLater(
      SecurityService.decryptField(encrypted),
      throwsA(anything),
    );
  });
}
