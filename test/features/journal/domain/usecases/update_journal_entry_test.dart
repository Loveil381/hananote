import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/update_journal_entry.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late _MockJournalRepository repository;
  late UpdateJournalEntry useCase;

  setUp(() {
    repository = _MockJournalRepository();
    useCase = UpdateJournalEntry(repository);
  });

  group('UpdateJournalEntry', () {
    test('trims content before updating', () async {
      final entry = buildJournalEntry(content: '  better today  ');
      final trimmedEntry = entry.copyWith(content: 'better today');
      when(() => repository.updateEntry(trimmedEntry))
          .thenAnswer((_) async => right(trimmedEntry));

      final result = await useCase(entry);

      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        trimmedEntry,
      );
      verify(() => repository.updateEntry(trimmedEntry)).called(1);
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
      verifyNever(() => repository.updateEntry(entry));
    });
  });
}
