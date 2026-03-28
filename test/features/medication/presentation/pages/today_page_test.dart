import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
