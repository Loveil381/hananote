import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/add_journal_entry.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late _MockJournalRepository repository;
  late AddJournalEntry useCase;

  setUp(() {
    repository = _MockJournalRepository();
    useCase = AddJournalEntry(repository);
  });

  group('AddJournalEntry', () {
    test('trims content before persisting', () async {
      final entry = buildJournalEntry(content: '  grounded today  ');
      final trimmedEntry = entry.copyWith(content: 'grounded today');
      when(() => repository.addEntry(trimmedEntry))
          .thenAnswer((_) async => right(trimmedEntry));

      final result = await useCase(entry);

      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        trimmedEntry,
      );
      verify(() => repository.addEntry(trimmedEntry)).called(1);
    });

    test('rejects empty content after trimming', () async {
      final entry = buildJournalEntry(content: '   ');

      final result = await useCase(entry);

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const Failure.validation(
          message: 'Journal entry content cannot be empty.',
        ),
      );
      verifyNever(() => repository.addEntry(entry));
    });
  });
}
