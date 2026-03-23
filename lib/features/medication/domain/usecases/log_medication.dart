import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Records a medication event and deducts stock when inventory exists.
class LogMedication {
  /// Creates a [LogMedication] use case.
  LogMedication(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, MedicationLog>> call(MedicationLog log) async {
    final validation = _validateLog(log);
    if (validation != null) {
      return left(validation);
    }

    final inventoryResult = await _repository.getInventoryForDrug(log.drugId);
    if (inventoryResult.isLeft()) {
      return inventoryResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final inventory = inventoryResult.getOrElse((_) => null);
    DrugInventory? updatedInventory;
    if (inventory != null) {
      if (inventory.unit != log.dosageUnit) {
        return left(
          const Failure.validation(
            message: 'Inventory unit does not match the logged dose unit.',
          ),
        );
      }

      final quantityToDeduct = _quantityToDeduct(log);
      final remainingQuantity = inventory.quantity - quantityToDeduct;
      if (remainingQuantity < 0) {
        return left(
          const Failure.validation(
            message: 'Inventory cannot go below zero.',
          ),
        );
      }

      updatedInventory = inventory.copyWith(
        quantity: remainingQuantity,
        updatedAt: log.timestamp,
      );
    }

    final addLogResult = await _repository.addLog(log);
    if (addLogResult.isLeft()) {
      return addLogResult;
    }

    final persistedLog = addLogResult.getOrElse((_) => log);
    if (updatedInventory == null || log.status == LogStatus.skipped) {
      return right(persistedLog);
    }

    final updateInventoryResult =
        await _repository.updateInventory(updatedInventory);
    if (updateInventoryResult.isLeft()) {
      return updateInventoryResult.fold(
        left,
        (_) => throw StateError('unreachable'),
      );
    }

    return right(persistedLog);
  }

  Failure? _validateLog(MedicationLog log) {
    if (log.status != LogStatus.skipped && log.dosageAmount <= 0) {
      return const Failure.validation(
        message: 'Taken doses must be greater than zero.',
      );
    }

    if (log.administrationRoute.isInjection &&
        log.injectionSite == null &&
        log.status != LogStatus.skipped) {
      return const Failure.validation(
        message: 'Injection logs require an injection site.',
      );
    }

    if (!log.administrationRoute.isInjection && log.injectionSite != null) {
      return const Failure.validation(
        message: 'Injection site can only be set for injections.',
      );
    }

    if (log.administrationRoute.isPatch &&
        log.patchSite == null &&
        log.status != LogStatus.skipped) {
      return const Failure.validation(
        message: 'Patch logs require a patch site.',
      );
    }

    if (!log.administrationRoute.isPatch &&
        (log.patchSite != null || log.patchCount != null)) {
      return const Failure.validation(
        message: 'Patch fields can only be set for patch administration.',
      );
    }

    if (log.administrationRoute.isGel &&
        log.gelPumps != null &&
        log.gelPumps! <= 0) {
      return const Failure.validation(
        message: 'Gel pump count must be positive.',
      );
    }

    if (!log.administrationRoute.isGel && log.gelPumps != null) {
      return const Failure.validation(
        message: 'Gel pump count can only be set for gel administration.',
      );
    }

    if (!log.administrationRoute.isPatch &&
        !log.administrationRoute.isGel &&
        log.skinReaction != null) {
      return const Failure.validation(
        message:
            'Skin reaction can only be set for patch or gel administration.',
      );
    }

    return null;
  }

  double _quantityToDeduct(MedicationLog log) {
    if (log.status == LogStatus.skipped) {
      return 0;
    }

    if (log.administrationRoute.isPatch && log.patchCount != null) {
      return log.patchCount!.toDouble();
    }

    if (log.administrationRoute.isGel &&
        log.dosageUnit == DosageUnit.pump &&
        log.gelPumps != null) {
      return log.gelPumps!.toDouble();
    }

    return log.dosageAmount;
  }
}
