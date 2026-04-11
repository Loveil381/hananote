import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

/// Whether the app is running on the web platform.
const bool kDatabaseIsWeb = true;

/// The web database factory instance.
DatabaseFactory get _factory => databaseFactoryFfiWeb;

/// Opens the database using the web FFI implementation.
///
/// On web platforms this uses sql.js (SQLite compiled to WebAssembly).
/// Encryption is not supported; the [password] parameter is ignored.
Future<Database> openPlatformDatabase(
  String path, {
  String? password,
  int version = 1,
  OnDatabaseCreateFn? onCreate,
  OnDatabaseVersionChangeFn? onUpgrade,
}) {
  // Web does not support SQLCipher encryption — password is ignored.
  return _factory.openDatabase(
    path,
    options: OpenDatabaseOptions(
      version: version,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    ),
  );
}

/// Returns a virtual path for web databases.
///
/// On web, databases are stored in IndexedDB.
Future<String> getPlatformDatabasesPath() async => '/databases';

/// Initializes the web database factory.
///
/// Must be called before any database operations on web.
void initDatabaseFactory() {
  // No global setter needed — we use the factory directly.
}
