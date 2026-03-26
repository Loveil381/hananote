import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns hormone trend data ordered by report test date.
@injectable
class GetHormoneTrend {
  /// Creates a [GetHormoneTrend] use case.
  GetHormoneTrend(this._repository);

  final BloodTestRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<HormoneReading>>> call(
    HormoneType type, {
    required DateTime from,
    required DateTime to,
  }) {
    return _repository.getReadingsByType(type, from: from, to: to);
  }
}
