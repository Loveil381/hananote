import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns the complete measurement history in reverse chronological order.
@injectable
class GetMeasurementHistory {
  /// Creates a [GetMeasurementHistory] use case.
  GetMeasurementHistory(this._repository);

  final MeasurementRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<MeasurementEntry>>> call() async {
    final result = await _repository.getAll();
    return result.map(
      (entries) => [...entries]..sort((a, b) => b.date.compareTo(a.date)),
    );
  }
}
