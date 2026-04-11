import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

/// Whether the app is running on the web platform.
const bool kDatabaseIsWeb = true;

/// Uses basic Worker (not SharedWorker) to avoid Cloudflare Pages
/// edge runtime issues with SharedWorker.
DatabaseFactory get _factory => databaseFactoryFfiWebBasicWebWorker;

/// Opens the database using the web FFI implementation.
Future<Database> openPlatformDatabase(
  String path, {
  String? password,
  int version = 1,
  OnDatabaseCreateFn? onCreate,
  OnDatabaseVersionChangeFn? onUpgrade,
}) {
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
Future<String> getPlatformDatabasesPath() async => '/databases';

/// Initializes the web database factory.
void initDatabaseFactory() {
  // No-op: factory is accessed directly via the getter.
}
