import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:injectable/injectable.dart';

/// Deletes a measurement entry by id.
@injectable
class DeleteMeasurement {
  /// Creates a [DeleteMeasurement] use case.
  DeleteMeasurement(this._repository);

  final MeasurementRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, Unit>> call(String id) {
    return _repository.delete(id);
  }
}
