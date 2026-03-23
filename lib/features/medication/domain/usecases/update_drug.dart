import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Updates an existing drug definition.
class UpdateDrug {
  /// Creates an [UpdateDrug] use case.
  UpdateDrug(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, Drug>> call(Drug drug) => _repository.updateDrug(drug);
}
