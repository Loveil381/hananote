import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:hananote/features/photo/domain/usecases/load_photo_full.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoCryptoService extends Mock implements PhotoCryptoService {}

void main() {
  late _MockPhotoCryptoService cryptoService;
  late LoadPhotoFull useCase;

  setUp(() {
    cryptoService = _MockPhotoCryptoService();
    useCase = LoadPhotoFull(cryptoService);
  });

  test('loads the decrypted full photo bytes', () async {
    final entry = buildPhotoEntry();
    final bytes = Uint8List.fromList([9, 8, 7]);
    when(
      () => cryptoService.loadAndDecrypt(entry.encryptedPath),
    ).thenAnswer((_) async => right(bytes));

    final result = await useCase(entry);

    expect(result.getOrElse((_) => Uint8List(0)), bytes);
  });

  test('forwards full photo decryption failures', () async {
    final entry = buildPhotoEntry();
    when(
      () => cryptoService.loadAndDecrypt(entry.encryptedPath),
    ).thenAnswer(
      (_) async => left(const Failure.storage(message: 'full failed')),
    );

    final result = await useCase(entry);

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.storage(message: 'full failed'),
    );
  });
}
