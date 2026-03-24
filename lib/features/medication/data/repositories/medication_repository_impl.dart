import 'dart:math';

import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/data/datasources/medication_local_datasource.dart';
import 'package:hananote/features/medication/data/models/drug_inventory_model.dart';
import 'package:hananote/features/medication/data/models/drug_model.dart';
import 'package:hananote/features/medication/data/models/medication_log_model.dart';
import 'package:hananote/features/medication/data/models/medication_schedule_model.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation backed by a local SQLCipher datasource.
@LazySingleton(as: MedicationRepository)
class MedicationRepositoryImpl implements MedicationRepository {
  /// Creates a [MedicationRepositoryImpl].
  MedicationRepositoryImpl(this._localDataSource);

  final MedicationLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Drug>>> getAllDrugs() {
    return _guard(() async {
      final models = await _localDataSource.getAllDrugs();
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, Drug>> getDrugById(String id) {
    return _guard(() async {
      final model = await _localDataSource.getDrugById(id);
      if (model == null) {
        throw StateError('Drug not found: $id');
      }
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, Drug>> addDrug(Drug drug) {
    return _guard(() async {
      final model = DrugModel.fromDomain(drug);
      await _localDataSource.insertDrug(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, Drug>> updateDrug(Drug drug) {
    return _guard(() async {
      final model = DrugModel.fromDomain(drug);
      await _localDataSource.updateDrug(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteDrug(String id) {
    return _guard(() => _localDataSource.deleteDrug(id));
  }

  @override
  Future<Either<Failure, MedicationSchedule?>> getScheduleForDrug(
    String drugId,
  ) {
    return _guard(() async {
      final model = await _localDataSource.getScheduleForDrug(drugId);
      return model?.toDomain();
    });
  }

  @override
  Future<Either<Failure, MedicationSchedule>> addSchedule(
    MedicationSchedule schedule,
  ) {
    return _guard(() async {
      final model = MedicationScheduleModel.fromDomain(schedule);
      await _localDataSource.insertSchedule(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, MedicationSchedule>> updateSchedule(
    MedicationSchedule schedule,
  ) {
    return _guard(() async {
      final model = MedicationScheduleModel.fromDomain(schedule);
      await _localDataSource.updateSchedule(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteSchedule(String id) {
    return _guard(() => _localDataSource.deleteSchedule(id));
  }

  @override
  Future<Either<Failure, MedicationLog>> addLog(MedicationLog log) {
    return _guard(() async {
      final model = MedicationLogModel.fromDomain(log);
      await _localDataSource.insertLog(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, List<MedicationLog>>> getLogsForDrug(
    String drugId, {
    DateTime? from,
    DateTime? to,
  }) {
    return _guard(() async {
      final models = await _localDataSource.getLogsForDrug(
        drugId,
        from: from,
        to: to,
      );
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, List<MedicationLog>>> getLogsForDate(DateTime date) {
    return _guard(() async {
      final models = await _localDataSource.getLogsForDate(date);
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, double>> getAdherenceRate(
    String drugId, {
    required DateTime from,
    required DateTime to,
  }) {
    return _guard(() async {
      final scheduleModel = await _localDataSource.getScheduleForDrug(drugId);
      if (scheduleModel == null) {
        return 0;
      }

      final schedule = scheduleModel.toDomain();
      final effectiveRange = _effectiveScheduleRange(
        schedule: schedule,
        from: from,
        to: to,
      );
      if (effectiveRange == null) {
        return 0;
      }

      final expected = _expectedDoseCount(
        schedule: schedule,
        from: effectiveRange.start,
        to: effectiveRange.end,
      );
      if (expected == 0) {
        return 0;
      }

      final logs = await _localDataSource.getLogsForDrug(
        drugId,
        from: from,
        to: to,
      );
      final actual = logs
          .map((model) => model.toDomain())
          .where(
            (log) =>
                log.scheduleId == schedule.id &&
                (log.status == LogStatus.taken || log.status == LogStatus.late),
          )
          .length;

      return min(actual / expected, 1);
    });
  }

  @override
  Future<Either<Failure, DrugInventory?>> getInventoryForDrug(String drugId) {
    return _guard(() async {
      final model = await _localDataSource.getInventoryForDrug(drugId);
      return model?.toDomain();
    });
  }

  @override
  Future<Either<Failure, DrugInventory>> updateInventory(
    DrugInventory inventory,
  ) {
    return _guard(() async {
      final model = DrugInventoryModel.fromDomain(inventory);
      await _localDataSource.upsertInventory(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, int?>> getDaysUntilEmpty(String drugId) {
    return _guard(() async {
      final inventoryModel = await _localDataSource.getInventoryForDrug(drugId);
      final scheduleModel = await _localDataSource.getScheduleForDrug(drugId);
      if (inventoryModel == null || scheduleModel == null) {
        return null;
      }

      final inventory = inventoryModel.toDomain();
      final schedule = scheduleModel.toDomain();
      if (inventory.unit != schedule.dosageUnit) {
        return null;
      }

      final dailyConsumption = _dailyConsumption(schedule);
      if (dailyConsumption == null || dailyConsumption <= 0) {
        return null;
      }

      return (inventory.quantity / dailyConsumption).floor();
    });
  }

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return right(await action());
    } catch (error) {
      return left(Failure.database(message: error.toString()));
    }
  }

  ({DateTime start, DateTime end})? _effectiveScheduleRange({
    required MedicationSchedule schedule,
    required DateTime from,
    required DateTime to,
  }) {
    final start = schedule.startDate.isAfter(from) ? schedule.startDate : from;
    final scheduleEnd = schedule.endDate;
    final end =
        scheduleEnd != null && scheduleEnd.isBefore(to) ? scheduleEnd : to;

    if (end.isBefore(start)) {
      return null;
    }

    return (start: start, end: end);
  }

  int _expectedDoseCount({
    required MedicationSchedule schedule,
    required DateTime from,
    required DateTime to,
  }) {
    return switch (schedule.frequency) {
      DailyMedicationFrequency(:final timesPerDay) => _countDailyOccurrences(
          schedule: schedule,
          from: from,
          to: to,
          timesPerDay: timesPerDay,
        ),
      EveryNDaysMedicationFrequency(:final days) => _countEveryNDaysOccurrences(
          schedule: schedule,
          from: from,
          to: to,
          intervalDays: days,
        ),
      WeeklyMedicationFrequency(:final dayOfWeek) => _countWeeklyOccurrences(
          schedule: schedule,
          from: from,
          to: to,
          dayOfWeek: dayOfWeek,
        ),
      CustomMedicationFrequency() => 0,
    };
  }

  int _countDailyOccurrences({
    required MedicationSchedule schedule,
    required DateTime from,
    required DateTime to,
    required int timesPerDay,
  }) {
    if (schedule.scheduleTimes.isEmpty) {
      final totalDays = _inclusiveDaySpan(from, to);
      return totalDays * timesPerDay;
    }

    var count = 0;
    var cursor = DateTime(from.year, from.month, from.day);
    final lastDay = DateTime(to.year, to.month, to.day);
    while (!cursor.isAfter(lastDay)) {
      for (final time in schedule.scheduleTimes) {
        final candidate = DateTime(
          cursor.year,
          cursor.month,
          cursor.day,
          time.hour,
          time.minute,
        );
        if (!candidate.isBefore(from) && !candidate.isAfter(to)) {
          count++;
        }
      }
      cursor = cursor.add(const Duration(days: 1));
    }
    return count;
  }

  int _countEveryNDaysOccurrences({
    required MedicationSchedule schedule,
    required DateTime from,
    required DateTime to,
    required int intervalDays,
  }) {
    var count = 0;
    var cursor = schedule.startDate;
    while (!cursor.isAfter(to)) {
      if (!cursor.isBefore(from)) {
        count++;
      }
      cursor = cursor.add(Duration(days: intervalDays));
    }
    return count;
  }

  int _countWeeklyOccurrences({
    required MedicationSchedule schedule,
    required DateTime from,
    required DateTime to,
    required int dayOfWeek,
  }) {
    final scheduledTime = schedule.scheduleTimes.isNotEmpty
        ? schedule.scheduleTimes.first
        : TimeOfDay(
            hour: schedule.startDate.hour,
            minute: schedule.startDate.minute,
          );

    var cursor = schedule.startDate;
    while (cursor.weekday != dayOfWeek) {
      cursor = cursor.add(const Duration(days: 1));
    }
    cursor = DateTime(
      cursor.year,
      cursor.month,
      cursor.day,
      scheduledTime.hour,
      scheduledTime.minute,
    );

    var count = 0;
    while (!cursor.isAfter(to)) {
      if (!cursor.isBefore(from)) {
        count++;
      }
      cursor = cursor.add(const Duration(days: 7));
    }
    return count;
  }

  int _inclusiveDaySpan(DateTime from, DateTime to) {
    final start = DateTime(from.year, from.month, from.day);
    final end = DateTime(to.year, to.month, to.day);
    return end.difference(start).inDays + 1;
  }

  double? _dailyConsumption(MedicationSchedule schedule) {
    return switch (schedule.frequency) {
      DailyMedicationFrequency(:final timesPerDay) =>
        schedule.dosageAmount * timesPerDay,
      EveryNDaysMedicationFrequency(:final days) =>
        schedule.dosageAmount / days,
      WeeklyMedicationFrequency() => schedule.dosageAmount / 7,
      CustomMedicationFrequency() => null,
    };
  }
}
