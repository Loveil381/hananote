// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hormone_reading_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HormoneReadingModelImpl _$$HormoneReadingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HormoneReadingModelImpl(
      id: json['id'] as String,
      reportId: json['report_id'] as String,
      hormoneType: json['hormone_type'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$HormoneReadingModelImplToJson(
        _$HormoneReadingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'report_id': instance.reportId,
      'hormone_type': instance.hormoneType,
      'value': instance.value,
      'unit': instance.unit,
      'notes': instance.notes,
    };
