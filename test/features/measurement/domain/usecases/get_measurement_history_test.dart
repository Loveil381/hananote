import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/measurement/domain/usecases/get_measurement_history.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockMeasurementRepository extends Mock
    implements MeasurementRepository {}

void main() {
  late _MockMeasurementRepository repository;
  late GetMeasurementHistory useCase;

  setUp(() {
    repository = _MockMeasurementRepository();
    useCase = GetMeasurementHistory(repository);
  });

  test('returns entries sorted by date descending', () async {
    final older = buildMeasurementEntry(
      id: 'older',
      date: DateTime(2026, 3, 25),
    );
    final newer = buildMeasurementEntry(
      id: 'newer',
      date: DateTime(2026, 3, 27),
    );
    when(() => repository.getAll())
        .thenAnswer((_) async => right([older, newer]));

    final result = await useCase();

    expect(
      result.getOrElse((_) => []),
      [newer, older],
    );
    verify(() => repository.getAll()).called(1);
  });

  test('forwards repository failures', () async {
    when(() => repository.getAll()).thenAnswer(
      (_) async => left(const Failure.storage(message: 'history failed')),
    );

    final result = await useCase();

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.storage(message: 'history failed'),
    );
  });
}
