import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:injectable/injectable.dart';

/// Validates and stores a new blood test report.
@injectable
class AddBloodTestReport {
  /// Creates an [AddBloodTestReport] use case.
  AddBloodTestReport(this._repository);

  final BloodTestRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, BloodTestReport>> call(BloodTestReport report) {
    if (report.readings.isEmpty) {
      return Future.value(
        left(
          const Failure.validation(
            message: 'Blood test report must contain at least one reading.',
          ),
        ),
      );
    }

    return _repository.addReport(report);
  }
}
