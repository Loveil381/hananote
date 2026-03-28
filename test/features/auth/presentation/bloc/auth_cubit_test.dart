import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/auth/domain/entities/auth_settings.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:hananote/features/auth/domain/usecases/setup_app.dart';
import 'package:hananote/features/auth/domain/usecases/unlock_app.dart';
import 'package:hananote/features/auth/domain/usecases/wipe_data.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

class _MockSetupApp extends Mock implements SetupApp {}

class _MockUnlockApp extends Mock implements UnlockApp {}

class _MockWipeData extends Mock implements WipeData {}

void main() {
  late _MockAuthRepository repository;
  late _MockSetupApp setupApp;
  late _MockUnlockApp unlockApp;
  late _MockWipeData wipeData;

  const setupRequiredSettings = AuthSettings(
    isSetup: false,
    biometricEnabled: false,
    appDisplayName: 'HanaNote',
    appIconKey: 'default',
    autoLockMinutes: 0,
    maxFailedAttempts: 0,
  );
  const lockedSettings = AuthSettings(
    isSetup: true,
    biometricEnabled: true,
    appDisplayName: 'HanaNote',
    appIconKey: 'default',
    autoLockMinutes: 0,
    maxFailedAttempts: 2,
  );

  setUp(() {
    repository = _MockAuthRepository();
    setupApp = _MockSetupApp();
    unlockApp = _MockUnlockApp();
    wipeData = _MockWipeData();
  });

  setUpAll(() {
    registerFallbackValue(const SetupAppParams(pin: '000000'));
  });

  AuthCubit buildCubit() =>
      AuthCubit(repository, setupApp, unlockApp, wipeData);

  blocTest<AuthCubit, AuthState>(
    'emits needsSetup when app is not configured',
    build: () {
      when(() => repository.getSettings()).thenAnswer(
        (_) async => const Right(setupRequiredSettings),
      );
      return buildCubit();
    },
    act: (cubit) => cubit.checkAuthStatus(),
    expect: () => const [AuthState.needsSetup()],
  );

  blocTest<AuthCubit, AuthState>(
    'sets up PIN and unlocks on success',
    build: () {
      when(() => setupApp(any())).thenAnswer((_) async => const Right(null));
      when(() => repository.getSettings()).thenAnswer(
        (_) async => const Right(
          AuthSettings(
            isSetup: true,
            biometricEnabled: true,
            appDisplayName: 'HanaNote',
            appIconKey: 'default',
            autoLockMinutes: 0,
            maxFailedAttempts: 0,
          ),
        ),
      );
      return buildCubit();
    },
    act: (cubit) => cubit.setupPin('123456', '123456', biometricEnabled: true),
    expect: () => const [AuthState.unlocking(), AuthState.unlocked()],
  );

  blocTest<AuthCubit, AuthState>(
    'emits locked state then error fallback on invalid PIN',
    build: () {
      when(() => repository.getSettings()).thenAnswer(
        (_) async => const Right(lockedSettings),
      );
      when(() => repository.isBiometricAvailable()).thenAnswer(
        (_) async => const Right(true),
      );
      when(() => unlockApp('000000'))
          .thenAnswer((_) async => const Right(false));
      return buildCubit();
    },
    act: (cubit) async {
      await cubit.checkAuthStatus();
      await cubit.unlock('000000');
    },
    expect: () => const [
      AuthState.locked(biometricAvailable: true),
      AuthState.unlocking(),
      AuthState.error(message: '\u5BC6\u7801\u9519\u8BEF'),
      AuthState.locked(biometricAvailable: true),
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'wipes data successfully',
    build: () {
      when(() => wipeData()).thenAnswer((_) async => const Right(null));
      return buildCubit();
    },
    act: (cubit) => cubit.wipeData(),
    expect: () => const [AuthState.wiped()],
  );
}
