import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:injectable/injectable.dart';

/// Loads and decrypts a photo thumbnail.
@injectable
class LoadPhotoThumbnail {
  /// Creates a [LoadPhotoThumbnail] use case.
  LoadPhotoThumbnail(this._photoCryptoService);

  final PhotoCryptoService _photoCryptoService;

  /// Executes the use case.
  Future<Either<Failure, Uint8List>> call(PhotoEntry entry) {
    return _photoCryptoService.loadAndDecrypt(entry.encryptedThumbPath);
  }
}
