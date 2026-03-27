// ignore_for_file: public_member_api_docs

part of 'measurement_bloc.dart';

/// States for [MeasurementBloc].
sealed class MeasurementState {
  const MeasurementState();

  /// Initial idle state.
  const factory MeasurementState.initial() = MeasurementInitial;

  /// Generic loading state.
  const factory MeasurementState.loading() = MeasurementLoading;

  /// Loaded history state.
  const factory MeasurementState.loaded(List<MeasurementEntry> entries) =
      MeasurementLoaded;

  /// Save-in-progress state.
  const factory MeasurementState.saving() = MeasurementSaving;

  /// Save completed state.
  const factory MeasurementState.saved() = MeasurementSaved;

  /// Error state.
  const factory MeasurementState.error(String message) = MeasurementError;
}

/// Initial state.
class MeasurementInitial extends MeasurementState {
  const MeasurementInitial();
}

/// Loading state.
class MeasurementLoading extends MeasurementState {
  const MeasurementLoading();
}

/// Loaded state.
class MeasurementLoaded extends MeasurementState {
  const MeasurementLoaded(this.entries);

  /// Loaded measurement entries.
  final List<MeasurementEntry> entries;
}

/// Saving state.
class MeasurementSaving extends MeasurementState {
  const MeasurementSaving();
}

/// Saved state.
class MeasurementSaved extends MeasurementState {
  const MeasurementSaved();
}

/// Error state.
class MeasurementError extends MeasurementState {
  const MeasurementError(this.message);

  /// Error message.
  final String message;
}
