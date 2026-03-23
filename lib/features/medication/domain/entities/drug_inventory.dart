import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'drug_inventory.freezed.dart';

/// Remaining stock information for a drug.
@freezed
class DrugInventory with _$DrugInventory {
  /// Creates a [DrugInventory].
  @Assert('quantity >= 0', 'quantity must be zero or positive')
  const factory DrugInventory({
    required String id,
    required String drugId,
    required double quantity,
    required DosageUnit unit,
    required DateTime purchaseDate,
    required DateTime updatedAt,
    DateTime? expirationDate,
    String? batchNumber,
    String? notes,
  }) = _DrugInventory;
}
