import 'package:flutter/services.dart';

/// Triggers the Android system package installer for a downloaded APK.
class ApkInstaller {
  static const _channel = MethodChannel('com.hananote.app/installer');

  /// Opens the system package installer for the APK at [filePath].
  static Future<void> install(String filePath) async {
    await _channel.invokeMethod<bool>('installApk', {'path': filePath});
  }
}
