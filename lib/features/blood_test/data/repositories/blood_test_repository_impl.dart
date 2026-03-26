import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/data/datasources/blood_test_local_datasource.dart';
import 'package:hananote/features/blood_test/data/models/blood_test_report_model.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation backed by a local SQLCipher datasource.
@LazySingleton(as: BloodTestRepository)
class BloodTestRepositoryImpl implements BloodTestRepository {
  /// Creates a [BloodTestRepositoryImpl].
  BloodTestRepositoryImpl(this._localDataSource);

  final BloodTestLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<BloodTestReport>>> getAllReports() {
    return _guard(() async {
      final models = await _localDataSource.getAllReports();
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, BloodTestReport>> getReportById(String id) {
    return _guard(() async {
      final model = await _localDataSource.getReportById(id);
      if (model == null) {
        throw StateError('Blood test report not found: $id');
      }
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, BloodTestReport>> addReport(BloodTestReport report) {
    return _guard(() async {
      final model = BloodTestReportModel.fromDomain(report);
      await _localDataSource.insertReport(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteReport(String id) {
    return _guard(() => _localDataSource.deleteReport(id));
  }

  @override
  Future<Either<Failure, List<HormoneReading>>> getReadingsByType(
    HormoneType type, {
    DateTime? from,
    DateTime? to,
  }) {
    return _guard(() async {
      final models = await _localDataSource.getReadingsByType(
        type,
        from: from,
        to: to,
      );
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, HormoneReading?>> getLatestReading(HormoneType type) {
    return _guard(() async {
      final model = await _localDataSource.getLatestReading(type);
      return model?.toDomain();
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
