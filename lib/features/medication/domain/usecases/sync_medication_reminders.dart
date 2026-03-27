import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/notifications/notification_service.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:injectable/injectable.dart';

/// Synchronizes scheduled medication reminders with active schedules.
@injectable
class SyncMedicationReminders {
  /// Creates a [SyncMedicationReminders].
  SyncMedicationReminders(this._repository, this._notificationService);

  final MedicationRepository _repository;
  final NotificationService _notificationService;

  /// Cancels existing reminders and reschedules active medication times.
  Future<Either<Failure, int>> call() async {
    try {
      await _notificationService.cancelAllReminders();

      final drugsResult = await _repository.getAllDrugs();
      return await drugsResult.fold(
        (failure) async =>
            left(Failure.notification(message: failureMessage(failure))),
        (drugs) async {
          var reminderCount = 0;

          for (final drug in drugs.where((drug) => drug.isActive)) {
            final scheduleResult = await _repository.getScheduleForDrug(
              drug.id,
            );
            if (scheduleResult.isLeft()) {
              final failure = scheduleResult.swap().getOrElse(
                    (_) => const Failure.notification(
                      message: 'failed to load schedule',
                    ),
                  );
              return left(
                Failure.notification(message: failureMessage(failure)),
              );
            }

            final schedule = scheduleResult.getOrElse((_) => null);
            if (schedule == null ||
                !schedule.isActive ||
                schedule.scheduleTimes.isEmpty) {
              continue;
            }

            for (final entry in schedule.scheduleTimes.indexed) {
              final timeIndex = entry.$1;
              final scheduleTime = entry.$2;
              final id = drug.id.hashCode.abs() % 10000 * 10 + timeIndex;

              await _notificationService.scheduleMedicationReminder(
                id: id,
                drugName: drug.name,
                dosage: schedule.dosageAmount,
                unit: schedule.dosageUnit.name,
                hour: scheduleTime.hour,
                minute: scheduleTime.minute,
              );
              reminderCount++;
            }
          }

          return right(reminderCount);
        },
      );
    } catch (error) {
      return left(Failure.notification(message: error.toString()));
    }
  }
}
