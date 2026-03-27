part of 'simulator_bloc.dart';

@freezed
class SimulatorState with _$SimulatorState {
  const factory SimulatorState.initial() = _Initial;
  
  const factory SimulatorState.loading() = _Loading;
  
  const factory SimulatorState.loaded({
    required PkSimulationResult result, // Active engine result
    required DosingRegimen regimen,
    required bool isHanaPk, // True if active result is Hana-PK
    PkSimulationResult? hanaPkResult, // Stores inactive engine result for swap
  }) = _Loaded;
  
  const factory SimulatorState.error({
    required String message,
  }) = _Error;
}
