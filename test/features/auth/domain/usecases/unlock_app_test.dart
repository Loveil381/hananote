import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:hananote/features/auth/domain/usecases/unlock_app.dart';
import 'package:mocktail/mocktail.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository repository;
  late UnlockApp useCase;

  setUp(() {
    repository = _MockAuthRepository();
    useCase = UnlockApp(repository);
  });

  group('UnlockApp', () {
    test('returns false when PIN format is invalid', () async {
      final result = await useCase('123');

      expect(result.getOrElse((_) => true), isFalse);
      verifyNever(() => repository.verifyPassword(any()));
    });

    test('opens database when PIN is correct', () async {
      when(() => repository.verifyPassword('123456')).thenAnswer(
        (_) async => const Right(true),
      );
      when(() => repository.openDatabase()).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await useCase('123456');

      expect(result.getOrElse((_) => false), isTrue);
      verify(() => repository.verifyPassword('123456')).called(1);
      verify(() => repository.openDatabase()).called(1);
    });
  });
}
