import 'dart:math' as math;

import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_parameters.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';

/// Pure Dart pharmacokinetic engine for deterministic estradiol simulation.
class PkEngine {
  /// Creates a [PkEngine].
  const PkEngine();

  static const double _epsilon = 1e-6;
  static const double _steadyStateTolerance = 0.05;
  static const double _troughProbeHours = 1 / 60;

  /// Three-compartment single-dose estradiol concentration.
  double singleDoseE2(double t, double dose, PkParameters params) {
    if (t <= 0 || dose <= 0) {
      return 0;
    }

    final timeDays = t / 24;
    final k1 = params.k1;
    final k2 = params.k2;
    final k3 = params.k3;

    final a =
        math.exp(-k1 * timeDays) / (_safeDelta(k1, k2) * _safeDelta(k1, k3));
    final b =
        math.exp(-k2 * timeDays) / (_safeDelta(k1, k2) * _safeDelta(k2, k3));
    final c =
        math.exp(-k3 * timeDays) / (_safeDelta(k1, k3) * _safeDelta(k2, k3));

    return _clampNonNegative(dose * k1 * k2 * _heaviside(t) * (a - b + c));
  }

  /// Linear superposition of multiple doses.
  double multiDoseE2(
    double t,
    List<(double time, double dose)> doses,
    PkParameters params,
  ) {
    if (t <= 0 || doses.isEmpty) {
      return 0;
    }

    return _clampNonNegative(
      doses.fold<double>(
        0,
        (sum, doseEvent) =>
            sum + singleDoseE2(t - doseEvent.$1, doseEvent.$2, params),
      ),
    );
  }

  /// Closed-form steady-state concentration for repeated dosing.
  double steadyStateE2(
    double t,
    double dose,
    double intervalHours,
    PkParameters params,
  ) {
    if (t < 0 || dose <= 0 || intervalHours <= 0) {
      return 0;
    }

    final intervalDays = intervalHours / 24;
    final phaseDays = _phaseHours(t, intervalHours) / 24;
    final k1 = params.k1;
    final k2 = params.k2;
    final k3 = params.k3;

    final a = math.exp(-k1 * phaseDays) /
        (_steadyStateDenominator(k1, intervalDays) *
            _safeDelta(k1, k2) *
            _safeDelta(k1, k3));
    final b = math.exp(-k2 * phaseDays) /
        (_steadyStateDenominator(k2, intervalDays) *
            _safeDelta(k1, k2) *
            _safeDelta(k2, k3));
    final c = math.exp(-k3 * phaseDays) /
        (_steadyStateDenominator(k3, intervalDays) *
            _safeDelta(k1, k3) *
            _safeDelta(k2, k3));

    return _clampNonNegative(dose * k1 * k2 * (a - b + c));
  }

  /// Steady-state approximation for transdermal patch-like dosing.
  double steadyStatePatchE2(
    double t,
    double dose,
    double intervalHours,
    double wearHours,
    PkParameters params,
  ) {
    if (t < 0 || dose <= 0 || intervalHours <= 0 || wearHours <= 0) {
      return 0;
    }

    final phaseHours = _phaseHours(t, intervalHours);
    final phaseDays = phaseHours / 24;
    final intervalDays = intervalHours / 24;
    final wearDays = math.min(wearHours, intervalHours) / 24;
    final k = params.k3;
    final rate = dose / wearDays;
    final doseAtRemoval = rate / k * (1 - math.exp(-k * wearDays));
    final decayFactor = _steadyStateDenominator(k, intervalDays);

    if (phaseDays <= wearDays) {
      final activeRelease = rate / k * (1 - math.exp(-k * phaseDays));
      final residual = doseAtRemoval *
          math.exp(-k * (phaseDays + intervalDays - wearDays)) /
          decayFactor;
      return _clampNonNegative(activeRelease + residual);
    }

    return _clampNonNegative(
      doseAtRemoval * math.exp(-k * (phaseDays - wearDays)) / decayFactor,
    );
  }

  /// Runs a deterministic simulation and calculates steady-state metrics.
  PkSimulationResult simulate(
    DosingRegimen regimen, {
    int durationDays = 90,
    int pointsPerDay = 24,
  }) {
    final totalPoints = durationDays * pointsPerDay;
    final pointStepHours = 24 / pointsPerDay;
    final intervalHours = regimen.intervalDays * 24;
    final params = regimen.esterType.defaultParameters;
    final doses = _buildDoseEvents(regimen, durationDays.toDouble());

    final curvePoints = List<PkCurvePoint>.generate(totalPoints, (index) {
      final timeHours = index * pointStepHours;
      final concentration = regimen.esterType.usesPatchModel
          ? _multiDosePatchE2(
              timeHours,
              doses,
              params,
              _resolvedWearHours(regimen),
            )
          : multiDoseE2(timeHours, doses, params);

      return PkCurvePoint(
        time: timeHours,
        concentration: concentration,
        dateTime: regimen.startDate.add(
          Duration(milliseconds: (timeHours * 3600 * 1000).round()),
        ),
      );
    });

    final steadyCurve = _steadyStateProfile(
      regimen,
      intervalHours,
      samples: math.max(240, pointsPerDay * 10),
    );
    final trough = regimen.esterType.usesPatchModel
        ? steadyStatePatchE2(
            intervalHours - _troughProbeHours,
            regimen.effectiveDose,
            intervalHours,
            _resolvedWearHours(regimen),
            params,
          )
        : steadyStateE2(
            intervalHours - _troughProbeHours,
            regimen.effectiveDose,
            intervalHours,
            params,
          );
    final peak = steadyCurve.fold<double>(
      0,
      (currentPeak, point) => math.max(currentPeak, point.concentration),
    );
    final auc = regimen.esterType.usesPatchModel
        ? _integrateAuc(steadyCurve)
        : regimen.effectiveDose / params.k3;
    final average = auc / regimen.intervalDays;

    return PkSimulationResult(
      curvePoints: curvePoints,
      steadyStateTrough: trough,
      steadyStatePeak: peak,
      steadyStateAverage: average,
      timeToSteadyState: _estimateTimeToSteadyState(regimen, intervalHours),
      aucPerInterval: auc,
      regimen: regimen,
    );
  }

  List<(double time, double dose)> _buildDoseEvents(
    DosingRegimen regimen,
    double durationDays,
  ) {
    final intervalHours = regimen.intervalDays * 24;
    final totalHours = durationDays * 24;
    final doses = <(double, double)>[];

    for (var time = 0.0; time < totalHours + _epsilon; time += intervalHours) {
      doses.add((time, regimen.effectiveDose));
    }

    return doses;
  }

  double _multiDosePatchE2(
    double t,
    List<(double time, double dose)> doses,
    PkParameters params,
    double wearHours,
  ) {
    if (t <= 0 || doses.isEmpty) {
      return 0;
    }

    return _clampNonNegative(
      doses.fold<double>(
        0,
        (sum, doseEvent) =>
            sum +
            _singlePatchDoseE2(
              t - doseEvent.$1,
              doseEvent.$2,
              wearHours,
              params,
            ),
      ),
    );
  }

  double _singlePatchDoseE2(
    double t,
    double dose,
    double wearHours,
    PkParameters params,
  ) {
    if (t <= 0 || dose <= 0 || wearHours <= 0) {
      return 0;
    }

    final timeDays = t / 24;
    final wearDays = wearHours / 24;
    final k = params.k3;
    final releaseRate = dose / wearDays;
    final doseAtRemoval = releaseRate / k * (1 - math.exp(-k * wearDays));

    if (timeDays <= wearDays) {
      return _clampNonNegative(
        releaseRate / k * (1 - math.exp(-k * timeDays)),
      );
    }

    return _clampNonNegative(
      doseAtRemoval * math.exp(-k * (timeDays - wearDays)),
    );
  }

  List<PkCurvePoint> _steadyStateProfile(
    DosingRegimen regimen,
    double intervalHours, {
    required int samples,
  }) {
    final params = regimen.esterType.defaultParameters;
    final wearHours = _resolvedWearHours(regimen);
    final stepHours = intervalHours / samples;

    return List<PkCurvePoint>.generate(samples, (index) {
      final timeHours = index * stepHours;
      final concentration = regimen.esterType.usesPatchModel
          ? steadyStatePatchE2(
              timeHours,
              regimen.effectiveDose,
              intervalHours,
              wearHours,
              params,
            )
          : steadyStateE2(
              timeHours,
              regimen.effectiveDose,
              intervalHours,
              params,
            );

      return PkCurvePoint(
        time: timeHours,
        concentration: concentration,
        dateTime: regimen.startDate.add(
          Duration(milliseconds: (timeHours * 3600 * 1000).round()),
        ),
      );
    });
  }

  double _estimateTimeToSteadyState(
    DosingRegimen regimen,
    double intervalHours,
  ) {
    final params = regimen.esterType.defaultParameters;
    final wearHours = _resolvedWearHours(regimen);
    double? previousTrough;

    for (var cycle = 1; cycle <= 20; cycle++) {
      final troughTime = cycle * intervalHours - _troughProbeHours;
      final currentTrough = regimen.esterType.usesPatchModel
          ? _multiDosePatchE2(
              troughTime,
              _buildDoseEvents(regimen, regimen.intervalDays * (cycle + 1)),
              params,
              wearHours,
            )
          : multiDoseE2(
              troughTime,
              _buildDoseEvents(regimen, regimen.intervalDays * (cycle + 1)),
              params,
            );

      if (previousTrough != null) {
        final baseline = math.max(previousTrough.abs(), _epsilon);
        final delta = (currentTrough - previousTrough).abs() / baseline;
        if (delta < _steadyStateTolerance) {
          return troughTime / 24;
        }
      }

      previousTrough = currentTrough;
    }

    return 20 * regimen.intervalDays;
  }

  double _integrateAuc(List<PkCurvePoint> curve) {
    if (curve.length < 2) {
      return 0;
    }

    var auc = 0.0;
    for (var i = 1; i < curve.length; i++) {
      final previous = curve[i - 1];
      final current = curve[i];
      final deltaDays = (current.time - previous.time) / 24;
      auc += (previous.concentration + current.concentration) * 0.5 * deltaDays;
    }

    return auc;
  }

  double _phaseHours(double timeHours, double intervalHours) {
    final cycles = (timeHours / intervalHours).floorToDouble();
    return timeHours - intervalHours * cycles;
  }

  double _resolvedWearHours(DosingRegimen regimen) {
    if (regimen.esterType == EsterType.transdermalPatch) {
      return (regimen.wearDurationDays ?? regimen.intervalDays) * 24;
    }

    if (regimen.esterType == EsterType.transdermalGel) {
      return math.min(regimen.intervalDays, 1) * 24;
    }

    return regimen.intervalDays * 24;
  }

  double _steadyStateDenominator(double k, double intervalDays) {
    final value = 1 - math.exp(-k * intervalDays);
    return value.abs() < _epsilon ? _epsilon : value;
  }

  double _safeDelta(double left, double right) {
    final delta = left - right;
    if (delta.abs() >= _epsilon) {
      return delta;
    }

    return delta.isNegative ? -_epsilon : _epsilon;
  }

  double _heaviside(double value) => value > 0 ? 1 : 0;

  double _clampNonNegative(double value) => value.isNegative ? 0 : value;
}
