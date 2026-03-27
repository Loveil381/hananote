// Release prep note: Freezed/json_serializable require these file-level
// suppressions for generated annotations and constructor ordering.
// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/data/models/medication_model_converters.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'drug_inventory_model.freezed.dart';
part 'drug_inventory_model.g.dart';

/// Data-layer representation of a [DrugInventory].
@freezed
class DrugInventoryModel with _$DrugInventoryModel {
  /// Creates a [DrugInventoryModel].
  const DrugInventoryModel._();

  /// Creates a [DrugInventoryModel].
  const factory DrugInventoryModel({
    required String id,
    @JsonKey(name: 'drug_id') required String drugId,
    required double quantity,
    required String unit,
    @JsonKey(name: 'purchase_date') required String purchaseDate,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'expiration_date') String? expirationDate,
    @JsonKey(name: 'batch_number') String? batchNumber,
    String? notes,
  }) = _DrugInventoryModel;

  /// Creates a [DrugInventoryModel] from JSON.
  factory DrugInventoryModel.fromJson(Map<String, dynamic> json) =>
      _$DrugInventoryModelFromJson(json);

  /// Creates a [DrugInventoryModel] from a domain entity.
  factory DrugInventoryModel.fromDomain(DrugInventory entity) {
    return DrugInventoryModel(
      id: entity.id,
      drugId: entity.drugId,
      quantity: entity.quantity,
      unit: entity.unit.name,
      purchaseDate: MedicationModelConverters.dateTimeToString(
        entity.purchaseDate,
      ),
      updatedAt: MedicationModelConverters.dateTimeToString(entity.updatedAt),
      expirationDate: entity.expirationDate == null
          ? null
          : MedicationModelConverters.dateTimeToString(entity.expirationDate!),
      batchNumber: entity.batchNumber,
      notes: entity.notes,
    );
  }

  /// Converts this model to a domain entity.
  DrugInventory toDomain() {
    return DrugInventory(
      id: id,
      drugId: drugId,
      quantity: quantity,
      unit: DosageUnit.values.byName(unit),
      purchaseDate: MedicationModelConverters.stringToDateTime(purchaseDate),
      updatedAt: MedicationModelConverters.stringToDateTime(updatedAt),
      expirationDate: expirationDate == null
          ? null
          : MedicationModelConverters.stringToDateTime(expirationDate!),
      batchNumber: batchNumber,
      notes: notes,
    );
  }
}
