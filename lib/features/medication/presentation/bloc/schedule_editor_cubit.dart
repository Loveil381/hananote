import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/utils/id_generator.dart';
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

  /// Loads the existing schedule for [drugId] from the repository.
  ///
  /// If a schedule exists, enters edit mode with all fields pre-filled.
  /// Otherwise enters new mode with the drug's route and default unit pre-set.
  Future<void> loadForDrug(String drugId) async {
    final drugResult = await _repository.getDrugById(drugId);
    final scheduleResult = await _repository.getScheduleForDrug(drugId);

    AdministrationRoute? drugRoute;
    DosageUnit? drugUnit;
    String? drugName;
    drugResult.fold(
      (_) {},
      (drug) {
        drugRoute = drug.administrationRoute;
        drugUnit = drug.defaultDosageUnit;
        drugName = drug.name;
      },
    );

    scheduleResult.fold(
      (_) {
        emit(
          ScheduleEditorEditing(
            drugId: drugId,
            isNew: true,
            drugName: drugName,
            startDate: DateTime.now(),
            administrationRoute: drugRoute,
            dosageUnit: drugUnit,
          ),
        );
      },
      (schedule) {
        if (schedule != null) {
          initEdit(schedule, drugName: drugName);
          return;
        }

        emit(
          ScheduleEditorEditing(
            drugId: drugId,
            isNew: true,
            drugName: drugName,
            startDate: DateTime.now(),
            administrationRoute: drugRoute,
            dosageUnit: drugUnit,
          ),
        );
      },
    );
  }

  /// Initialises the editor from [schedule] for editing.
  ///
  /// When [drugName] is provided it is shown in the editor header card.
  void initEdit(MedicationSchedule schedule, {String? drugName}) {
    emit(
      ScheduleEditorEditing(
        drugId: schedule.drugId,
        isNew: false,
        existingId: schedule.id,
        drugName: drugName,
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
          message: 'validationFieldsIncomplete',
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
      frequencyError:
          s.frequency == null ? 'validationFrequencyRequired' : null,
      startDateError:
          s.startDate == null ? 'validationStartDateRequired' : null,
      scheduleTimesError: _validateScheduleTimes(s),
    );
  }

  String? _validateDosage(ScheduleEditorEditing s) {
    if (s.dosageAmount == null || s.dosageAmount! <= 0) {
      return 'validationDosageRequired';
    }
    if (s.dosageUnit == null) return 'validationUnitRequired';
    return null;
  }

  String? _validateScheduleTimes(ScheduleEditorEditing s) {
    final route = s.administrationRoute;
    if (route == null) return null;
    if (route.supportsScheduleTimes && s.scheduleTimes.isEmpty) {
      return 'validationScheduleTimeRequired';
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
      id: s.existingId ?? IdGenerator.generate(),
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
}
