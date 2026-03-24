import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:hananote/core/database/tables/medication_tables.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Wraps SQLCipher database connection.
@lazySingleton
class SecureDatabase {
  /// Constructor for [SecureDatabase].
  SecureDatabase(this._keyManager);

  final KeyManager _keyManager;
  Database? _db;

  /// Returns the open database instance.
  ///
  /// Throws a [StateError] when the database has not been opened yet.
  Database get database {
    final db = _db;
    if (db == null || !db.isOpen) {
      throw StateError('Database is not open.');
    }
    return db;
  }

  /// Open the encrypted database.
  Future<Either<Failure, Database>> open(String password) async {
    try {
      if (_db != null && _db!.isOpen) return right(_db!);

      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'hananote_secure.db');

      // Retrieve the 256-bit key from KeyManager, base64 encode it to use
      // as SQLCipher password
      final key = await _keyManager.getKey();
      if (key == null) {
        return left(
          const DatabaseFailure(
            message: 'Database key not available. Cannot open database.',
          ),
        );
      }
      final dbPassword = base64Encode(key);

      _db = await openDatabase(
        path,
        password: dbPassword,
        version: 1,
        onCreate: (db, version) async {
          await _runInitialMigrations(db);
        },
      );

      return right(_db!);
    } catch (e) {
      return left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Close the database.
  Future<Either<Failure, void>> close() async {
    try {
      if (_db != null && _db!.isOpen) {
        await _db!.close();
        _db = null;
      }
      return right(null);
    } catch (e) {
      return left(DatabaseFailure(message: e.toString()));
    }
  }

  /// Run database migrations explicitly.
  Future<Either<Failure, void>> runMigrations() async {
    try {
      // Migration logic will be implemented here.
      if (_db == null || !_db!.isOpen) {
        return left(const DatabaseFailure(message: 'Database is not open.'));
      }
      return right(null);
    } catch (e) {
      return left(DatabaseFailure(message: e.toString()));
    }
  }

  Future<void> _runInitialMigrations(Database db) async {
    for (final statement in MedicationTables.allCreateStatements) {
      await db.execute(statement);
    }

    for (final statement in MedicationTables.createIndices) {
      await db.execute(statement);
    }
  }
}
