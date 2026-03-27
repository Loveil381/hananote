import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';

void main() {
  const engine = PkEngine();
  final startDate = DateTime(2026, 3, 27);
  final evParams =
      EsterType.estradiolValerate.defaultParameters as InjectionParams;
  final ecParams =
      EsterType.estradiolCypionate.defaultParameters as InjectionParams;
  const oralE2Params = OralParams(
    kAbs: 0.08,
  );
  const oralEvParams = OralParams(
    kAbs: 0.05,
  );
  const sublingualZeroTheta = SublingualParams(
    theta: 0,
    kAbsOral: 0.08,
  );
  const sublingualStrict = SublingualParams(
    theta: 0.18,
    kAbsOral: 0.08,
  );
  const patchParams = PatchParams(
    releaseRateMcgPerDay: 100,
    wearDurationH: 168,
  );
  const gelParams = GelParams();

  double findPeakTimeH(double Function(double tH) evaluator) {
    var peakTime = 0.0;
    var peakValue = -1.0;
    for (var hour = 0; hour <= 240; hour++) {
      final value = evaluator(hour.toDouble());
      if (value > peakValue) {
        peakValue = value;
        peakTime = hour.toDouble();
      }
    }
    return peakTime;
  }

  group('dualDepotInjection', () {
    test('returns zero at t=0 for EV', () {
      expect(engine.dualDepotInjection(0, 5, evParams), 0);
    });

    test('returns non-negative concentrations across the EV curve', () {
      for (var hour = 0; hour <= 240; hour += 6) {
        expect(
          engine.dualDepotInjection(hour.toDouble(), 5, evParams),
          greaterThanOrEqualTo(0),
        );
      }
    });

    test('EV single-dose Tmax falls between 24h and 72h', () {
      final peakTime = findPeakTimeH(
        (tH) => engine.dualDepotInjection(tH, 5, evParams),
      );

      expect(peakTime, inInclusiveRange(24, 72));
    });

    test('EC single-dose Tmax falls between 72h and 120h', () {
      final peakTime = findPeakTimeH(
        (tH) => engine.dualDepotInjection(tH, 5, ecParams),
      );

      expect(peakTime, inInclusiveRange(72, 120));
    });

    test(
        'multi-dose accumulation is higher than a single dose at the same time',
        () {
      final singleRegimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 999,
        startDate: startDate,
      );
      final multiRegimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 5,
        startDate: startDate,
      );

      final single = engine.concentrationAt(
        200,
        singleRegimen,
        evParams,
      );
      final multi = engine.concentrationAt(
        200,
        multiRegimen,
        evParams,
      );

      expect(multi, greaterThan(single));
    });

    test('remains stable when depot rates are nearly equal', () {
      const params = InjectionParams(
        fracFast: 0.4,
        k1Fast: 0.01,
        k1Slow: 0.0100001,
        k2: 0.07,
        formationFraction: 0.0623,
      );

      final result = engine.dualDepotInjection(72, 5, params);

      expect(result.isFinite, isTrue);
      expect(result, greaterThanOrEqualTo(0));
    });
  });

  group('non-injection routes', () {
    test('oral E2 reaches an early peak', () {
      final peakTime = findPeakTimeH(
        (tH) => engine.oralBateman(tH, 2, oralE2Params),
      );

      expect(peakTime, inInclusiveRange(2, 6));
    });

    test('oral EV peaks later than oral E2', () {
      final oralE2Peak = findPeakTimeH(
        (tH) => engine.oralBateman(tH, 2, oralE2Params),
      );
      final oralEvPeak = findPeakTimeH(
        (tH) => engine.oralBateman(tH, 2, oralEvParams),
      );

      expect(oralEvPeak, greaterThan(oralE2Peak));
      expect(oralEvPeak, inInclusiveRange(5, 8));
    });

    test('sublingual theta=0 collapses to the oral path', () {
      final oral = engine.oralBateman(8, 2, oralE2Params);
      final sublingual = engine.sublingualDualPath(8, 2, sublingualZeroTheta);

      expect((oral - sublingual).abs(), lessThan(0.01));
    });

    test('strict sublingual hold yields a higher peak than oral', () {
      final oralPeak = List<double>.generate(
        24,
        (index) => engine.oralBateman(index.toDouble(), 2, oralE2Params),
      ).reduce(math.max);
      final sublingualPeak = List<double>.generate(
        24,
        (index) => engine.sublingualDualPath(
          index.toDouble(),
          2,
          sublingualStrict,
        ),
      ).reduce(math.max);

      expect(sublingualPeak, greaterThan(oralPeak));
    });

    test('patch rises monotonically while worn', () {
      final samples = [
        engine.patchZeroOrder(6, 1, patchParams),
        engine.patchZeroOrder(24, 1, patchParams),
        engine.patchZeroOrder(72, 1, patchParams),
        engine.patchZeroOrder(120, 1, patchParams),
      ];

      expect(samples[1], greaterThan(samples[0]));
      expect(samples[2], greaterThan(samples[1]));
      expect(samples[3], greaterThan(samples[2]));
    });

    test('patch decays after removal', () {
      final atRemoval = engine.patchZeroOrder(168, 1, patchParams);
      final afterRemoval = engine.patchZeroOrder(192, 1, patchParams);

      expect(afterRemoval, lessThan(atRemoval));
    });

    test('gel Bateman produces a positive peak before declining', () {
      final at12 = engine.gelBateman(12, 1.5, gelParams);
      final at36 = engine.gelBateman(36, 1.5, gelParams);

      expect(at12, greaterThan(0));
      expect(at36, lessThan(at12));
    });
  });

  group('simulate', () {
    test('returns zero for negative time inputs', () {
      expect(engine.oralBateman(-1, 2, oralE2Params), 0);
      expect(engine.dualDepotInjection(-1, 5, evParams), 0);
    });

    test('returns a reasonable steady state for injection regimens', () {
      final regimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 5,
        startDate: startDate,
      );

      final result = engine.simulate(
        regimen,
        paramsOverride: evParams,
      );

      expect(result.curvePoints, hasLength(2160));
      expect(result.steadyStatePeak, greaterThan(result.steadyStateTrough));
      expect(result.steadyStateAverage, greaterThan(0));
      expect(result.timeToSteadyState, greaterThan(0));
    });

    test('returns a reasonable steady state for patch regimens', () {
      final regimen = DosingRegimen(
        esterType: EsterType.transdermalPatch,
        doseAmount: 1,
        intervalDays: 7,
        startDate: startDate,
        wearDurationDays: 7,
      );

      final result = engine.simulate(
        regimen,
        paramsOverride: patchParams,
      );

      expect(result.curvePoints, hasLength(2160));
      expect(result.steadyStatePeak, greaterThan(0));
      expect(result.steadyStateTrough, greaterThan(0));
      expect(result.aucPerInterval, greaterThan(0));
    });
  });
}
