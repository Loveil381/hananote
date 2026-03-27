// Release prep note: Freezed unions are app-internal and stay undocumented to
// avoid repeating obvious variant docs across generated state types.
// ignore_for_file: public_member_api_docs

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
