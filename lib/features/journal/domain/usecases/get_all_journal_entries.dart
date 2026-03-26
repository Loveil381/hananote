import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns journal entries within an optional date range.
@injectable
class GetAllJournalEntries {
  /// Creates a [GetAllJournalEntries] use case.
  GetAllJournalEntries(this._repository);

  final JournalRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<JournalEntry>>> call({
    DateTime? from,
    DateTime? to,
  }) {
    return _repository.getAllEntries(from: from, to: to);
  }
}
