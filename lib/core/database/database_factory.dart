/// Platform-aware database factory.
///
/// Uses conditional imports to select the correct database implementation:
/// - Mobile (Android/iOS): sqflite_sqlcipher with encryption
/// - Web: sqflite_common_ffi_web (SQLite via WebAssembly, no encryption)
export 'database_factory_native.dart'
    if (dart.library.js_interop) 'database_factory_web.dart';
