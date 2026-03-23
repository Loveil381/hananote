import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Deletes a drug definition.
class DeleteDrug {
  /// Creates a [DeleteDrug] use case.
  DeleteDrug(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, void>> call(String id) => _repository.deleteDrug(id);
}
