import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:hananote/features/auth/presentation/pages/auth_wrapper_page.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class _MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  late _MockAuthCubit authCubit;
  late _MockSettingsBloc settingsBloc;

  setUpAll(() {
    registerFallbackValue(const SettingsEvent.loadDashboard());
  });

  setUp(() {
    authCubit = _MockAuthCubit();
    settingsBloc = _MockSettingsBloc();

    when(() => authCubit.state).thenReturn(const AuthState.initial());
    when(() => settingsBloc.state).thenReturn(const SettingsState.initial());
    when(() => settingsBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('loads settings before navigating to today after unlock', (
    tester,
  ) async {
    whenListen(
      authCubit,
      Stream<AuthState>.fromIterable(const [AuthState.unlocked()]),
      initialState: const AuthState.initial(),
    );

    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>.value(value: authCubit),
              BlocProvider<SettingsBloc>.value(value: settingsBloc),
            ],
            child: const AuthWrapperPage(),
          ),
        ),
        GoRoute(
          path: '/today',
          builder: (context, state) => const Scaffold(body: Text('today')),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    verify(() => settingsBloc.add(const LoadSettingsDashboard())).called(1);
    expect(find.text('today'), findsOneWidget);
  });
}
