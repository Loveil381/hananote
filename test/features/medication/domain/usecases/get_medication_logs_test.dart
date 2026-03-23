import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/get_medication_logs.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late GetMedicationLogs useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = GetMedicationLogs(repository);
  });

  group('GetMedicationLogs', () {
    test('returns logs in the requested range', () async {
      final from = DateTime(2026, 3);
      final to = DateTime(2026, 3, 31);
      final params = GetMedicationLogsParams(
        drugId: 'drug-1',
        from: from,
        to: to,
      );
      final logs = [buildLog()];

      when(
        () => repository.getLogsForDrug('drug-1', from: from, to: to),
      ).thenAnswer((_) async => right(logs));

      final result = await useCase(params);

      expect(result.getOrElse((_) => []), logs);
      verify(() => repository.getLogsForDrug('drug-1', from: from, to: to))
          .called(1);
    });

    test('returns failure when repository fails', () async {
      const params = GetMedicationLogsParams(drugId: 'drug-1');
      const failure = Failure.database(message: 'query failed');
      when(
        () => repository.getLogsForDrug('drug-1'),
      ).thenAnswer((_) async => left(failure));

      final result = await useCase(params);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
