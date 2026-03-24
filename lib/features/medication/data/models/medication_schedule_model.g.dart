// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationScheduleModelImpl _$$MedicationScheduleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MedicationScheduleModelImpl(
      id: json['id'] as String,
      drugId: json['drug_id'] as String,
      dosageAmount: (json['dosage_amount'] as num).toDouble(),
      dosageUnit: json['dosage_unit'] as String,
      frequencyType: json['frequency_type'] as String,
      frequencyValue: json['frequency_value'] as String,
      administrationRoute: json['administration_route'] as String,
      scheduleTimes: json['schedule_times'] as String,
      startDate: json['start_date'] as String,
      isActive: (json['is_active'] as num).toInt(),
      intervalDays: (json['interval_days'] as num?)?.toInt(),
      endDate: json['end_date'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MedicationScheduleModelImplToJson(
        _$MedicationScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'drug_id': instance.drugId,
      'dosage_amount': instance.dosageAmount,
      'dosage_unit': instance.dosageUnit,
      'frequency_type': instance.frequencyType,
      'frequency_value': instance.frequencyValue,
      'administration_route': instance.administrationRoute,
      'schedule_times': instance.scheduleTimes,
      'start_date': instance.startDate,
      'is_active': instance.isActive,
      'interval_days': instance.intervalDays,
      'end_date': instance.endDate,
      'notes': instance.notes,
    };
