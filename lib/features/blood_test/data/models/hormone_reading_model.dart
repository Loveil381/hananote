// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';

part 'hormone_reading_model.freezed.dart';
part 'hormone_reading_model.g.dart';

/// Data-layer representation of a [HormoneReading].
@freezed
class HormoneReadingModel with _$HormoneReadingModel {
  /// Creates a [HormoneReadingModel].
  const HormoneReadingModel._();

  /// Creates a [HormoneReadingModel].
  const factory HormoneReadingModel({
    required String id,
    @JsonKey(name: 'report_id') required String reportId,
    @JsonKey(name: 'hormone_type') required String hormoneType,
    required double value,
    required String unit,
    String? notes,
  }) = _HormoneReadingModel;

  /// Creates a [HormoneReadingModel] from JSON.
  factory HormoneReadingModel.fromJson(Map<String, dynamic> json) =>
      _$HormoneReadingModelFromJson(json);

  /// Creates a [HormoneReadingModel] from a domain entity.
  factory HormoneReadingModel.fromDomain(HormoneReading entity) {
    return HormoneReadingModel(
      id: entity.id,
      reportId: entity.reportId,
      hormoneType: entity.type.name,
      value: entity.value,
      unit: entity.unit,
      notes: entity.notes,
    );
  }

  /// Converts this model to a domain entity.
  HormoneReading toDomain() {
    return HormoneReading(
      id: id,
      reportId: reportId,
      type: HormoneType.values.byName(hormoneType),
      value: value,
      unit: unit,
      notes: notes,
    );
  }
}
