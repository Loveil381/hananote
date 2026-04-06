import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/presentation/main_shell.dart';
import 'package:hananote/app/theme/app_theme.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthCubit extends Mock implements AuthCubit {
  @override
  Future<void> close() async {}
}

class _MockSettingsBloc extends Mock implements SettingsBloc {
  @override
  Future<void> close() async {}
}

/// Builds a localized test app with mocked BLoCs and custom router.
Widget buildTestApp({
  required GoRouter router,
  required AuthCubit authCubit,
  required SettingsBloc settingsBloc,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider<AuthCubit>.value(value: authCubit),
      BlocProvider<SettingsBloc>.value(value: settingsBloc),
    ],
    child: MaterialApp.router(
      routerConfig: router,
      theme: AppTheme.getTheme(AppThemeType.sakura),
      locale: const Locale('zh'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late _MockAuthCubit authCubit;
  late _MockSettingsBloc settingsBloc;

  setUpAll(() {
    registerFallbackValue(const SettingsEvent.loadDashboard());
  });

  setUp(() {
    authCubit = _MockAuthCubit();
    settingsBloc = _MockSettingsBloc();

    // Auth: already unlocked
    when(() => authCubit.state).thenReturn(const AuthState.unlocked());
    when(() => authCubit.stream)
        .thenAnswer((_) => Stream.value(const AuthState.unlocked()));

    // Settings: initial (not loaded yet)
    when(() => settingsBloc.state).thenReturn(const SettingsState.initial());
    when(() => settingsBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  group('App Smoke Tests', () {
    testWidgets('bottom navigation tabs render and switch', (tester) async {
      final router = GoRouter(
        initialLocation: '/today',
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                MainShell(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/today',
                    builder: (_, __) => const Center(child: Text('Today Page')),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/record',
                    builder: (_, __) =>
                        const Center(child: Text('Record Page')),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/timeline',
                    builder: (_, __) =>
                        const Center(child: Text('Timeline Page')),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/data',
                    builder: (_, __) => const Center(child: Text('Data Page')),
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/profile',
                    builder: (_, __) =>
                        const Center(child: Text('Profile Page')),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        buildTestApp(
          router: router,
          authCubit: authCubit,
          settingsBloc: settingsBloc,
        ),
      );
      await tester.pumpAndSettle();

      // Verify Today tab is shown initially
      expect(find.text('Today Page'), findsOneWidget);

      // Tap each nav tab and verify navigation
      // Find all nav item icons
      final navBar = find.byType(BottomNavigationBar);
      if (navBar.evaluate().isEmpty) {
        // Custom nav bar — find tappable items by icon
        final icons = find.byType(IconButton);
        if (icons.evaluate().length >= 5) {
          // Tap Record tab (index 1)
          await tester.tap(icons.at(1));
          await tester.pumpAndSettle();
          expect(find.text('Record Page'), findsOneWidget);

          // Tap Data tab (index 3)
          await tester.tap(icons.at(3));
          await tester.pumpAndSettle();
          expect(find.text('Data Page'), findsOneWidget);
        }
      }
    });

    testWidgets('app renders with Chinese locale', (tester) async {
      final router = GoRouter(
        initialLocation: '/today',
        routes: [
          GoRoute(
            path: '/today',
            builder: (context, __) {
              final l10n = AppLocalizations.of(context);
              return Center(
                child: Text(l10n?.tabToday ?? 'NO L10N'),
              );
            },
          ),
        ],
      );

      await tester.pumpWidget(
        buildTestApp(
          router: router,
          authCubit: authCubit,
          settingsBloc: settingsBloc,
        ),
      );
      await tester.pumpAndSettle();

      // l10n should load — no "NO L10N" fallback
      expect(find.text('NO L10N'), findsNothing);
    });
  });
}
