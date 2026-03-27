import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/usecases/delete_measurement.dart';
import 'package:hananote/features/measurement/domain/usecases/get_measurement_history.dart';
import 'package:hananote/features/measurement/domain/usecases/save_measurement.dart';
import 'package:injectable/injectable.dart';

part 'measurement_event.dart';
part 'measurement_state.dart';

/// Bloc for loading, saving, and deleting measurement entries.
@injectable
class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  /// Creates a [MeasurementBloc].
  MeasurementBloc(
    this._getMeasurementHistory,
    this._saveMeasurement,
    this._deleteMeasurement,
  ) : super(const MeasurementState.initial()) {
    on<LoadMeasurementHistory>(_onLoadHistory);
    on<SaveMeasurementEvent>(_onSaveMeasurement);
    on<DeleteMeasurementEvent>(_onDeleteMeasurement);
  }

  final GetMeasurementHistory _getMeasurementHistory;
  final SaveMeasurement _saveMeasurement;
  final DeleteMeasurement _deleteMeasurement;

  Future<void> _onLoadHistory(
    LoadMeasurementHistory event,
    Emitter<MeasurementState> emit,
  ) async {
    emit(const MeasurementState.loading());

    final result = await _getMeasurementHistory();
    result.fold(
      (failure) => emit(MeasurementState.error(failureMessage(failure))),
      (entries) => emit(MeasurementState.loaded(entries)),
    );
  }

  Future<void> _onSaveMeasurement(
    SaveMeasurementEvent event,
    Emitter<MeasurementState> emit,
  ) async {
    emit(const MeasurementState.saving());

    final result = await _saveMeasurement(event.entry);
    result.fold(
      (failure) => emit(MeasurementState.error(failureMessage(failure))),
      (_) {
        emit(const MeasurementState.saved());
        add(const MeasurementEvent.loadHistory());
      },
    );
  }

  Future<void> _onDeleteMeasurement(
    DeleteMeasurementEvent event,
    Emitter<MeasurementState> emit,
  ) async {
    emit(const MeasurementState.loading());

    final deleteResult = await _deleteMeasurement(event.id);
    if (deleteResult.isLeft()) {
      emit(
        MeasurementState.error(
          failureMessage(
            deleteResult
                .swap()
                .getOrElse((_) => throw StateError('unreachable')),
          ),
        ),
      );
      return;
    }

    final historyResult = await _getMeasurementHistory();
    historyResult.fold(
      (failure) => emit(MeasurementState.error(failureMessage(failure))),
      (entries) => emit(MeasurementState.loaded(entries)),
    );
  }
}
