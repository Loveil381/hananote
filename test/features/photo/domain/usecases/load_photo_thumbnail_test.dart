import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:hananote/features/photo/domain/usecases/load_photo_thumbnail.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoCryptoService extends Mock implements PhotoCryptoService {}

void main() {
  late _MockPhotoCryptoService cryptoService;
  late LoadPhotoThumbnail useCase;

  setUp(() {
    cryptoService = _MockPhotoCryptoService();
    useCase = LoadPhotoThumbnail(cryptoService);
  });

  test('loads the decrypted thumbnail bytes', () async {
    final entry = buildPhotoEntry();
    final bytes = Uint8List.fromList([1, 2, 3]);
    when(
      () => cryptoService.loadAndDecrypt(entry.encryptedThumbPath),
    ).thenAnswer((_) async => right(bytes));

    final result = await useCase(entry);

    expect(result.getOrElse((_) => Uint8List(0)), bytes);
  });

  test('forwards thumbnail decryption failures', () async {
    final entry = buildPhotoEntry();
    when(
      () => cryptoService.loadAndDecrypt(entry.encryptedThumbPath),
    ).thenAnswer(
      (_) async => left(const Failure.storage(message: 'thumb failed')),
    );

    final result = await useCase(entry);

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.storage(message: 'thumb failed'),
    );
  });
}
