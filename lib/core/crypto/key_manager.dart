import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hashlib/hashlib.dart';
import 'package:injectable/injectable.dart';

/// Manages key derivation and secure storage.
@lazySingleton
class KeyManager {
  /// Constructor for [KeyManager].
  KeyManager(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const String _keyStorageKey = 'hananote_master_key';
  static const String _saltStorageKey = 'hananote_salt';
  static const int _saltLength = 16;
  static const int _hashLength = 32;
  static const int _memorySizeKb = 65536;
  static const int _iterations = 3;
  static const int _parallelism = 4;
  Uint8List? _cachedKey;

  /// Derive key from password using Argon2id and save it to secure storage.
  Future<void> initializeKey(String password) async {
    final salt = _generateSalt();
    final key = _deriveKey(password, salt);

    await _secureStorage.write(key: _saltStorageKey, value: base64Encode(salt));
    await _secureStorage.write(key: _keyStorageKey, value: base64Encode(key));
    _cachedKey = key;
  }

  /// Retrieves the symmetric key from secure storage or the in-memory cache.
  Future<Uint8List?> getKey() async {
    final cachedKey = _cachedKey;
    if (cachedKey != null) {
      return cachedKey;
    }
    final encodedKey = await _secureStorage.read(key: _keyStorageKey);
    if (encodedKey == null) return null;
    final key = base64Decode(encodedKey);
    _cachedKey = key;
    return key;
  }

  /// Returns the current session key, hydrating it from secure storage when the
  /// in-memory cache is empty.
  Future<Uint8List?> getCurrentKey() {
    return getKey();
  }

  /// Verifies whether [password] derives the same master key as the stored one.
  Future<bool> verifyPassword(String password) async {
    final encodedSalt = await _secureStorage.read(key: _saltStorageKey);
    final encodedStoredKey = await _secureStorage.read(key: _keyStorageKey);

    if (encodedSalt == null || encodedStoredKey == null) return false;

    final salt = base64Decode(encodedSalt);
    final storedKey = base64Decode(encodedStoredKey);

    final testKey = _deriveKey(password, salt);

    return _constantTimeEquals(testKey, storedKey);
  }

  /// Deletes the persisted key material and clears the in-memory cache.
  Future<void> deleteKey() async {
    await _secureStorage.delete(key: _keyStorageKey);
    await _secureStorage.delete(key: _saltStorageKey);
    _cachedKey = null;
  }

  Uint8List _generateSalt() {
    final random = Random.secure();
    final salt = Uint8List(_saltLength);
    for (var i = 0; i < _saltLength; i++) {
      salt[i] = random.nextInt(256);
    }
    return salt;
  }

  Uint8List _deriveKey(String password, Uint8List salt) {
    final derivator = Argon2(
      parallelism: _parallelism,
      memorySizeKB: _memorySizeKb,
      iterations: _iterations,
      hashLength: _hashLength,
      salt: salt,
    );

    return Uint8List.fromList(derivator.convert(utf8.encode(password)).bytes);
  }

  bool _constantTimeEquals(Uint8List left, Uint8List right) {
    if (left.length != right.length) return false;

    var result = 0;
    for (var i = 0; i < left.length; i++) {
      result |= left[i] ^ right[i];
    }
    return result == 0;
  }
}
