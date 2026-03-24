import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/data/datasources/medication_local_datasource.dart';
import 'package:hananote/features/medication/data/models/drug_model.dart';
import 'package:hananote/features/medication/data/repositories/medication_repository_impl.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';

class _MockMedicationLocalDataSource extends Mock
    implements MedicationLocalDataSource {}

void main() {
  late _MockMedicationLocalDataSource localDataSource;
  late MedicationRepositoryImpl repository;

  setUp(() {
    localDataSource = _MockMedicationLocalDataSource();
    repository = MedicationRepositoryImpl(localDataSource);
  });

  group('MedicationRepositoryImpl', () {
    test('maps getAllDrugs to domain entities', () async {
      final models = [buildDrugModel()];
      when(() => localDataSource.getAllDrugs()).thenAnswer((_) async => models);

      final result = await repository.getAllDrugs();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), [models.first.toDomain()]);
    });

    test('wraps datasource exceptions as failures', () async {
      when(() => localDataSource.getAllDrugs())
          .thenThrow(Exception('db failed'));

      final result = await repository.getAllDrugs();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const TypeMatcher<DatabaseFailure>(),
      );
    });

    test('adds drugs using model mapping', () async {
      final drug = buildDrug();
      when(
        () => localDataSource.insertDrug(DrugModel.fromDomain(drug)),
      ).thenAnswer((_) async {});

      final result = await repository.addDrug(drug);

      expect(result.getOrElse((_) => throw StateError('expected value')), drug);
      verify(() => localDataSource.insertDrug(DrugModel.fromDomain(drug)))
          .called(1);
    });

    test('calculates adherence rate from expected and actual doses', () async {
      final scheduleModel = buildScheduleModel();
      final takenLog = buildLogModel();
      final lateLog = buildLogModel(
        timestamp: DateTime(2026, 3, 23, 20, 5),
        status: LogStatus.late,
      );
      when(
        () => localDataSource.getScheduleForDrug('drug-1'),
      ).thenAnswer((_) async => scheduleModel);
      when(
        () => localDataSource.getLogsForDrug(
          'drug-1',
          from: DateTime(2026, 3, 23),
          to: DateTime(2026, 3, 23, 23, 59),
        ),
      ).thenAnswer((_) async => [takenLog, lateLog]);

      final result = await repository.getAdherenceRate(
        'drug-1',
        from: DateTime(2026, 3, 23),
        to: DateTime(2026, 3, 23, 23, 59),
      );

      expect(result.getOrElse((_) => 0), 1.0);
    });

    test('calculates days until empty from inventory and schedule', () async {
      when(
        () => localDataSource.getInventoryForDrug('drug-1'),
      ).thenAnswer((_) async => buildInventoryModel(quantity: 20));
      when(
        () => localDataSource.getScheduleForDrug('drug-1'),
      ).thenAnswer((_) async => buildScheduleModel());

      final result = await repository.getDaysUntilEmpty('drug-1');

      expect(result.getOrElse((_) => null), 5);
    });
  });
}
