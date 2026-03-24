// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/data/models/medication_model_converters.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

part 'medication_schedule_model.freezed.dart';
part 'medication_schedule_model.g.dart';

/// Data-layer representation of a [MedicationSchedule].
@freezed
class MedicationScheduleModel with _$MedicationScheduleModel {
  /// Creates a [MedicationScheduleModel].
  const MedicationScheduleModel._();

  /// Creates a [MedicationScheduleModel].
  const factory MedicationScheduleModel({
    required String id,
    @JsonKey(name: 'drug_id') required String drugId,
    @JsonKey(name: 'dosage_amount') required double dosageAmount,
    @JsonKey(name: 'dosage_unit') required String dosageUnit,
    @JsonKey(name: 'frequency_type') required String frequencyType,
    @JsonKey(name: 'frequency_value') required String frequencyValue,
    @JsonKey(name: 'administration_route') required String administrationRoute,
    @JsonKey(name: 'schedule_times') required String scheduleTimes,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'interval_days') int? intervalDays,
    @JsonKey(name: 'end_date') String? endDate,
    String? notes,
  }) = _MedicationScheduleModel;

  /// Creates a [MedicationScheduleModel] from JSON.
  factory MedicationScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$MedicationScheduleModelFromJson(json);

  /// Creates a [MedicationScheduleModel] from a domain entity.
  factory MedicationScheduleModel.fromDomain(MedicationSchedule entity) {
    final serializedFrequency = MedicationModelConverters.frequencyToDatabase(
      entity.frequency,
    );

    return MedicationScheduleModel(
      id: entity.id,
      drugId: entity.drugId,
      dosageAmount: entity.dosageAmount,
      dosageUnit: entity.dosageUnit.name,
      frequencyType: serializedFrequency.type,
      frequencyValue: serializedFrequency.value,
      administrationRoute: entity.administrationRoute.name,
      scheduleTimes: MedicationModelConverters.scheduleTimesToJson(
        entity.scheduleTimes,
      ),
      startDate: MedicationModelConverters.dateTimeToString(entity.startDate),
      isActive: MedicationModelConverters.boolToInt(value: entity.isActive),
      intervalDays: entity.intervalDays,
      endDate: entity.endDate == null
          ? null
          : MedicationModelConverters.dateTimeToString(entity.endDate!),
      notes: entity.notes,
    );
  }

  /// Converts this model to a domain entity.
  MedicationSchedule toDomain() {
    return MedicationSchedule(
      id: id,
      drugId: drugId,
      dosageAmount: dosageAmount,
      dosageUnit: DosageUnit.values.byName(dosageUnit),
      frequency: MedicationModelConverters.frequencyFromDatabase(
        type: frequencyType,
        value: frequencyValue,
      ),
      administrationRoute: AdministrationRoute.values.byName(
        administrationRoute,
      ),
      startDate: MedicationModelConverters.stringToDateTime(startDate),
      isActive: MedicationModelConverters.intToBool(isActive),
      scheduleTimes: MedicationModelConverters.scheduleTimesFromJson(
        scheduleTimes,
      ),
      intervalDays: intervalDays,
      endDate: endDate == null
          ? null
          : MedicationModelConverters.stringToDateTime(endDate!),
      notes: notes,
    );
  }
}
