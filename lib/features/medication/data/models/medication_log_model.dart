// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/data/models/medication_model_converters.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';

part 'medication_log_model.freezed.dart';
part 'medication_log_model.g.dart';

/// Data-layer representation of a [MedicationLog].
@freezed
class MedicationLogModel with _$MedicationLogModel {
  /// Creates a [MedicationLogModel].
  const MedicationLogModel._();

  /// Creates a [MedicationLogModel].
  const factory MedicationLogModel({
    required String id,
    @JsonKey(name: 'schedule_id') required String scheduleId,
    @JsonKey(name: 'drug_id') required String drugId,
    required String timestamp,
    @JsonKey(name: 'dosage_amount') required double dosageAmount,
    @JsonKey(name: 'dosage_unit') required String dosageUnit,
    @JsonKey(name: 'administration_route') required String administrationRoute,
    required String status,
    @JsonKey(name: 'injection_site') String? injectionSite,
    @JsonKey(name: 'patch_site') String? patchSite,
    @JsonKey(name: 'patch_count') int? patchCount,
    @JsonKey(name: 'gel_pumps') int? gelPumps,
    @JsonKey(name: 'skin_reaction') String? skinReaction,
    String? notes,
  }) = _MedicationLogModel;

  /// Creates a [MedicationLogModel] from JSON.
  factory MedicationLogModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationLogModelFromJson(json);

  /// Creates a [MedicationLogModel] from a domain entity.
  factory MedicationLogModel.fromDomain(MedicationLog entity) {
    return MedicationLogModel(
      id: entity.id,
      scheduleId: entity.scheduleId,
      drugId: entity.drugId,
      timestamp: MedicationModelConverters.dateTimeToString(entity.timestamp),
      dosageAmount: entity.dosageAmount,
      dosageUnit: entity.dosageUnit.name,
      administrationRoute: entity.administrationRoute.name,
      status: entity.status.name,
      injectionSite: entity.injectionSite?.name,
      patchSite: entity.patchSite?.name,
      patchCount: entity.patchCount,
      gelPumps: entity.gelPumps,
      skinReaction: entity.skinReaction?.name,
      notes: entity.notes,
    );
  }

  /// Converts this model to a domain entity.
  MedicationLog toDomain() {
    return MedicationLog(
      id: id,
      scheduleId: scheduleId,
      drugId: drugId,
      timestamp: MedicationModelConverters.stringToDateTime(timestamp),
      dosageAmount: dosageAmount,
      dosageUnit: DosageUnit.values.byName(dosageUnit),
      administrationRoute: AdministrationRoute.values.byName(
        administrationRoute,
      ),
      status: LogStatus.values.byName(status),
      injectionSite: injectionSite == null
          ? null
          : InjectionSite.values.byName(injectionSite!),
      patchSite: patchSite == null ? null : PatchSite.values.byName(patchSite!),
      patchCount: patchCount,
      gelPumps: gelPumps,
      skinReaction: skinReaction == null
          ? null
          : SkinReaction.values.byName(skinReaction!),
      notes: notes,
    );
  }
}
