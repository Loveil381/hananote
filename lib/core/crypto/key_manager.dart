import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hashlib/hashlib.dart';
import 'package:injectable/injectable.dart';

/// Manages key derivation and secure storage.
///
/// Security model: the actual encryption key is **never** persisted to disk.
/// Only a SHA-256 verification hash of the key is stored so that PIN
/// correctness can be checked. The key itself lives only in the in-memory
/// [_cachedKey] after a successful [verifyPassword] or [initializeKey] call.
@lazySingleton
class KeyManager {
  /// Constructor for [KeyManager].
  KeyManager(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  static const String _hashStorageKey = 'hananote_key_hash';
  static const String _saltStorageKey = 'hananote_salt';

  /// Legacy key used in versions prior to the hash-based scheme.
  static const String _legacyKeyStorageKey = 'hananote_master_key';

  static const int _saltLength = 16;
  static const int _hashLength = 32;
  static const int _memorySizeKb = 65536;
  static const int _iterations = 3;
  static const int _parallelism = 4;
  Uint8List? _cachedKey;

  /// Derive key from password using Argon2id and save a verification hash.
  ///
  /// The actual key is kept only in [_cachedKey] — never written to storage.
  Future<void> initializeKey(String password) async {
    final salt = _generateSalt();
    final key = _deriveKey(password, salt);
    final hash = _computeHash(key);

    await _secureStorage.write(
      key: _saltStorageKey,
      value: base64Encode(salt),
    );
    await _secureStorage.write(
      key: _hashStorageKey,
      value: base64Encode(hash),
    );

    // Remove any legacy key that might exist from a previous version.
    await _secureStorage.delete(key: _legacyKeyStorageKey);

    _cachedKey = key;
  }

  /// Returns the current session key from the in-memory cache.
  ///
  /// Returns `null` if [verifyPassword] or [initializeKey] has not been called
  /// in the current session — the key is **never** read back from storage.
  Future<Uint8List?> getKey() async {
    return _cachedKey;
  }

  /// Returns the current session key, hydrating it from secure storage when the
  /// in-memory cache is empty.
  Future<Uint8List?> getCurrentKey() {
    return getKey();
  }

  /// Verifies whether [password] derives the same master key as the stored one.
  ///
  /// On success the derived key is cached in memory so that [getKey] can
  /// return it for the remainder of the session.
  ///
  /// Handles transparent migration from the legacy scheme where the raw key
  /// was persisted instead of a hash.
  Future<bool> verifyPassword(String password) async {
    final encodedSalt = await _secureStorage.read(key: _saltStorageKey);
    if (encodedSalt == null) return false;

    final salt = base64Decode(encodedSalt);
    final testKey = _deriveKey(password, salt);

    // --- Legacy migration path ---
    final encodedLegacyKey =
        await _secureStorage.read(key: _legacyKeyStorageKey);
    if (encodedLegacyKey != null) {
      final legacyKey = base64Decode(encodedLegacyKey);
      if (_constantTimeEquals(testKey, legacyKey)) {
        // Migrate: store hash, delete raw key.
        final hash = _computeHash(testKey);
        await _secureStorage.write(
          key: _hashStorageKey,
          value: base64Encode(hash),
        );
        await _secureStorage.delete(key: _legacyKeyStorageKey);
        _cachedKey = testKey;
        return true;
      }
      return false;
    }

    // --- New hash-based path ---
    final encodedStoredHash = await _secureStorage.read(key: _hashStorageKey);
    if (encodedStoredHash == null) return false;

    final storedHash = base64Decode(encodedStoredHash);
    final testHash = _computeHash(testKey);

    if (_constantTimeEquals(testHash, storedHash)) {
      _cachedKey = testKey;
      return true;
    }
    return false;
  }

  /// Deletes the persisted key material and clears the in-memory cache.
  Future<void> deleteKey() async {
    await _secureStorage.delete(key: _hashStorageKey);
    await _secureStorage.delete(key: _saltStorageKey);
    await _secureStorage.delete(key: _legacyKeyStorageKey);
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

  Uint8List _computeHash(Uint8List key) {
    return Uint8List.fromList(sha256.convert(key).bytes);
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
