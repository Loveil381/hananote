import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/usecases/add_drug.dart';
import 'package:hananote/features/medication/domain/usecases/delete_drug.dart';
import 'package:hananote/features/medication/domain/usecases/get_all_drugs.dart';
import 'package:hananote/features/medication/domain/usecases/update_drug.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_state.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockGetAllDrugs extends Mock implements GetAllDrugs {}

class _MockAddDrug extends Mock implements AddDrug {}

class _MockUpdateDrug extends Mock implements UpdateDrug {}

class _MockDeleteDrug extends Mock implements DeleteDrug {}

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

Drug _buildDrug({String id = 'drug-1', bool isActive = true}) => Drug(
      id: id,
      name: 'Estradiol',
      genericName: 'Estradiol Valerate',
      category: DrugCategory.estrogen,
      administrationRoute: AdministrationRoute.oral,
      defaultDosageUnit: DosageUnit.mg,
      isActive: isActive,
      createdAt: DateTime(2026, 3),
    );

const _dbFailure = Failure.database(message: 'DB error');

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late _MockGetAllDrugs getAllDrugs;
  late _MockAddDrug addDrug;
  late _MockUpdateDrug updateDrug;
  late _MockDeleteDrug deleteDrug;

  DrugListCubit build() =>
      DrugListCubit(getAllDrugs, addDrug, updateDrug, deleteDrug);

  setUp(() {
    getAllDrugs = _MockGetAllDrugs();
    addDrug = _MockAddDrug();
    updateDrug = _MockUpdateDrug();
    deleteDrug = _MockDeleteDrug();

    registerFallbackValue(_buildDrug());
  });

  test('initial state is DrugListInitial', () {
    expect(build().state, isA<DrugListInitial>());
  });

  group('loadDrugs', () {
    blocTest<DrugListCubit, DrugListState>(
      'emits [loading, loaded] on success',
      build: build,
      setUp: () =>
          when(getAllDrugs.call).thenAnswer((_) async => right([_buildDrug()])),
      act: (c) => c.loadDrugs(),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>(),
      ],
    );

    blocTest<DrugListCubit, DrugListState>(
      'emits [loading, error] on failure',
      build: build,
      setUp: () =>
          when(getAllDrugs.call).thenAnswer((_) async => left(_dbFailure)),
      act: (c) => c.loadDrugs(),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListError>(),
      ],
    );

    blocTest<DrugListCubit, DrugListState>(
      'emits loaded with empty list when no drugs exist',
      build: build,
      setUp: () =>
          when(getAllDrugs.call).thenAnswer((_) async => right(<Drug>[])),
      act: (c) => c.loadDrugs(),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>().having((s) => s.drugs, 'drugs', isEmpty),
      ],
    );
  });

  group('addDrug', () {
    final drug = _buildDrug();

    blocTest<DrugListCubit, DrugListState>(
      'reloads list on success',
      build: build,
      setUp: () {
        when(() => addDrug.call(drug)).thenAnswer((_) async => right(drug));
        when(getAllDrugs.call).thenAnswer((_) async => right([drug]));
      },
      act: (c) => c.addDrug(drug),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>(),
      ],
    );

    blocTest<DrugListCubit, DrugListState>(
      'emits error on failure',
      build: build,
      setUp: () => when(() => addDrug.call(drug))
          .thenAnswer((_) async => left(_dbFailure)),
      act: (c) => c.addDrug(drug),
      expect: () => [isA<DrugListError>()],
    );
  });

  group('updateDrug', () {
    final drug = _buildDrug();

    blocTest<DrugListCubit, DrugListState>(
      'reloads list on success',
      build: build,
      setUp: () {
        when(() => updateDrug.call(drug)).thenAnswer((_) async => right(drug));
        when(getAllDrugs.call).thenAnswer((_) async => right([drug]));
      },
      act: (c) => c.updateDrug(drug),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>(),
      ],
    );
  });

  group('deleteDrug', () {
    blocTest<DrugListCubit, DrugListState>(
      'reloads list on success',
      build: build,
      setUp: () {
        when(() => deleteDrug.call('drug-1'))
            .thenAnswer((_) async => right(null));
        when(getAllDrugs.call).thenAnswer((_) async => right(<Drug>[]));
      },
      act: (c) => c.deleteDrug('drug-1'),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>(),
      ],
    );
  });

  group('toggleDrugActive', () {
    blocTest<DrugListCubit, DrugListState>(
      'flips isActive and reloads',
      build: build,
      setUp: () {
        final inactive = _buildDrug(isActive: false);
        when(() => updateDrug.call(inactive))
            .thenAnswer((_) async => right(inactive));
        when(getAllDrugs.call).thenAnswer((_) async => right([inactive]));
      },
      act: (c) => c.toggleDrugActive(_buildDrug()),
      expect: () => [
        isA<DrugListLoading>(),
        isA<DrugListLoaded>(),
      ],
      verify: (_) {
        final captured = verify(() => updateDrug.call(captureAny())).captured;
        final toggled = captured.first as Drug;
        expect(toggled.isActive, isFalse);
      },
    );
  });
}
