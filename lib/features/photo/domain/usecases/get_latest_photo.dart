import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

/// Loads the latest photo entry, if available.
@injectable
class GetLatestPhoto {
  /// Creates a [GetLatestPhoto] use case.
  GetLatestPhoto(this._photoRepository);

  final PhotoRepository _photoRepository;

  /// Executes the use case.
  Future<Either<Failure, PhotoEntry?>> call() {
    return _photoRepository.getLatest();
  }
}
