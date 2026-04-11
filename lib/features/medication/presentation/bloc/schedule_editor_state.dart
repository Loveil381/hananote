import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

/// Validation result for schedule editor fields.
class ScheduleValidationResult {
  /// Creates a [ScheduleValidationResult].
  const ScheduleValidationResult({
    this.dosageError,
    this.frequencyError,
    this.startDateError,
    this.scheduleTimesError,
  });

  /// Error message for the dosage amount field.
  final String? dosageError;

  /// Error message for the frequency field.
  final String? frequencyError;

  /// Error message for the start date field.
  final String? startDateError;

  /// Error message for the schedule times field.
  final String? scheduleTimesError;

  /// Whether all fields are valid.
  bool get isValid =>
      dosageError == null &&
      frequencyError == null &&
      startDateError == null &&
      scheduleTimesError == null;
}

/// Base class for schedule editor states.
sealed class ScheduleEditorState {
  const ScheduleEditorState();
}

/// Not yet initialized.
final class ScheduleEditorIdle extends ScheduleEditorState {
  /// Creates a [ScheduleEditorIdle].
  const ScheduleEditorIdle();
}

/// Actively editing a new or existing schedule.
final class ScheduleEditorEditing extends ScheduleEditorState {
  /// Creates a [ScheduleEditorEditing].
  const ScheduleEditorEditing({
    required this.drugId,
    required this.isNew,
    this.existingId,
    this.drugName,
    this.dosageAmount,
    this.dosageUnit,
    this.frequency,
    this.administrationRoute,
    this.startDate,
    this.endDate,
    this.scheduleTimes = const <TimeOfDay>[],
    this.notes,
    this.validation,
  });

  /// Drug this schedule belongs to.
  final String drugId;

  /// Display name of the drug (for UI context).
  final String? drugName;

  /// True when creating a new schedule.
  final bool isNew;

  /// ID of the schedule being edited (null when creating).
  final String? existingId;

  /// Dosage amount field.
  final double? dosageAmount;

  /// Dosage unit field.
  final DosageUnit? dosageUnit;

  /// Frequency field.
  final MedicationFrequency? frequency;

  /// Administration route field.
  final AdministrationRoute? administrationRoute;

  /// Start date field.
  final DateTime? startDate;

  /// Optional end date.
  final DateTime? endDate;

  /// Scheduled times of day.
  final List<TimeOfDay> scheduleTimes;

  /// Optional notes.
  final String? notes;

  /// Validation result from the last `validate` call.
  final ScheduleValidationResult? validation;

  /// Returns a copy with the given fields replaced.
  ScheduleEditorEditing copyWith({
    String? drugName,
    double? dosageAmount,
    DosageUnit? dosageUnit,
    MedicationFrequency? frequency,
    AdministrationRoute? administrationRoute,
    DateTime? startDate,
    DateTime? endDate,
    List<TimeOfDay>? scheduleTimes,
    String? notes,
    ScheduleValidationResult? validation,
  }) {
    return ScheduleEditorEditing(
      drugId: drugId,
      isNew: isNew,
      existingId: existingId,
      drugName: drugName ?? this.drugName,
      dosageAmount: dosageAmount ?? this.dosageAmount,
      dosageUnit: dosageUnit ?? this.dosageUnit,
      frequency: frequency ?? this.frequency,
      administrationRoute: administrationRoute ?? this.administrationRoute,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      scheduleTimes: scheduleTimes ?? this.scheduleTimes,
      notes: notes ?? this.notes,
      validation: validation ?? this.validation,
    );
  }
}

/// Persisting the schedule.
final class ScheduleEditorSaving extends ScheduleEditorState {
  /// Creates a [ScheduleEditorSaving].
  const ScheduleEditorSaving();
}

/// Schedule was persisted successfully.
final class ScheduleEditorSaved extends ScheduleEditorState {
  /// Creates a [ScheduleEditorSaved].
  const ScheduleEditorSaved({required this.schedule});

  /// The persisted schedule.
  final MedicationSchedule schedule;
}

/// Failed to save.
final class ScheduleEditorError extends ScheduleEditorState {
  /// Creates a [ScheduleEditorError].
  const ScheduleEditorError({required this.message});

  /// Human-readable error message.
  final String message;
}
