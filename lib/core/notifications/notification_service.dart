import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;

/// Wrapper around flutter_local_notifications used by features.
@lazySingleton
class NotificationService {
  /// Creates a [NotificationService].
  NotificationService(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;

  static const AndroidNotificationChannel _medicationChannel =
      AndroidNotificationChannel(
    'medication_reminders',
    '服药提醒',
    description: '每日服药提醒通知',
    importance: Importance.high,
  );

  /// Initializes platform notification settings.
  Future<void> init() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('app_icon'),
      iOS: DarwinInitializationSettings(),
    );

    await _plugin.initialize(settings);

    final androidImplementation = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.createNotificationChannel(
      _medicationChannel,
    );
  }

  /// Requests notification permissions from the current platform.
  Future<bool> requestPermissions() async {
    if (kIsWeb) {
      return true;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return await _plugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.requestNotificationsPermission() ??
            true;
      case TargetPlatform.iOS:
        return await _plugin
                .resolvePlatformSpecificImplementation<
                    IOSFlutterLocalNotificationsPlugin>()
                ?.requestPermissions(
                  alert: true,
                  badge: true,
                  sound: true,
                ) ??
            true;
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
      case TargetPlatform.fuchsia:
        return true;
    }
  }

  /// Schedules a daily repeating medication reminder.
  Future<void> scheduleMedicationReminder({
    required int id,
    required String drugName,
    required double dosage,
    required String unit,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id,
      'HanaNote 服药提醒',
      '$drugName ${_formatDosage(dosage)}$unit — 该吃药啦 💊',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'medication_reminders',
          '服药提醒',
          channelDescription: '每日服药提醒通知',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Cancels a scheduled reminder by id.
  Future<void> cancelReminder(int id) => _plugin.cancel(id);

  /// Cancels all reminders.
  Future<void> cancelAllReminders() => _plugin.cancelAll();

  /// Lists all pending reminders.
  Future<List<PendingNotificationRequest>> getPendingReminders() =>
      _plugin.pendingNotificationRequests();

  String _formatDosage(double dosage) {
    if (dosage == dosage.roundToDouble()) {
      return dosage.toInt().toString();
    }

    return dosage.toString();
  }
}
