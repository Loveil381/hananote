import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:hananote/features/photo/domain/usecases/save_photo.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockPhotoRepository extends Mock implements PhotoRepository {}

class _MockPhotoCryptoService extends Mock implements PhotoCryptoService {}

void main() {
  late _MockPhotoRepository repository;
  late _MockPhotoCryptoService cryptoService;
  late SavePhoto useCase;
  late Uint8List imageBytes;
  late Uint8List thumbnailBytes;

  setUpAll(() {
    registerFallbackValue(buildPhotoEntry());
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    repository = _MockPhotoRepository();
    cryptoService = _MockPhotoCryptoService();
    useCase = SavePhoto(repository, cryptoService);
    imageBytes = buildTestImageBytes();
    thumbnailBytes = buildTestImageBytes(width: 200, height: 120);
  });

  test('saves photo metadata after encrypting both files', () async {
    when(
      () => cryptoService.generateThumbnail(imageBytes),
    ).thenAnswer((_) async => thumbnailBytes);
    when(() => cryptoService.encryptAndSave(imageBytes, any())).thenAnswer((
      invocation,
    ) async {
      final relativePath = invocation.positionalArguments[1] as String;
      return right('${r'C:\sandbox'}\\$relativePath');
    });
    when(
      () => cryptoService.encryptAndSave(thumbnailBytes, any()),
    ).thenAnswer((invocation) async {
      final relativePath = invocation.positionalArguments[1] as String;
      return right('${r'C:\sandbox'}\\$relativePath');
    });
    when(() => repository.save(any())).thenAnswer((invocation) async {
      return right(invocation.positionalArguments.first as PhotoEntry);
    });

    final result = await useCase(
      imageBytes: imageBytes,
      notes: 'front',
      date: DateTime(2026, 3, 27),
    );

    expect(result.isRight(), isTrue);
    final entry = result.getOrElse((_) => throw StateError('unreachable'));
    expect(entry.encryptedPath, startsWith('photos/'));
    expect(entry.encryptedPath, endsWith('.enc'));
    expect(entry.encryptedThumbPath, endsWith('_thumb.enc'));
    expect(entry.originalSizeBytes, imageBytes.lengthInBytes);
    verify(() => cryptoService.generateThumbnail(imageBytes)).called(1);
    verify(() => repository.save(any())).called(1);
  });

  test('propagates encryption failures', () async {
    when(
      () => cryptoService.generateThumbnail(imageBytes),
    ).thenAnswer((_) async => thumbnailBytes);
    when(
      () => cryptoService.encryptAndSave(imageBytes, any()),
    ).thenAnswer(
      (_) async => left(const Failure.crypto(message: 'encrypt failed')),
    );

    final result = await useCase(
      imageBytes: imageBytes,
      date: DateTime(2026, 3, 27),
    );

    expect(result.isLeft(), isTrue);
    expect(
      result.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.crypto(message: 'encrypt failed'),
    );
    verifyNever(() => repository.save(any()));
  });

  test('rolls back encrypted files when repository save fails', () async {
    when(
      () => cryptoService.generateThumbnail(imageBytes),
    ).thenAnswer((_) async => thumbnailBytes);
    when(
      () => cryptoService.encryptAndSave(imageBytes, any()),
    ).thenAnswer((_) async => right(r'C:\sandbox\photos\original.enc'));
    when(
      () => cryptoService.encryptAndSave(thumbnailBytes, any()),
    ).thenAnswer((_) async => right(r'C:\sandbox\photos\thumb.enc'));
    when(() => repository.save(any())).thenAnswer(
      (_) async => left(const Failure.database(message: 'save failed')),
    );
    when(
      () => cryptoService.deleteFiles(any()),
    ).thenAnswer((_) async => right(unit));

    final result = await useCase(
      imageBytes: imageBytes,
      date: DateTime(2026, 3, 27),
    );

    expect(result.isLeft(), isTrue);
    verify(() => cryptoService.deleteFiles(any())).called(1);
  });
}
