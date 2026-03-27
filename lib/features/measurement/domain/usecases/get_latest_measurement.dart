import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns the latest measurement entry, if present.
@injectable
class GetLatestMeasurement {
  /// Creates a [GetLatestMeasurement] use case.
  GetLatestMeasurement(this._repository);

  final MeasurementRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, MeasurementEntry?>> call() {
    return _repository.getLatest();
  }
}
