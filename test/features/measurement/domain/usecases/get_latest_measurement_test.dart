import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/measurement/domain/usecases/get_latest_measurement.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockMeasurementRepository extends Mock
    implements MeasurementRepository {}

void main() {
  late _MockMeasurementRepository repository;
  late GetLatestMeasurement useCase;

  setUp(() {
    repository = _MockMeasurementRepository();
    useCase = GetLatestMeasurement(repository);
  });

  test('returns the latest measurement entry', () async {
    final entry = buildMeasurementEntry();
    when(() => repository.getLatest()).thenAnswer((_) async => right(entry));

    final result = await useCase();

    expect(result.getOrElse((_) => null), entry);
    verify(() => repository.getLatest()).called(1);
  });

  test('forwards repository failures', () async {
    when(() => repository.getLatest()).thenAnswer(
      (_) async => left(const Failure.storage(message: 'latest failed')),
    );

    final result = await useCase();

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.storage(message: 'latest failed'),
    );
  });
}
