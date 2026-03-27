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
