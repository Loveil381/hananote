// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeasurementModelImpl _$$MeasurementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MeasurementModelImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      bust: (json['bust'] as num?)?.toDouble(),
      underbust: (json['underbust'] as num?)?.toDouble(),
      waist: (json['waist'] as num?)?.toDouble(),
      hip: (json['hip'] as num?)?.toDouble(),
      thigh: (json['thigh'] as num?)?.toDouble(),
      bicep: (json['bicep'] as num?)?.toDouble(),
      shoulder: (json['shoulder'] as num?)?.toDouble(),
      neck: (json['neck'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MeasurementModelImplToJson(
        _$MeasurementModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'bust': instance.bust,
      'underbust': instance.underbust,
      'waist': instance.waist,
      'hip': instance.hip,
      'thigh': instance.thigh,
      'bicep': instance.bicep,
      'shoulder': instance.shoulder,
      'neck': instance.neck,
      'weight': instance.weight,
      'notes': instance.notes,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
