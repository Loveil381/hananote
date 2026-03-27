import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/usecases/run_pk_simulation.dart';
import 'package:mocktail/mocktail.dart';

class _MockMedicationRepository extends Mock implements MedicationRepository {}

void main() {
  late _MockMedicationRepository repository;
  late RunPkSimulation useCase;

  setUp(() {
    repository = _MockMedicationRepository();
    useCase = RunPkSimulation(repository);
  });

  Drug buildDrug({
    required String id,
    required DrugCategory category,
    required AdministrationRoute route,
    bool isActive = true,
    String name = 'Estradiol Valerate',
    String genericName = 'estradiol valerate',
  }) {
    return Drug(
      id: id,
      name: name,
      genericName: genericName,
      category: category,
      administrationRoute: route,
      defaultDosageUnit: DosageUnit.mg,
      isActive: isActive,
      createdAt: DateTime(2026, 3, 27),
    );
  }

  MedicationSchedule buildSchedule({
    required String drugId,
    double dosageAmount = 5,
    AdministrationRoute route = AdministrationRoute.intramuscularInjection,
  }) {
    return MedicationSchedule(
      id: 'schedule-$drugId',
      drugId: drugId,
      dosageAmount: dosageAmount,
      dosageUnit: DosageUnit.mg,
      frequency: const MedicationFrequency.everyNDays(days: 5),
      administrationRoute: route,
      startDate: DateTime(2026, 3),
      isActive: true,
      intervalDays: 5,
    );
  }

  group('RunPkSimulation', () {
    test('uses override regimen directly', () async {
      final regimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 5,
        startDate: DateTime(2026, 3),
      );

      final result = await useCase(overrideRegimen: regimen);

      expect(result.isRight(), isTrue);
      final simulation =
          result.getOrElse((_) => throw StateError('expected simulation'));
      expect(simulation.regimen, regimen);
      verifyNever(() => repository.getAllDrugs());
    });

    test('infers regimen from an active estrogen drug', () async {
      final drug = buildDrug(
        id: 'drug-1',
        category: DrugCategory.estrogen,
        route: AdministrationRoute.intramuscularInjection,
      );
      final schedule = buildSchedule(drugId: drug.id);
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([drug]));
      when(() => repository.getScheduleForDrug(drug.id))
          .thenAnswer((_) async => right(schedule));

      final result = await useCase();

      expect(result.isRight(), isTrue);
      final simulation =
          result.getOrElse((_) => throw StateError('expected simulation'));
      expect(simulation.regimen.esterType, EsterType.estradiolValerate);
      expect(simulation.regimen.intervalDays, 5);
      expect(simulation.regimen.doseAmount, 5);
    });

    test('returns validation failure when no estrogen drugs are active',
        () async {
      final drug = buildDrug(
        id: 'drug-1',
        category: DrugCategory.antiAndrogen,
        route: AdministrationRoute.oral,
      );
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([drug]));

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(
          message: 'No active estrogen medication found for PK simulation.',
        ),
      );
    });

    test('returns repository failure when loading drugs fails', () async {
      const failure = Failure.database(message: 'load failed');
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
