import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/check_inventory.dart';
import 'package:hananote/features/medication/presentation/bloc/inventory_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/inventory_state.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockCheckInventory extends Mock implements CheckInventory {}

class _MockMedicationRepository extends Mock implements MedicationRepository {}

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

InventoryStatus _status({bool isLowStock = false}) => InventoryStatus(
      drug: _drug(),
      daysRemaining: isLowStock ? 5 : 30,
      isLowStock: isLowStock,
    );

DrugInventory _inventory() => DrugInventory(
      id: 'inv-1',
      drugId: 'drug-1',
      quantity: 30,
      unit: DosageUnit.mg,
      purchaseDate: DateTime(2026, 3),
      updatedAt: DateTime(2026, 3),
    );

const _failure = Failure.database(message: 'DB error');

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late _MockCheckInventory checkInventory;
  late _MockMedicationRepository repository;

  InventoryCubit build() => InventoryCubit(checkInventory, repository);

  setUp(() {
    checkInventory = _MockCheckInventory();
    repository = _MockMedicationRepository();

    registerFallbackValue(_inventory());
  });

  test('initial state is InventoryInitial', () {
    expect(build().state, isA<InventoryInitial>());
  });

  group('loadInventory', () {
    blocTest<InventoryCubit, InventoryState>(
      'emits [loading, loaded] on success',
      build: build,
      setUp: () =>
          when(checkInventory.call).thenAnswer((_) async => right([_status()])),
      act: (c) => c.loadInventory(),
      expect: () => [
        isA<InventoryLoading>(),
        isA<InventoryLoaded>(),
      ],
    );

    blocTest<InventoryCubit, InventoryState>(
      'computes lowStockCount correctly',
      build: build,
      setUp: () => when(checkInventory.call).thenAnswer(
        (_) async => right([_status(isLowStock: true), _status()]),
      ),
      act: (c) => c.loadInventory(),
      expect: () => [
        isA<InventoryLoading>(),
        isA<InventoryLoaded>()
            .having((s) => s.lowStockCount, 'lowStockCount', 1),
      ],
    );

    blocTest<InventoryCubit, InventoryState>(
      'emits [loading, error] on failure',
      build: build,
      setUp: () =>
          when(checkInventory.call).thenAnswer((_) async => left(_failure)),
      act: (c) => c.loadInventory(),
      expect: () => [
        isA<InventoryLoading>(),
        isA<InventoryError>(),
      ],
    );
  });

  group('updateStock', () {
    blocTest<InventoryCubit, InventoryState>(
      'updates stock and reloads on success',
      build: build,
      setUp: () {
        when(() => repository.getInventoryForDrug('drug-1'))
            .thenAnswer((_) async => right(_inventory()));
        when(() => repository.updateInventory(any()))
            .thenAnswer((_) async => right(_inventory()));
        when(checkInventory.call).thenAnswer((_) async => right([_status()]));
      },
      act: (c) => c.updateStock('drug-1', 20),
      expect: () => [
        isA<InventoryLoading>(),
        isA<InventoryLoaded>(),
      ],
    );

    blocTest<InventoryCubit, InventoryState>(
      'emits error when repository fails',
      build: build,
      setUp: () => when(() => repository.getInventoryForDrug('drug-1'))
          .thenAnswer((_) async => left(_failure)),
      act: (c) => c.updateStock('drug-1', 20),
      expect: () => [isA<InventoryError>()],
    );
  });
}
