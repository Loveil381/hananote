import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/check_inventory.dart';
import 'package:hananote/features/medication/presentation/bloc/inventory_state.dart';

/// Manages medication inventory state.
///
/// Provides [loadInventory] and [updateStock].
/// The [lowStockCount] in the loaded state drives any alert badges in the UI.
class InventoryCubit extends Cubit<InventoryState> {
  /// Creates an [InventoryCubit].
  InventoryCubit(this._checkInventory, this._repository)
      : super(const InventoryState.initial());

  final CheckInventory _checkInventory;
  final MedicationRepository _repository;

  /// Loads inventory health for all drugs.
  Future<void> loadInventory() async {
    emit(const InventoryState.loading());
    final result = await _checkInventory();
    result.fold(
      (failure) => emit(InventoryState.error(message: failureMessage(failure))),
      (statuses) => emit(
        InventoryState.loaded(
          statuses: statuses,
          lowStockCount: statuses.where((s) => s.isLowStock).length,
        ),
      ),
    );
  }

  /// Updates stock quantity for [drugId] to [newQuantity] and reloads.
  Future<void> updateStock(String drugId, double newQuantity) async {
    final inventoryResult = await _repository.getInventoryForDrug(drugId);
    await inventoryResult.fold(
      (failure) async =>
          emit(InventoryState.error(message: failureMessage(failure))),
      (existing) async {
        final inventory = existing ??
            DrugInventory(
              id: drugId,
              drugId: drugId,
              quantity: newQuantity,
              unit: DosageUnit.mg,
              purchaseDate: DateTime.now(),
              updatedAt: DateTime.now(),
            );
        final updated = inventory.copyWith(
          quantity: newQuantity,
          updatedAt: DateTime.now(),
        );
        final updateResult = await _repository.updateInventory(updated);
        await updateResult.fold(
          (failure) async =>
              emit(InventoryState.error(message: failureMessage(failure))),
          (_) async => loadInventory(),
        );
      },
    );
  }
}
