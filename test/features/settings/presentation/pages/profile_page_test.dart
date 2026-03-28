import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:hananote/features/settings/presentation/pages/profile_page.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  late _MockSettingsBloc settingsBloc;

  setUpAll(() {
    registerFallbackValue(const SettingsEvent.loadDashboard());
  });

  setUp(() {
    settingsBloc = _MockSettingsBloc();
    when(() => settingsBloc.state)
        .thenReturn(const SettingsState.error('load failed'));
    when(() => settingsBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  const loadedState = SettingsState.loaded(
    profile: UserProfile(
      displayName: '小花',
      hrtDayCount: 120,
      hrtStartDate: DateTime(2025, 1, 1),
    ),
    settings: AppSettings(
      appLockEnabled: true,
      privacyModeEnabled: false,
      blurOverlayEnabled: false,
      lastBackupDate: null,
    ),
    activeDrugCount: 1,
    inventoryDaysRemaining: 30,
  );

  testWidgets('shows retry UI when loading the profile dashboard fails', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SettingsBloc>.value(
          value: settingsBloc,
          child: const ProfilePage(),
        ),
      ),
    );

    expect(find.text('load failed'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    verify(() => settingsBloc.add(const LoadSettingsDashboard())).called(1);
  });

  testWidgets('shows a snackbar for unfinished tool actions', (tester) async {
    when(() => settingsBloc.state).thenReturn(loadedState);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SettingsBloc>.value(
          value: settingsBloc,
          child: const ProfilePage(),
        ),
      ),
    );

    await tester.tap(find.text('导出备份'));
    await tester.pump();

    expect(find.text('功能开发中，敬请期待'), findsOneWidget);
  });
}
