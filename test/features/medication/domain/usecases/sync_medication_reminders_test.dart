import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/medication/domain/usecases/sync_medication_reminders.dart';
import 'package:mocktail/mocktail.dart';

class _MockMedicationRepository extends Mock implements MedicationRepository {}

class _MockNotificationService extends Mock implements NotificationService {}

void main() {
  late _MockMedicationRepository repository;
  late _MockNotificationService notificationService;
  late SyncMedicationReminders useCase;

  setUp(() {
    repository = _MockMedicationRepository();
    notificationService = _MockNotificationService();
    useCase = SyncMedicationReminders(repository, notificationService);
  });

  Drug buildDrug(String id, {required bool isActive}) => Drug(
        id: id,
        name: 'Drug $id',
        genericName: 'Generic $id',
        category: DrugCategory.estrogen,
        administrationRoute: AdministrationRoute.oral,
        defaultDosageUnit: DosageUnit.mg,
        isActive: isActive,
        createdAt: DateTime(2026),
      );

  MedicationSchedule buildSchedule(String drugId) => MedicationSchedule(
        id: 'schedule-$drugId',
        drugId: drugId,
        dosageAmount: 2,
        dosageUnit: DosageUnit.mg,
        frequency: const MedicationFrequency.daily(timesPerDay: 2),
        administrationRoute: AdministrationRoute.oral,
        startDate: DateTime(2026),
        isActive: true,
        scheduleTimes: const [
          TimeOfDay(hour: 8, minute: 0),
          TimeOfDay(hour: 20, minute: 0),
        ],
      );

  group('SyncMedicationReminders', () {
    test('synchronizes 2 active drugs with 2 times each', () async {
      final drugOne = buildDrug('drug-1', isActive: true);
      final drugTwo = buildDrug('drug-2', isActive: true);
      when(() => notificationService.cancelAllReminders())
          .thenAnswer((_) async {});
      when(() => repository.getAllDrugs())
          .thenAnswer((_) async => right([drugOne, drugTwo]));
      when(() => repository.getScheduleForDrug(drugOne.id))
          .thenAnswer((_) async => right(buildSchedule(drugOne.id)));
      when(() => repository.getScheduleForDrug(drugTwo.id))
          .thenAnswer((_) async => right(buildSchedule(drugTwo.id)));
      when(
        () => notificationService.scheduleMedicationReminder(
          id: any(named: 'id'),
          drugName: any(named: 'drugName'),
          dosage: any(named: 'dosage'),
          unit: any(named: 'unit'),
          hour: any(named: 'hour'),
          minute: any(named: 'minute'),
        ),
      ).thenAnswer((_) async {});

      final result = await useCase();

      expect(result, right<Failure, int>(4));
      verify(() => notificationService.cancelAllReminders()).called(1);
      verify(
        () => notificationService.scheduleMedicationReminder(
          id: any(named: 'id'),
          drugName: any(named: 'drugName'),
          dosage: any(named: 'dosage'),
          unit: any(named: 'unit'),
          hour: any(named: 'hour'),
          minute: any(named: 'minute'),
        ),
      ).called(4);
    });

    test('returns right(0) when there are no active drugs', () async {
      when(() => notificationService.cancelAllReminders())
          .thenAnswer((_) async {});
      when(() => repository.getAllDrugs())
          .thenAnswer(
            (_) async => right([buildDrug('drug-1', isActive: false)]),
          );

      final result = await useCase();

      expect(result, right<Failure, int>(0));
      verifyNever(
        () => notificationService.scheduleMedicationReminder(
          id: any(named: 'id'),
          drugName: any(named: 'drugName'),
          dosage: any(named: 'dosage'),
          unit: any(named: 'unit'),
          hour: any(named: 'hour'),
          minute: any(named: 'minute'),
        ),
      );
    });

    test('returns Failure.notification when the repository fails', () async {
      when(() => notificationService.cancelAllReminders())
          .thenAnswer((_) async {});
      when(() => repository.getAllDrugs()).thenAnswer(
        (_) async => left(const Failure.database(message: 'db unavailable')),
      );

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      expect(
        result.swap().getOrElse(
              (_) => const Failure.unexpected(message: 'unexpected'),
            ),
        const Failure.notification(message: 'db unavailable'),
      );
    });
  });
}
