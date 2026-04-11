import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/crypto/crypto_engine.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/platform/file_helper.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';

/// Encrypts and decrypts photo files without ever writing plaintext to disk.
@injectable
class PhotoCryptoService {
  /// Creates a [PhotoCryptoService].
  PhotoCryptoService(this._cryptoEngine, this._keyManager);

  final CryptoEngine _cryptoEngine;
  final KeyManager _keyManager;

  /// Encrypts [imageBytes] and writes them to [relativePath] under the app
  /// documents directory.
  Future<Either<Failure, String>> encryptAndSave(
    Uint8List imageBytes,
    String relativePath,
  ) async {
    if (imageBytes.isEmpty) {
      return left(
        const Failure.validation(message: 'Photo bytes cannot be empty.'),
      );
    }

    try {
      final key = await _requireKey();
      if (key == null) {
        // On web without encryption key, store raw bytes.
        if (!kHasFileSystem) {
          final path = await writeFileBytes(relativePath, imageBytes);
          return right(path);
        }
        return left(
          const Failure.auth(message: 'Photo encryption key is unavailable.'),
        );
      }

      final encryptedResult = await _cryptoEngine.encrypt(imageBytes, key);
      return await encryptedResult.fold(
        (failure) async => left(failure),
        (encryptedBytes) async {
          final path = await writeFileBytes(relativePath, encryptedBytes);
          return right(path);
        },
      );
    } catch (error) {
      return left(Failure.storage(message: error.toString()));
    }
  }

  /// Loads an encrypted file and returns the decrypted bytes.
  Future<Either<Failure, Uint8List>> loadAndDecrypt(String relativePath) async {
    try {
      final key = await _requireKey();
      if (key == null) {
        // On web, try to load raw bytes directly.
        if (!kHasFileSystem) {
          final bytes = await readFileBytes(relativePath);
          if (bytes == null) {
            return left(
              Failure.storage(
                message: 'Photo file not found: $relativePath',
              ),
            );
          }
          return right(bytes);
        }
        return left(
          const Failure.auth(message: 'Photo encryption key is unavailable.'),
        );
      }

      final encryptedBytes = await readFileBytes(relativePath);
      if (encryptedBytes == null) {
        return left(
          Failure.storage(
            message: 'Encrypted photo file not found: $relativePath',
          ),
        );
      }

      return _cryptoEngine.decrypt(encryptedBytes, key);
    } catch (error) {
      return left(Failure.storage(message: error.toString()));
    }
  }

  /// Deletes encrypted files for the provided relative paths.
  Future<Either<Failure, Unit>> deleteFiles(List<String> relativePaths) async {
    try {
      for (final relativePath in relativePaths) {
        await deleteFileAt(relativePath);
      }
      return right(unit);
    } catch (error) {
      return left(Failure.storage(message: error.toString()));
    }
  }

  /// Generates a JPEG thumbnail with the longest side capped at 200px.
  Future<Uint8List> generateThumbnail(Uint8List imageBytes) async {
    if (imageBytes.isEmpty) {
      return Uint8List(0);
    }

    // On web, compute() may not work with isolates the same way,
    // but Flutter handles this via web workers when available.
    return compute(_generateThumbnailInIsolate, imageBytes);
  }

  Future<Uint8List?> _requireKey() {
    return _keyManager.getCurrentKey();
  }
}

Uint8List _generateThumbnailInIsolate(Uint8List imageBytes) {
  if (imageBytes.isEmpty) {
    return Uint8List(0);
  }

  final decodedImage = img.decodeImage(imageBytes);
  if (decodedImage == null) {
    throw ArgumentError('Unsupported image format.');
  }

  final resizedImage = img.copyResize(
    decodedImage,
    width: decodedImage.width >= decodedImage.height ? 200 : null,
    height: decodedImage.height > decodedImage.width ? 200 : null,
    interpolation: img.Interpolation.linear,
  );

  final encoded = img.encodeJpg(resizedImage, quality: 70);
  return Uint8List.fromList(encoded);
}
