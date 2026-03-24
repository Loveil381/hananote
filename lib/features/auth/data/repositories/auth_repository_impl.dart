import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:hananote/features/auth/domain/entities/auth_settings.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class _AuthRepositoryException implements Exception {
  const _AuthRepositoryException(this.failure);

  final Failure failure;
}

/// Default repository for startup authentication flows.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  /// Creates [AuthRepositoryImpl].
  AuthRepositoryImpl(
    this._localDataSource,
    this._keyManager,
    this._secureDatabase,
    this._secureStorage,
    this._localAuthentication,
  );

  final AuthLocalDataSource _localDataSource;
  final KeyManager _keyManager;
  final SecureDatabase _secureDatabase;
  final FlutterSecureStorage _secureStorage;
  final LocalAuthentication _localAuthentication;

  @override
  Future<Either<Failure, AuthSettings>> getSettings() {
    return _guard(_localDataSource.getSettings);
  }

  @override
  Future<Either<Failure, void>> saveSettings(AuthSettings settings) {
    return _guard(() => _localDataSource.saveSettings(settings));
  }

  @override
  Future<Either<Failure, void>> setupPassword(String pin) {
    return _guard(() => _keyManager.initializeKey(pin));
  }

  @override
  Future<Either<Failure, bool>> verifyPassword(String pin) {
    return _guard(() => _keyManager.verifyPassword(pin));
  }

  @override
  Future<Either<Failure, void>> changePassword(String oldPin, String newPin) {
    return _guard(() async {
      final verified = await _keyManager.verifyPassword(oldPin);
      if (!verified) {
        throw const _AuthRepositoryException(
          Failure.auth(message: 'Current PIN is incorrect.'),
        );
      }
      await _keyManager.initializeKey(newPin);
    });
  }

  @override
  Future<Either<Failure, void>> deleteAllData() {
    return _guard(() async {
      await _secureDatabase.close();
      await deleteDatabase(await _secureDatabase.getDatabasePath());
      await _keyManager.deleteKey();
      await _secureStorage.deleteAll();
    });
  }

  @override
  Future<Either<Failure, bool>> isBiometricAvailable() {
    return _guard(() async {
      final canCheck = await _localAuthentication.canCheckBiometrics;
      final supported = await _localAuthentication.isDeviceSupported();
      return canCheck && supported;
    });
  }

  @override
  Future<Either<Failure, bool>> authenticateBiometric() {
    return _guard(() async {
      return _localAuthentication.authenticate(
        localizedReason: 'Unlock the app',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    });
  }

  @override
  Future<Either<Failure, void>> openDatabase() {
    return _guard(() async {
      final key = await _keyManager.getKey();
      if (key == null) {
        throw const _AuthRepositoryException(
          Failure.auth(message: 'Security key is not initialized.'),
        );
      }

      final result = await _secureDatabase.open(base64Encode(key));
      if (result.isLeft()) {
        throw _AuthRepositoryException(result.getLeft().toNullable()!);
      }
    });
  }

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return right(await action());
    } on _AuthRepositoryException catch (error) {
      return left(error.failure);
    } catch (error) {
      if (error is StateError) {
        return left(Failure.auth(message: error.toString()));
      }
      return left(Failure.unexpected(message: error.toString()));
    }
  }
}
