import 'dart:convert';

import 'package:hananote/core/crypto/key_manager.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Wraps SQLCipher database connection.
class SecureDatabase {
  /// Constructor for [SecureDatabase].
  SecureDatabase(this._keyManager);

  final KeyManager _keyManager;
  Database? _db;

  /// Open the encrypted database.
  Future<Database> open(String password) async {
    if (_db != null && _db!.isOpen) return _db!;

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'hananote_secure.db');

    // Retrieve the 256-bit key from KeyManager, base64 encode it to use
    // as SQLCipher password
    final key = await _keyManager.getKey();
    if (key == null) {
      throw Exception('Database key not available. Cannot open database.');
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

    return _db!;
  }

  /// Close the database.
  Future<void> close() async {
    if (_db != null && _db!.isOpen) {
      await _db!.close();
      _db = null;
    }
  }

  /// Run database migrations explicitly.
  Future<void> runMigrations() async {
    // Migration logic will be implemented here.
    if (_db == null || !_db!.isOpen) {
      throw Exception('Database is not open.');
    }
  }

  Future<void> _runInitialMigrations(Database db) async {
    // Create initial schema.
    // Example: await db.execute('CREATE TABLE User (id TEXT)');
  }
}
