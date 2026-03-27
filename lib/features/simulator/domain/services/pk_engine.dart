import 'dart:math' as math;

import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';

/// Pure Dart pharmacokinetic engine for the V2 estradiol simulator.
class PkEngine {
  /// Creates a [PkEngine].
  const PkEngine();

  static const double _epsilon = 1e-6;
  static const double _steadyStateTolerance = 0.05;
  static const double _troughProbeHours = 1 / 60;

  /// Dual-depot injection model with parallel fast and slow depots.
  double dualDepotInjection(double tH, double dose, InjectionParams p) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    final fast = _analytic3C(tH, p.k1Fast, p.k2, p.k3);
    final slow = _analytic3C(tH, p.k1Slow, p.k2, p.k3);

    return _clampNonNegative(
      dose *
          p.formationFraction *
          (p.fracFast * fast + (1 - p.fracFast) * slow),
    );
  }

  /// Oral Bateman model.
  double oralBateman(double tH, double dose, OralParams p) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    return _clampNonNegative(
      dose * p.bioavailability * _batemanUnit(tH, p.kAbs, p.kClear),
    );
  }

  /// Sublingual model with a fast mucosal path and a slower swallowed path.
  double sublingualDualPath(double tH, double dose, SublingualParams p) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    final fast = p.k2Hydrolysis > 0
        ? _analytic3C(tH, p.kSL, p.k2Hydrolysis, p.kClear)
        : _batemanUnit(tH, p.kSL, p.kClear);
    final slow = _batemanUnit(tH, p.kAbsOral, p.kClear);

    return _clampNonNegative(
      dose * p.theta * fast +
          dose * (1 - p.theta) * p.bioavailabilityOral * slow,
    );
  }

  /// Zero-order patch input during wear followed by exponential decay.
  double patchZeroOrder(double tH, double dose, PatchParams p) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    final rateMgPerHour = p.releaseRateMcgPerDay / 24 / 1000 * dose;
    if (tH <= p.wearDurationH) {
      return _clampNonNegative(
        rateMgPerHour / p.kClear * (1 - math.exp(-p.kClear * tH)),
      );
    }

    final amountAtRemoval =
        rateMgPerHour / p.kClear * (1 - math.exp(-p.kClear * p.wearDurationH));
    return _clampNonNegative(
      amountAtRemoval * math.exp(-p.kClear * (tH - p.wearDurationH)),
    );
  }

  /// Gel Bateman model.
  double gelBateman(double tH, double dose, GelParams p) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    return _clampNonNegative(
      dose * p.bioavailability * _batemanUnit(tH, p.kAbs, p.kClear),
    );
  }

  /// Closed-form steady-state solution for repeated injection dosing.
  double steadyStateE2(
    double tH,
    double dose,
    double intervalHours,
    InjectionParams p,
  ) {
    if (tH < 0 || dose <= 0 || intervalHours <= 0) {
      return 0;
    }

    final phaseHours = _phaseHours(tH, intervalHours);
    final fast = _steadyStateAnalytic3C(
      phaseHours,
      p.k1Fast,
      p.k2,
      p.k3,
      intervalHours,
    );
    final slow = _steadyStateAnalytic3C(
      phaseHours,
      p.k1Slow,
      p.k2,
      p.k3,
      intervalHours,
    );

    return _clampNonNegative(
      dose *
          p.formationFraction *
          (p.fracFast * fast + (1 - p.fracFast) * slow),
    );
  }

  /// Returns the concentration for [regimen] at [tH] hours since first dose.
  double concentrationAt(
    double tH,
    DosingRegimen regimen,
    RouteParams params, {
    double vdPerKg = 2,
  }) {
    final resolvedParams = resolveRouteParams(regimen, params);
    final amountMg = _multiDoseAmount(tH, regimen, resolvedParams);
    return _amountToConcentrationPgMl(
      amountMg,
      bodyWeightKg: regimen.bodyWeightKg ?? 65,
      vdPerKg: vdPerKg,
    );
  }

  /// Applies regimen-level overrides to route parameters.
  RouteParams resolveRouteParams(DosingRegimen regimen, RouteParams params) {
    final paramsWithHold = switch (params) {
      final SublingualParams sublingual
          when regimen.sublingualHoldTime != null =>
        sublingual.copyWith(theta: regimen.sublingualHoldTime!.theta),
      _ => params,
    };

    return switch (paramsWithHold) {
      final PatchParams patch when regimen.wearDurationDays != null =>
        patch.copyWith(wearDurationH: regimen.wearDurationDays! * 24),
      _ => paramsWithHold,
    };
  }

  /// Runs a complete simulation using route-specific V2 logic.
  PkSimulationResult simulate(
    DosingRegimen regimen, {
    RouteParams? paramsOverride,
    int durationDays = 90,
    int pointsPerDay = 24,
    double vdPerKg = 2,
  }) {
    final intervalHours = regimen.intervalDays * 24;
    final totalPoints = durationDays * pointsPerDay;
    final pointStepHours = 24 / pointsPerDay;
    final totalDurationHours = durationDays * 24.0;
    final params = resolveRouteParams(
      regimen,
      paramsOverride ?? regimen.esterType.defaultParameters,
    );

    final curvePoints = List<PkCurvePoint>.generate(totalPoints, (index) {
      final timeHours = index * pointStepHours;
      return PkCurvePoint(
        time: timeHours,
        concentration: concentrationAt(
          timeHours,
          regimen,
          params,
          vdPerKg: vdPerKg,
        ),
        dateTime: regimen.startDate.add(
          Duration(milliseconds: (timeHours * 3600 * 1000).round()),
        ),
      );
    });

    final steadyCurve = _steadyStateProfile(
      regimen,
      params,
      intervalHours: intervalHours,
      totalDurationHours: totalDurationHours,
      vdPerKg: vdPerKg,
      samples: math.max(240, pointsPerDay * 10),
    );
    final steadyStateStartHours =
        math.max(0, totalDurationHours - intervalHours);
    final troughTime = intervalHours - _troughProbeHours;
    final steadyStateTrough = switch (params) {
      final InjectionParams injection => _amountToConcentrationPgMl(
          steadyStateE2(
            troughTime,
            regimen.doseAmount,
            intervalHours,
            injection,
          ),
          bodyWeightKg: regimen.bodyWeightKg ?? 65,
          vdPerKg: vdPerKg,
        ),
      _ => concentrationAt(
          steadyStateStartHours + troughTime,
          regimen,
          params,
          vdPerKg: vdPerKg,
        ),
    };
    final steadyStatePeak = steadyCurve.fold<double>(
      0,
      (currentPeak, point) => math.max(currentPeak, point.concentration),
    );
    final aucPerInterval = _integrateAuc(steadyCurve);

    return PkSimulationResult(
      curvePoints: curvePoints,
      steadyStateTrough: steadyStateTrough,
      steadyStatePeak: steadyStatePeak,
      steadyStateAverage: intervalHours <= 0
          ? 0
          : _clampNonNegative(aucPerInterval / intervalHours),
      timeToSteadyState: _estimateTimeToSteadyState(
        regimen,
        params,
        vdPerKg: vdPerKg,
      ),
      aucPerInterval: aucPerInterval,
      regimen: regimen,
    );
  }

  double _multiDoseAmount(
    double tH,
    DosingRegimen regimen,
    RouteParams params,
  ) {
    if (tH <= 0) {
      return 0;
    }

    final intervalHours = regimen.intervalDays * 24;
    var total = 0.0;

    for (var doseTime = 0.0;
        doseTime <= tH + _epsilon;
        doseTime += intervalHours) {
      total += _singleDoseAmount(tH - doseTime, regimen.doseAmount, params);
    }

    return _clampNonNegative(total);
  }

  double _singleDoseAmount(double tH, double dose, RouteParams params) {
    if (tH <= 0 || dose <= 0) {
      return 0;
    }

    return switch (params) {
      final InjectionParams injection =>
        dualDepotInjection(tH, dose, injection),
      final OralParams oral => oralBateman(tH, dose, oral),
      final SublingualParams sublingual =>
        sublingualDualPath(tH, dose, sublingual),
      final PatchParams patch => patchZeroOrder(tH, dose, patch),
      final GelParams gel => gelBateman(tH, dose, gel),
    };
  }

  List<PkCurvePoint> _steadyStateProfile(
    DosingRegimen regimen,
    RouteParams params, {
    required double intervalHours,
    required double totalDurationHours,
    required double vdPerKg,
    required int samples,
  }) {
    final stepHours = intervalHours / samples;
    final steadyStateStartHours =
        math.max(0, totalDurationHours - intervalHours);

    return List<PkCurvePoint>.generate(samples, (index) {
      final phaseHours = index * stepHours;
      final concentration = switch (params) {
        final InjectionParams injection => _amountToConcentrationPgMl(
            steadyStateE2(
              phaseHours,
              regimen.doseAmount,
              intervalHours,
              injection,
            ),
            bodyWeightKg: regimen.bodyWeightKg ?? 65,
            vdPerKg: vdPerKg,
          ),
        _ => concentrationAt(
            steadyStateStartHours + phaseHours,
            regimen,
            params,
            vdPerKg: vdPerKg,
          ),
      };

      return PkCurvePoint(
        time: phaseHours,
        concentration: concentration,
        dateTime: regimen.startDate.add(
          Duration(
            milliseconds:
                ((steadyStateStartHours + phaseHours) * 3600 * 1000).round(),
          ),
        ),
      );
    });
  }

  double _estimateTimeToSteadyState(
    DosingRegimen regimen,
    RouteParams params, {
    required double vdPerKg,
  }) {
    final intervalHours = regimen.intervalDays * 24;
    double? previousTrough;

    for (var cycle = 1; cycle <= 20; cycle++) {
      final troughTime = cycle * intervalHours - _troughProbeHours;
      final currentTrough = concentrationAt(
        troughTime,
        regimen,
        params,
        vdPerKg: vdPerKg,
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

  double _analytic3C(double tH, double ka, double kb, double kc) {
    if (tH <= 0) {
      return 0;
    }

    final a = math.exp(-ka * tH) / (_safeDelta(ka, kb) * _safeDelta(ka, kc));
    final b = math.exp(-kb * tH) / (_safeDelta(ka, kb) * _safeDelta(kb, kc));
    final c = math.exp(-kc * tH) / (_safeDelta(ka, kc) * _safeDelta(kb, kc));

    return _clampNonNegative(ka * kb * _heaviside(tH) * (a - b + c));
  }

  double _steadyStateAnalytic3C(
    double phaseHours,
    double ka,
    double kb,
    double kc,
    double intervalHours,
  ) {
    final a = math.exp(-ka * phaseHours) /
        (_steadyStateDenominator(ka, intervalHours) *
            _safeDelta(ka, kb) *
            _safeDelta(ka, kc));
    final b = math.exp(-kb * phaseHours) /
        (_steadyStateDenominator(kb, intervalHours) *
            _safeDelta(ka, kb) *
            _safeDelta(kb, kc));
    final c = math.exp(-kc * phaseHours) /
        (_steadyStateDenominator(kc, intervalHours) *
            _safeDelta(ka, kc) *
            _safeDelta(kb, kc));

    return _clampNonNegative(ka * kb * (a - b + c));
  }

  double _batemanUnit(double tH, double kAbs, double kClear) {
    if (tH <= 0) {
      return 0;
    }

    return _clampNonNegative(
      kAbs /
          _safeDelta(kAbs, kClear) *
          (math.exp(-kClear * tH) - math.exp(-kAbs * tH)),
    );
  }

  double _integrateAuc(List<PkCurvePoint> curve) {
    if (curve.length < 2) {
      return 0;
    }

    var auc = 0.0;
    for (var i = 1; i < curve.length; i++) {
      final previous = curve[i - 1];
      final current = curve[i];
      final deltaHours = current.time - previous.time;
      auc +=
          (previous.concentration + current.concentration) * 0.5 * deltaHours;
    }

    return auc;
  }

  double _amountToConcentrationPgMl(
    double amountMg, {
    required double bodyWeightKg,
    required double vdPerKg,
  }) {
    // amountMg × 1e6 ng/mg ÷ (volumeLiters × 1e3 mL/L) = ng/mL ≡ μg/L
    // amountMg × 1e9 pg/mg ÷ (volumeLiters × 1e3 mL/L) = pg/mL
    final volumeLiters = math.max(bodyWeightKg * vdPerKg, _epsilon);
    return _clampNonNegative(amountMg * 1e9 / volumeLiters / 1000);
  }

  double _phaseHours(double timeHours, double intervalHours) {
    final cycles = (timeHours / intervalHours).floorToDouble();
    return timeHours - intervalHours * cycles;
  }

  double _steadyStateDenominator(double k, double intervalHours) {
    final value = 1 - math.exp(-k * intervalHours);
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
