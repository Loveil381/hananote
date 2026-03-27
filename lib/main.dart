import 'package:flutter/material.dart';
import 'package:hananote/app/app.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/core/error/error_boundary.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  await ErrorBoundary.init(() async {
    WidgetsFlutterBinding.ensureInitialized();
    tz.initializeTimeZones();
    configureDependencies();
    await getIt<NotificationService>().init();
    await getIt<NotificationService>().requestPermissions();
    ErrorBoundary.markAppStarted();
    runApp(const HanaNote());
  });
}
