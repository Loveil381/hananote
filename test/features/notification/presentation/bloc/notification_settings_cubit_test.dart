import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/notification/presentation/bloc/notification_settings_cubit.dart';
import 'package:hananote/features/notification/presentation/bloc/notification_settings_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockMedicationRepository extends Mock implements MedicationRepository {}

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

MedicationSchedule _buildSchedule({
  String id = 'sched-1',
  String drugId = 'drug-1',
}) =>
    MedicationSchedule(
      id: id,
      drugId: drugId,
      dosageAmount: 2,
      dosageUnit: DosageUnit.mg,
      frequency: const MedicationFrequency.daily(timesPerDay: 2),
      administrationRoute: AdministrationRoute.oral,
      startDate: DateTime(2026, 3),
      isActive: true,
      scheduleTimes: const [
        TimeOfDay(hour: 8, minute: 0),
        TimeOfDay(hour: 20, minute: 0),
      ],
    );

void main() {
  late _MockMedicationRepository repository;
  late NotificationSettingsCubit cubit;

  setUp(() {
    repository = _MockMedicationRepository();
    cubit = NotificationSettingsCubit(repository);
  });

  tearDown(() => cubit.close());

  group('NotificationSettingsCubit', () {
    test('initial state is NotificationSettingsInitial', () {
      expect(cubit.state, const NotificationSettingsState.initial());
    });

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, loaded] with active drugs and schedules',
      build: () {
        when(repository.getAllDrugs)
            .thenAnswer((_) async => right([_buildDrug()]));
        when(() => repository.getScheduleForDrug('drug-1'))
            .thenAnswer((_) async => right(_buildSchedule()));
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        NotificationSettingsState.loaded(
          drugs: [_buildDrug()],
          schedules: {'drug-1': _buildSchedule()},
        ),
      ],
    );

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, loaded] with empty list when no active drugs',
      build: () {
        when(repository.getAllDrugs).thenAnswer(
          (_) async => right([_buildDrug(isActive: false)]),
        );
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        const NotificationSettingsState.loaded(
          drugs: [],
          schedules: {},
        ),
      ],
    );

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, loaded] when drug has no schedule',
      build: () {
        when(repository.getAllDrugs)
            .thenAnswer((_) async => right([_buildDrug()]));
        when(() => repository.getScheduleForDrug('drug-1'))
            .thenAnswer((_) async => right(null));
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        NotificationSettingsState.loaded(
          drugs: [_buildDrug()],
          schedules: const {},
        ),
      ],
    );

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, loaded] skipping drugs whose schedule fetch fails',
      build: () {
        final drug1 = _buildDrug();
        final drug2 = _buildDrug(id: 'drug-2');
        when(repository.getAllDrugs)
            .thenAnswer((_) async => right([drug1, drug2]));
        when(() => repository.getScheduleForDrug('drug-1'))
            .thenAnswer((_) async => right(_buildSchedule()));
        when(() => repository.getScheduleForDrug('drug-2')).thenAnswer(
          (_) async =>
              left(const Failure.database(message: 'schedule not found')),
        );
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        NotificationSettingsState.loaded(
          drugs: [_buildDrug(), _buildDrug(id: 'drug-2')],
          schedules: {'drug-1': _buildSchedule()},
        ),
      ],
    );

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, error] when getAllDrugs fails',
      build: () {
        when(repository.getAllDrugs).thenAnswer(
          (_) async =>
              left(const Failure.database(message: 'db connection lost')),
        );
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        const NotificationSettingsState.error(
          message: 'db connection lost',
        ),
      ],
    );

    blocTest<NotificationSettingsCubit, NotificationSettingsState>(
      'emits [loading, error] when getAllDrugs throws exception',
      build: () {
        when(repository.getAllDrugs).thenThrow(Exception('unexpected'));
        return cubit;
      },
      act: (c) => c.loadData(),
      expect: () => [
        const NotificationSettingsState.loading(),
        const NotificationSettingsState.error(
          message: 'Exception: unexpected',
        ),
      ],
    );
  });
}
