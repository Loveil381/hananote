import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';

part 'pk_result.freezed.dart';

/// A single point in the simulated PK curve.
@freezed
class PkCurvePoint with _$PkCurvePoint {
  /// Creates a [PkCurvePoint].
  const factory PkCurvePoint({
    required double time,
    required double concentration,
    required DateTime dateTime,
  }) = _PkCurvePoint;
}

/// Complete simulation output and steady-state summary metrics.
@freezed
class PkSimulationResult with _$PkSimulationResult {
  /// Creates a [PkSimulationResult].
  const factory PkSimulationResult({
    required List<PkCurvePoint> curvePoints,
    required double steadyStateTrough,
    required double steadyStatePeak,
    required double steadyStateAverage,
    required double timeToSteadyState,
    required double aucPerInterval,
    required DosingRegimen regimen,
  }) = _PkSimulationResult;
}
