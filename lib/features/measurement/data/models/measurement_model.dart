// Release prep note: Freezed/json_serializable require this suppression for
// generated annotations.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';

part 'measurement_model.freezed.dart';
part 'measurement_model.g.dart';

/// SQLite/JSON model for [MeasurementEntry].
@freezed
class MeasurementModel with _$MeasurementModel {
  /// Creates a [MeasurementModel].
  const factory MeasurementModel({
    required String id,
    required DateTime date,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    double? bust,
    double? underbust,
    double? waist,
    double? hip,
    double? thigh,
    double? bicep,
    double? shoulder,
    double? neck,
    double? weight,
    String? notes,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _MeasurementModel;

  /// Creates a [MeasurementModel] from JSON.
  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementModelFromJson(json);

  /// Creates a [MeasurementModel] from a domain entity.
  factory MeasurementModel.fromEntity(MeasurementEntry entity) {
    return MeasurementModel(
      id: entity.id,
      date: entity.date,
      bust: entity.bust,
      underbust: entity.underbust,
      waist: entity.waist,
      hip: entity.hip,
      thigh: entity.thigh,
      bicep: entity.bicep,
      shoulder: entity.shoulder,
      neck: entity.neck,
      weight: entity.weight,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

/// Mapping helpers for measurement models.
extension MeasurementModelX on MeasurementModel {
  /// Converts this model to a domain entity.
  MeasurementEntry toEntity() {
    return MeasurementEntry(
      id: id,
      date: date,
      bust: bust,
      underbust: underbust,
      waist: waist,
      hip: hip,
      thigh: thigh,
      bicep: bicep,
      shoulder: shoulder,
      neck: neck,
      weight: weight,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
