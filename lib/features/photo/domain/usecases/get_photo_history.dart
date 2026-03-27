import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

/// Loads the full photo history ordered by date descending.
@injectable
class GetPhotoHistory {
  /// Creates a [GetPhotoHistory] use case.
  GetPhotoHistory(this._photoRepository);

  final PhotoRepository _photoRepository;

  /// Executes the use case.
  Future<Either<Failure, List<PhotoEntry>>> call() async {
    final result = await _photoRepository.getAll();
    return result.map(
      (entries) => [...entries]..sort((a, b) => b.date.compareTo(a.date)),
    );
  }
}
