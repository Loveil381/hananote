import 'package:sqflite_sqlcipher/sqflite.dart';

/// Whether the app is running on the web platform.
const bool kDatabaseIsWeb = false;

/// Opens the database using the native SQLCipher implementation.
///
/// On mobile platforms this uses the encrypted SQLCipher driver.
Future<Database> openPlatformDatabase(
  String path, {
  String? password,
  int version = 1,
  OnDatabaseCreateFn? onCreate,
  OnDatabaseVersionChangeFn? onUpgrade,
}) {
  return openDatabase(
    path,
    password: password,
    version: version,
    onCreate: onCreate,
    onUpgrade: onUpgrade,
  );
}

/// Returns the default databases path for the current platform.
Future<String> getPlatformDatabasesPath() => getDatabasesPath();

/// Initializes the database factory for the current platform.
///
/// No-op on native platforms.
void initDatabaseFactory() {}
