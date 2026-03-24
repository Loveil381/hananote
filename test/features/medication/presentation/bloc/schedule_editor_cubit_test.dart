import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/presentation/bloc/schedule_editor_cubit.dart';
import 'package:hananote/features/medication/presentation/bloc/schedule_editor_state.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockMedicationRepository extends Mock implements MedicationRepository {}

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

MedicationSchedule _schedule({String id = 'schedule-1'}) => MedicationSchedule(
      id: id,
      drugId: 'drug-1',
      dosageAmount: 2,
      dosageUnit: DosageUnit.mg,
      frequency: const MedicationFrequency.daily(timesPerDay: 1),
      administrationRoute: AdministrationRoute.oral,
      startDate: DateTime(2026, 3, 1),
      isActive: true,
      scheduleTimes: const [TimeOfDay(hour: 8, minute: 0)],
    );

const _failure = Failure.database(message: 'DB error');

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late _MockMedicationRepository repository;

  setUp(() {
    repository = _MockMedicationRepository();

    registerFallbackValue(_schedule());
  });

  ScheduleEditorCubit build() => ScheduleEditorCubit(repository);

  test('initial state is ScheduleEditorIdle', () {
    expect(build().state, isA<ScheduleEditorIdle>());
  });

  group('initNew', () {
    blocTest<ScheduleEditorCubit, ScheduleEditorState>(
      'emits ScheduleEditorEditing with isNew=true',
      build: build,
      act: (c) => c.initNew('drug-1'),
      expect: () => [
        isA<ScheduleEditorEditing>()
            .having((s) => s.isNew, 'isNew', isTrue)
            .having((s) => s.drugId, 'drugId', 'drug-1'),
      ],
    );
  });

  group('initEdit', () {
    blocTest<ScheduleEditorCubit, ScheduleEditorState>(
      'emits ScheduleEditorEditing populated from existing schedule',
      build: build,
      act: (c) => c.initEdit(_schedule()),
      expect: () => [
        isA<ScheduleEditorEditing>()
            .having((s) => s.isNew, 'isNew', isFalse)
            .having((s) => s.existingId, 'existingId', 'schedule-1')
            .having((s) => s.dosageAmount, 'dosageAmount', 2.0),
      ],
    );
  });

  group('validate', () {
    test('returns false when dosageAmount is null', () {
      final cubit = build()..initNew('drug-1');
      expect(cubit.validate(), isFalse);
    });

    test('returns true when all required fields are set', () {
      final cubit = build()
        ..initNew('drug-1')
        ..setDosageAmount(2)
        ..setDosageUnit(DosageUnit.mg)
        ..setFrequency(const MedicationFrequency.daily(timesPerDay: 1))
        ..setAdministrationRoute(AdministrationRoute.oral)
        ..setStartDate(DateTime(2026, 3, 1))
        ..setScheduleTimes(
          const [TimeOfDay(hour: 8, minute: 0)],
        );
      expect(cubit.validate(), isTrue);
    });
  });

  group('save', () {
    void setupCubit(ScheduleEditorCubit c) {
      c
        ..initNew('drug-1')
        ..setDosageAmount(2)
        ..setDosageUnit(DosageUnit.mg)
        ..setFrequency(const MedicationFrequency.daily(timesPerDay: 1))
        ..setAdministrationRoute(AdministrationRoute.oral)
        ..setStartDate(DateTime(2026, 3, 1))
        ..setScheduleTimes(
          const [TimeOfDay(hour: 8, minute: 0)],
        );
    }

    blocTest<ScheduleEditorCubit, ScheduleEditorState>(
      'emits [saving, saved] on success for new schedule',
      build: build,
      setUp: () => when(() => repository.addSchedule(any()))
          .thenAnswer((_) async => right(_schedule())),
      act: (c) {
        setupCubit(c);

        return c.save();
      },
      skip: 7,
      expect: () => [
        isA<ScheduleEditorEditing>(), // validate inside save
        isA<ScheduleEditorSaving>(),
        isA<ScheduleEditorSaved>(),
      ],
    );

    blocTest<ScheduleEditorCubit, ScheduleEditorState>(
      'emits [saving, error] on repository failure',
      build: build,
      setUp: () => when(() => repository.addSchedule(any()))
          .thenAnswer((_) async => left(_failure)),
      act: (c) {
        setupCubit(c);

        return c.save();
      },
      skip: 7,
      expect: () => [
        isA<ScheduleEditorEditing>(), // validate
        isA<ScheduleEditorSaving>(),
        isA<ScheduleEditorError>(),
      ],
    );

    blocTest<ScheduleEditorCubit, ScheduleEditorState>(
      'emits [saving, saved] when editing existing schedule',
      build: build,
      setUp: () => when(() => repository.updateSchedule(any()))
          .thenAnswer((_) async => right(_schedule())),
      act: (c) {
        c.initEdit(_schedule());
        return c.save();
      },
      skip: 1,
      expect: () => [
        isA<ScheduleEditorEditing>(), // validate
        isA<ScheduleEditorSaving>(),
        isA<ScheduleEditorSaved>(),
      ],
    );
  });
}
