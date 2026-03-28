import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
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
    '你的每一次坚持，都会在未来悄悄开花。',
    '今天也请温柔地照顾自己，变化正在发生。',
    '身体的每一点回应，都是你认真生活的证据。',
    '慢一点没有关系，稳定前进本身就是力量。',
    '服药和记录不是任务，是你对自己的承诺。',
    '允许自己按节奏成长，不必和任何人比较。',
    '你正在成为想成为的人，这件事值得庆祝。',
    '再普通的一天，也可以因为认真对待自己而闪光。',
    '照顾身体不是负担，是你给未来写下的情书。',
    '你今天的耐心，会变成明天的安心。',
    '每一次记录都不是重复，而是在看见真实的自己。',
    '今天也别忘了夸夸自己，你已经做得很好。',
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

  MaterialApp buildLocalizedApp(Widget child) {
    return MaterialApp(
      locale: const Locale('zh'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }

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
      buildLocalizedApp(
        MultiBlocProvider(
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
      buildLocalizedApp(
        MultiBlocProvider(
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

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        locale: const Locale('zh'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );

    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();

    expect(find.text('profile'), findsOneWidget);
  });
}
