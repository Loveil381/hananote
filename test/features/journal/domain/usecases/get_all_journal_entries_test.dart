import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_all_journal_entries.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late _MockJournalRepository repository;
  late GetAllJournalEntries useCase;

  setUp(() {
    repository = _MockJournalRepository();
    useCase = GetAllJournalEntries(repository);
  });

  group('GetAllJournalEntries', () {
    test('forwards the optional date range to the repository', () async {
      final from = DateTime(2026, 3);
      final to = DateTime(2026, 3, 31);
      final entries = [buildJournalEntry(content: 'Entry in requested range')];
      when(() => repository.getAllEntries(from: from, to: to))
          .thenAnswer((_) async => right(entries));

      final result = await useCase(from: from, to: to);

      expect(result.getOrElse((_) => []), entries);
      verify(() => repository.getAllEntries(from: from, to: to)).called(1);
    });
  });
}
