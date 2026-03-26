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
    );
    final plaintext = Uint8List.fromList(
      utf8.encode('Top Secret Health Data 123!'),
    );
    final aad = Uint8List.fromList(utf8.encode('note:entry:metadata'));

    test('should encrypt and decrypt correctly', () async {
      final encryptResult = await cryptoEngine.encrypt(plaintext, key);
      expect(encryptResult.isRight(), isTrue);

      final encryptedData = encryptResult.getRight().toNullable()!;
      expect(encryptedData.length, greaterThan(plaintext.length));

      final decryptResult = await cryptoEngine.decrypt(encryptedData, key);
      expect(decryptResult.isRight(), isTrue);

      final decryptedData = decryptResult.getRight().toNullable()!;
      expect(decryptedData, orderedEquals(plaintext));
      expect(utf8.decode(decryptedData), 'Top Secret Health Data 123!');
    });

    test('should fail decryption with wrong key', () async {
      final encryptResult = await cryptoEngine.encrypt(plaintext, key);
      final encryptedData = encryptResult.getRight().toNullable()!;

      final wrongKey = Uint8List.fromList(
        List.generate(32, (index) => 31 - index),
      );

      final decryptResult = await cryptoEngine.decrypt(encryptedData, wrongKey);

      expect(decryptResult.isLeft(), isTrue);
      decryptResult.fold(
        (failure) => expect(failure.message, contains('Decryption failed')),
        (_) => fail('Should not decrypt successfully with wrong key'),
      );
    });

    test('should encrypt and decrypt empty plaintext', () async {
      final encryptResult = await cryptoEngine.encrypt(Uint8List(0), key);
      expect(encryptResult.isRight(), isTrue);

      final encryptedData = encryptResult.getRight().toNullable()!;
      final decryptResult = await cryptoEngine.decrypt(encryptedData, key);

      expect(decryptResult.isRight(), isTrue);
      expect(decryptResult.getRight().toNullable(), isEmpty);
    });

    test('should encrypt and decrypt with aad', () async {
      final encryptResult = await cryptoEngine.encrypt(
        plaintext,
        key,
        aad: aad,
      );
      expect(encryptResult.isRight(), isTrue);

      final encryptedData = encryptResult.getRight().toNullable()!;
      final decryptResult = await cryptoEngine.decrypt(
        encryptedData,
        key,
        aad: aad,
      );

      expect(decryptResult.isRight(), isTrue);
      expect(
        decryptResult.getRight().toNullable(),
        orderedEquals(plaintext),
      );
    });

    test('should fail decryption when aad does not match', () async {
      final encryptResult = await cryptoEngine.encrypt(
        plaintext,
        key,
        aad: aad,
      );
      final encryptedData = encryptResult.getRight().toNullable()!;
      final differentAad = Uint8List.fromList(utf8.encode('wrong-metadata'));

      final decryptResult = await cryptoEngine.decrypt(
        encryptedData,
        key,
        aad: differentAad,
      );

      expect(decryptResult.isLeft(), isTrue);
      decryptResult.fold(
        (failure) => expect(failure.message, contains('Decryption failed')),
        (_) => fail('Should not decrypt successfully with mismatched AAD'),
      );
    });
  });
}
