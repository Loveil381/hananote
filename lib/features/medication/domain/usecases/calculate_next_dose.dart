import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Calculates the next due date-time for a medication schedule.
class CalculateNextDose {
  /// Creates a [CalculateNextDose] use case.
  CalculateNextDose(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, DateTime?>> call(
    MedicationSchedule schedule, {
    DateTime? referenceTime,
  }) async {
    final now = referenceTime ?? DateTime.now();
    final logsResult = await _repository.getLogsForDrug(
      schedule.drugId,
      from: schedule.startDate,
      to: schedule.endDate,
    );
    if (logsResult.isLeft()) {
      return logsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final latestLog = _latestRelevantLog(
      schedule.id,
      logsResult.getOrElse((_) => <MedicationLog>[]),
    );
    final effectiveReference = _laterOf(now, latestLog?.timestamp);

    final nextDose = switch (schedule.frequency) {
      DailyMedicationFrequency() =>
        _nextDailyDose(schedule, effectiveReference),
      EveryNDaysMedicationFrequency(:final days) =>
        _nextEveryNDaysDose(schedule, effectiveReference, days),
      WeeklyMedicationFrequency(:final dayOfWeek) =>
        _nextWeeklyDose(schedule, effectiveReference, dayOfWeek),
      CustomMedicationFrequency() => null,
    };

    if (nextDose == null) {
      return right(null);
    }

    final endDate = schedule.endDate;
    if (endDate != null && nextDose.isAfter(endDate)) {
      return right(null);
    }

    return right(nextDose);
  }

  MedicationLog? _latestRelevantLog(
    String scheduleId,
    List<MedicationLog> logs,
  ) {
    final matchingLogs = logs
        .where((log) => log.scheduleId == scheduleId)
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return matchingLogs.isEmpty ? null : matchingLogs.first;
  }

  DateTime _laterOf(DateTime first, DateTime? second) {
    if (second == null || first.isAfter(second)) {
      return first;
    }
    return second;
  }

  DateTime? _nextDailyDose(MedicationSchedule schedule, DateTime reference) {
    if (schedule.scheduleTimes.isNotEmpty) {
      final candidateDays = <DateTime>[
        DateTime(reference.year, reference.month, reference.day),
        DateTime(reference.year, reference.month, reference.day)
            .add(const Duration(days: 1)),
      ];

      for (final day in candidateDays) {
        if (_dateOnly(day).isBefore(_dateOnly(schedule.startDate))) {
          continue;
        }

        final candidates = schedule.scheduleTimes
            .map(
              (time) => DateTime(
                day.year,
                day.month,
                day.day,
                time.hour,
                time.minute,
              ),
            )
            .where((candidate) => candidate.isAfter(reference))
            .toList()
          ..sort();

        if (candidates.isNotEmpty) {
          return candidates.first;
        }
      }
    }

    final timesPerDay = switch (schedule.frequency) {
      DailyMedicationFrequency(:final timesPerDay) => timesPerDay,
      _ => 1,
    };
    final intervalMinutes = (Duration.minutesPerDay / timesPerDay).round();
    final base =
        reference.isBefore(schedule.startDate) ? schedule.startDate : reference;
    return base.add(Duration(minutes: intervalMinutes));
  }

  DateTime _nextEveryNDaysDose(
    MedicationSchedule schedule,
    DateTime reference,
    int days,
  ) {
    var candidate = schedule.startDate;
    while (!candidate.isAfter(reference)) {
      candidate = candidate.add(Duration(days: days));
    }
    return candidate;
  }

  DateTime _nextWeeklyDose(
    MedicationSchedule schedule,
    DateTime reference,
    int dayOfWeek,
  ) {
    final scheduleTime = schedule.scheduleTimes.isNotEmpty
        ? schedule.scheduleTimes.first
        : TimeOfDay(
            hour: schedule.startDate.hour,
            minute: schedule.startDate.minute,
          );

    var candidate = DateTime(
      reference.year,
      reference.month,
      reference.day,
      scheduleTime.hour,
      scheduleTime.minute,
    );

    while (candidate.weekday != dayOfWeek || !candidate.isAfter(reference)) {
      candidate = candidate.add(const Duration(days: 1));
      candidate = DateTime(
        candidate.year,
        candidate.month,
        candidate.day,
        scheduleTime.hour,
        scheduleTime.minute,
      );
    }

    if (candidate.isBefore(schedule.startDate)) {
      candidate = schedule.startDate;
      while (candidate.weekday != dayOfWeek) {
        candidate = candidate.add(const Duration(days: 1));
      }
      candidate = DateTime(
        candidate.year,
        candidate.month,
        candidate.day,
        scheduleTime.hour,
        scheduleTime.minute,
      );
    }

    return candidate;
  }

  DateTime _dateOnly(DateTime value) =>
      DateTime(value.year, value.month, value.day);
}
