import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/usecases/get_latest_photo.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoRepository extends Mock implements PhotoRepository {}

void main() {
  late _MockPhotoRepository repository;
  late GetLatestPhoto useCase;

  setUp(() {
    repository = _MockPhotoRepository();
    useCase = GetLatestPhoto(repository);
  });

  test('returns the latest photo entry', () async {
    final entry = buildPhotoEntry();
    when(() => repository.getLatest()).thenAnswer((_) async => right(entry));

    final result = await useCase();

    expect(result.getOrElse((_) => null), entry);
  });

  test('forwards repository failures', () async {
    when(() => repository.getLatest()).thenAnswer(
      (_) async => left(const Failure.database(message: 'latest failed')),
    );

    final result = await useCase();

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.database(message: 'latest failed'),
    );
  });
}
