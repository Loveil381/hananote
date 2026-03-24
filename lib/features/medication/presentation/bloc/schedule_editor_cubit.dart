import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/presentation/bloc/schedule_editor_state.dart';

/// Manages editing state for a single medication schedule.
///
/// Call [initNew] to create a new schedule or [initEdit] to edit an existing
/// one. Use field-setter methods to update the form. Call [save] when done.
class ScheduleEditorCubit extends Cubit<ScheduleEditorState> {
  /// Creates a [ScheduleEditorCubit].
  ScheduleEditorCubit(this._repository) : super(const ScheduleEditorIdle());

  final MedicationRepository _repository;

  /// Initialises the editor to create a new schedule for [drugId].
  void initNew(String drugId) {
    emit(
      ScheduleEditorEditing(
        drugId: drugId,
        isNew: true,
        startDate: DateTime.now(),
      ),
    );
  }

  /// Initialises the editor from [schedule] for editing.
  void initEdit(MedicationSchedule schedule) {
    emit(
      ScheduleEditorEditing(
        drugId: schedule.drugId,
        isNew: false,
        existingId: schedule.id,
        dosageAmount: schedule.dosageAmount,
        dosageUnit: schedule.dosageUnit,
        frequency: schedule.frequency,
        administrationRoute: schedule.administrationRoute,
        startDate: schedule.startDate,
        endDate: schedule.endDate,
        scheduleTimes: schedule.scheduleTimes,
        notes: schedule.notes,
      ),
    );
  }

  /// Updates the dosage amount field.
  void setDosageAmount(double amount) =>
      _withEditing((s) => s.copyWith(dosageAmount: amount));

  /// Updates the dosage unit field.
  void setDosageUnit(DosageUnit unit) =>
      _withEditing((s) => s.copyWith(dosageUnit: unit));

  /// Updates the frequency field.
  void setFrequency(MedicationFrequency frequency) =>
      _withEditing((s) => s.copyWith(frequency: frequency));

  /// Updates the administration route field.
  void setAdministrationRoute(AdministrationRoute route) =>
      _withEditing((s) => s.copyWith(administrationRoute: route));

  /// Updates the start date field.
  void setStartDate(DateTime date) =>
      _withEditing((s) => s.copyWith(startDate: date));

  /// Updates the optional end date field.
  void setEndDate(DateTime? date) =>
      _withEditing((s) => s.copyWith(endDate: date));

  /// Updates the list of scheduled times of day.
  void setScheduleTimes(List<TimeOfDay> times) =>
      _withEditing((s) => s.copyWith(scheduleTimes: times));

  /// Updates the notes field.
  void setNotes(String? notes) => _withEditing((s) => s.copyWith(notes: notes));

  /// Validates all fields and returns true if the schedule is ready to save.
  bool validate() {
    final editing = _editingOrNull;
    if (editing == null) return false;
    final result = _buildValidation(editing);
    emit(editing.copyWith(validation: result));
    return result.isValid;
  }

  /// Persists the schedule by calling `addSchedule` or `updateSchedule`.
  ///
  /// Validates before saving. Emits [ScheduleEditorSaved] on success.
  Future<void> save() async {
    final editing = _editingOrNull;
    if (editing == null) return;

    if (!validate()) return;

    emit(const ScheduleEditorSaving());

    final schedule = _buildSchedule(editing);
    if (schedule == null) {
      emit(
        const ScheduleEditorError(
          message: 'All required fields must be set.',
        ),
      );
      return;
    }

    final result = editing.isNew
        ? await _repository.addSchedule(schedule)
        : await _repository.updateSchedule(schedule);

    if (result.isLeft()) {
      emit(
        ScheduleEditorError(
          message: failureMessage(result.getLeft().toNullable()!),
        ),
      );
    } else {
      emit(ScheduleEditorSaved(schedule: result.getRight().toNullable()!));
    }
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  ScheduleEditorEditing? get _editingOrNull {
    final s = state;
    return s is ScheduleEditorEditing ? s : null;
  }

  void _withEditing(
    ScheduleEditorEditing Function(ScheduleEditorEditing) updater,
  ) {
    final editing = _editingOrNull;
    if (editing == null) return;
    emit(updater(editing));
  }

  ScheduleValidationResult _buildValidation(ScheduleEditorEditing s) {
    return ScheduleValidationResult(
      dosageError: _validateDosage(s),
      frequencyError: s.frequency == null ? 'Frequency is required.' : null,
      startDateError: s.startDate == null ? 'Start date is required.' : null,
      scheduleTimesError: _validateScheduleTimes(s),
    );
  }

  String? _validateDosage(ScheduleEditorEditing s) {
    if (s.dosageAmount == null || s.dosageAmount! <= 0) {
      return 'Dosage must be greater than zero.';
    }
    if (s.dosageUnit == null) return 'Dosage unit is required.';
    return null;
  }

  String? _validateScheduleTimes(ScheduleEditorEditing s) {
    final route = s.administrationRoute;
    if (route == null) return null;
    if (route.supportsScheduleTimes && s.scheduleTimes.isEmpty) {
      return 'At least one schedule time is required.';
    }
    return null;
  }

  MedicationSchedule? _buildSchedule(ScheduleEditorEditing s) {
    if (s.dosageAmount == null ||
        s.dosageUnit == null ||
        s.frequency == null ||
        s.administrationRoute == null ||
        s.startDate == null) {
      return null;
    }

    return MedicationSchedule(
      id: s.existingId ?? _generateId(),
      drugId: s.drugId,
      dosageAmount: s.dosageAmount!,
      dosageUnit: s.dosageUnit!,
      frequency: s.frequency!,
      administrationRoute: s.administrationRoute!,
      startDate: s.startDate!,
      endDate: s.endDate,
      scheduleTimes: s.scheduleTimes,
      isActive: true,
      notes: s.notes,
    );
  }

  /// Simple ID generator using millisecond timestamp; avoids adding a package.
  static String _generateId() {
    final ms = DateTime.now().millisecondsSinceEpoch.toRadixString(16);
    final suffix = (ms.hashCode ^ Object.hash(ms, ms)).toRadixString(16);
    return '$ms-$suffix';
  }
}
