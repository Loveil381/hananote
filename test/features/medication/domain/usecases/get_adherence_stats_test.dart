import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/get_adherence_stats.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late GetAdherenceStats useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = GetAdherenceStats(repository);
  });

  group('GetAdherenceStats', () {
    test('returns adherence for active drugs', () async {
      final drug = buildDrug();
      final inactiveDrug = buildDrug(id: 'drug-2', isActive: false);
      final params = GetAdherenceStatsParams(
        from: DateTime(2026, 3),
        to: DateTime(2026, 3, 31),
      );

      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([drug, inactiveDrug]));
      when(
        () => repository.getAdherenceRate(
          drug.id,
          from: params.from,
          to: params.to,
        ),
      ).thenAnswer((_) async => right(0.92));

      final result = await useCase(params);

      final stats = result.getOrElse((_) => []);
      expect(stats, hasLength(1));
      expect(stats.single.drug.id, drug.id);
      expect(stats.single.rate, 0.92);
    });

    test('returns failure when loading drugs fails', () async {
      const failure = Failure.database(message: 'adherence failed');
      final params = GetAdherenceStatsParams(
        from: DateTime(2026, 3),
        to: DateTime(2026, 3, 31),
      );
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => left(failure));

      final result = await useCase(params);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
