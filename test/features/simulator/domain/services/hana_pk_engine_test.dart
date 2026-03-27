// ignore_for_file: avoid_print
// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/hana_pk_params.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';
import 'package:hananote/features/simulator/domain/services/hana_pk_engine.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';

// β>1 with kEl=0.05 (DEC-029): S-shaped absorption + correct injection clearance.

void main() {
  const engine = HanaPkEngine();
  const pkEngine = PkEngine();

  double findTmax(
    double Function(double) evaluator,
    double upperBoundHours, {
    double step = 1,
  }) {
    var peak = 0.0;
    var tmax = 0.0;
    for (var t = step; t <= upperBoundHours; t += step) {
      final value = evaluator(t);
      if (value > peak) {
        peak = value;
        tmax = t;
      }
    }
    return tmax;
  }

  group('weibullInjection', () {
    const evParams = WeibullInjectionParams(
      tau: 36,
      beta: 1.8,
      formationFraction: 0.062,
    );
    const ecParams = WeibullInjectionParams(
      tau: 80,
      beta: 1.6,
      formationFraction: 0.117,
    );
    const enParams = WeibullInjectionParams(
      tau: 120,
      beta: 1.4,
      formationFraction: 0.12,
    );

    test('EV Tmax ∈ [24, 72]h', () {
      final tmax = findTmax(
        (t) => engine.weibullInjection(t, 5, evParams),
        240,
      );
      print('EV Tmax: ${tmax}h');

      expect(tmax, inInclusiveRange(24, 72));
    });

    test('EC Tmax ∈ [48, 168]h', () {
      final tmax = findTmax(
        (t) => engine.weibullInjection(t, 5, ecParams),
        240,
      );
      print('EC Tmax: ${tmax}h');

      expect(tmax, inInclusiveRange(48, 168));
    });

    test('EN Tmax ∈ [72, 240]h', () {
      final tmax = findTmax(
        (t) => engine.weibullInjection(t, 5, enParams),
        300,
      );
      print('EN Tmax: ${tmax}h');

      expect(tmax, inInclusiveRange(72, 240));
    });

    test('Tmax ordering: EV < EC < EN', () {
      final evTmax = findTmax(
        (t) => engine.weibullInjection(t, 5, evParams),
        240,
      );
      final ecTmax = findTmax(
        (t) => engine.weibullInjection(t, 5, ecParams),
        240,
      );
      final enTmax = findTmax(
        (t) => engine.weibullInjection(t, 5, enParams),
        300,
      );

      print('Tmax ordering => EV: ${evTmax}h, EC: ${ecTmax}h, EN: ${enTmax}h');

      expect(evTmax, lessThan(ecTmax));
      expect(ecTmax, lessThan(enTmax));
    });

    test('t=0 returns 0', () {
      expect(engine.weibullInjection(0, 5, evParams), 0);
    });

    test('negative time returns 0', () {
      expect(engine.weibullInjection(-10, 5, evParams), 0);
    });
  });

  group('oralWithE1SReservoir', () {
    const oralParams = OralE1SParams();

    test('E2 peaks between 2 and 8 hours', () {
      final tmax = findTmax(
        (t) => engine.oralWithE1SReservoir(t, 2, oralParams),
        24,
        step: 0.5,
      );
      expect(tmax, inInclusiveRange(2.0, 8.0));
    });

    test('concentration at 24h stays positive due to E1S reservoir', () {
      expect(engine.oralWithE1SReservoir(24, 2, oralParams), greaterThan(0));
    });

    test('Hana oral tail stays above plain Bateman at 24h', () {
      const pkOralParams = OralParams(
        kAbs: 0.3,
        bioavailability: 0.04,
      );
      final hana24 = engine.oralWithE1SReservoir(24, 2, oralParams);
      final pk24 = pkEngine.oralBateman(24, 2, pkOralParams);

      expect(hana24, greaterThan(pk24));
    });

    test('F=0 returns 0', () {
      const zeroFParams = OralE1SParams(bioavailability: 0, fE1S: 0);

      expect(engine.oralWithE1SReservoir(4, 2, zeroFParams), 0);
    });
  });

  group('sublingualHanaDualPath', () {
    test('theta=0 degenerates to the oral E1S model', () {
      const slParams = HanaSublingualParams(theta: 0);
      const oralParams = OralE1SParams();

      final slValue = engine.sublingualHanaDualPath(4, 2, slParams);
      final oralValue = engine.oralWithE1SReservoir(4, 2, oralParams);

      expect((slValue - oralValue).abs(), lessThan(1e-10));
    });

    test('strict hold peak stays above oral peak', () {
      const strictParams = HanaSublingualParams(theta: 0.18);
      const oralParams = OralE1SParams();
      var slPeak = 0.0;
      var oralPeak = 0.0;

      for (var t = 0.25; t <= 12; t += 0.25) {
        final sl = engine.sublingualHanaDualPath(t, 2, strictParams);
        final oral = engine.oralWithE1SReservoir(t, 2, oralParams);
        if (sl > slPeak) slPeak = sl;
        if (oral > oralPeak) oralPeak = oral;
      }

      expect(slPeak, greaterThan(oralPeak));
    });
  });

  group('comparison: Hana-PK vs V2 PkEngine', () {
    final evV2Params =
        EsterType.estradiolValerate.defaultParameters as InjectionParams;
    const evHanaParams = WeibullInjectionParams(
      tau: 36,
      beta: 1.8,
      formationFraction: 0.062,
    );

    test('both engines produce a positive EV Tmax', () {
      final hanaTmax = findTmax(
        (t) => engine.weibullInjection(t, 5, evHanaParams),
        240,
      );
      final pkTmax = findTmax(
        (t) => pkEngine.dualDepotInjection(t, 5, evV2Params),
        240,
      );

      expect(hanaTmax, greaterThan(0));
      expect(pkTmax, greaterThan(0));
    });

    test('steady-state peak remains positive for weekly EV dosing', () {
      const intervalHours = 7 * 24.0;
      const totalDays = 90;

      double hanaAt(double tH) {
        var sum = 0.0;
        for (var doseT = 0.0; doseT <= tH + 1e-6; doseT += intervalHours) {
          sum += engine.weibullInjection(tH - doseT, 5, evHanaParams);
        }
        return sum;
      }

      double pkAt(double tH) {
        var sum = 0.0;
        for (var doseT = 0.0; doseT <= tH + 1e-6; doseT += intervalHours) {
          sum += pkEngine.dualDepotInjection(tH - doseT, 5, evV2Params);
        }
        return sum;
      }

      const lastDoseT = (totalDays * 24 ~/ intervalHours) * intervalHours;
      var hanaPeak = 0.0;
      var pkPeak = 0.0;

      for (var phase = 0.0; phase <= intervalHours; phase += 1) {
        final tH = lastDoseT + phase;
        hanaPeak = hanaPeak < hanaAt(tH) ? hanaAt(tH) : hanaPeak;
        pkPeak = pkPeak < pkAt(tH) ? pkAt(tH) : pkPeak;
      }

      expect(hanaPeak, greaterThan(0));
      expect(pkPeak, greaterThan(0));
    });
  });
}
