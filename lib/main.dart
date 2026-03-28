import 'package:flutter/material.dart';
import 'package:hananote/app/app.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  configureDependencies();

  try {
    await getIt<NotificationService>().init();
    await getIt<NotificationService>().requestPermissions();
  } catch (e) {
    debugPrint('[main] Notification init error (non-fatal): $e');
  }

  runApp(const HanaNote());
}
