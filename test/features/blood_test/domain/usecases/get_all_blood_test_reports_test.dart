import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_all_blood_test_reports.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockBloodTestRepository extends Mock implements BloodTestRepository {}

void main() {
  late _MockBloodTestRepository repository;
  late GetAllBloodTestReports useCase;

  setUp(() {
    repository = _MockBloodTestRepository();
    useCase = GetAllBloodTestReports(repository);
  });

  group('GetAllBloodTestReports', () {
    test('returns reports when repository succeeds', () async {
      final reports = [buildReport()];
      when(() => repository.getAllReports())
          .thenAnswer((_) async => right(reports));

      final result = await useCase();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), reports);
      verify(() => repository.getAllReports()).called(1);
    });

    test('returns failure when repository fails', () async {
      const failure = Failure.database(message: 'db');
      when(() => repository.getAllReports())
          .thenAnswer((_) async => left(failure));

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
      verify(() => repository.getAllReports()).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
