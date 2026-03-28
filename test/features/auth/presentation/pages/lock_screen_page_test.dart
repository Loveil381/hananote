import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:hananote/features/auth/presentation/pages/lock_screen_page.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  late _MockAuthCubit authCubit;

  setUp(() {
    authCubit = _MockAuthCubit();
    when(() => authCubit.state).thenReturn(
      const AuthState.locked(biometricAvailable: false),
    );
    when(() => authCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => authCubit.unlock(any())).thenAnswer((_) async {});
    when(() => authCubit.unlockBiometric()).thenAnswer((_) async {});
  });

  testWidgets('submits the PIN automatically after the sixth digit', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AuthCubit>.value(
          value: authCubit,
          child: const LockScreenPage(biometricAvailable: false),
        ),
      ),
    );

    for (final digit in ['1', '2', '3', '4', '5', '6']) {
      await tester.tap(find.text(digit));
      await tester.pump();
    }

    await tester.pump();

    verify(() => authCubit.unlock('123456')).called(1);
  });
}
