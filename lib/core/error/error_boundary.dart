import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hananote/core/error/error_fallback_page.dart';

/// Global error boundary that catches unhandled Flutter and platform errors.
class ErrorBoundary {
  ErrorBoundary._();

  static bool _appStarted = false;
  static bool _fallbackShown = false;
  static void Function(Widget app) _appLauncher = runApp;

  /// Marks that the main app widget has been handed to Flutter.
  static void markAppStarted() {
    _appStarted = true;
  }

  /// Exposes whether the main app widget has been started for tests.
  @visibleForTesting
  static bool get appStarted => _appStarted;

  /// Resets the internal startup state so tests can run in isolation.
  @visibleForTesting
  static void resetForTest() {
    _appStarted = false;
    _fallbackShown = false;
    _appLauncher = runApp;
  }

  /// Overrides the app launcher used for fallback UI during tests.
  @visibleForTesting
  static void setAppLauncherForTest(void Function(Widget app)? appLauncher) {
    _appLauncher = appLauncher ?? runApp;
  }

  /// Call once in `main()` before `runApp()`.
  static Future<void> init(Future<void> Function() appRunner) async {
    _appStarted = false;
    _fallbackShown = false;

    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      debugPrint(
        '[ErrorBoundary] FlutterError: ${details.exceptionAsString()}',
      );
    };

    ErrorWidget.builder = (details) => MaterialApp(
          home: ErrorFallbackPage(error: details.exception),
        );

    PlatformDispatcher.instance.onError = (error, stack) {
      debugPrint('[ErrorBoundary] PlatformError: $error\n$stack');
      return true;
    };

    await runZonedGuarded(
      () async {
        await appRunner();
        _appStarted = true;
      },
      (error, stack) {
        debugPrint('[ErrorBoundary] ZoneError: $error\n$stack');
        if (!_appStarted && !_fallbackShown) {
          _fallbackShown = true;
          _appLauncher(
            MaterialApp(
              home: ErrorFallbackPage(error: error),
            ),
          );
        }
      },
    );
  }
}
