import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_journal_streak.dart';
import 'package:hananote/features/journal/presentation/bloc/record_bloc.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';
import 'package:hananote/features/journal/presentation/bloc/record_state.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../measurement/fixtures.dart';
import '../../fixtures.dart';

class _MockGetJournalStreak extends Mock implements GetJournalStreak {}

class _MockJournalRepository extends Mock implements JournalRepository {}

class _MockMeasurementRepository extends Mock
    implements MeasurementRepository {}

void main() {
  late _MockGetJournalStreak getJournalStreak;
  late _MockJournalRepository repository;
  late _MockMeasurementRepository measurementRepository;

  final latestEntry = buildJournalEntry(
    date: DateTime(2026, 3, 26, 21),
    createdAt: DateTime(2026, 3, 26, 22),
  );
  final latestMeasurement = buildMeasurementEntry(
    date: DateTime(2026, 3, 27),
  );

  RecordBloc buildBloc() => RecordBloc(
        getJournalStreak,
        repository,
        measurementRepository,
      );

  setUp(() {
    getJournalStreak = _MockGetJournalStreak();
    repository = _MockJournalRepository();
    measurementRepository = _MockMeasurementRepository();
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
      when(() => measurementRepository.getLatest())
          .thenAnswer((_) async => right(null));
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
      when(() => measurementRepository.getLatest())
          .thenAnswer((_) async => right(null));
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

  blocTest<RecordBloc, RecordState>(
    'LoadRecordSummary fills lastMeasurementSummary from latest measurement',
    build: buildBloc,
    setUp: () {
      when(() => getJournalStreak()).thenAnswer((_) async => right(3));
      when(() => repository.getLatestEntry())
          .thenAnswer((_) async => right(latestEntry));
      when(() => measurementRepository.getLatest())
          .thenAnswer((_) async => right(latestMeasurement));
    },
    act: (bloc) => bloc.add(const RecordEvent.loadSummary()),
    expect: () => [
      const RecordState.loading(),
      RecordState.loaded(
        journalStreak: 3,
        lastJournalDate: latestEntry.date,
        lastPhotoDate: null,
        lastMeasurementDate: latestMeasurement.date,
        lastMeasurementSummary: '胸: 86cm · 腰: 72cm · 臀: 92cm',
      ),
    ],
  );
}
