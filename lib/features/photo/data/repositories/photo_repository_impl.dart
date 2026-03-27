import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/data/datasources/photo_local_data_source.dart';
import 'package:hananote/features/photo/data/models/photo_model.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation backed by local SQLite metadata storage.
@LazySingleton(as: PhotoRepository)
class PhotoRepositoryImpl implements PhotoRepository {
  /// Creates a [PhotoRepositoryImpl].
  PhotoRepositoryImpl(this._localDataSource);

  final PhotoLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, PhotoEntry>> save(PhotoEntry entry) {
    return _guard(() async {
      final model = PhotoModel.fromEntity(entry);
      await _localDataSource.save(model);
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<PhotoEntry>>> getAll() {
    return _guard(() async {
      final models = await _localDataSource.getAll();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, PhotoEntry?>> getLatest() {
    return _guard(() async {
      final model = await _localDataSource.getLatest();
      return model?.toEntity();
    });
  }

  @override
  Future<Either<Failure, Unit>> delete(String id) async {
    return _guard(() async {
      await _localDataSource.delete(id);
      return unit;
    });
  }

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return right(await action());
    } catch (error) {
      return left(Failure.database(message: error.toString()));
    }
  }
}
