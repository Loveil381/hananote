import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hananote/core/error/error_fallback_page.dart';

/// Global error boundary that catches unhandled Flutter and platform errors.
class ErrorBoundary {
  ErrorBoundary._();

  /// Call once in `main()` before `runApp()`.
  static Future<void> init(Future<void> Function() appRunner) async {
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
      appRunner,
      (error, stack) {
        debugPrint('[ErrorBoundary] ZoneError: $error\n$stack');
      },
    );
  }
}
