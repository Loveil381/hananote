import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

part 'today_schedule_event.freezed.dart';

/// All events handled by [TodayScheduleBloc].
@freezed
sealed class TodayScheduleEvent with _$TodayScheduleEvent {
  /// Requests the schedule for the given [date] (defaults to today).
  const factory TodayScheduleEvent.load({
    DateTime? date,
  }) = LoadTodaySchedule;

  /// Records a taken (or late) dose.
  const factory TodayScheduleEvent.logDose({
    required MedicationSchedule schedule,
    required Drug drug,
    InjectionSite? injectionSite,
    PatchSite? patchSite,
    int? patchCount,
    int? gelPumps,
    SkinReaction? skinReaction,
    String? notes,
  }) = LogDoseTodaySchedule;

  /// Records a skipped dose for [schedule].
  const factory TodayScheduleEvent.skipDose({
    required MedicationSchedule schedule,
    required Drug drug,
    String? notes,
  }) = SkipDoseTodaySchedule;
}
