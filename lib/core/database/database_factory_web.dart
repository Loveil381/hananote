import 'package:hananote/core/database/wasm_sqflite_web.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// Whether the app is running on the web platform.
const bool kDatabaseIsWeb = true;

/// Opens the database using the direct WASM implementation.
Future<Database> openPlatformDatabase(
  String path, {
  String? password,
  int version = 1,
  OnDatabaseCreateFn? onCreate,
  OnDatabaseVersionChangeFn? onUpgrade,
}) {
  return openWasmDatabase(
    path,
    version: version,
    onCreate: onCreate,
    onUpgrade: onUpgrade,
  );
}

/// Returns a virtual path for web databases.
Future<String> getPlatformDatabasesPath() => getWasmDatabasesPath();

/// Initializes the web database factory.
void initDatabaseFactory() {
  initWasmDatabaseFactory();
}
