import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:hananote/features/photo/domain/usecases/delete_photo.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoRepository extends Mock implements PhotoRepository {}

class _MockPhotoCryptoService extends Mock implements PhotoCryptoService {}

void main() {
  late _MockPhotoRepository repository;
  late _MockPhotoCryptoService cryptoService;
  late DeletePhoto useCase;

  setUp(() {
    repository = _MockPhotoRepository();
    cryptoService = _MockPhotoCryptoService();
    useCase = DeletePhoto(repository, cryptoService);
  });

  test('deletes encrypted files and then removes the metadata row', () async {
    final entry = buildPhotoEntry();
    when(
      () => cryptoService.deleteFiles([
        entry.encryptedPath,
        entry.encryptedThumbPath,
      ]),
    ).thenAnswer((_) async => right(unit));
    when(
      () => repository.delete(entry.id),
    ).thenAnswer((_) async => right(unit));

    final result = await useCase(entry);

    expect(result.getOrElse((_) => unit), unit);
    verify(() => repository.delete(entry.id)).called(1);
  });

  test('stops when encrypted file deletion fails', () async {
    final entry = buildPhotoEntry();
    when(
      () => cryptoService.deleteFiles([
        entry.encryptedPath,
        entry.encryptedThumbPath,
      ]),
    ).thenAnswer(
      (_) async => left(const Failure.storage(message: 'delete files failed')),
    );

    final result = await useCase(entry);

    expect(result.isLeft(), isTrue);
    verifyNever(() => repository.delete(any()));
  });
}
