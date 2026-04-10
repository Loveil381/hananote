import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/blood_test/data/models/blood_test_report_model.dart';
import 'package:hananote/features/blood_test/data/models/hormone_reading_model.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Direct database operations for blood test data.
abstract interface class BloodTestLocalDataSource {
  /// Returns all stored reports with their readings.
  Future<List<BloodTestReportModel>> getAllReports();

  /// Returns a single report by [id], if present.
  Future<BloodTestReportModel?> getReportById(String id);

  /// Inserts a report and all of its nested readings transactionally.
  Future<void> insertReport(BloodTestReportModel report);

  /// Updates a report and replaces all of its readings transactionally.
  Future<void> updateReport(BloodTestReportModel report);

  /// Deletes the report with [id].
  Future<void> deleteReport(String id);

  /// Returns readings of the requested [type] within the optional date range.
  Future<List<HormoneReadingModel>> getReadingsByType(
    HormoneType type, {
    DateTime? from,
    DateTime? to,
  });

  /// Returns the latest reading of the requested [type], if present.
  Future<HormoneReadingModel?> getLatestReading(HormoneType type);
}

/// Default SQLite-backed implementation of [BloodTestLocalDataSource].
@LazySingleton(as: BloodTestLocalDataSource)
class BloodTestLocalDataSourceImpl implements BloodTestLocalDataSource {
  /// Creates a [BloodTestLocalDataSourceImpl].
  BloodTestLocalDataSourceImpl(this._secureDatabase);

  final SecureDatabase _secureDatabase;

  Database get _db => _secureDatabase.database;

  static const String _joinedReportSelect = '''
    SELECT
      r.id AS report_id,
      r.test_date AS report_test_date,
      r.lab_name AS report_lab_name,
      r.notes AS report_notes,
      r.created_at AS report_created_at,
      h.id AS reading_id,
      h.report_id AS reading_report_id,
      h.hormone_type AS reading_hormone_type,
      h.value AS reading_value,
      h.unit AS reading_unit,
      h.notes AS reading_notes
    FROM blood_test_reports r
    LEFT JOIN hormone_readings h ON h.report_id = r.id
  ''';

  @override
  Future<List<BloodTestReportModel>> getAllReports() async {
    final rows = await _db.rawQuery(
      '$_joinedReportSelect '
      'ORDER BY r.test_date DESC, r.created_at DESC, h.id ASC',
    );
    return _mapJoinedReports(rows);
  }

  @override
  Future<BloodTestReportModel?> getReportById(String id) async {
    final rows = await _db.rawQuery(
      '$_joinedReportSelect '
      'WHERE r.id = ? '
      'ORDER BY r.test_date DESC, r.created_at DESC, h.id ASC',
      [id],
    );
    if (rows.isEmpty) {
      return null;
    }
    return _mapJoinedReports(rows).first;
  }

  @override
  Future<void> insertReport(BloodTestReportModel report) async {
    await _db.transaction<void>((txn) async {
      await txn.insert('blood_test_reports', report.toJson());
      for (final reading in report.readings) {
        await txn.insert('hormone_readings', reading.toJson());
      }
    });
  }

  @override
  Future<void> updateReport(BloodTestReportModel report) async {
    await _db.transaction<void>((txn) async {
      await txn.delete(
        'hormone_readings',
        where: 'report_id = ?',
        whereArgs: [report.id],
      );
      for (final reading in report.readings) {
        await txn.insert('hormone_readings', reading.toJson());
      }
      await txn.update(
        'blood_test_reports',
        report.toJson(),
        where: 'id = ?',
        whereArgs: [report.id],
      );
    });
  }

  @override
  Future<void> deleteReport(String id) async {
    await _db.delete('blood_test_reports', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<HormoneReadingModel>> getReadingsByType(
    HormoneType type, {
    DateTime? from,
    DateTime? to,
  }) async {
    final clauses = <String>['h.hormone_type = ?'];
    final args = <Object?>[type.name];

    if (from != null) {
      clauses.add('r.test_date >= ?');
      args.add(from.toIso8601String());
    }
    if (to != null) {
      clauses.add('r.test_date <= ?');
      args.add(to.toIso8601String());
    }

    final rows = await _db.rawQuery(
      '''
      SELECT
        h.id,
        h.report_id,
        h.hormone_type,
        h.value,
        h.unit,
        h.notes
      FROM hormone_readings h
      INNER JOIN blood_test_reports r ON r.id = h.report_id
      WHERE ${clauses.join(' AND ')}
      ORDER BY r.test_date ASC, h.id ASC
      ''',
      args,
    );

    return rows.map(HormoneReadingModel.fromJson).toList();
  }

  @override
  Future<HormoneReadingModel?> getLatestReading(HormoneType type) async {
    final rows = await _db.rawQuery(
      '''
      SELECT
        h.id,
        h.report_id,
        h.hormone_type,
        h.value,
        h.unit,
        h.notes
      FROM hormone_readings h
      INNER JOIN blood_test_reports r ON r.id = h.report_id
      WHERE h.hormone_type = ?
      ORDER BY r.test_date DESC, r.created_at DESC, h.id DESC
      LIMIT 1
      ''',
      [type.name],
    );

    if (rows.isEmpty) {
      return null;
    }
    return HormoneReadingModel.fromJson(rows.first);
  }

  List<BloodTestReportModel> _mapJoinedReports(
    List<Map<String, Object?>> rows,
  ) {
    final reportsById = <String, BloodTestReportModel>{};
    final reportOrder = <String>[];

    for (final row in rows) {
      final reportId = row['report_id']! as String;
      final report = reportsById.putIfAbsent(reportId, () {
        reportOrder.add(reportId);
        return BloodTestReportModel(
          id: reportId,
          testDate: row['report_test_date']! as String,
          labName: row['report_lab_name'] as String?,
          notes: row['report_notes'] as String?,
          createdAt: row['report_created_at']! as String,
        );
      });

      final readingId = row['reading_id'] as String?;
      if (readingId == null) {
        continue;
      }

      final reading = HormoneReadingModel(
        id: readingId,
        reportId: row['reading_report_id']! as String,
        hormoneType: row['reading_hormone_type']! as String,
        value: (row['reading_value']! as num).toDouble(),
        unit: row['reading_unit']! as String,
        notes: row['reading_notes'] as String?,
      );

      reportsById[reportId] = report.copyWith(
        readings: [...report.readings, reading],
      );
    }

    return reportOrder.map((id) => reportsById[id]!).toList();
  }
}
