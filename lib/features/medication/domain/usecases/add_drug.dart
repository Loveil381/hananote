import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Validates and stores a new drug definition.
@injectable
class AddDrug {
  /// Creates an [AddDrug] use case.
  AddDrug(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, Drug>> call(Drug drug) {
    final trimmedName = drug.name.trim();
    if (trimmedName.isEmpty) {
      return Future.value(
        left(const Failure.validation(message: 'Drug name cannot be empty.')),
      );
    }

    if (!drug.administrationRoute.supportedUnits
        .contains(drug.defaultDosageUnit)) {
      return Future.value(
        left(
          Failure.validation(
            message: _buildUnitMismatchMessage(
              route: drug.administrationRoute,
              unit: drug.defaultDosageUnit,
            ),
          ),
        ),
      );
    }

    return _repository.addDrug(
      drug.copyWith(
        name: trimmedName,
        genericName: drug.genericName.trim(),
        notes: drug.notes?.trim(),
      ),
    );
  }

  String _buildUnitMismatchMessage({
    required AdministrationRoute route,
    required DosageUnit unit,
  }) {
    return 'Dosage unit $unit is not supported for route $route.';
  }
}
