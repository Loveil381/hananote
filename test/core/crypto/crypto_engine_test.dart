import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/crypto/crypto_engine.dart';

void main() {
  late CryptoEngine cryptoEngine;

  setUp(() {
    cryptoEngine = CryptoEngine();
  });

  group('CryptoEngine AES-256-GCM', () {
    final key = Uint8List.fromList(
      List.generate(32, (index) => index),
    ); // 256 bit key
    final plaintext = Uint8List.fromList(
      utf8.encode('Top Secret Health Data 123!'),
    );

    test('should encrypt and decrypt correctly', () async {
      // Act: Encrypt
      final encryptResult = await cryptoEngine.encrypt(plaintext, key);
      expect(encryptResult.isRight(), isTrue);

      final encryptedData = encryptResult.getRight().toNullable()!;
      expect(encryptedData.length, greaterThan(plaintext.length));

      // Act: Decrypt
      final decryptResult = await cryptoEngine.decrypt(encryptedData, key);
      expect(decryptResult.isRight(), isTrue);

      final decryptedData = decryptResult.getRight().toNullable()!;
      expect(decryptedData, equals(plaintext));
      expect(utf8.decode(decryptedData), 'Top Secret Health Data 123!');
    });

    test('should fail decryption with wrong key', () async {
      // Act: Encrypt
      final encryptResult = await cryptoEngine.encrypt(plaintext, key);
      final encryptedData = encryptResult.getRight().toNullable()!;

      // Wrong key
      final wrongKey = Uint8List.fromList(
        List.generate(32, (index) => 31 - index),
      );

      // Act: Decrypt
      final decryptResult = await cryptoEngine.decrypt(encryptedData, wrongKey);

      expect(decryptResult.isLeft(), isTrue);
      decryptResult.fold(
        (failure) => expect(failure.message, contains('Decryption failed')),
        (_) => fail('Should not decrypt successfully with wrong key'),
      );
    });

    test('should fail decryption when data is tampered', () async {
      final encryptResult = await cryptoEngine.encrypt(plaintext, key);
      final encryptedData = encryptResult.getRight().toNullable()!;

      // Tamper with the last byte (MAC tag)
      encryptedData[encryptedData.length - 1] ^= 0x01;

      final decryptResult = await cryptoEngine.decrypt(encryptedData, key);
      expect(decryptResult.isLeft(), isTrue);
    });
  });
}
