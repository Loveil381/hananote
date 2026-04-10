import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:injectable/injectable.dart';

/// Validates and persists updates to an existing blood test report.
@injectable
class UpdateBloodTestReport {
  /// Creates an [UpdateBloodTestReport] use case.
  UpdateBloodTestReport(this._repository);

  final BloodTestRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, void>> call(BloodTestReport report) {
    if (report.readings.isEmpty) {
      return Future.value(
        left(
          const Failure.validation(
            message: 'At least one reading is required',
          ),
        ),
      );
    }

    return _repository.updateReport(report);
  }
}
