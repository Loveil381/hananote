import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';

/// Manages key derivation and secure storage.
class KeyManager {
  /// Constructor for [KeyManager].
  KeyManager(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const String _keyStorageKey = 'hananote_master_key';
  static const String _saltStorageKey = 'hananote_salt';

  /// Derive key from password using PBKDF2 and save it to secure storage.
  Future<void> initializeKey(String password) async {
    final salt = _generateSalt();
    final key = _deriveKey(password, salt);

    await _secureStorage.write(key: _saltStorageKey, value: base64Encode(salt));
    await _secureStorage.write(key: _keyStorageKey, value: base64Encode(key));
  }

  /// Retrieve the symmetric key from secure storage.
  Future<Uint8List?> getKey() async {
    final encodedKey = await _secureStorage.read(key: _keyStorageKey);
    if (encodedKey == null) return null;
    return base64Decode(encodedKey);
  }

  /// Verify if the given password matches the stored key.
  Future<bool> verifyPassword(String password) async {
    final encodedSalt = await _secureStorage.read(key: _saltStorageKey);
    final encodedStoredKey = await _secureStorage.read(key: _keyStorageKey);

    if (encodedSalt == null || encodedStoredKey == null) return false;

    final salt = base64Decode(encodedSalt);
    final storedKey = base64Decode(encodedStoredKey);

    final testKey = _deriveKey(password, salt);

    // Constant-time comparison
    if (testKey.length != storedKey.length) return false;
    var result = 0;
    for (var i = 0; i < testKey.length; i++) {
      result |= testKey[i] ^ storedKey[i];
    }
    return result == 0;
  }

  /// Delete the key for emergency or logout purposes.
  Future<void> deleteKey() async {
    await _secureStorage.delete(key: _keyStorageKey);
    await _secureStorage.delete(key: _saltStorageKey);
  }

  Uint8List _generateSalt() {
    final random = Random.secure();
    final salt = Uint8List(16);
    for (var i = 0; i < 16; i++) {
      salt[i] = random.nextInt(256);
    }
    return salt;
  }

  Uint8List _deriveKey(String password, Uint8List salt) {
    final derivator = PBKDF2KeyDerivator(HMac(SHA256Digest(), 64))
      ..init(Pbkdf2Parameters(salt, 100000, 32)); // 32 bytes = 256 bits
    return derivator.process(Uint8List.fromList(utf8.encode(password)));
  }
}
