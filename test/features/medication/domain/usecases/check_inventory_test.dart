import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/check_inventory.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late CheckInventory useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = CheckInventory(repository);
  });

  group('CheckInventory', () {
    test('marks stock below 14 days as low and 14 days as normal', () async {
      final lowDrug = buildDrug(id: 'drug-low');
      final safeDrug = buildDrug(id: 'drug-safe', name: 'Safe');

      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([lowDrug, safeDrug]));
      when(() => repository.getDaysUntilEmpty('drug-low'))
          .thenAnswer((_) async => right(13));
      when(() => repository.getDaysUntilEmpty('drug-safe'))
          .thenAnswer((_) async => right(14));

      final result = await useCase();

      final statuses = result.getOrElse((_) => []);
      expect(statuses, hasLength(2));
      expect(statuses.first.isLowStock, isTrue);
      expect(statuses.first.daysRemaining, 13);
      expect(statuses.last.isLowStock, isFalse);
      expect(statuses.last.daysRemaining, 14);
    });

    test('returns failure when repository fails', () async {
      const failure = Failure.database(message: 'inventory failed');
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
