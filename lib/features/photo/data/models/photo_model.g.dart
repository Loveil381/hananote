// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoModelImpl _$$PhotoModelImplFromJson(Map<String, dynamic> json) =>
    _$PhotoModelImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      encryptedPath: json['encrypted_path'] as String,
      encryptedThumbPath: json['encrypted_thumb_path'] as String,
      originalSizeBytes: (json['original_size_bytes'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      notes: json['notes'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PhotoModelImplToJson(_$PhotoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'encrypted_path': instance.encryptedPath,
      'encrypted_thumb_path': instance.encryptedThumbPath,
      'original_size_bytes': instance.originalSizeBytes,
      'created_at': instance.createdAt.toIso8601String(),
      'notes': instance.notes,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
