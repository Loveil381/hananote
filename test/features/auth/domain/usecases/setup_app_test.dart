import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/auth/domain/entities/auth_settings.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:hananote/features/auth/domain/usecases/setup_app.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repository;
  late SetupApp useCase;

  setUp(() {
    repository = _MockAuthRepository();
    useCase = SetupApp(repository);
  });

  group('SetupApp', () {
    test('validates PIN format before setup', () async {
      final result = await useCase(const SetupAppParams(pin: '12'));

      expect(result.isLeft(), isTrue);
      verifyNever(() => repository.setupPassword(any()));
    });

    test('sets up password, saves settings, and opens database', () async {
      const params = SetupAppParams(
        pin: '123456',
        biometricEnabled: true,
        appDisplayName: 'Notes',
        appIconKey: 'lotus',
        autoLockMinutes: 5,
        maxFailedAttempts: 3,
      );
      const expectedSettings = AuthSettings(
        isSetup: true,
        biometricEnabled: true,
        appDisplayName: 'Notes',
        appIconKey: 'lotus',
        autoLockMinutes: 5,
        maxFailedAttempts: 3,
      );

      when(() => repository.setupPassword(params.pin)).thenAnswer(
        (_) async => const Right(null),
      );
      when(() => repository.saveSettings(expectedSettings)).thenAnswer(
        (_) async => const Right(null),
      );
      when(() => repository.openDatabase()).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await useCase(params);

      expect(result.isRight(), isTrue);
      verifyInOrder([
        () => repository.setupPassword(params.pin),
        () => repository.saveSettings(expectedSettings),
        () => repository.openDatabase(),
      ]);
    });
  });
}
