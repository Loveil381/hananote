import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/measurement/data/models/measurement_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Direct database operations for body measurement data.
abstract interface class MeasurementLocalDataSource {
  /// Saves [entry] using an upsert strategy.
  Future<void> save(MeasurementModel entry);

  /// Returns all stored measurements.
  Future<List<MeasurementModel>> getAll();

  /// Returns the latest measurement entry, if present.
  Future<MeasurementModel?> getLatest();

  /// Returns entries within the inclusive date range.
  Future<List<MeasurementModel>> getByDateRange(DateTime from, DateTime to);

  /// Deletes the entry with [id].
  Future<void> delete(String id);
}

/// SQLite-backed implementation of [MeasurementLocalDataSource].
@LazySingleton(as: MeasurementLocalDataSource)
class MeasurementLocalDataSourceImpl implements MeasurementLocalDataSource {
  /// Creates a [MeasurementLocalDataSourceImpl].
  MeasurementLocalDataSourceImpl(this._secureDatabase);

  final SecureDatabase _secureDatabase;

  Database get _db => _secureDatabase.database;

  @override
  Future<void> save(MeasurementModel entry) async {
    await _db.insert(
      'measurements',
      entry.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<MeasurementModel>> getAll() async {
    final rows = await _db.query(
      'measurements',
      orderBy: 'date DESC, created_at DESC',
    );

    return rows
        .map(
          (row) => MeasurementModel.fromJson(Map<String, dynamic>.from(row)),
        )
        .toList();
  }

  @override
  Future<MeasurementModel?> getLatest() async {
    final rows = await _db.query(
      'measurements',
      orderBy: 'date DESC, created_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }

    return MeasurementModel.fromJson(Map<String, dynamic>.from(rows.first));
  }

  @override
  Future<List<MeasurementModel>> getByDateRange(
    DateTime from,
    DateTime to,
  ) async {
    final rows = await _db.query(
      'measurements',
      where: 'date >= ? AND date <= ?',
      whereArgs: [
        _dateOnly(from).toIso8601String(),
        _dateOnly(to).toIso8601String(),
      ],
      orderBy: 'date DESC, created_at DESC',
    );

    return rows
        .map(
          (row) => MeasurementModel.fromJson(Map<String, dynamic>.from(row)),
        )
        .toList();
  }

  @override
  Future<void> delete(String id) async {
    await _db.delete(
      'measurements',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static DateTime _dateOnly(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }
}
