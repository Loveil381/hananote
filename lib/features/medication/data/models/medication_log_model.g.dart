// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationLogModelImpl _$$MedicationLogModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MedicationLogModelImpl(
      id: json['id'] as String,
      scheduleId: json['schedule_id'] as String,
      drugId: json['drug_id'] as String,
      timestamp: json['timestamp'] as String,
      dosageAmount: (json['dosage_amount'] as num).toDouble(),
      dosageUnit: json['dosage_unit'] as String,
      administrationRoute: json['administration_route'] as String,
      status: json['status'] as String,
      injectionSite: json['injection_site'] as String?,
      patchSite: json['patch_site'] as String?,
      patchCount: (json['patch_count'] as num?)?.toInt(),
      gelPumps: (json['gel_pumps'] as num?)?.toInt(),
      skinReaction: json['skin_reaction'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$MedicationLogModelImplToJson(
        _$MedicationLogModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule_id': instance.scheduleId,
      'drug_id': instance.drugId,
      'timestamp': instance.timestamp,
      'dosage_amount': instance.dosageAmount,
      'dosage_unit': instance.dosageUnit,
      'administration_route': instance.administrationRoute,
      'status': instance.status,
      'injection_site': instance.injectionSite,
      'patch_site': instance.patchSite,
      'patch_count': instance.patchCount,
      'gel_pumps': instance.gelPumps,
      'skin_reaction': instance.skinReaction,
      'notes': instance.notes,
    };
