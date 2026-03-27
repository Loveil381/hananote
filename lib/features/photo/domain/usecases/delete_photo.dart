import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:hananote/features/photo/domain/services/photo_crypto_service.dart';
import 'package:injectable/injectable.dart';

/// Deletes encrypted photo files and then removes the metadata record.
@injectable
class DeletePhoto {
  /// Creates a [DeletePhoto] use case.
  DeletePhoto(this._photoRepository, this._photoCryptoService);

  final PhotoRepository _photoRepository;
  final PhotoCryptoService _photoCryptoService;

  /// Executes the use case.
  Future<Either<Failure, Unit>> call(PhotoEntry entry) async {
    final fileDeletionResult = await _photoCryptoService.deleteFiles([
      entry.encryptedPath,
      entry.encryptedThumbPath,
    ]);
    if (fileDeletionResult.isLeft()) {
      return fileDeletionResult;
    }

    return _photoRepository.delete(entry.id);
  }
}
