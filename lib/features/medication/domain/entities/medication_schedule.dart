import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'medication_schedule.freezed.dart';

/// A lightweight time-of-day value object for the pure Dart domain layer.
@freezed
class TimeOfDay with _$TimeOfDay {
  /// Creates a [TimeOfDay].
  @Assert('hour >= 0 && hour < 24', 'hour must be between 0 and 23')
  @Assert('minute >= 0 && minute < 60', 'minute must be between 0 and 59')
  const factory TimeOfDay({
    required int hour,
    required int minute,
  }) = _TimeOfDay;
}

/// The recurrence model for a medication schedule.
@freezed
sealed class MedicationFrequency with _$MedicationFrequency {
  /// Creates a daily schedule.
  @Assert('timesPerDay > 0', 'timesPerDay must be positive')
  const factory MedicationFrequency.daily({required int timesPerDay}) =
      DailyMedicationFrequency;

  /// Creates an every-N-days schedule.
  @Assert('days > 0', 'days must be positive')
  const factory MedicationFrequency.everyNDays({required int days}) =
      EveryNDaysMedicationFrequency;

  /// Creates a weekly schedule.
  @Assert(
    'dayOfWeek >= DateTime.monday && dayOfWeek <= DateTime.sunday',
    'dayOfWeek must be between 1 and 7',
  )
  const factory MedicationFrequency.weekly({required int dayOfWeek}) =
      WeeklyMedicationFrequency;

  /// Creates a custom schedule with a free-form description.
  const factory MedicationFrequency.custom({
    required String description,
  }) = CustomMedicationFrequency;
}

/// Helpers for working with [MedicationFrequency].
extension MedicationFrequencyX on MedicationFrequency {
  /// Returns the frequency type.
  MedicationFrequencyType get type => switch (this) {
        DailyMedicationFrequency() => MedicationFrequencyType.daily,
        EveryNDaysMedicationFrequency() => MedicationFrequencyType.everyNDays,
        WeeklyMedicationFrequency() => MedicationFrequencyType.weekly,
        CustomMedicationFrequency() => MedicationFrequencyType.custom,
      };
}

/// An active or historical dosing plan for a medication.
@freezed
class MedicationSchedule with _$MedicationSchedule {
  /// Creates a [MedicationSchedule].
  @Assert('dosageAmount > 0', 'dosageAmount must be positive')
  const factory MedicationSchedule({
    required String id,
    required String drugId,
    required double dosageAmount,
    required DosageUnit dosageUnit,
    required MedicationFrequency frequency,
    required AdministrationRoute administrationRoute,
    required DateTime startDate,
    required bool isActive,
    @Default(<TimeOfDay>[]) List<TimeOfDay> scheduleTimes,
    int? intervalDays,
    DateTime? endDate,
    String? notes,
  }) = _MedicationSchedule;
}
