import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late GetTodaySchedule useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = GetTodaySchedule(repository);
  });

  group('GetTodaySchedule', () {
    test('returns due items and completion state for today', () async {
      final date = DateTime(2026, 3, 23, 10);
      final dayStart = DateTime(2026, 3, 23);
      final dayEnd = DateTime(2026, 3, 23, 23, 59, 59, 999, 999);
      final drug = buildDrug();
      final schedule = buildSchedule(
        startDate: DateTime(2026, 3, 1, 8),
        frequency: const MedicationFrequency.daily(timesPerDay: 1),
      );
      final log = buildLog(timestamp: DateTime(2026, 3, 23, 8, 5));

      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([drug]));
      when(() => repository.getScheduleForDrug(drug.id))
          .thenAnswer((_) async => right(schedule));
      when(
        () => repository.getLogsForDrug(drug.id, from: dayStart, to: dayEnd),
      ).thenAnswer((_) async => right([log]));

      final result = await useCase(date: date);

      final items = result.getOrElse((_) => []);
      expect(items, hasLength(1));
      expect(items.first.isCompleted, isTrue);
      expect(items.first.completedCount, 1);
    });

    test('returns failure when loading drugs fails', () async {
      const failure = Failure.database(message: 'load failed');
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => left(failure));

      final result = await useCase(date: DateTime(2026, 3, 23));

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
