import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:hananote/features/medication/presentation/pages/today_page.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

class _MockTodayScheduleBloc
    extends MockBloc<TodayScheduleEvent, TodayScheduleState>
    implements TodayScheduleBloc {}

void main() {
  late _MockSettingsBloc settingsBloc;
  late _MockTodayScheduleBloc todayScheduleBloc;
  final quotes = [
    '你的每一点坚持，都在悄悄靠近更自在的自己。',
    '身体的变化需要时间，温柔地陪自己走下去。',
    '记录今天，也是为了更清楚地看见未来的你。',
    '稳定和耐心，本身就是一种很强大的力量。',
    '你认真照顾自己的样子，值得被温柔对待。',
    '哪怕只是小小一步，也是在向想成为的自己前进。',
    '请相信，今天的努力会在未来慢慢发光。',
    '允许自己慢一点，但不要否认已经走过的路。',
    '你的感受和变化都真实而重要，值得被认真记录。',
    '愿你在每一次回看时，都能看见自己的勇敢。',
    '今天也请把关心留给自己一点点。',
    '你不是在追赶谁，你是在稳稳地成为自己。',
  ];

  final loadedSettings = SettingsState.loaded(
    profile: UserProfile(
      displayName: '\u5C0F\u82B1',
      hrtDayCount: 123,
      hrtStartDate: DateTime(2025, 11, 26),
    ),
    settings: const AppSettings(
      appLockEnabled: true,
      privacyModeEnabled: false,
      blurOverlayEnabled: false,
      lastBackupDate: null,
    ),
    activeDrugCount: 1,
    inventoryDaysRemaining: 30,
  );

  setUpAll(() {
    registerFallbackValue(const SettingsEvent.loadDashboard());
    registerFallbackValue(const TodayScheduleEvent.load());
  });

  setUp(() {
    settingsBloc = _MockSettingsBloc();
    todayScheduleBloc = _MockTodayScheduleBloc();

    when(() => settingsBloc.state).thenReturn(loadedSettings);
    when(() => settingsBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => todayScheduleBloc.state)
        .thenReturn(const TodayScheduleState.initial());
    when(() => todayScheduleBloc.stream)
        .thenAnswer((_) => const Stream.empty());
  });

  testWidgets('renders greeting and HRT day count from settings state', (
    tester,
  ) async {
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? '\u65E9\u5B89'
        : hour < 18
            ? '\u5348\u5B89'
            : '\u665A\u4E0A\u597D';

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SettingsBloc>.value(value: settingsBloc),
            BlocProvider<TodayScheduleBloc>.value(value: todayScheduleBloc),
          ],
          child: const TodayPage(),
        ),
      ),
    );

    expect(
      find.text('$greeting\uFF0C\u5C0F\u82B1'),
      findsOneWidget,
    );
    expect(find.text('HRT \u7B2C 123 \u5929'), findsOneWidget);
  });

  testWidgets('renders the daily quote selected from the rotation list', (
    tester,
  ) async {
    final expectedQuote = quotes[DateTime.now().day % quotes.length];
    final item = TodayScheduleItem(
      drug: Drug(
        id: 'drug-1',
        name: 'Estradiol',
        genericName: 'Estradiol',
        category: DrugCategory.estrogen,
        administrationRoute: AdministrationRoute.oral,
        defaultDosageUnit: DosageUnit.mg,
        isActive: true,
        createdAt: DateTime(2026, 1, 1),
      ),
      schedule: MedicationSchedule(
        id: 'schedule-1',
        drugId: 'drug-1',
        dosageAmount: 2,
        dosageUnit: DosageUnit.mg,
        frequency: const MedicationFrequency.daily(timesPerDay: 1),
        administrationRoute: AdministrationRoute.oral,
        startDate: DateTime(2026, 1, 1),
        isActive: true,
        scheduleTimes: const [TimeOfDay(hour: 8, minute: 0)],
      ),
      logs: const [],
      scheduledDateTimes: [DateTime.now().add(const Duration(hours: 1))],
      isCompleted: false,
    );

    when(() => todayScheduleBloc.state).thenReturn(
      TodayScheduleState.loaded(
        items: [item],
        date: DateTime.now(),
        completedCount: 0,
        totalCount: 1,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<SettingsBloc>.value(value: settingsBloc),
            BlocProvider<TodayScheduleBloc>.value(value: todayScheduleBloc),
          ],
          child: const TodayPage(),
        ),
      ),
    );

    expect(find.text(expectedQuote), findsOneWidget);
  });
}
