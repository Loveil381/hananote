import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:pointycastle/export.dart';

/// Handles AES-256-GCM encryption and decryption.
@lazySingleton
class CryptoEngine {
  /// The length of the GCM Initialization Vector (IV) in bytes.
  static const int _ivLength = 12;

  /// Generate a cryptographically secure random IV.
  Uint8List _generateIV() {
    final random = Random.secure();
    final iv = Uint8List(_ivLength);
    for (var i = 0; i < _ivLength; i++) {
      iv[i] = random.nextInt(256);
    }
    return iv;
  }

  /// Returns `Either<CryptoFailure, Uint8List>` containing
  /// [IV + Ciphertext + MAC tag].
  Future<Either<Failure, Uint8List>> encrypt(
    Uint8List plaintext,
    Uint8List key, {
    Uint8List? aad,
  }) async {
    try {
      final payload = <String, Uint8List>{
        'plaintext': plaintext,
        'key': key,
        'aad': aad ?? Uint8List(0),
      };
      final result = await compute(_encryptInIsolate, payload);
      return right(result);
    } on Exception catch (e) {
      return left(Failure.crypto(message: 'Encryption failed: $e'));
    }
  }

  /// Decrypt given payload (IV + Ciphertext + MAC tag) using AES-256-GCM.
  Future<Either<Failure, Uint8List>> decrypt(
    Uint8List encrypted,
    Uint8List key, {
    Uint8List? aad,
  }) async {
    try {
      final payload = <String, Uint8List>{
        'encrypted': encrypted,
        'key': key,
        'aad': aad ?? Uint8List(0),
      };
      final result = await compute(_decryptInIsolate, payload);
      return right(result);
    } on Exception catch (e) {
      return left(Failure.crypto(message: 'Decryption failed: $e'));
    }
  }

  static Uint8List _encryptInIsolate(Map<String, Uint8List> payload) {
    final plaintext = payload['plaintext']!;
    final key = payload['key']!;
    final aad = payload['aad']!;

    final engine = CryptoEngine();
    final iv = engine._generateIV();

    final cipher = GCMBlockCipher(AESEngine())
      ..init(
        true,
        AEADParameters(
          KeyParameter(key),
          128, // MAC size in bits
          iv,
          aad,
        ),
      );

    final ciphertext = cipher.process(plaintext);

    // Concat IV + Ciphertext (which includes the MAC tag)
    final result = BytesBuilder(copy: false)
      ..add(iv)
      ..add(ciphertext);

    return result.toBytes();
  }

  static Uint8List _decryptInIsolate(Map<String, Uint8List> payload) {
    final encrypted = payload['encrypted']!;
    final key = payload['key']!;
    final aad = payload['aad']!;

    if (encrypted.length < _ivLength) {
      throw ArgumentError('Encrypted data too short.');
    }

    final iv = encrypted.sublist(0, _ivLength);
    final ciphertext = encrypted.sublist(_ivLength);

    final cipher = GCMBlockCipher(AESEngine())
      ..init(
        false,
        AEADParameters(
          KeyParameter(key),
          128, // MAC size in bits
          iv,
          aad,
        ),
      );

    return cipher.process(ciphertext);
  }
}
