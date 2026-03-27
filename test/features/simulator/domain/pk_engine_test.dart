import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_parameters.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';

void main() {
  const engine = PkEngine();
  final startDate = DateTime(2026, 3, 27);

  group('PkEngine.singleDoseE2', () {
    test('returns zero at time zero', () {
      final result = engine.singleDoseE2(
        0,
        5,
        EsterType.estradiolValerate.defaultParameters,
      );

      expect(result, 0);
    });

    test('returns zero for a negative time', () {
      final result = engine.singleDoseE2(
        -1,
        5,
        EsterType.estradiolValerate.defaultParameters,
      );

      expect(result, 0);
    });

    test('EV IM is near peak around 48 hours', () {
      final params = EsterType.estradiolValerate.defaultParameters;
      final at48 = engine.singleDoseE2(48, 5, params);
      final samples = List<double>.generate(
        11,
        (index) => engine.singleDoseE2(index * 12, 5, params),
      );
      final peak = samples.reduce((left, right) => left > right ? left : right);

      expect(at48, greaterThan(0));
      expect(at48 / peak, greaterThan(0.85));
    });

    test('EC IM peaks later and lower than EV IM at 48 hours', () {
      final evAt48 = engine.singleDoseE2(
        48,
        5,
        EsterType.estradiolValerate.defaultParameters,
      );
      final ecAt48 = engine.singleDoseE2(
        48,
        5,
        EsterType.estradiolCypionate.defaultParameters,
      );
      final ecAt96 = engine.singleDoseE2(
        96,
        5,
        EsterType.estradiolCypionate.defaultParameters,
      );

      expect(ecAt48, lessThan(evAt48));
      expect(ecAt96, greaterThan(ecAt48));
    });

    test('does not crash when k1 is nearly equal to k2', () {
      const params = PkParameters(
        k1: 0.2,
        k2: 0.2000001,
        k3: 0.1,
      );

      final result = engine.singleDoseE2(48, 5, params);

      expect(result.isFinite, isTrue);
      expect(result, greaterThanOrEqualTo(0));
    });
  });

  group('PkEngine.multi-dose and steady state', () {
    test('accumulates concentration after a second dose', () {
      final params = EsterType.estradiolValerate.defaultParameters;
      final singleDose = engine.singleDoseE2(200, 5, params);
      final accumulated = engine.multiDoseE2(
        200,
        const [(0, 5), (168, 5)],
        params,
      );

      expect(accumulated, greaterThan(singleDose));
    });

    test('steady-state EV trough stabilizes after repeated cycles', () {
      final params = EsterType.estradiolValerate.defaultParameters;
      const intervalHours = 5 * 24.0;
      final troughOne = engine.multiDoseE2(
        intervalHours * 4 - (1 / 60),
        const [(0, 5), (120, 5), (240, 5), (360, 5)],
        params,
      );
      final troughTwo = engine.multiDoseE2(
        intervalHours * 5 - (1 / 60),
        const [(0, 5), (120, 5), (240, 5), (360, 5), (480, 5)],
        params,
      );

      final relativeDelta = (troughTwo - troughOne).abs() / troughOne;
      expect(relativeDelta, lessThan(0.05));
    });

    test('patch steady-state concentration declines after removal', () {
      final params = EsterType.transdermalPatch.defaultParameters;
      const intervalHours = 84.0;
      const wearHours = 72.0;
      final duringWear = engine.steadyStatePatchE2(
        48,
        0.1,
        intervalHours,
        wearHours,
        params,
      );
      final afterRemoval = engine.steadyStatePatchE2(
        80,
        0.1,
        intervalHours,
        wearHours,
        params,
      );

      expect(afterRemoval, lessThan(duringWear));
    });

    test('steady-state AUC matches dose divided by k3', () {
      final regimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 5,
        startDate: startDate,
      );

      final result = engine.simulate(regimen);

      expect(
        result.aucPerInterval,
        closeTo(
          regimen.effectiveDose /
              EsterType.estradiolValerate.defaultParameters.k3,
          1e-6,
        ),
      );
    });
  });

  group('PkEngine.simulate', () {
    test('returns the requested number of points', () {
      final regimen = DosingRegimen(
        esterType: EsterType.estradiolValerate,
        doseAmount: 5,
        intervalDays: 5,
        startDate: startDate,
      );

      final result = engine.simulate(regimen);

      expect(result.curvePoints, hasLength(2160));
    });

    test('returns steady-state summary metrics', () {
      final regimen = DosingRegimen(
        esterType: EsterType.estradiolEnanthate,
        doseAmount: 4,
        intervalDays: 7,
        startDate: startDate,
      );

      final result = engine.simulate(regimen, durationDays: 60);

      expect(result.steadyStatePeak, greaterThan(result.steadyStateTrough));
      expect(result.steadyStateAverage, greaterThan(0));
      expect(result.timeToSteadyState, greaterThan(0));
    });
  });
}
