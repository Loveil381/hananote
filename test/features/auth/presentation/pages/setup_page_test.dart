import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:hananote/features/auth/presentation/pages/setup_page.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  late _MockAuthCubit authCubit;

  setUp(() {
    authCubit = _MockAuthCubit();
    when(() => authCubit.state).thenReturn(const AuthState.needsSetup());
    when(() => authCubit.stream).thenAnswer((_) => const Stream.empty());
    when(
      () => authCubit.setupPin(
        any(),
        any(),
        biometricEnabled: any(named: 'biometricEnabled'),
      ),
    ).thenAnswer((_) async {});
  });

  testWidgets('shows inline error instead of submitting mismatched pins', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('zh'),
        home: BlocProvider<AuthCubit>.value(
          value: authCubit,
          child: const SetupPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '123456');
    await tester.enterText(find.byType(TextField).at(1), '654321');
    await tester.tap(find.text('保存'));
    await tester.pump();

    expect(find.text('两次输入的密码不一致'), findsOneWidget);
    verifyNever(
      () => authCubit.setupPin(
        any(),
        any(),
        biometricEnabled: any(named: 'biometricEnabled'),
      ),
    );
  });
}
