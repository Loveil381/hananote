import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';
import 'package:hananote/features/medication/domain/usecases/log_medication.dart';
import 'package:hananote/features/medication/domain/usecases/sync_medication_reminders.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_bloc.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_event.dart';
import 'package:hananote/features/medication/presentation/bloc/today_schedule_state.dart';
import 'package:mocktail/mocktail.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class _MockGetTodaySchedule extends Mock implements GetTodaySchedule {}

class _MockLogMedication extends Mock implements LogMedication {}

class _MockSyncMedicationReminders extends Mock
    implements SyncMedicationReminders {}

// ---------------------------------------------------------------------------
// Fixtures
// ---------------------------------------------------------------------------

Drug _drug() => Drug(
      id: 'drug-1',
      name: 'Estradiol',
      genericName: 'Estradiol Valerate',
      category: DrugCategory.estrogen,
      administrationRoute: AdministrationRoute.oral,
      defaultDosageUnit: DosageUnit.mg,
      isActive: true,
      createdAt: DateTime(2026, 3),
    );

MedicationSchedule _schedule() => MedicationSchedule(
      id: 'schedule-1',
      drugId: 'drug-1',
      dosageAmount: 2,
      dosageUnit: DosageUnit.mg,
      frequency: const MedicationFrequency.daily(timesPerDay: 1),
      administrationRoute: AdministrationRoute.oral,
      startDate: DateTime(2026, 3),
      isActive: true,
    );

TodayScheduleItem _item({bool isCompleted = false}) => TodayScheduleItem(
      drug: _drug(),
      schedule: _schedule(),
      logs: const [],
      scheduledDateTimes: [DateTime(2026, 3, 23, 8)],
      isCompleted: isCompleted,
    );

MedicationLog _log() => MedicationLog(
      id: 'log-1',
      scheduleId: 'schedule-1',
      drugId: 'drug-1',
      timestamp: DateTime(2026, 3, 23, 8),
      dosageAmount: 2,
      dosageUnit: DosageUnit.mg,
      administrationRoute: AdministrationRoute.oral,
      status: LogStatus.taken,
    );

const _failure = Failure.database(message: 'DB error');

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  late _MockGetTodaySchedule getTodaySchedule;
  late _MockLogMedication logMedication;
  late _MockSyncMedicationReminders syncMedicationReminders;

  TodayScheduleBloc build() => TodayScheduleBloc(
        getTodaySchedule,
        logMedication,
        syncMedicationReminders,
      );

  setUp(() {
    getTodaySchedule = _MockGetTodaySchedule();
    logMedication = _MockLogMedication();
    syncMedicationReminders = _MockSyncMedicationReminders();

    registerFallbackValue(
      MedicationLog(
        id: 'fallback',
        scheduleId: 's',
        drugId: 'd',
        timestamp: DateTime.now(),
        dosageAmount: 0,
        dosageUnit: DosageUnit.mg,
        administrationRoute: AdministrationRoute.oral,
        status: LogStatus.skipped,
      ),
    );
    when(() => syncMedicationReminders()).thenAnswer((_) async => right(0));
  });

  test('initial state is TodayScheduleInitial', () {
    expect(build().state, isA<TodayScheduleInitial>());
  });

  group('LoadTodaySchedule', () {
    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'emits [loading, loaded] on success',
      build: build,
      setUp: () => when(() => getTodaySchedule(date: any(named: 'date')))
          .thenAnswer((_) async => right([_item()])),
      act: (b) => b.add(const TodayScheduleEvent.load()),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleLoaded>(),
      ],
    );

    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'emits [loading, error] on failure',
      build: build,
      setUp: () => when(() => getTodaySchedule(date: any(named: 'date')))
          .thenAnswer((_) async => left(_failure)),
      act: (b) => b.add(const TodayScheduleEvent.load()),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleError>(),
      ],
    );

    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'emits loaded with 0/0 counts for empty list',
      build: build,
      setUp: () => when(() => getTodaySchedule(date: any(named: 'date')))
          .thenAnswer((_) async => right(<TodayScheduleItem>[])),
      act: (b) => b.add(const TodayScheduleEvent.load()),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleLoaded>()
            .having((s) => s.completedCount, 'completedCount', 0)
            .having((s) => s.totalCount, 'totalCount', 0),
      ],
    );

    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'counts completed items correctly',
      build: build,
      setUp: () =>
          when(() => getTodaySchedule(date: any(named: 'date'))).thenAnswer(
        (_) async => right([
          _item(isCompleted: true),
          _item(),
        ]),
      ),
      act: (b) => b.add(const TodayScheduleEvent.load()),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleLoaded>()
            .having((s) => s.completedCount, 'completedCount', 1)
            .having((s) => s.totalCount, 'totalCount', 2),
      ],
    );
  });

  group('LogDoseTodaySchedule', () {
    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'logs dose and reloads on success',
      build: build,
      setUp: () {
        when(() => logMedication(any())).thenAnswer((_) async => right(_log()));
        when(() => getTodaySchedule(date: any(named: 'date')))
            .thenAnswer((_) async => right([_item(isCompleted: true)]));
      },
      act: (b) => b.add(
        TodayScheduleEvent.logDose(
          schedule: _schedule(),
          drug: _drug(),
        ),
      ),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleLoaded>(),
      ],
    );

    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'emits error when logMedication fails',
      build: build,
      setUp: () => when(() => logMedication(any()))
          .thenAnswer((_) async => left(_failure)),
      act: (b) => b.add(
        TodayScheduleEvent.logDose(
          schedule: _schedule(),
          drug: _drug(),
        ),
      ),
      expect: () => [isA<TodayScheduleError>()],
    );
  });

  group('SkipDoseTodaySchedule', () {
    blocTest<TodayScheduleBloc, TodayScheduleState>(
      'skips dose and reloads on success',
      build: build,
      setUp: () {
        when(() => logMedication(any())).thenAnswer((_) async => right(_log()));
        when(() => getTodaySchedule(date: any(named: 'date')))
            .thenAnswer((_) async => right([_item()]));
      },
      act: (b) => b.add(
        TodayScheduleEvent.skipDose(
          schedule: _schedule(),
          drug: _drug(),
        ),
      ),
      expect: () => [
        isA<TodayScheduleLoading>(),
        isA<TodayScheduleLoaded>(),
      ],
    );
  });
}
