import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class _MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

void main() {
  late _MockFlutterLocalNotificationsPlugin plugin;
  late NotificationService service;

  setUpAll(() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('UTC'));
    registerFallbackValue(
      const InitializationSettings(
        android: AndroidInitializationSettings('app_icon'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    registerFallbackValue(
      tz.TZDateTime.from(DateTime.utc(2026), tz.local),
    );
    registerFallbackValue(
      const NotificationDetails(
        android: AndroidNotificationDetails('id', 'name'),
        iOS: DarwinNotificationDetails(),
      ),
    );
    registerFallbackValue(
      UILocalNotificationDateInterpretation.absoluteTime,
    );
    registerFallbackValue(AndroidScheduleMode.exactAllowWhileIdle);
    registerFallbackValue(DateTimeComponents.time);
  });

  setUp(() {
    plugin = _MockFlutterLocalNotificationsPlugin();
    service = NotificationService(plugin);
  });

  test('init initializes the plugin', () async {
    when(() => plugin.initialize(any())).thenAnswer((_) async => true);

    await service.init();

    verify(() => plugin.initialize(any())).called(1);
  });

  test('scheduleMedicationReminder schedules a daily repeating reminder',
      () async {
    when(
      () => plugin.zonedSchedule(
        any(),
        any(),
        any(),
        any(),
        any(),
        uiLocalNotificationDateInterpretation:
            any(named: 'uiLocalNotificationDateInterpretation'),
        androidScheduleMode: any(named: 'androidScheduleMode'),
        matchDateTimeComponents: any(named: 'matchDateTimeComponents'),
      ),
    ).thenAnswer((_) async {});

    await service.scheduleMedicationReminder(
      id: 42,
      drugName: 'Estradiol',
      dosage: 2,
      unit: 'mg',
      hour: 8,
      minute: 30,
    );

    final captured = (verify(
      () => plugin.zonedSchedule(
        captureAny(),
        captureAny(),
        captureAny(),
        captureAny(),
        captureAny(),
        uiLocalNotificationDateInterpretation: captureAny(
          named: 'uiLocalNotificationDateInterpretation',
        ),
        androidScheduleMode: captureAny(named: 'androidScheduleMode'),
        matchDateTimeComponents: captureAny(
          named: 'matchDateTimeComponents',
        ),
      ),
    )..called(1))
        .captured;
    expect(captured[0], 42);
    expect(captured[1], 'HanaNote');
    expect(captured[2], 'Estradiol 2mg');
    expect(captured[4], isA<NotificationDetails>());
    expect(
      captured[5],
      UILocalNotificationDateInterpretation.absoluteTime,
    );
    expect(captured[6], AndroidScheduleMode.exactAllowWhileIdle);
    expect(captured[7], DateTimeComponents.time);

    final scheduledDate = captured[3] as tz.TZDateTime;
    expect(scheduledDate.hour, 8);
    expect(scheduledDate.minute, 30);
  });

  test('cancelAllReminders calls cancelAll on the plugin', () async {
    when(() => plugin.cancelAll()).thenAnswer((_) async {});

    await service.cancelAllReminders();

    verify(() => plugin.cancelAll()).called(1);
  });
}
