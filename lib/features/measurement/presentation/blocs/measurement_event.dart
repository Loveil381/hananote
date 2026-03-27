// Release prep note: Freezed unions are app-internal and stay undocumented to
// avoid repeating obvious variant docs across generated event types.
// ignore_for_file: public_member_api_docs

part of 'measurement_bloc.dart';

/// Events for [MeasurementBloc].
sealed class MeasurementEvent {
  const MeasurementEvent();

  /// Loads measurement history.
  const factory MeasurementEvent.loadHistory() = LoadMeasurementHistory;

  /// Saves a measurement entry.
  const factory MeasurementEvent.saveMeasurement(MeasurementEntry entry) =
      SaveMeasurementEvent;

  /// Deletes the measurement with [id].
  const factory MeasurementEvent.deleteMeasurement(String id) =
      DeleteMeasurementEvent;
}

/// Loads measurement history.
class LoadMeasurementHistory extends MeasurementEvent {
  const LoadMeasurementHistory();
}

/// Saves a measurement entry.
class SaveMeasurementEvent extends MeasurementEvent {
  const SaveMeasurementEvent(this.entry);

  /// Measurement to save.
  final MeasurementEntry entry;
}

/// Deletes a measurement entry.
class DeleteMeasurementEvent extends MeasurementEvent {
  const DeleteMeasurementEvent(this.id);

  /// Identifier to delete.
  final String id;
}
