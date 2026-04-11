// Platform-aware database factory.
//
// Uses conditional imports to select the correct database implementation:
// - Mobile (Android/iOS): sqflite_sqlcipher with encryption
// - Web: direct sqlite3.wasm adapter (SQLite via WebAssembly, no encryption)
export 'database_factory_native.dart'
    if (dart.library.js_interop) 'database_factory_web.dart';
