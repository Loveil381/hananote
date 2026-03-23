import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/get_all_drugs.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late GetAllDrugs useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = GetAllDrugs(repository);
  });

  group('GetAllDrugs', () {
    test('returns drugs when repository succeeds', () async {
      final drugs = [buildDrug()];
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right(drugs));

      final result = await useCase();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), drugs);
      verify(() => repository.getAllDrugs()).called(1);
    });

    test('returns failure when repository fails', () async {
      const failure = Failure.database(message: 'db');
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => left(failure));

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
