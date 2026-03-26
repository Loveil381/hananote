import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';

/// Contract for journal persistence and queries.
abstract interface class JournalRepository {
  /// Returns all stored entries within the optional date range.
  Future<Either<Failure, List<JournalEntry>>> getAllEntries({
    DateTime? from,
    DateTime? to,
  });

  /// Returns the entry with the given [id].
  Future<Either<Failure, JournalEntry>> getEntryById(String id);

  /// Returns the entry recorded for [date], if present.
  Future<Either<Failure, JournalEntry?>> getEntryByDate(DateTime date);

  /// Persists a new [entry].
  Future<Either<Failure, JournalEntry>> addEntry(JournalEntry entry);

  /// Persists changes to [entry].
  Future<Either<Failure, JournalEntry>> updateEntry(JournalEntry entry);

  /// Deletes the entry with [id].
  Future<Either<Failure, void>> deleteEntry(String id);

  /// Returns the number of consecutive recorded days.
  Future<Either<Failure, int>> getConsecutiveDays();

  /// Returns the latest recorded entry, if present.
  Future<Either<Failure, JournalEntry?>> getLatestEntry();
}
