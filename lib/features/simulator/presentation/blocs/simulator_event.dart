// Release prep note: Freezed unions are app-internal and stay undocumented to
// avoid repeating obvious variant docs across generated event types.
// ignore_for_file: public_member_api_docs

part of 'simulator_bloc.dart';

@freezed
class SimulatorEvent with _$SimulatorEvent {
  const factory SimulatorEvent.started() = _Started;

  const factory SimulatorEvent.regimenUpdated({
    required DosingRegimen regimen,
  }) = _RegimenUpdated;

  const factory SimulatorEvent.esterTypeChanged({
    required EsterType esterType,
  }) = _EsterTypeChanged;

  const factory SimulatorEvent.engineToggled() = _EngineToggled;
}
