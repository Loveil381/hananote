import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/data/datasources/measurement_local_data_source.dart';
import 'package:hananote/features/measurement/data/models/measurement_model.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation backed by a local SQLCipher datasource.
@LazySingleton(as: MeasurementRepository)
class MeasurementRepositoryImpl implements MeasurementRepository {
  /// Creates a [MeasurementRepositoryImpl].
  MeasurementRepositoryImpl(this._localDataSource);

  final MeasurementLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, MeasurementEntry>> save(MeasurementEntry entry) {
    return _guard(() async {
      final model = MeasurementModel.fromEntity(entry);
      await _localDataSource.save(model);
      return model.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<MeasurementEntry>>> getAll() {
    return _guard(() async {
      final models = await _localDataSource.getAll();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<Either<Failure, MeasurementEntry?>> getLatest() {
    return _guard(() async {
      final model = await _localDataSource.getLatest();
      return model?.toEntity();
    });
  }

  @override
  Future<Either<Failure, List<MeasurementEntry>>> getByDateRange(
    DateTime from,
    DateTime to,
  ) {
    return _guard(() async {
      final models = await _localDataSource.getByDateRange(from, to);
      return models.map((model) => model.toEntity()).toList();
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
