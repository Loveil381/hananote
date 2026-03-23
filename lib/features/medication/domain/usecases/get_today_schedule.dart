import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// A medication item due today with completion state.
class TodayScheduleItem {
  /// Creates a [TodayScheduleItem].
  const TodayScheduleItem({
    required this.drug,
    required this.schedule,
    required this.logs,
    required this.scheduledDateTimes,
    required this.isCompleted,
  });

  /// Drug definition.
  final Drug drug;

  /// Active schedule.
  final MedicationSchedule schedule;

  /// Logs recorded today.
  final List<MedicationLog> logs;

  /// Scheduled date-times for today.
  final List<DateTime> scheduledDateTimes;

  /// Whether the due doses for today are complete.
  final bool isCompleted;

  /// Completed logs counted toward adherence for today.
  int get completedCount => logs
      .where(
        (log) => log.status == LogStatus.taken || log.status == LogStatus.late,
      )
      .length;
}

/// Returns all due medication items for a given day.
class GetTodaySchedule {
  /// Creates a [GetTodaySchedule] use case.
  GetTodaySchedule(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<TodayScheduleItem>>> call({
    DateTime? date,
  }) async {
    final targetDate = date ?? DateTime.now();
    final drugsResult = await _repository.getAllDrugs();
    if (drugsResult.isLeft()) {
      return drugsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final drugs =
        drugsResult.getOrElse((_) => <Drug>[]).where((drug) => drug.isActive);
    final startOfDay =
        DateTime(targetDate.year, targetDate.month, targetDate.day);
    final endOfDay = startOfDay
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));
    final items = <TodayScheduleItem>[];

    for (final drug in drugs) {
      final scheduleResult = await _repository.getScheduleForDrug(drug.id);
      if (scheduleResult.isLeft()) {
        return scheduleResult.fold(
          left,
          (_) => throw StateError('unreachable'),
        );
      }

      final schedule = scheduleResult.getOrElse((_) => null);
      if (schedule == null ||
          !schedule.isActive ||
          !_isScheduleApplicable(schedule, targetDate)) {
        continue;
      }

      final logsResult = await _repository.getLogsForDrug(
        drug.id,
        from: startOfDay,
        to: endOfDay,
      );
      if (logsResult.isLeft()) {
        return logsResult.fold(left, (_) => throw StateError('unreachable'));
      }

      final logs = logsResult
          .getOrElse((_) => <MedicationLog>[])
          .where((log) => log.scheduleId == schedule.id)
          .toList()
        ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

      final completedCount = logs
          .where(
            (log) =>
                log.status == LogStatus.taken || log.status == LogStatus.late,
          )
          .length;

      items.add(
        TodayScheduleItem(
          drug: drug,
          schedule: schedule,
          logs: logs,
          scheduledDateTimes: _scheduledTimesForDay(schedule, targetDate),
          isCompleted: completedCount >= _requiredCountForDay(schedule),
        ),
      );
    }

    return right(items);
  }

  bool _isScheduleApplicable(MedicationSchedule schedule, DateTime date) {
    if (!_isWithinActiveRange(schedule, date)) {
      return false;
    }

    final targetDate = _dateOnly(date);
    final startDate = _dateOnly(schedule.startDate);

    return switch (schedule.frequency) {
      DailyMedicationFrequency() => true,
      EveryNDaysMedicationFrequency(:final days) =>
        targetDate.difference(startDate).inDays % days == 0,
      WeeklyMedicationFrequency(:final dayOfWeek) =>
        targetDate.weekday == dayOfWeek,
      CustomMedicationFrequency() => true,
    };
  }

  bool _isWithinActiveRange(MedicationSchedule schedule, DateTime date) {
    final targetDate = _dateOnly(date);
    final startDate = _dateOnly(schedule.startDate);
    if (targetDate.isBefore(startDate)) {
      return false;
    }

    final endDate =
        schedule.endDate == null ? null : _dateOnly(schedule.endDate!);
    return endDate == null || !targetDate.isAfter(endDate);
  }

  List<DateTime> _scheduledTimesForDay(
    MedicationSchedule schedule,
    DateTime date,
  ) {
    if (schedule.scheduleTimes.isEmpty) {
      return <DateTime>[];
    }

    return schedule.scheduleTimes
        .map(
          (time) => DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          ),
        )
        .toList()
      ..sort();
  }

  int _requiredCountForDay(MedicationSchedule schedule) {
    return switch (schedule.frequency) {
      DailyMedicationFrequency(:final timesPerDay) => timesPerDay,
      EveryNDaysMedicationFrequency() ||
      WeeklyMedicationFrequency() ||
      CustomMedicationFrequency() =>
        1,
    };
  }

  DateTime _dateOnly(DateTime value) =>
      DateTime(value.year, value.month, value.day);
}
