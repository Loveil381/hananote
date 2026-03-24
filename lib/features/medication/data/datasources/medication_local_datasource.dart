import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/medication/data/models/drug_inventory_model.dart';
import 'package:hananote/features/medication/data/models/drug_model.dart';
import 'package:hananote/features/medication/data/models/medication_log_model.dart';
import 'package:hananote/features/medication/data/models/medication_schedule_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Direct database operations for medication data.
///
/// No business logic lives here; this layer performs CRUD only.
abstract interface class MedicationLocalDataSource {
  /// Returns all stored drugs.
  Future<List<DrugModel>> getAllDrugs();

  /// Returns a single drug by [id], if present.
  Future<DrugModel?> getDrugById(String id);

  /// Inserts a new [drug].
  Future<void> insertDrug(DrugModel drug);

  /// Updates an existing [drug].
  Future<void> updateDrug(DrugModel drug);

  /// Deletes the drug with [id].
  Future<void> deleteDrug(String id);

  /// Returns the active or latest schedule for [drugId], if present.
  Future<MedicationScheduleModel?> getScheduleForDrug(String drugId);

  /// Inserts a new [schedule].
  Future<void> insertSchedule(MedicationScheduleModel schedule);

  /// Updates an existing [schedule].
  Future<void> updateSchedule(MedicationScheduleModel schedule);

  /// Deletes the schedule with [id].
  Future<void> deleteSchedule(String id);

  /// Inserts a medication [log].
  Future<void> insertLog(MedicationLogModel log);

  /// Returns logs for [drugId] in the optional date range.
  Future<List<MedicationLogModel>> getLogsForDrug(
    String drugId, {
    DateTime? from,
    DateTime? to,
  });

  /// Returns all logs recorded on [date].
  Future<List<MedicationLogModel>> getLogsForDate(DateTime date);

  /// Returns the inventory for [drugId], if present.
  Future<DrugInventoryModel?> getInventoryForDrug(String drugId);

  /// Inserts or replaces [inventory] for its drug.
  Future<void> upsertInventory(DrugInventoryModel inventory);
}

/// Default SQLite-backed implementation of [MedicationLocalDataSource].
@LazySingleton(as: MedicationLocalDataSource)
class MedicationLocalDataSourceImpl implements MedicationLocalDataSource {
  /// Creates a [MedicationLocalDataSourceImpl].
  MedicationLocalDataSourceImpl(this._secureDatabase);

  final SecureDatabase _secureDatabase;

  Database get _db => _secureDatabase.database;

  @override
  Future<List<DrugModel>> getAllDrugs() async {
    final rows = await _db.query('drugs', orderBy: 'created_at DESC');
    return rows.map(DrugModel.fromJson).toList();
  }

  @override
  Future<DrugModel?> getDrugById(String id) async {
    final rows = await _db.query(
      'drugs',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return DrugModel.fromJson(rows.first);
  }

  @override
  Future<void> insertDrug(DrugModel drug) async {
    await _db.insert('drugs', drug.toJson());
  }

  @override
  Future<void> updateDrug(DrugModel drug) async {
    await _db.update(
      'drugs',
      drug.toJson(),
      where: 'id = ?',
      whereArgs: [drug.id],
    );
  }

  @override
  Future<void> deleteDrug(String id) async {
    await _db.delete('drugs', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<MedicationScheduleModel?> getScheduleForDrug(String drugId) async {
    final rows = await _db.query(
      'medication_schedules',
      where: 'drug_id = ?',
      whereArgs: [drugId],
      orderBy: 'is_active DESC, start_date DESC',
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return MedicationScheduleModel.fromJson(rows.first);
  }

  @override
  Future<void> insertSchedule(MedicationScheduleModel schedule) async {
    await _db.insert('medication_schedules', schedule.toJson());
  }

  @override
  Future<void> updateSchedule(MedicationScheduleModel schedule) async {
    await _db.update(
      'medication_schedules',
      schedule.toJson(),
      where: 'id = ?',
      whereArgs: [schedule.id],
    );
  }

  @override
  Future<void> deleteSchedule(String id) async {
    await _db.delete(
      'medication_schedules',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> insertLog(MedicationLogModel log) async {
    await _db.insert('medication_logs', log.toJson());
  }

  @override
  Future<List<MedicationLogModel>> getLogsForDrug(
    String drugId, {
    DateTime? from,
    DateTime? to,
  }) async {
    final clauses = <String>['drug_id = ?'];
    final args = <Object?>[drugId];

    if (from != null) {
      clauses.add('timestamp >= ?');
      args.add(from.toIso8601String());
    }
    if (to != null) {
      clauses.add('timestamp <= ?');
      args.add(to.toIso8601String());
    }

    final rows = await _db.query(
      'medication_logs',
      where: clauses.join(' AND '),
      whereArgs: args,
      orderBy: 'timestamp DESC',
    );
    return rows.map(MedicationLogModel.fromJson).toList();
  }

  @override
  Future<List<MedicationLogModel>> getLogsForDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start
        .add(const Duration(days: 1))
        .subtract(const Duration(microseconds: 1));

    final rows = await _db.query(
      'medication_logs',
      where: 'timestamp >= ? AND timestamp <= ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'timestamp DESC',
    );
    return rows.map(MedicationLogModel.fromJson).toList();
  }

  @override
  Future<DrugInventoryModel?> getInventoryForDrug(String drugId) async {
    final rows = await _db.query(
      'drug_inventory',
      where: 'drug_id = ?',
      whereArgs: [drugId],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }
    return DrugInventoryModel.fromJson(rows.first);
  }

  @override
  Future<void> upsertInventory(DrugInventoryModel inventory) async {
    await _db.insert(
      'drug_inventory',
      inventory.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
