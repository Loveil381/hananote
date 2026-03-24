import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/usecases/check_inventory.dart';

part 'inventory_state.freezed.dart';

/// States for `InventoryCubit`.
@freezed
sealed class InventoryState with _$InventoryState {
  /// Not yet loaded.
  const factory InventoryState.initial() = InventoryInitial;

  /// Fetching inventory data.
  const factory InventoryState.loading() = InventoryLoading;

  /// Inventory loaded successfully.
  const factory InventoryState.loaded({
    required List<InventoryStatus> statuses,
    required int lowStockCount,
  }) = InventoryLoaded;

  /// Failed to load or update inventory.
  const factory InventoryState.error({
    required String message,
  }) = InventoryError;
}
