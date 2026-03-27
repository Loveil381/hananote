import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_type.dart';

part 'measurement_entry.freezed.dart';

/// Domain entity for a single body measurement session.
@freezed
class MeasurementEntry with _$MeasurementEntry {
  /// Creates a [MeasurementEntry].
  const factory MeasurementEntry({
    required String id,
    required DateTime date,
    required DateTime createdAt,
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
    DateTime? updatedAt,
  }) = _MeasurementEntry;
}

/// Helpers for working with measurement values generically.
extension MeasurementEntryX on MeasurementEntry {
  /// Returns the value for [type], if recorded.
  double? valueFor(MeasurementType type) {
    return switch (type) {
      MeasurementType.bust => bust,
      MeasurementType.underbust => underbust,
      MeasurementType.waist => waist,
      MeasurementType.hip => hip,
      MeasurementType.thigh => thigh,
      MeasurementType.bicep => bicep,
      MeasurementType.shoulder => shoulder,
      MeasurementType.neck => neck,
      MeasurementType.weight => weight,
    };
  }

  /// Whether the entry contains at least one numeric measurement.
  bool get hasAnyMeasurement {
    return MeasurementTypes.all.any((type) => valueFor(type) != null);
  }
}
