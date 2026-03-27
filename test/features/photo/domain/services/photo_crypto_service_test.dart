import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/crypto/crypto_engine.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:image/image.dart' as img;
import 'package:mocktail/mocktail.dart';
import 'package:path/path.dart' as p;

import '../../fixtures.dart';

class _MockKeyManager extends Mock implements KeyManager {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/path_provider');

  late Directory tempDirectory;
  late CryptoEngine cryptoEngine;
  late _MockKeyManager keyManager;
  late PhotoCryptoService service;
  final goodKey = Uint8List.fromList(List<int>.generate(32, (index) => index));
  final wrongKey = Uint8List.fromList(
    List<int>.generate(32, (index) => 255 - index),
  );

  setUp(() async {
    tempDirectory = await Directory.systemTemp.createTemp('photo_crypto_test');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (methodCall) async {
      return tempDirectory.path;
    });

    cryptoEngine = CryptoEngine();
    keyManager = _MockKeyManager();
    service = PhotoCryptoService(cryptoEngine, keyManager);

    when(() => keyManager.getCurrentKey()).thenAnswer((_) async => goodKey);
  });

  tearDown(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);

    if (tempDirectory.existsSync()) {
      tempDirectory.deleteSync(recursive: true);
    }
  });

  test('encrypts, saves, loads, and decrypts a photo round-trip', () async {
    final originalBytes = buildTestImageBytes();

    final saveResult = await service.encryptAndSave(
      originalBytes,
      'photos/roundtrip.enc',
    );
    expect(saveResult.isRight(), isTrue);

    final loadResult = await service.loadAndDecrypt('photos/roundtrip.enc');

    expect(loadResult.isRight(), isTrue);
    expect(loadResult.getOrElse((_) => Uint8List(0)), originalBytes);
  });

  test('stores encrypted content instead of plaintext bytes', () async {
    final originalBytes = buildPlainBytes('plaintext-photo');

    await service.encryptAndSave(originalBytes, 'photos/encrypted.enc');

    final writtenBytes = await File(
      p.join(tempDirectory.path, 'photos', 'encrypted.enc'),
    ).readAsBytes();
    expect(writtenBytes, isNot(originalBytes));
    expect(writtenBytes, isNot(equals(originalBytes)));
  });

  test('returns crypto failure when decrypting with the wrong key', () async {
    final originalBytes = buildTestImageBytes();
    await service.encryptAndSave(originalBytes, 'photos/wrong-key.enc');
    when(() => keyManager.getCurrentKey()).thenAnswer((_) async => wrongKey);

    final loadResult = await service.loadAndDecrypt('photos/wrong-key.enc');

    expect(loadResult.isLeft(), isTrue);
    expect(
      loadResult.swap().getOrElse((_) => throw StateError('unreachable')),
      isA<CryptoFailure>(),
    );
  });

  test('returns storage failure after encrypted files are deleted', () async {
    final originalBytes = buildTestImageBytes();
    await service.encryptAndSave(originalBytes, 'photos/delete-me.enc');
    await service.deleteFiles(['photos/delete-me.enc']);

    final loadResult = await service.loadAndDecrypt('photos/delete-me.enc');

    expect(loadResult.isLeft(), isTrue);
    expect(
      loadResult.swap().getOrElse((_) => throw StateError('unreachable')),
      isA<StorageFailure>(),
    );
  });

  test('generateThumbnail caps the longest side to 200px', () async {
    final originalBytes = buildTestImageBytes(width: 1024, height: 768);

    final thumbnailBytes = await service.generateThumbnail(originalBytes);
    final decoded = img.decodeImage(thumbnailBytes);

    expect(decoded, isNotNull);
    expect(decoded!.width, lessThanOrEqualTo(200));
    expect(decoded.height, lessThanOrEqualTo(200));
  });

  test('handles empty byte input gracefully', () async {
    final saveResult = await service.encryptAndSave(Uint8List(0), 'photos/a');
    final thumbnailBytes = await service.generateThumbnail(Uint8List(0));

    expect(saveResult.isLeft(), isTrue);
    expect(
      saveResult.swap().getOrElse((_) => throw StateError('unreachable')),
      const Failure.validation(message: 'Photo bytes cannot be empty.'),
    );
    expect(thumbnailBytes, isEmpty);
  });
}
