import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/usecases/get_photo_history.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoRepository extends Mock implements PhotoRepository {}

void main() {
  late _MockPhotoRepository repository;
  late GetPhotoHistory useCase;

  setUp(() {
    repository = _MockPhotoRepository();
    useCase = GetPhotoHistory(repository);
  });

  test('returns photo history sorted by date descending', () async {
    final older = buildPhotoEntry(id: '1', date: DateTime(2026, 3, 20));
    final newer = buildPhotoEntry(id: '2', date: DateTime(2026, 3, 27));
    when(
      () => repository.getAll(),
    ).thenAnswer((_) async => right([older, newer]));

    final result = await useCase();

    expect(result.getOrElse((_) => []), [newer, older]);
  });

  test('forwards repository failures', () async {
    when(() => repository.getAll()).thenAnswer(
      (_) async => left(const Failure.database(message: 'history failed')),
    );

    final result = await useCase();

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.database(message: 'history failed'),
    );
  });
}
