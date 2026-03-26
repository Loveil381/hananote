import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:injectable/injectable.dart';

/// Validates and updates an existing journal entry.
@injectable
class UpdateJournalEntry {
  /// Creates an [UpdateJournalEntry] use case.
  UpdateJournalEntry(this._repository);

  final JournalRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, JournalEntry>> call(JournalEntry entry) {
    final trimmedContent = entry.content.trim();
    if (trimmedContent.isEmpty) {
      return Future.value(
        left(
          const Failure.validation(
            message: 'Journal entry content cannot be empty.',
          ),
        ),
      );
    }

    return _repository.updateEntry(entry.copyWith(content: trimmedContent));
  }
}
