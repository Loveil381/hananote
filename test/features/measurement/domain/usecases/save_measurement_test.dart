import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/measurement/domain/usecases/save_measurement.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockMeasurementRepository extends Mock
    implements MeasurementRepository {}

void main() {
  late _MockMeasurementRepository repository;
  late SaveMeasurement useCase;

  setUpAll(() {
    registerFallbackValue(buildMeasurementEntry());
  });

  setUp(() {
    repository = _MockMeasurementRepository();
    useCase = SaveMeasurement(repository);
  });

  test('saves a valid measurement entry', () async {
    final entry = buildMeasurementEntry();
    when(() => repository.save(entry)).thenAnswer((_) async => right(entry));

    final result = await useCase(entry);

    expect(result.getOrElse((_) => throw StateError('unreachable')), entry);
    verify(() => repository.save(entry)).called(1);
  });

  test('returns validation failure when all measurement values are empty',
      () async {
    final entry = buildMeasurementEntry(
      bust: null,
      underbust: null,
      waist: null,
      hip: null,
      thigh: null,
      bicep: null,
      shoulder: null,
      neck: null,
      weight: null,
    );

    final result = await useCase(entry);

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.validation(
        message: 'Please enter at least one measurement value.',
      ),
    );
    verifyNever(() => repository.save(any()));
  });
}
