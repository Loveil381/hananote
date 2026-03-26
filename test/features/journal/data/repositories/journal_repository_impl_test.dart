import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/journal/data/datasources/journal_local_datasource.dart';
import 'package:hananote/features/journal/data/models/journal_entry_model.dart';
import 'package:hananote/features/journal/data/repositories/journal_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockJournalLocalDataSource extends Mock
    implements JournalLocalDataSource {}

void main() {
  late _MockJournalLocalDataSource localDataSource;
  late JournalRepositoryImpl repository;

  setUp(() {
    localDataSource = _MockJournalLocalDataSource();
    repository = JournalRepositoryImpl(localDataSource);
  });

  group('JournalRepositoryImpl', () {
    test('maps getAllEntries to domain entities', () async {
      final models = [buildJournalEntryModel()];
      when(() => localDataSource.getAllEntries())
          .thenAnswer((_) async => models);

      final result = await repository.getAllEntries();

      expect(result.isRight(), isTrue);
      expect(result.getOrElse((_) => []), [models.first.toDomain()]);
    });

    test('maps getEntryByDate to a nullable domain entity', () async {
      final model = buildJournalEntryModel();
      final date = DateTime(2026, 3, 20);
      when(() => localDataSource.getEntryByDate(date))
          .thenAnswer((_) async => model);

      final result = await repository.getEntryByDate(date);

      expect(result.getOrElse((_) => null), model.toDomain());
    });

    test('adds entries using model mapping', () async {
      final entry = buildJournalEntry();
      when(
        () => localDataSource.insertEntry(
          JournalEntryModel.fromDomain(entry),
        ),
      ).thenAnswer((_) async {});

      final result = await repository.addEntry(entry);

      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        JournalEntryModel.fromDomain(entry).toDomain(),
      );
      verify(
        () => localDataSource.insertEntry(JournalEntryModel.fromDomain(entry)),
      ).called(1);
    });

    test('updates entries using model mapping', () async {
      final entry = buildJournalEntry(content: 'Updated');
      when(
        () => localDataSource.updateEntry(
          JournalEntryModel.fromDomain(entry),
        ),
      ).thenAnswer((_) async {});

      final result = await repository.updateEntry(entry);

      expect(
        result.getOrElse((_) => throw StateError('expected value')),
        JournalEntryModel.fromDomain(entry).toDomain(),
      );
      verify(
        () => localDataSource.updateEntry(JournalEntryModel.fromDomain(entry)),
      ).called(1);
    });

    test('deletes entries through the datasource', () async {
      when(() => localDataSource.deleteEntry('entry-1'))
          .thenAnswer((_) async {});

      final result = await repository.deleteEntry('entry-1');

      expect(result.isRight(), isTrue);
      verify(() => localDataSource.deleteEntry('entry-1')).called(1);
    });

    test('returns the current streak', () async {
      when(() => localDataSource.getConsecutiveDays())
          .thenAnswer((_) async => 4);

      final result = await repository.getConsecutiveDays();

      expect(result.getOrElse((_) => 0), 4);
    });

    test('returns the latest entry when present', () async {
      final model = buildJournalEntryModel();
      when(() => localDataSource.getLatestEntry())
          .thenAnswer((_) async => model);

      final result = await repository.getLatestEntry();

      expect(result.getOrElse((_) => null), model.toDomain());
    });

    test('wraps datasource exceptions as database failures', () async {
      when(() => localDataSource.getAllEntries())
          .thenThrow(Exception('db failed'));

      final result = await repository.getAllEntries();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse((_) => throw StateError('expected failure')),
        const TypeMatcher<DatabaseFailure>(),
      );
    });
  });
}
