import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/journal/data/models/journal_entry_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Direct database operations for journal data.
abstract interface class JournalLocalDataSource {
  /// Returns all stored entries within the optional date range.
  Future<List<JournalEntryModel>> getAllEntries({
    DateTime? from,
    DateTime? to,
  });

  /// Returns a single entry by [id], if present.
  Future<JournalEntryModel?> getEntryById(String id);

  /// Returns a single entry recorded for [date], if present.
  Future<JournalEntryModel?> getEntryByDate(DateTime date);

  /// Inserts a new [entry].
  Future<void> insertEntry(JournalEntryModel entry);

  /// Updates an existing [entry].
  Future<void> updateEntry(JournalEntryModel entry);

  /// Deletes the entry with [id].
  Future<void> deleteEntry(String id);

  /// Returns the current consecutive-day streak.
  Future<int> getConsecutiveDays();

  /// Returns the latest entry, if present.
  Future<JournalEntryModel?> getLatestEntry();
}

/// Default SQLite-backed implementation of [JournalLocalDataSource].
@LazySingleton(as: JournalLocalDataSource)
class JournalLocalDataSourceImpl implements JournalLocalDataSource {
  /// Creates a [JournalLocalDataSourceImpl].
  JournalLocalDataSourceImpl(this._secureDatabase);

  final SecureDatabase _secureDatabase;

  Database get _db => _secureDatabase.database;

  @override
  Future<List<JournalEntryModel>> getAllEntries({
    DateTime? from,
    DateTime? to,
  }) async {
    final clauses = <String>[];
    final args = <Object?>[];

    if (from != null) {
      clauses.add('date >= ?');
      args.add(_dateOnlyToString(from));
    }
    if (to != null) {
      clauses.add('date <= ?');
      args.add(_dateOnlyToString(to));
    }

    final rows = await _db.query(
      'journal_entries',
      where: clauses.isEmpty ? null : clauses.join(' AND '),
      whereArgs: args.isEmpty ? null : args,
      orderBy: 'date DESC, created_at DESC',
    );

    return rows
        .map(
          (row) => JournalEntryModel.fromJson(Map<String, dynamic>.from(row)),
        )
        .toList();
  }

  @override
  Future<JournalEntryModel?> getEntryById(String id) async {
    final rows = await _db.query(
      'journal_entries',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }

    return JournalEntryModel.fromJson(Map<String, dynamic>.from(rows.first));
  }

  @override
  Future<JournalEntryModel?> getEntryByDate(DateTime date) async {
    final rows = await _db.query(
      'journal_entries',
      where: 'date = ?',
      whereArgs: [_dateOnlyToString(date)],
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }

    return JournalEntryModel.fromJson(Map<String, dynamic>.from(rows.first));
  }

  @override
  Future<void> insertEntry(JournalEntryModel entry) async {
    await _db.insert('journal_entries', entry.toJson());
  }

  @override
  Future<void> updateEntry(JournalEntryModel entry) async {
    await _db.update(
      'journal_entries',
      entry.toJson(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  @override
  Future<void> deleteEntry(String id) async {
    await _db.delete('journal_entries', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> getConsecutiveDays() async {
    final rows = await _db.query(
      'journal_entries',
      columns: ['date'],
      orderBy: 'date DESC',
    );
    if (rows.isEmpty) {
      return 0;
    }

    final recordedDates =
        rows.map((row) => _stringToDateOnly(row['date']! as String)).toSet();

    final today = _dateOnly(DateTime.now());
    var cursor = recordedDates.contains(today)
        ? today
        : today.subtract(const Duration(days: 1));

    var streak = 0;
    while (recordedDates.contains(cursor)) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }

    return streak;
  }

  @override
  Future<JournalEntryModel?> getLatestEntry() async {
    final rows = await _db.query(
      'journal_entries',
      orderBy: 'date DESC, created_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }

    return JournalEntryModel.fromJson(Map<String, dynamic>.from(rows.first));
  }

  static String _dateOnlyToString(DateTime value) {
    return _dateOnly(value).toIso8601String();
  }

  static DateTime _stringToDateOnly(String value) {
    final parsed = DateTime.parse(value);
    return DateTime(parsed.year, parsed.month, parsed.day);
  }

  static DateTime _dateOnly(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }
}
