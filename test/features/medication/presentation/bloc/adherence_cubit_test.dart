import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/usecases/get_adherence_stats.dart';
import 'package:hananote/features/medication/presentation/bloc/adherence_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/adherence_state.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockGetAdherenceStats extends Mock implements GetAdherenceStats {}

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

Drug _drug({String id = 'drug-1'}) => Drug(
      id: id,
      name: 'Estradiol',
      genericName: 'EV',
      category: DrugCategory.estrogen,
      administrationRoute: AdministrationRoute.oral,
      defaultDosageUnit: DosageUnit.mg,
      isActive: true,
      createdAt: DateTime(2026, 3),
    );

DrugAdherenceStat _stat({double rate = 0.8, String id = 'drug-1'}) =>
    DrugAdherenceStat(drug: _drug(id: id), rate: rate);

final _params = GetAdherenceStatsParams(
  from: DateTime(2026, 3),
  to: DateTime(2026, 3, 31),
);

const _failure = Failure.database(message: 'DB error');

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late _MockGetAdherenceStats getAdherenceStats;

  AdherenceCubit build() => AdherenceCubit(getAdherenceStats);

  setUp(() {
    getAdherenceStats = _MockGetAdherenceStats();

    registerFallbackValue(_params);
  });

  test('initial state is AdherenceInitial', () {
    expect(build().state, isA<AdherenceInitial>());
  });

  group('loadStats', () {
    blocTest<AdherenceCubit, AdherenceState>(
      'emits [loading, loaded] on success',
      build: build,
      setUp: () => when(() => getAdherenceStats(any()))
          .thenAnswer((_) async => right([_stat()])),
      act: (c) => c.loadStats(
        from: _params.from,
        to: _params.to,
      ),
      expect: () => [
        isA<AdherenceLoading>(),
        isA<AdherenceLoaded>(),
      ],
    );

    blocTest<AdherenceCubit, AdherenceState>(
      'computes overallRate as mean across drugs',
      build: build,
      setUp: () => when(() => getAdherenceStats(any())).thenAnswer(
        (_) async => right([
          _stat(),
          _stat(id: 'drug-2', rate: 0.6),
        ]),
      ),
      act: (c) => c.loadStats(from: _params.from, to: _params.to),
      expect: () => [
        isA<AdherenceLoading>(),
        isA<AdherenceLoaded>().having(
          (s) => s.overallRate,
          'overallRate',
          closeTo(0.7, 0.001),
        ),
      ],
    );

    blocTest<AdherenceCubit, AdherenceState>(
      'overallRate is 0.0 when no drugs',
      build: build,
      setUp: () => when(() => getAdherenceStats(any()))
          .thenAnswer((_) async => right(<DrugAdherenceStat>[])),
      act: (c) => c.loadStats(from: _params.from, to: _params.to),
      expect: () => [
        isA<AdherenceLoading>(),
        isA<AdherenceLoaded>()
            .having((s) => s.overallRate, 'overallRate', 0.0)
            .having((s) => s.stats, 'stats', isEmpty),
      ],
    );

    blocTest<AdherenceCubit, AdherenceState>(
      'emits [loading, error] on failure',
      build: build,
      setUp: () => when(() => getAdherenceStats(any()))
          .thenAnswer((_) async => left(_failure)),
      act: (c) => c.loadStats(from: _params.from, to: _params.to),
      expect: () => [
        isA<AdherenceLoading>(),
        isA<AdherenceError>(),
      ],
    );
  });
}
