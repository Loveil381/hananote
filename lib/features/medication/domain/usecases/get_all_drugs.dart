import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns all known drugs.
@injectable
class GetAllDrugs {
  /// Creates a [GetAllDrugs] use case.
  GetAllDrugs(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<Drug>>> call() => _repository.getAllDrugs();
}
