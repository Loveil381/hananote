import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/utils/id_generator.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:hananote/features/medication/domain/usecases/log_medication.dart';
import 'package:hananote/features/medication/domain/usecases/sync_medication_reminders.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:injectable/injectable.dart';

/// Manages the daily medication schedule for a given date.
///
/// Handles loading, dose logging, and dose skipping. Every mutation
/// triggers a reload so the UI always reflects persisted state.
@injectable
class TodayScheduleBloc extends Bloc<TodayScheduleEvent, TodayScheduleState> {
  /// Creates a [TodayScheduleBloc].
  TodayScheduleBloc(
    this._getTodaySchedule,
    this._logMedication,
    this._syncMedicationReminders,
  ) : super(const TodayScheduleState.initial()) {
    on<LoadTodaySchedule>(_onLoad);
    on<LogDoseTodaySchedule>(_onLogDose);
    on<SkipDoseTodaySchedule>(_onSkipDose);
  }

  final GetTodaySchedule _getTodaySchedule;
  final LogMedication _logMedication;
  final SyncMedicationReminders _syncMedicationReminders;

  /// The date currently displayed; used for reload after mutations.
  DateTime? _currentDate;

  Future<void> _onLoad(
    LoadTodaySchedule event,
    Emitter<TodayScheduleState> emit,
  ) async {
    _currentDate = event.date ?? DateTime.now();
    emit(const TodayScheduleState.loading());
    final result = await _getTodaySchedule(date: _currentDate);
    result.fold(
      (failure) =>
          emit(TodayScheduleState.error(message: failureMessage(failure))),
      (items) {
        final completed = items.where((i) => i.isCompleted).length;
        emit(
          TodayScheduleState.loaded(
            items: items,
            date: _currentDate!,
            completedCount: completed,
            totalCount: items.length,
          ),
        );
        unawaited(_syncReminders());
      },
    );
  }

  Future<void> _onLogDose(
    LogDoseTodaySchedule event,
    Emitter<TodayScheduleState> emit,
  ) async {
    final now = DateTime.now();
    final isLate = _isDoseLate(
      event.schedule,
      now,
      scheduledAt: event.scheduledDateTime,
    );
    final log = MedicationLog(
      id: IdGenerator.generate(),
      scheduleId: event.schedule.id,
      drugId: event.drug.id,
      timestamp: now,
      dosageAmount: event.schedule.dosageAmount,
      dosageUnit: event.schedule.dosageUnit,
      administrationRoute: event.schedule.administrationRoute,
      status: isLate ? LogStatus.late : LogStatus.taken,
      injectionSite: event.injectionSite,
      patchSite: event.patchSite,
      patchCount: event.patchCount,
      gelPumps: event.gelPumps,
      skinReaction: event.skinReaction,
      notes: event.notes,
    );
    final result = await _logMedication(log);
    await result.fold(
      (failure) async =>
          emit(TodayScheduleState.error(message: failureMessage(failure))),
      (_) async => _reload(emit),
    );
  }

  Future<void> _onSkipDose(
    SkipDoseTodaySchedule event,
    Emitter<TodayScheduleState> emit,
  ) async {
    final log = MedicationLog(
      id: IdGenerator.generate(),
      scheduleId: event.schedule.id,
      drugId: event.drug.id,
      timestamp: DateTime.now(),
      dosageAmount: 0,
      dosageUnit: event.schedule.dosageUnit,
      administrationRoute: event.schedule.administrationRoute,
      status: LogStatus.skipped,
      notes: event.notes,
    );
    final result = await _logMedication(log);
    await result.fold(
      (failure) async =>
          emit(TodayScheduleState.error(message: failureMessage(failure))),
      (_) async => _reload(emit),
    );
  }

  Future<void> _reload(Emitter<TodayScheduleState> emit) =>
      _onLoad(LoadTodaySchedule(date: _currentDate), emit);

  Future<void> _syncReminders() async {
    await _syncMedicationReminders();
  }

  /// Returns true when [now] is past the scheduled dose time.
  bool _isDoseLate(
    MedicationSchedule schedule,
    DateTime now, {
    DateTime? scheduledAt,
  }) {
    if (scheduledAt != null) {
      return now.isAfter(scheduledAt);
    }

    if (schedule.scheduleTimes.isEmpty) return false;
    final last = schedule.scheduleTimes.reduce(
      (a, b) => (a.hour * 60 + a.minute) > (b.hour * 60 + b.minute) ? a : b,
    );
    return now.hour > last.hour ||
        (now.hour == last.hour && now.minute > last.minute);
  }
}
