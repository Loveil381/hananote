import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';

part 'dosing_regimen.freezed.dart';

/// User dosing configuration for a PK simulation run.
@freezed
class DosingRegimen with _$DosingRegimen {
  /// Creates a [DosingRegimen].
  @Assert('doseAmount > 0', 'doseAmount must be positive')
  @Assert('intervalDays > 0', 'intervalDays must be positive')
  @Assert(
    'wearDurationDays == null || wearDurationDays > 0',
    'wearDurationDays must be positive when provided',
  )
  @Assert(
    'bodyWeightKg == null || bodyWeightKg > 0',
    'bodyWeightKg must be positive when provided',
  )
  const factory DosingRegimen({
    required EsterType esterType,
    required double doseAmount,
    required double intervalDays,
    required DateTime startDate,
    double? wearDurationDays,
    SublingualHoldTime? sublingualHoldTime,
    @Default(65) double? bodyWeightKg,
  }) = _DosingRegimen;
}
