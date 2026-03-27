import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';
import 'package:hananote/features/simulator/domain/usecases/run_pk_simulation.dart';
import 'package:hananote/features/simulator/presentation/blocs/simulator_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _MockRunPkSimulation extends Mock implements RunPkSimulation {}

void main() {
  late _MockRunPkSimulation runPkSimulation;
  const engine = PkEngine();

  DosingRegimen buildRegimen({
    required double doseAmount,
    required double intervalDays,
    required double bodyWeightKg,
    EsterType esterType = EsterType.estradiolValerate,
  }) {
    return DosingRegimen(
      esterType: esterType,
      doseAmount: doseAmount,
      intervalDays: intervalDays,
      startDate: DateTime(2026, 3, 27),
      bodyWeightKg: bodyWeightKg,
    );
  }

  PkSimulationResult buildResult(DosingRegimen regimen) {
    return engine.simulate(
      regimen,
      paramsOverride: regimen.esterType.defaultParameters,
      durationDays: 30,
    );
  }

  SimulatorBloc buildBloc() => SimulatorBloc(runPkSimulation);

  bool loadedMetricsAreFinite(SimulatorState state) {
    return state.maybeMap(
      loaded: (loaded) {
        final result = loaded.result;
        final metrics = <double>[
          result.steadyStatePeak,
          result.steadyStateTrough,
          result.steadyStateAverage,
          result.aucPerInterval,
        ];
        return metrics.every((value) => value.isFinite && !value.isNaN) &&
            result.curvePoints.every(
              (PkCurvePoint point) =>
                  point.concentration.isFinite && !point.concentration.isNaN,
            );
      },
      orElse: () => false,
    );
  }

  double? loadedDose(SimulatorState state) {
    return state.maybeMap(
      loaded: (loaded) => loaded.regimen.doseAmount,
      orElse: () => null,
    );
  }

  double? loadedInterval(SimulatorState state) {
    return state.maybeMap(
      loaded: (loaded) => loaded.regimen.intervalDays,
      orElse: () => null,
    );
  }

  double? loadedWeight(SimulatorState state) {
    return state.maybeMap(
      loaded: (loaded) => loaded.regimen.bodyWeightKg,
      orElse: () => null,
    );
  }

  EsterType? loadedEsterType(SimulatorState state) {
    return state.maybeMap(
      loaded: (loaded) => loaded.regimen.esterType,
      orElse: () => null,
    );
  }

  setUp(() {
    runPkSimulation = _MockRunPkSimulation();
  });

  test('initial state is SimulatorState.initial', () {
    expect(buildBloc().state, const SimulatorState.initial());
  });

  blocTest<SimulatorBloc, SimulatorState>(
    'started emits error when repository-backed load fails',
    build: buildBloc,
    setUp: () {
      when(() => runPkSimulation()).thenAnswer(
        (_) async =>
            left(const Failure.storage(message: 'simulator unavailable')),
      );
    },
    act: (bloc) => bloc.add(const SimulatorEvent.started()),
    expect: () => [
      const SimulatorState.loading(),
      const SimulatorState.error(message: 'simulator unavailable'),
    ],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'started emits loaded when the initial simulation succeeds',
    build: buildBloc,
    setUp: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      when(() => runPkSimulation()).thenAnswer(
        (_) async => right(buildResult(regimen)),
      );
    },
    act: (bloc) => bloc.add(const SimulatorEvent.started()),
    expect: () => [
      const SimulatorState.loading(),
      isA<SimulatorState>()
          .having(loadedDose, 'loaded dose', 5.0)
          .having(loadedInterval, 'loaded interval', 5.0)
          .having(loadedWeight, 'loaded weight', 65.0),
    ],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'regimenUpdated with extreme parameters emits finite loaded values',
    build: buildBloc,
    seed: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      final result = buildResult(regimen);
      return SimulatorState.loaded(
        result: result,
        regimen: regimen,
        isHanaPk: false,
        hanaPkResult: result,
      );
    },
    setUp: () {
      final extremeRegimen = buildRegimen(
        doseAmount: 0.1,
        intervalDays: 1,
        bodyWeightKg: 40,
      );
      when(
        () => runPkSimulation(overrideRegimen: extremeRegimen),
      ).thenAnswer(
        (_) async => right(buildResult(extremeRegimen)),
      );
    },
    act: (bloc) => bloc.add(
      SimulatorEvent.regimenUpdated(
        regimen: buildRegimen(
          doseAmount: 0.1,
          intervalDays: 1,
          bodyWeightKg: 40,
        ),
      ),
    ),
    expect: () => [
      const SimulatorState.loading(),
      isA<SimulatorState>().having(
        loadedMetricsAreFinite,
        'finite result values',
        isTrue,
      ),
    ],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'engineToggled keeps state unchanged when hanaPkResult is null',
    build: buildBloc,
    seed: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      return SimulatorState.loaded(
        result: buildResult(regimen),
        regimen: regimen,
        isHanaPk: false,
      );
    },
    act: (bloc) => bloc.add(const SimulatorEvent.engineToggled()),
    expect: () => <SimulatorState>[],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'regimenUpdated emits error when recalculation fails',
    build: buildBloc,
    seed: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      final result = buildResult(regimen);
      return SimulatorState.loaded(
        result: result,
        regimen: regimen,
        isHanaPk: false,
        hanaPkResult: result,
      );
    },
    setUp: () {
      final updatedRegimen = buildRegimen(
        doseAmount: 9,
        intervalDays: 7,
        bodyWeightKg: 65,
      );
      when(
        () => runPkSimulation(overrideRegimen: updatedRegimen),
      ).thenAnswer(
        (_) async => left(const Failure.storage(message: 'recalc failed')),
      );
    },
    act: (bloc) => bloc.add(
      SimulatorEvent.regimenUpdated(
        regimen: buildRegimen(
          doseAmount: 9,
          intervalDays: 7,
          bodyWeightKg: 65,
        ),
      ),
    ),
    expect: () => [
      const SimulatorState.loading(),
      const SimulatorState.error(message: 'recalc failed'),
    ],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'esterTypeChanged rebuilds the regimen with the selected ester type',
    build: buildBloc,
    seed: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      final result = buildResult(regimen);
      return SimulatorState.loaded(
        result: result,
        regimen: regimen,
        isHanaPk: false,
        hanaPkResult: result,
      );
    },
    setUp: () {
      final updatedRegimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
        esterType: EsterType.estradiolCypionate,
      );
      when(
        () => runPkSimulation(overrideRegimen: updatedRegimen),
      ).thenAnswer(
        (_) async => right(buildResult(updatedRegimen)),
      );
    },
    act: (bloc) => bloc.add(
      const SimulatorEvent.esterTypeChanged(
        esterType: EsterType.estradiolCypionate,
      ),
    ),
    expect: () => [
      const SimulatorState.loading(),
      isA<SimulatorState>().having(
        loadedEsterType,
        'selected ester type',
        EsterType.estradiolCypionate,
      ),
    ],
  );

  blocTest<SimulatorBloc, SimulatorState>(
    'rapid consecutive regimenUpdated events settle on the last regimen',
    build: buildBloc,
    seed: () {
      final regimen = buildRegimen(
        doseAmount: 5,
        intervalDays: 5,
        bodyWeightKg: 65,
      );
      final result = buildResult(regimen);
      return SimulatorState.loaded(
        result: result,
        regimen: regimen,
        isHanaPk: false,
        hanaPkResult: result,
      );
    },
    setUp: () {
      final regimen1 = buildRegimen(
        doseAmount: 2,
        intervalDays: 7,
        bodyWeightKg: 55,
      );
      final regimen2 = buildRegimen(
        doseAmount: 3,
        intervalDays: 5,
        bodyWeightKg: 60,
      );
      final regimen3 = buildRegimen(
        doseAmount: 4,
        intervalDays: 3,
        bodyWeightKg: 70,
      );
      when(() => runPkSimulation(overrideRegimen: regimen1))
          .thenAnswer((_) async => right(buildResult(regimen1)));
      when(() => runPkSimulation(overrideRegimen: regimen2))
          .thenAnswer((_) async => right(buildResult(regimen2)));
      when(() => runPkSimulation(overrideRegimen: regimen3))
          .thenAnswer((_) async => right(buildResult(regimen3)));
    },
    act: (bloc) {
      final regimen1 = buildRegimen(
        doseAmount: 2,
        intervalDays: 7,
        bodyWeightKg: 55,
      );
      final regimen2 = buildRegimen(
        doseAmount: 3,
        intervalDays: 5,
        bodyWeightKg: 60,
      );
      final regimen3 = buildRegimen(
        doseAmount: 4,
        intervalDays: 3,
        bodyWeightKg: 70,
      );
      bloc
        ..add(SimulatorEvent.regimenUpdated(regimen: regimen1))
        ..add(SimulatorEvent.regimenUpdated(regimen: regimen2))
        ..add(SimulatorEvent.regimenUpdated(regimen: regimen3));
    },
    expect: () => [
      const SimulatorState.loading(),
      isA<SimulatorState>().having(
        loadedDose,
        'first dose',
        2,
      ),
      const SimulatorState.loading(),
      isA<SimulatorState>().having(
        loadedDose,
        'second dose',
        3,
      ),
      const SimulatorState.loading(),
      isA<SimulatorState>()
          .having(loadedDose, 'final dose', 4)
          .having(loadedInterval, 'final interval', 3.0)
          .having(loadedWeight, 'final weight', 70.0),
    ],
  );
}
