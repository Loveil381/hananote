// Release prep note: These tests keep explicit argument values to make mocked
// persistence interactions easier to scan during failures.
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import '../../fixtures.dart';

class _MockSecureDatabase extends Mock implements SecureDatabase {}

class _MockDatabase extends Mock implements Database {}

void main() {
  late _MockDatabase database;
  late _MockSecureDatabase secureDatabase;
  late JournalLocalDataSource dataSource;

  setUp(() {
    database = _MockDatabase();
    secureDatabase = _MockSecureDatabase();
    when(() => secureDatabase.database).thenReturn(database);
    dataSource = JournalLocalDataSourceImpl(secureDatabase);
  });

  group('JournalLocalDataSource', () {
    test('returns filtered journal entries ordered by date', () async {
      final from = DateTime(2026, 3, 1);
      final to = DateTime(2026, 3, 31, 23, 59);
      final row = buildJournalEntryRow();
      when(
        () => database.query(
          'journal_entries',
          where: 'date >= ? AND date <= ?',
          whereArgs: [
            DateTime(2026, 3, 1).toIso8601String(),
            DateTime(2026, 3, 31).toIso8601String(),
          ],
          orderBy: 'date DESC, created_at DESC',
        ),
      ).thenAnswer((_) async => [row]);

      final result = await dataSource.getAllEntries(from: from, to: to);

      expect(result, [buildJournalEntryModel()]);
    });

    test('returns null when an entry id is not found', () async {
      when(
        () => database.query(
          'journal_entries',
          where: 'id = ?',
          whereArgs: ['missing'],
          limit: 1,
        ),
      ).thenAnswer((_) async => <Map<String, Object?>>[]);

      final result = await dataSource.getEntryById('missing');

      expect(result, isNull);
    });

    test('queries an entry by its normalized day value', () async {
      final row = buildJournalEntryRow();
      when(
        () => database.query(
          'journal_entries',
          where: 'date = ?',
          whereArgs: [DateTime(2026, 3, 20).toIso8601String()],
          limit: 1,
        ),
      ).thenAnswer((_) async => [row]);

      final result =
          await dataSource.getEntryByDate(DateTime(2026, 3, 20, 21, 30));

      expect(result, buildJournalEntryModel());
    });

    test('inserts an entry json payload', () async {
      final model = buildJournalEntryModel();
      when(
        () => database.insert('journal_entries', model.toJson()),
      ).thenAnswer((_) async => 1);

      await dataSource.insertEntry(model);

      verify(() => database.insert('journal_entries', model.toJson()))
          .called(1);
    });

    test('updates an entry by id', () async {
      final model = buildJournalEntryModel();
      when(
        () => database.update(
          'journal_entries',
          model.toJson(),
          where: 'id = ?',
          whereArgs: [model.id],
        ),
      ).thenAnswer((_) async => 1);

      await dataSource.updateEntry(model);

      verify(
        () => database.update(
          'journal_entries',
          model.toJson(),
          where: 'id = ?',
          whereArgs: [model.id],
        ),
      ).called(1);
    });

    test('deletes an entry by id', () async {
      when(
        () => database.delete(
          'journal_entries',
          where: 'id = ?',
          whereArgs: ['entry-1'],
        ),
      ).thenAnswer((_) async => 1);

      await dataSource.deleteEntry('entry-1');

      verify(
        () => database.delete(
          'journal_entries',
          where: 'id = ?',
          whereArgs: ['entry-1'],
        ),
      ).called(1);
    });

    test('counts streak from yesterday when today has no entry', () async {
      final today = DateTime.now();
      final yesterday = DateTime(today.year, today.month, today.day - 1);
      final twoDaysAgo = yesterday.subtract(const Duration(days: 1));
      when(
        () => database.query(
          'journal_entries',
          columns: ['date'],
          orderBy: 'date DESC',
        ),
      ).thenAnswer(
        (_) async => [
          {'date': yesterday.toIso8601String()},
          {'date': twoDaysAgo.toIso8601String()},
        ],
      );

      final result = await dataSource.getConsecutiveDays();

      expect(result, 2);
    });

    test('returns the latest entry when present', () async {
      final row = buildJournalEntryRow();
      when(
        () => database.query(
          'journal_entries',
          orderBy: 'date DESC, created_at DESC',
          limit: 1,
        ),
      ).thenAnswer((_) async => [row]);

      final result = await dataSource.getLatestEntry();

      expect(result, buildJournalEntryModel());
    });
  });
}
