import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/data/datasources/blood_test_local_datasource.dart';
import 'package:hananote/features/blood_test/data/models/blood_test_report_model.dart';
import 'package:hananote/features/blood_test/data/repositories/blood_test_repository_impl.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockBloodTestLocalDataSource extends Mock
    implements BloodTestLocalDataSource {}

void main() {
  late _MockBloodTestLocalDataSource localDataSource;
  late BloodTestRepositoryImpl repository;

  setUp(() {
    localDataSource = _MockBloodTestLocalDataSource();
    repository = BloodTestRepositoryImpl(localDataSource);
  });

  group('BloodTestRepositoryImpl', () {
    test('maps getAllReports to domain entities', () async {
      final models = [buildReportModel()];
      when(() => localDataSource.getAllReports())
          .thenAnswer((_) async => models);

      final result = await repository.getAllReports();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), [models.first.toDomain()]);
    });

    test('wraps datasource exceptions as database failures', () async {
      when(() => localDataSource.getAllReports())
          .thenThrow(Exception('db failed'));

      final result = await repository.getAllReports();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const TypeMatcher<DatabaseFailure>(),
      );
    });

    test('adds reports using model mapping', () async {
      final report = buildReport();
      when(
        () => localDataSource
            .insertReport(BloodTestReportModel.fromDomain(report)),
      ).thenAnswer((_) async {});

      final result = await repository.addReport(report);

      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        report,
      );
      verify(
        () => localDataSource
            .insertReport(BloodTestReportModel.fromDomain(report)),
      ).called(1);
    });

    test('returns the latest hormone reading when present', () async {
      final reading = buildReadingModel(value: 170);
      when(() => localDataSource.getLatestReading(HormoneType.estradiol))
          .thenAnswer((_) async => reading);

      final result = await repository.getLatestReading(HormoneType.estradiol);

      expect(
        result.getOrElse((_) => null),
        reading.toDomain(),
      );
    });
  });
}
