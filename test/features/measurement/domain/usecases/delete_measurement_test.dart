import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/measurement/domain/usecases/delete_measurement.dart';
import 'package:mocktail/mocktail.dart';

class _MockMeasurementRepository extends Mock
    implements MeasurementRepository {}

void main() {
  late _MockMeasurementRepository repository;
  late DeleteMeasurement useCase;

  setUp(() {
    repository = _MockMeasurementRepository();
    useCase = DeleteMeasurement(repository);
  });

  test('deletes a measurement entry by id', () async {
    when(() => repository.delete('measurement-1'))
        .thenAnswer((_) async => right(unit));

    final result = await useCase('measurement-1');

    expect(result.getOrElse((_) => unit), unit);
    verify(() => repository.delete('measurement-1')).called(1);
  });

  test('forwards repository failures', () async {
    when(() => repository.delete('measurement-1')).thenAnswer(
      (_) async => left(const Failure.storage(message: 'delete failed')),
    );

    final result = await useCase('measurement-1');

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.storage(message: 'delete failed'),
    );
  });
}
