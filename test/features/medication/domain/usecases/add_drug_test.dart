import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/add_drug.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late AddDrug useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = AddDrug(repository);
  });

  group('AddDrug', () {
    test('trims and persists a valid drug', () async {
      final drug = buildDrug(name: '  Estradiol  ', genericName: '  EV  ');
      final expected = drug.copyWith(
        name: 'Estradiol',
        genericName: 'EV',
        notes: 'daily dose',
      );
      when(() => repository.addDrug(expected))
          .thenAnswer((_) async => right(expected));

      final result = await useCase(drug);

      expect(result.isRight(), isTrue);
      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        expected,
      );
      verify(() => repository.addDrug(expected)).called(1);
    });

    test('returns validation failure when name is empty', () async {
      final drug = buildDrug(name: '   ');

      final result = await useCase(drug);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(message: 'Drug name cannot be empty.'),
      );
      verifyNever(() => repository.addDrug(drug));
    });

    test('returns validation failure when unit does not match route', () async {
      final drug = buildDrug(
        administrationRoute: AdministrationRoute.transdermalPatch,
        defaultDosageUnit: DosageUnit.ml,
      );

      final result = await useCase(drug);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const TypeMatcher<ValidationFailure>(),
      );
      verifyNever(() => repository.addDrug(drug));
    });
  });
}
