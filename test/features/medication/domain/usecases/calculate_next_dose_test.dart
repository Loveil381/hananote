import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/calculate_next_dose.dart';
import 'package:mocktail/mocktail.dart';

import 'fixtures.dart';

class MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late MockMedicationRepository repository;
  late CalculateNextDose useCase;

  setUp(() {
    repository = MockMedicationRepository();
    useCase = CalculateNextDose(repository);
  });

  group('CalculateNextDose', () {
    test('calculates next time for a daily schedule', () async {
      final schedule = buildSchedule(
        frequency: const MedicationFrequency.daily(timesPerDay: 2),
        scheduleTimes: const [
          TimeOfDay(hour: 8, minute: 0),
          TimeOfDay(hour: 20, minute: 0),
        ],
      );
      final latestLog = buildLog(timestamp: DateTime(2026, 3, 23, 8, 5));
      when(
        () => repository.getLogsForDrug(
          schedule.drugId,
          from: schedule.startDate,
          to: schedule.endDate,
        ),
      ).thenAnswer((_) async => right([latestLog]));

      final result = await useCase(
        schedule,
        referenceTime: DateTime(2026, 3, 23, 10),
      );

      expect(result.getOrElse((_) => null), DateTime(2026, 3, 23, 20));
    });

    test('calculates next time for an every-N-days schedule', () async {
      final schedule = buildSchedule(
        administrationRoute: AdministrationRoute.transdermalPatch,
        dosageUnit: DosageUnit.patch,
        frequency: const MedicationFrequency.everyNDays(days: 7),
        scheduleTimes: const [],
        startDate: DateTime(2026, 3, 1, 9),
      );
      when(
        () => repository.getLogsForDrug(
          schedule.drugId,
          from: schedule.startDate,
          to: schedule.endDate,
        ),
      ).thenAnswer((_) async => right([]));

      final result = await useCase(
        schedule,
        referenceTime: DateTime(2026, 3, 10, 10),
      );

      expect(result.getOrElse((_) => null), DateTime(2026, 3, 15, 9));
    });

    test('calculates next time for a weekly schedule', () async {
      final schedule = buildSchedule(
        frequency: const MedicationFrequency.weekly(dayOfWeek: DateTime.friday),
        scheduleTimes: const [TimeOfDay(hour: 18, minute: 30)],
        startDate: DateTime(2026, 3, 1, 18, 30),
      );
      when(
        () => repository.getLogsForDrug(
          schedule.drugId,
          from: schedule.startDate,
          to: schedule.endDate,
        ),
      ).thenAnswer((_) async => right([]));

      final result = await useCase(
        schedule,
        referenceTime: DateTime(2026, 3, 23, 12),
      );

      expect(result.getOrElse((_) => null), DateTime(2026, 3, 27, 18, 30));
    });

    test('returns null for a custom schedule', () async {
      final schedule = buildSchedule(
        frequency: const MedicationFrequency.custom(description: 'as needed'),
      );
      when(
        () => repository.getLogsForDrug(
          schedule.drugId,
          from: schedule.startDate,
          to: schedule.endDate,
        ),
      ).thenAnswer((_) async => right([]));

      final result = await useCase(
        schedule,
        referenceTime: DateTime(2026, 3, 23, 12),
      );

      expect(result.getOrElse((_) => DateTime(2000)), isNull);
    });

    test('returns failure when repository fails', () async {
      final schedule = buildSchedule();
      const failure = Failure.database(message: 'query failed');
      when(
        () => repository.getLogsForDrug(
          schedule.drugId,
          from: schedule.startDate,
          to: schedule.endDate,
        ),
      ).thenAnswer((_) async => left(failure));

      final result = await useCase(schedule);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
    });
  });
}
