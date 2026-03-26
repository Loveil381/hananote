import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_journal_streak.dart';
import 'package:hananote/features/journal/presentation/bloc/record_bloc.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';
import 'package:hananote/features/journal/presentation/bloc/record_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockGetJournalStreak extends Mock implements GetJournalStreak {}

class _MockJournalRepository extends Mock implements JournalRepository {}

void main() {
  late _MockGetJournalStreak getJournalStreak;
  late _MockJournalRepository repository;

  final latestEntry = buildJournalEntry(
    date: DateTime(2026, 3, 26, 21),
    createdAt: DateTime(2026, 3, 26, 22),
  );

  RecordBloc buildBloc() => RecordBloc(getJournalStreak, repository);

  setUp(() {
    getJournalStreak = _MockGetJournalStreak();
    repository = _MockJournalRepository();
  });

  test('initial state is RecordInitial', () {
    expect(buildBloc().state, isA<RecordInitial>());
  });

  blocTest<RecordBloc, RecordState>(
    'LoadRecordSummary emits [loading, loaded] with journal metadata',
    build: buildBloc,
    setUp: () {
      when(() => getJournalStreak()).thenAnswer((_) async => right(6));
      when(() => repository.getLatestEntry())
          .thenAnswer((_) async => right(latestEntry));
    },
    act: (bloc) => bloc.add(const RecordEvent.loadSummary()),
    expect: () => [
      const RecordState.loading(),
      RecordState.loaded(
        journalStreak: 6,
        lastJournalDate: latestEntry.date,
        lastPhotoDate: null,
        lastMeasurementDate: null,
        lastMeasurementSummary: null,
      ),
    ],
    verify: (_) {
      verify(() => getJournalStreak()).called(1);
      verify(() => repository.getLatestEntry()).called(1);
    },
  );

  blocTest<RecordBloc, RecordState>(
    'RefreshRecordSummary re-loads record summary state',
    build: buildBloc,
    seed: () => RecordState.loaded(
      journalStreak: 2,
      lastJournalDate: DateTime(2026, 3, 25),
      lastPhotoDate: null,
      lastMeasurementDate: null,
      lastMeasurementSummary: null,
    ),
    setUp: () {
      when(() => getJournalStreak()).thenAnswer((_) async => right(7));
      when(() => repository.getLatestEntry())
          .thenAnswer((_) async => right(latestEntry));
    },
    act: (bloc) => bloc.add(const RecordEvent.refresh()),
    wait: const Duration(milliseconds: 1),
    expect: () => [
      const RecordState.loading(),
      RecordState.loaded(
        journalStreak: 7,
        lastJournalDate: latestEntry.date,
        lastPhotoDate: null,
        lastMeasurementDate: null,
        lastMeasurementSummary: null,
      ),
    ],
    verify: (_) {
      verify(() => getJournalStreak()).called(1);
      verify(() => repository.getLatestEntry()).called(1);
    },
  );
}
