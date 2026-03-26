import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:hananote/features/journal/data/models/journal_entry_model.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation backed by a local SQLCipher datasource.
@LazySingleton(as: JournalRepository)
class JournalRepositoryImpl implements JournalRepository {
  /// Creates a [JournalRepositoryImpl].
  JournalRepositoryImpl(this._localDataSource);

  final JournalLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<JournalEntry>>> getAllEntries({
    DateTime? from,
    DateTime? to,
  }) {
    return _guard(() async {
      final models = await _localDataSource.getAllEntries(from: from, to: to);
      return models.map((model) => model.toDomain()).toList();
    });
  }

  @override
  Future<Either<Failure, JournalEntry>> getEntryById(String id) {
    return _guard(() async {
      final model = await _localDataSource.getEntryById(id);
      if (model == null) {
        throw StateError('Journal entry not found: $id');
      }
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, JournalEntry?>> getEntryByDate(DateTime date) {
    return _guard(() async {
      final model = await _localDataSource.getEntryByDate(date);
      return model?.toDomain();
    });
  }

  @override
  Future<Either<Failure, JournalEntry>> addEntry(JournalEntry entry) {
    return _guard(() async {
      final model = JournalEntryModel.fromDomain(entry);
      await _localDataSource.insertEntry(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, JournalEntry>> updateEntry(JournalEntry entry) {
    return _guard(() async {
      final model = JournalEntryModel.fromDomain(entry);
      await _localDataSource.updateEntry(model);
      return model.toDomain();
    });
  }

  @override
  Future<Either<Failure, void>> deleteEntry(String id) {
    return _guard(() => _localDataSource.deleteEntry(id));
  }

  @override
  Future<Either<Failure, int>> getConsecutiveDays() {
    return _guard(_localDataSource.getConsecutiveDays);
  }

  @override
  Future<Either<Failure, JournalEntry?>> getLatestEntry() {
    return _guard(() async {
      final model = await _localDataSource.getLatestEntry();
      return model?.toDomain();
    });
  }

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return right(await action());
    } catch (error) {
      return left(Failure.database(message: error.toString()));
    }
  }
}
