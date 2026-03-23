import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/delete_drug.dart';
import 'package:mocktail/mocktail.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late DeleteDrug useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = DeleteDrug(repository);
  });

  group('DeleteDrug', () {
    test('returns success when repository deletes the drug', () async {
      when(() => repository.deleteDrug('drug-1')).thenAnswer(
        (_) async => const Right<Failure, void>(null),
      );

      final result = await useCase('drug-1');

      expect(result.isRight(), isTrue);
      verify(() => repository.deleteDrug('drug-1')).called(1);
    });

    test('returns failure when repository fails', () async {
      const failure = Failure.database(message: 'delete failed');
      when(() => repository.deleteDrug('drug-1'))
          .thenAnswer((_) async => left(failure));

      final result = await useCase('drug-1');

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
