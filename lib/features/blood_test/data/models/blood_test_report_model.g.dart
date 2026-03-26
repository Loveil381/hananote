// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_test_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BloodTestReportModelImpl _$$BloodTestReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BloodTestReportModelImpl(
      id: json['id'] as String,
      testDate: json['test_date'] as String,
      createdAt: json['created_at'] as String,
      labName: json['lab_name'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$BloodTestReportModelImplToJson(
        _$BloodTestReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'test_date': instance.testDate,
      'created_at': instance.createdAt,
      'lab_name': instance.labName,
      'notes': instance.notes,
    };
