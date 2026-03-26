import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_journal_streak.dart';
import 'package:mocktail/mocktail.dart';

class _MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late _MockJournalRepository repository;
  late GetJournalStreak useCase;

  setUp(() {
    repository = _MockJournalRepository();
    useCase = GetJournalStreak(repository);
  });

  group('GetJournalStreak', () {
    test('returns the repository streak value', () async {
      when(() => repository.getConsecutiveDays())
          .thenAnswer((_) async => right(5));

      final result = await useCase();

      expect(result.getOrElse((_) => 0), 5);
      verify(() => repository.getConsecutiveDays()).called(1);
    });
  });
}
