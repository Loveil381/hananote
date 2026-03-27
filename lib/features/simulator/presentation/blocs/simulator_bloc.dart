import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';
import 'package:hananote/features/simulator/domain/services/hana_pk_engine.dart';
import 'package:hananote/features/simulator/domain/usecases/run_pk_simulation.dart';
import 'package:injectable/injectable.dart';

part 'simulator_bloc.freezed.dart';
part 'simulator_event.dart';
part 'simulator_state.dart';

/// Manages the state of the PK simulator, including regimen inference and
/// dual-engine (V2 vs Hana-PK) execution for UI comparison.
@injectable
class SimulatorBloc extends Bloc<SimulatorEvent, SimulatorState> {
  SimulatorBloc(this._runPkSimulation) : super(const SimulatorState.initial()) {
    on<_Started>(_onStarted);
    on<_RegimenUpdated>(_onRegimenUpdated);
    on<_EsterTypeChanged>(_onEsterTypeChanged);
    on<_EngineToggled>(_onEngineToggled);
  }

  final RunPkSimulation _runPkSimulation;
  static const _hanaEngine = HanaPkEngine();

  Future<void> _onStarted(
    _Started event,
    Emitter<SimulatorState> emit,
  ) async {
    emit(const SimulatorState.loading());

    // This usecase will either use the override regimen (null here) or
    // infer it from the active medication.
    final resultOrFailure = await _runPkSimulation();
    
    resultOrFailure.fold(
      (failure) => emit(SimulatorState.error(message: failure.message)),
      (v2Result) {
        // Also run the Hana-PK engine so we have both results in memory
        final hanaResult = _hanaEngine.simulate(v2Result.regimen);
        
        emit(
          SimulatorState.loaded(
            result: v2Result, // Default to V2 results
            regimen: v2Result.regimen,
            isHanaPk: false,
            hanaPkResult: hanaResult,
          ),
        );
      },
    );
  }

  Future<void> _onRegimenUpdated(
    _RegimenUpdated event,
    Emitter<SimulatorState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(const SimulatorState.loading());

    // We pass the updated regimen to the usecase (which uses V2 engine by default)
    final resultOrFailure = await _runPkSimulation(
      overrideRegimen: event.regimen,
    );
    
    resultOrFailure.fold(
      (failure) => emit(SimulatorState.error(message: failure.message)),
      (v2Result) {
        final hanaResult = _hanaEngine.simulate(event.regimen);
        
        // Preserve engine toggle state
        final isHanaPk = currentState.isHanaPk;
        emit(
          SimulatorState.loaded(
            result: isHanaPk ? hanaResult : v2Result,
            regimen: event.regimen,
            isHanaPk: isHanaPk,
            hanaPkResult: isHanaPk ? v2Result : hanaResult, // Store the "other" result
          ),
        );
      },
    );
  }

  Future<void> _onEsterTypeChanged(
    _EsterTypeChanged event,
    Emitter<SimulatorState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    // Build new regimen with the changed ester type
    final newRegimen = currentState.regimen.copyWith(
      esterType: event.esterType,
    );

    add(SimulatorEvent.regimenUpdated(regimen: newRegimen));
  }

  void _onEngineToggled(
    _EngineToggled event,
    Emitter<SimulatorState> emit,
  ) {
    final currentState = state;
    if (currentState is! _Loaded) return;

    if (currentState.hanaPkResult == null) return;

    // Swap the main result and the comparison result, and flip the boolean
    emit(
      currentState.copyWith(
        isHanaPk: !currentState.isHanaPk,
        result: currentState.hanaPkResult!,
        hanaPkResult: currentState.result,
      ),
    );
  }
}
