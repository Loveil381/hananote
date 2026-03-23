import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/log_medication.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late LogMedication useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = LogMedication(repository);
  });

  group('LogMedication', () {
    test('adds the log and deducts inventory', () async {
      final log = buildLog();
      final inventory = buildInventory();
      final expectedInventory = inventory.copyWith(
        quantity: 28,
        updatedAt: log.timestamp,
      );

      when(() => repository.getInventoryForDrug(log.drugId)).thenAnswer(
        (_) async => right(inventory),
      );
      when(() => repository.addLog(log)).thenAnswer((_) async => right(log));
      when(() => repository.updateInventory(expectedInventory)).thenAnswer(
        (_) async => right(expectedInventory),
      );

      final result = await useCase(log);

      expect(result.getOrElse((_) => throw StateError('expected value')), log);
      verifyInOrder([
        () => repository.getInventoryForDrug(log.drugId),
        () => repository.addLog(log),
        () => repository.updateInventory(expectedInventory),
      ]);
    });

    test('returns validation failure when inventory would go negative',
        () async {
      final log = buildLog(dosageAmount: 10);
      final inventory = buildInventory(quantity: 5);
      when(() => repository.getInventoryForDrug(log.drugId)).thenAnswer(
        (_) async => right(inventory),
      );

      final result = await useCase(log);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(message: 'Inventory cannot go below zero.'),
      );
      verifyNever(() => repository.addLog(log));
    });

    test('returns validation failure when injection site is missing', () async {
      final log = buildLog(
        administrationRoute: AdministrationRoute.intramuscularInjection,
        dosageUnit: DosageUnit.ml,
      );

      final result = await useCase(log);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(
          message: 'Injection logs require an injection site.',
        ),
      );
    });
  });
}
