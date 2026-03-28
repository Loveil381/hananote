import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart'
    as medication;
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:hananote/features/medication/presentation/pages/today_page.dart';
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
    '你照顾自己的每一步，都会在未来开花。',
    '慢一点没有关系，稳定前进就很好。',
    '今天也值得为身体的变化感到期待。',
    '温柔对待自己，就是最长期有效的计划。',
    '记录不是负担，它会帮你看见自己的成长。',
    '哪怕只有一点点进步，也值得认真庆祝。',
    '身体在用自己的节奏回应你，给它一点时间。',
    '你已经走了很远，今天也继续向前。',
    '科学记录和温柔陪伴，可以同时存在。',
    '每一次坚持，都会让明天更安心。',
    '不必急着证明什么，你正在慢慢成为自己。',
    '今天的你，也值得被认真照顾。',
  ];

  final loadedSettings = SettingsState.loaded(
    profile: UserProfile(
      displayName: '小花',
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
        ? '早安'
        : hour < 18
            ? '午安'
            : '晚上好';

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

    expect(find.text('$greeting，小花'), findsOneWidget);
    expect(find.text('HRT 第 123 天'), findsOneWidget);
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
        createdAt: DateTime(2026),
      ),
      schedule: medication.MedicationSchedule(
        id: 'schedule-1',
        drugId: 'drug-1',
        dosageAmount: 2,
        dosageUnit: DosageUnit.mg,
        frequency: const medication.MedicationFrequency.daily(timesPerDay: 1),
        administrationRoute: AdministrationRoute.oral,
        startDate: DateTime(2026),
        isActive: true,
        scheduleTimes: const [medication.TimeOfDay(hour: 8, minute: 0)],
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

  testWidgets('avatar navigates to the profile page', (tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<SettingsBloc>.value(value: settingsBloc),
              BlocProvider<TodayScheduleBloc>.value(value: todayScheduleBloc),
            ],
            child: const TodayPage(),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const Scaffold(body: Text('profile')),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    expect(find.text('profile'), findsOneWidget);
  });
}
