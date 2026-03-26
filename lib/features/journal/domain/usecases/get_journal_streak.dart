import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:injectable/injectable.dart';

/// Returns the current journal streak.
@injectable
class GetJournalStreak {
  /// Creates a [GetJournalStreak] use case.
  GetJournalStreak(this._repository);

  final JournalRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, int>> call() {
    return _repository.getConsecutiveDays();
  }
}
