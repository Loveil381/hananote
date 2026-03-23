import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Query parameters for [GetMedicationLogs].
class GetMedicationLogsParams {
  /// Creates [GetMedicationLogsParams].
  const GetMedicationLogsParams({
    required this.drugId,
    this.from,
    this.to,
  });

  /// Target drug identifier.
  final String drugId;

  /// Inclusive range start.
  final DateTime? from;

  /// Inclusive range end.
  final DateTime? to;
}

/// Returns medication logs for a drug within a date range.
class GetMedicationLogs {
  /// Creates a [GetMedicationLogs] use case.
  GetMedicationLogs(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<MedicationLog>>> call(
    GetMedicationLogsParams params,
  ) {
    return _repository.getLogsForDrug(
      params.drugId,
      from: params.from,
      to: params.to,
    );
  }
}
