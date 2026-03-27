import 'dart:math' as math;

import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/hana_pk_params.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';

/// Experimental Hana-PK pharmacokinetic engine.
///
/// Implements the original Hana-PK model as an alternative to [PkEngine].
/// All methods are pure functions and Isolate-safe.
///
/// Computation model:
/// - Weibull absorption for IM injections (numerical convolution).
/// - Explicit E1S reservoir for oral / sublingual dosing.
/// - Patch and gel delegate to [PkEngine] (physically correct).
class HanaPkEngine {
  /// Creates a [HanaPkEngine].
  const HanaPkEngine();

  static const _convStep = 0.5; // convolution step (h)
  static const _pkEngine = PkEngine();

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Weibull absorption + single-compartment elimination for IM injections.
  ///
  /// [tH] hours since injection, [dose] in mg, [p] Weibull parameters.
  /// Returns amount (mg) still in central compartment.
  ///
  /// Uses numerical convolution: r_abs is sampled at 0.5 h intervals
  /// and accumulated with the trapezoidal rule to compute the area under the
  /// input function that has not yet been cleared.
  double weibullInjection(double tH, double dose, WeibullInjectionParams p) {
    if (tH <= 0 || dose <= 0) return 0;
    return _clamp(_weibullConvolution(tH, dose, p));
  }

  /// Three-pool oral model with explicit E1S reservoir.
  ///
  /// [tH] hours since dose, [dose] in mg, [p] oral E1S parameters.
  /// Returns E2 amount (mg) in central compartment.
  ///
  /// Linear ODE solved via eigenvalue decomposition — no iteration, no
  /// approximation.
  double oralWithE1SReservoir(
    double tH,
    double dose,
    OralE1SParams p,
  ) {
    if (tH <= 0 || dose <= 0 || p.bioavailability <= 0) return 0;
    return _clamp(_solveE1SOde(tH, dose, p));
  }

  /// θ-split dual-path sublingual model.
  ///
  /// `theta` fraction goes through fast mucosal path (Bateman),
  /// the remainder (1-θ) through the E1S oral reservoir model.
  /// Returns E2 amount (mg).
  double sublingualHanaDualPath(
    double tH,
    double dose,
    HanaSublingualParams p,
  ) {
    if (tH <= 0 || dose <= 0) return 0;

    final fastAmount = _batemanUnit(tH, p.kSL, p.kEl) * dose * p.theta;
    final oralParams = OralE1SParams(
      ka: p.kaOral,
      bioavailability: p.bioavailabilityOral,
      fE1S: p.fE1S,
      kRec: p.kRec,
      kElS: p.kElS,
      kEl: p.kEl,
    );
    final slowAmount = _solveE1SOde(tH, dose * (1 - p.theta), oralParams);
    return _clamp(fastAmount + slowAmount);
  }

  /// Delegates to [PkEngine.patchZeroOrder] (physically correct model).
  double patchZeroOrder(double tH, double dose, PatchParams p) =>
      _pkEngine.patchZeroOrder(tH, dose, p);

  /// Delegates to [PkEngine.gelBateman] (physically correct model).
  double gelBateman(double tH, double dose, GelParams p) =>
      _pkEngine.gelBateman(tH, dose, p);

  // ---------------------------------------------------------------------------
  // Weibull convolution
  // ---------------------------------------------------------------------------

  double _weibullIrr(double t, WeibullInjectionParams p) {
    if (t <= 0) return 0;
    final tau = p.tau;
    final beta = p.beta;
    final scaled = t / tau;
    // r_abs(t) = (D * F * β / τ) * (t/τ)^(β-1) * exp(-(t/τ)^β)
    // Per-unit-dose amplitude: (β / τ) * (t/τ)^(β-1) * exp(-(t/τ)^β)
    return (beta / tau) *
        math.pow(scaled, beta - 1) *
        math.exp(-math.pow(scaled, beta));
  }

  double _weibullConvolution(
    double tH,
    double dose,
    WeibullInjectionParams p,
  ) {
    // C(t) = ∫₀ᵗ r_abs(s) * exp(-k_el * (t-s)) ds  (per unit Vd)
    // Since Vd is absorbed into the dose·F factor (and callers convert
    // to concentration separately), we work in "amount" domain.
    final amplitude = dose * p.formationFraction;
    var result = 0.0;
    var sPrev = 0.0;
    var yPrev = 0.0;

    for (var s = _convStep; s <= tH + _convStep / 2; s += _convStep) {
      final sActual = math.min(s, tH);
      final weight = math.exp(-p.kEl * (tH - sActual));
      final y = _weibullIrr(sActual, p) * weight;
      // Trapezoidal integration
      result += (yPrev + y) * (sActual - sPrev) / 2;
      sPrev = sActual;
      yPrev = y;
      if (sActual >= tH) break;
    }

    return amplitude * result;
  }

  // ---------------------------------------------------------------------------
  // E1S reservoir ODE solver (3-pool linear system)
  // ---------------------------------------------------------------------------
  //
  // State vector [A_gut, C_E2, C_E1S]:
  //   dA_gut/dt  = -ka * A_gut
  //   dC_E2/dt   = ka * F * A_gut / Vd + kRec * C_E1S - kEl  * C_E2
  //   dC_E1S/dt  = ka * F_E1S * A_gut / Vd - (kRec + kElS) * C_E1S
  //
  // Note: Vd is implicit (absorbed into the initial dose scaling). We track
  // "amount" not concentration; callers convert to pg/mL externally.

  double _solveE1SOde(double tH, double dose, OralE1SParams p) {
    // Initial conditions (at t=0 after dose):
    //   A_gut(0) = dose  (total dose enters gut)
    //   C_E2(0)  = 0
    //   C_E1S(0) = 0
    final ka = p.ka;
    final f = p.bioavailability;
    final fE1S = p.fE1S;
    final kRec = p.kRec;
    final kElS = p.kElS;
    final kEl = p.kEl;

    // Eigenvalue λ1 = -ka (gut compartment decays independently)
    // The 2×2 sub-system for [C_E2, C_E1S] has eigenvalues:
    //   λ2 = -kEl,  λ3 = -(kRec + kElS)
    // (the matrix is upper-triangular: C_E2 does not feed into C_E1S)
    // C_E1S feeds into C_E2, so we solve via variation of parameters.

    final lam1 = -ka;
    final lam2 = -kEl;
    final lam3 = -(kRec + kElS);

    // Particular solutions (forced by A_gut = dose * exp(lam1 * t)):
    //   c_E1S: A_E1S * exp(lam1*t)  +  B_E1S * exp(lam3*t)
    //   c_E2:  A_E2  * exp(lam1*t)  +  B_E2  * exp(lam2*t)
    //        + C_E2  * exp(lam3*t)

    // A_E1S: particular solution driven by gut → E1S
    final aE1S = ka * fE1S * dose / _safeDenom(lam1 - lam3);
    // B_E1S: integration constant to satisfy C_E1S(0) = 0
    final bE1S = -aE1S;

    // C_E2(t) is driven by two sources:
    //   1. Gut → E2 direct:
    //        ka*f*dose * [exp(lam1*t) - exp(lam2*t)] / (lam1-lam2)
    //   2. E1S → E2 reconversion:
    //        kRec * [aE1S*exp(lam1*t) + bE1S*exp(lam3*t)] integrated

    final directAmp = ka * f * dose;
    final pE2Lam1 = directAmp / _safeDenom(lam1 - lam2) +
        kRec * aE1S / _safeDenom(lam1 - lam2);
    final pE2Lam3 = kRec * bE1S / _safeDenom(lam3 - lam2);
    // Integration constant to satisfy C_E2(0) = 0:
    final pE2Lam2 = -(pE2Lam1 + pE2Lam3);

    final e1 = math.exp(lam1 * tH);
    final e2 = math.exp(lam2 * tH);
    final e3 = math.exp(lam3 * tH);

    return pE2Lam1 * e1 + pE2Lam2 * e2 + pE2Lam3 * e3;
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  double _batemanUnit(double tH, double kAbs, double kClear) {
    if (tH <= 0) return 0;
    return _clamp(
      kAbs /
          _safeDenom(kAbs - kClear) *
          (math.exp(-kClear * tH) - math.exp(-kAbs * tH)),
    );
  }

  double _safeDenom(double d) {
    const eps = 1e-9;
    if (d.abs() < eps) return d < 0 ? -eps : eps;
    return d;
  }

  double _clamp(double v) => v.isFinite && v > 0 ? v : 0;

  // ---------------------------------------------------------------------------
  // Full Simulation Wrapper (Mirrors PkEngine)
  // ---------------------------------------------------------------------------

  /// Calculates plasma concentration (pg/mL) at [tH] hours.
  double concentrationAt(
    double tH,
    DosingRegimen regimen, {
    HanaPkParams? paramsOverride,
    double vdPerKg = 2.0,
  }) {
    if (tH <= 0) return 0;
    final params = paramsOverride ?? regimen.esterType.hanaPkDefaults;
    if (params == null) {
      // Fallback to PkEngine for patch/gel
      return _pkEngine.concentrationAt(
        tH,
        regimen,
        regimen.esterType.defaultParameters,
        vdPerKg: vdPerKg,
      );
    }
    final amountMg = _multiDoseAmount(tH, regimen, params);
    return _amountToConcentrationPgMl(
      amountMg,
      bodyWeightKg: regimen.bodyWeightKg ?? 65,
      vdPerKg: vdPerKg,
    );
  }

  double _multiDoseAmount(
    double tH,
    DosingRegimen regimen,
    HanaPkParams params,
  ) {
    if (tH <= 0) return 0;
    final intervalHours = regimen.intervalDays * 24;
    var total = 0.0;
    for (var doseTime = 0.0; doseTime <= tH + 1e-6; doseTime += intervalHours) {
      total += _singleDoseAmount(tH - doseTime, regimen.doseAmount, params);
    }
    return _clamp(total);
  }

  double _singleDoseAmount(double tH, double dose, HanaPkParams params) {
    if (tH <= 0 || dose <= 0) return 0;
    return switch (params) {
      WeibullInjectionParams() => weibullInjection(tH, dose, params),
      OralE1SParams() => oralWithE1SReservoir(tH, dose, params),
      HanaSublingualParams() => sublingualHanaDualPath(tH, dose, params),
    };
  }

  /// Runs a complete simulation using Hana-PK logic.
  PkSimulationResult simulate(
    DosingRegimen regimen, {
    HanaPkParams? paramsOverride,
    int durationDays = 90,
    int pointsPerDay = 24,
    double vdPerKg = 2,
  }) {
    final params = paramsOverride ?? regimen.esterType.hanaPkDefaults;
    if (params == null) {
      return _pkEngine.simulate(
        regimen,
        paramsOverride: regimen.esterType.defaultParameters,
        durationDays: durationDays,
        pointsPerDay: pointsPerDay,
        vdPerKg: vdPerKg,
      );
    }

    final intervalHours = regimen.intervalDays * 24;
    final totalPoints = durationDays * pointsPerDay;
    final pointStepHours = 24 / pointsPerDay;
    final totalDurationHours = durationDays * 24.0;

    final curvePoints = List<PkCurvePoint>.generate(totalPoints, (index) {
      final timeHours = index * pointStepHours;
      return PkCurvePoint(
        time: timeHours,
        concentration: concentrationAt(
          timeHours,
          regimen,
          paramsOverride: params,
          vdPerKg: vdPerKg,
        ),
        dateTime: regimen.startDate.add(
          Duration(milliseconds: (timeHours * 3600 * 1000).round()),
        ),
      );
    });

    final steadySamples = math.max(240, pointsPerDay * 10);
    final steadyCurve = _steadyStateProfile(
      regimen,
      params,
      intervalHours: intervalHours,
      totalDurationHours: totalDurationHours,
      vdPerKg: vdPerKg,
      samples: steadySamples,
    );
    final steadyStateStartHours =
        math.max(0, totalDurationHours - intervalHours);
    final troughTime = intervalHours - 0.5; // Probe trough just before next dose
    
    final steadyStateTrough = concentrationAt(
      steadyStateStartHours + troughTime,
      regimen,
      paramsOverride: params,
      vdPerKg: vdPerKg,
    );
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
          : _clamp(aucPerInterval / intervalHours),
      timeToSteadyState: _estimateTimeToSteadyState(
        regimen,
        params,
        vdPerKg: vdPerKg,
      ),
      aucPerInterval: aucPerInterval,
      regimen: regimen,
    );
  }

  List<PkCurvePoint> _steadyStateProfile(
    DosingRegimen regimen,
    HanaPkParams params, {
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
      final concentration = concentrationAt(
        steadyStateStartHours + phaseHours,
        regimen,
        paramsOverride: params,
        vdPerKg: vdPerKg,
      );

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
    HanaPkParams params, {
    required double vdPerKg,
  }) {
    final intervalHours = regimen.intervalDays * 24;
    double? previousTrough;
    for (var cycle = 1; cycle <= 20; cycle++) {
      final troughTime = cycle * intervalHours - 0.5;
      final currentTrough = concentrationAt(
        troughTime,
        regimen,
        paramsOverride: params,
        vdPerKg: vdPerKg,
      );
      if (previousTrough != null) {
        final baseline = math.max(previousTrough.abs(), 1e-6);
        final delta = (currentTrough - previousTrough).abs() / baseline;
        if (delta < 0.05) {
          return troughTime / 24;
        }
      }
      previousTrough = currentTrough;
    }
    return 20 * regimen.intervalDays;
  }

  double _integrateAuc(List<PkCurvePoint> curve) {
    if (curve.length < 2) return 0;
    var auc = 0.0;
    for (var i = 1; i < curve.length; i++) {
      final prev = curve[i - 1];
      final curr = curve[i];
      final delta = curr.time - prev.time;
      auc += (prev.concentration + curr.concentration) * 0.5 * delta;
    }
    return auc;
  }

  double _amountToConcentrationPgMl(
    double amountMg, {
    required double bodyWeightKg,
    required double vdPerKg,
  }) {
    final volumeLiters = math.max(bodyWeightKg * vdPerKg, 1e-6);
    return _clamp(amountMg * 1e9 / volumeLiters / 1000);
  }
}
