import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/update_drug.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late UpdateDrug useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = UpdateDrug(repository);
  });

  group('UpdateDrug', () {
    test('returns updated drug on success', () async {
      final drug = buildDrug(name: 'Updated');
      when(() => repository.updateDrug(drug))
          .thenAnswer((_) async => right(drug));

      final result = await useCase(drug);

      expect(result.getOrElse((_) => throw StateError('expected value')), drug);
      verify(() => repository.updateDrug(drug)).called(1);
    });

    test('returns failure on repository error', () async {
      final drug = buildDrug();
      const failure = Failure.database(message: 'update failed');
      when(() => repository.updateDrug(drug))
          .thenAnswer((_) async => left(failure));

      final result = await useCase(drug);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
