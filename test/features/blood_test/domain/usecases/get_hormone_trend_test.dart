// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_hormone_trend.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockBloodTestRepository extends Mock implements BloodTestRepository {}

void main() {
  late _MockBloodTestRepository repository;
  late GetHormoneTrend useCase;

  setUp(() {
    repository = _MockBloodTestRepository();
    useCase = GetHormoneTrend(repository);
  });

  group('GetHormoneTrend', () {
    test('returns readings ordered by test date for the requested range',
        () async {
      final from = DateTime(2026, 1, 1);
      final to = DateTime(2026, 3, 31);
      final readings = [
        buildReading(
          id: 'reading-older',
          reportId: 'report-older',
          value: 120,
        ),
        buildReading(id: 'reading-newer', reportId: 'report-newer', value: 180),
      ];
      when(
        () => repository.getReadingsByType(
          HormoneType.estradiol,
          from: from,
          to: to,
        ),
      ).thenAnswer((_) async => right(readings));

      final result = await useCase(
        HormoneType.estradiol,
        from: from,
        to: to,
      );

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), readings);
      verify(
        () => repository.getReadingsByType(
          HormoneType.estradiol,
          from: from,
          to: to,
        ),
      ).called(1);
    });

    test('returns an empty list when no readings match the requested range',
        () async {
      final from = DateTime(2026, 1, 1);
      final to = DateTime(2026, 3, 31);
      when(
        () => repository.getReadingsByType(
          HormoneType.testosterone,
          from: from,
          to: to,
        ),
      ).thenAnswer((_) async => right(<HormoneReading>[]));

      final result = await useCase(
        HormoneType.testosterone,
        from: from,
        to: to,
      );

      expect(result.isRight(), isTrue);
      expect(
          result.getOrElse((_) => throw StateError('expected list')), isEmpty);
      verify(
        () => repository.getReadingsByType(
          HormoneType.testosterone,
          from: from,
          to: to,
        ),
      ).called(1);
    });

    test('returns failure when repository fails', () async {
      final from = DateTime(2026, 1, 1);
      final to = DateTime(2026, 3, 31);
      const failure = Failure.database(message: 'db');
      when(
        () => repository.getReadingsByType(
          HormoneType.estradiol,
          from: from,
          to: to,
        ),
      ).thenAnswer((_) async => left(failure));

      final result = await useCase(
        HormoneType.estradiol,
        from: from,
        to: to,
      );

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        failure,
      );
      verify(
        () => repository.getReadingsByType(
          HormoneType.estradiol,
          from: from,
          to: to,
        ),
      ).called(1);
    });
  });
}
