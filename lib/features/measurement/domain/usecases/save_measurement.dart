import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:injectable/injectable.dart';

/// Validates and saves a body measurement entry.
@injectable
class SaveMeasurement {
  /// Creates a [SaveMeasurement] use case.
  SaveMeasurement(this._repository);

  final MeasurementRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, MeasurementEntry>> call(MeasurementEntry entry) {
    if (!entry.hasAnyMeasurement) {
      return Future.value(
        left(
          const Failure.validation(
            message: 'Please enter at least one measurement value.',
          ),
        ),
      );
    }

    return _repository.save(entry);
  }
}
