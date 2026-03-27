import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

/// Encrypts and persists a new photo plus its thumbnail.
@injectable
class SavePhoto {
  /// Creates a [SavePhoto] use case.
  SavePhoto(this._photoRepository, this._photoCryptoService);

  final PhotoRepository _photoRepository;
  final PhotoCryptoService _photoCryptoService;
  final Uuid _uuid = const Uuid();

  /// Saves a new encrypted photo record.
  Future<Either<Failure, PhotoEntry>> call({
    required Uint8List imageBytes,
    required DateTime date,
    String? notes,
  }) async {
    if (imageBytes.isEmpty) {
      return left(
        const Failure.validation(message: 'Photo bytes cannot be empty.'),
      );
    }

    try {
      final id = _uuid.v4();
      final originalPath = 'photos/$id.enc';
      final thumbPath = 'photos/${id}_thumb.enc';
      final thumbnailBytes = await _photoCryptoService.generateThumbnail(
        imageBytes,
      );

      final originalResult = await _photoCryptoService.encryptAndSave(
        imageBytes,
        originalPath,
      );
      if (originalResult.isLeft()) {
        return left(
          originalResult.swap().getOrElse(
            (_) => throw StateError('unreachable'),
          ),
        );
      }

      final thumbResult = await _photoCryptoService.encryptAndSave(
        thumbnailBytes,
        thumbPath,
      );
      if (thumbResult.isLeft()) {
        await _photoCryptoService.deleteFiles([originalPath]);
        return left(
          thumbResult.swap().getOrElse(
            (_) => throw StateError('unreachable'),
          ),
        );
      }

      final now = DateTime.now();
      final entry = PhotoEntry(
        id: id,
        date: date,
        encryptedPath: originalPath,
        encryptedThumbPath: thumbPath,
        originalSizeBytes: imageBytes.lengthInBytes,
        notes: notes,
        createdAt: now,
      );

      final saveResult = await _photoRepository.save(entry);
      if (saveResult.isLeft()) {
        await _photoCryptoService.deleteFiles([originalPath, thumbPath]);
      }

      return saveResult;
    } catch (error) {
      return left(Failure.storage(message: error.toString()));
    }
  }
}
