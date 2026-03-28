import 'package:flutter/material.dart';
import 'package:hananote/app/app.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/core/error/error_fallback_page.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  configureDependencies();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint('[ErrorBoundary] FlutterError: ${details.exceptionAsString()}');
  };

  ErrorWidget.builder = (details) => MaterialApp(
        home: ErrorFallbackPage(error: details.exception),
      );

  try {
    await getIt<NotificationService>().init();
    await getIt<NotificationService>().requestPermissions();
  } catch (e) {
    debugPrint('[main] Notification init error (non-fatal): $e');
  }

  runApp(const HanaNote());
}
