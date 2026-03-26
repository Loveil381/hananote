import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/blood_test/domain/usecases/add_blood_test_report.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockBloodTestRepository extends Mock implements BloodTestRepository {}

void main() {
  late _MockBloodTestRepository repository;
  late AddBloodTestReport useCase;

  setUp(() {
    repository = _MockBloodTestRepository();
    useCase = AddBloodTestReport(repository);
  });

  group('AddBloodTestReport', () {
    test('returns validation failure when readings are empty', () async {
      final report = buildReport(readings: <HormoneReading>[]);

      final result = await useCase(report);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(
          message: 'Blood test report must contain at least one reading.',
        ),
      );
    });

    test('stores the report when validation succeeds', () async {
      final report = buildReport();
      when(() => repository.addReport(report)).thenAnswer(
        (_) async => right(report),
      );

      final result = await useCase(report);

      expect(
        result.getOrElse((_) => throw StateError('expected report')),
        report,
      );
      verify(() => repository.addReport(report)).called(1);
    });
  });
}
