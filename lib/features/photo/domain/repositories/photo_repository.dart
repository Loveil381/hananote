import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';

/// Abstraction for photo metadata persistence.
abstract class PhotoRepository {
  /// Saves a photo entry.
  Future<Either<Failure, PhotoEntry>> save(PhotoEntry entry);

  /// Returns all photo entries.
  Future<Either<Failure, List<PhotoEntry>>> getAll();

  /// Returns the latest photo entry, if present.
  Future<Either<Failure, PhotoEntry?>> getLatest();

  /// Deletes the photo entry with [id].
  Future<Either<Failure, Unit>> delete(String id);
}
