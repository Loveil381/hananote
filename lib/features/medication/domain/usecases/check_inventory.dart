import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Inventory health information for a drug.
class InventoryStatus {
  /// Creates an [InventoryStatus].
  const InventoryStatus({
    required this.drug,
    required this.daysRemaining,
    required this.isLowStock,
  });

  /// Drug definition.
  final Drug drug;

  /// Remaining days until empty, if available.
  final int? daysRemaining;

  /// Whether stock is below the alert threshold.
  final bool isLowStock;
}

/// Checks inventory health across all drugs.
class CheckInventory {
  /// Creates a [CheckInventory] use case.
  CheckInventory(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<InventoryStatus>>> call() async {
    final drugsResult = await _repository.getAllDrugs();
    if (drugsResult.isLeft()) {
      return drugsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final statuses = <InventoryStatus>[];
    final drugs = drugsResult.getOrElse((_) => <Drug>[]);
    for (final drug in drugs) {
      final daysResult = await _repository.getDaysUntilEmpty(drug.id);
      if (daysResult.isLeft()) {
        return daysResult.fold(left, (_) => throw StateError('unreachable'));
      }

      final daysRemaining = daysResult.getOrElse((_) => null);
      statuses.add(
        InventoryStatus(
          drug: drug,
          daysRemaining: daysRemaining,
          isLowStock: daysRemaining != null && daysRemaining < 14,
        ),
      );
    }

    return right(statuses);
  }
}
