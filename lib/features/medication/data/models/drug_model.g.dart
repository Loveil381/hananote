// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrugModelImpl _$$DrugModelImplFromJson(Map<String, dynamic> json) =>
    _$DrugModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      genericName: json['generic_name'] as String,
      category: json['category'] as String,
      administrationRoute: json['administration_route'] as String,
      defaultDosageUnit: json['default_dosage_unit'] as String,
      isActive: (json['is_active'] as num).toInt(),
      createdAt: json['created_at'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$DrugModelImplToJson(_$DrugModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'generic_name': instance.genericName,
      'category': instance.category,
      'administration_route': instance.administrationRoute,
      'default_dosage_unit': instance.defaultDosageUnit,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'notes': instance.notes,
    };
