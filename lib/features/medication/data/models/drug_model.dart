// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/data/models/medication_model_converters.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'drug_model.freezed.dart';
part 'drug_model.g.dart';

/// Data-layer representation of a [Drug].
@freezed
class DrugModel with _$DrugModel {
  /// Creates a [DrugModel].
  const DrugModel._();

  /// Creates a [DrugModel].
  const factory DrugModel({
    required String id,
    required String name,
    @JsonKey(name: 'generic_name') required String genericName,
    required String category,
    @JsonKey(name: 'administration_route') required String administrationRoute,
    @JsonKey(name: 'default_dosage_unit') required String defaultDosageUnit,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    String? notes,
  }) = _DrugModel;

  /// Creates a [DrugModel] from JSON.
  factory DrugModel.fromJson(Map<String, dynamic> json) =>
      _$DrugModelFromJson(json);

  /// Creates a [DrugModel] from a domain entity.
  factory DrugModel.fromDomain(Drug entity) {
    return DrugModel(
      id: entity.id,
      name: entity.name,
      genericName: entity.genericName,
      category: entity.category.name,
      administrationRoute: entity.administrationRoute.name,
      defaultDosageUnit: entity.defaultDosageUnit.name,
      isActive: MedicationModelConverters.boolToInt(value: entity.isActive),
      createdAt: MedicationModelConverters.dateTimeToString(entity.createdAt),
      notes: entity.notes,
    );
  }

  /// Converts this model to a domain entity.
  Drug toDomain() {
    return Drug(
      id: id,
      name: name,
      genericName: genericName,
      category: DrugCategory.values.byName(category),
      administrationRoute: AdministrationRoute.values.byName(
        administrationRoute,
      ),
      defaultDosageUnit: DosageUnit.values.byName(defaultDosageUnit),
      isActive: MedicationModelConverters.intToBool(isActive),
      createdAt: MedicationModelConverters.stringToDateTime(createdAt),
      notes: notes,
    );
  }
}
