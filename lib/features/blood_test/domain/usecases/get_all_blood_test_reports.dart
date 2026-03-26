import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns all stored blood test reports.
@injectable
class GetAllBloodTestReports {
  /// Creates a [GetAllBloodTestReports] use case.
  GetAllBloodTestReports(this._repository);

  final BloodTestRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<BloodTestReport>>> call() {
    return _repository.getAllReports();
  }
}
