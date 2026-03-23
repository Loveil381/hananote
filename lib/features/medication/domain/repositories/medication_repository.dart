import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

/// Contract for medication domain persistence and queries.
abstract interface class MedicationRepository {
  /// Returns all stored drugs.
  Future<Either<Failure, List<Drug>>> getAllDrugs();

  /// Returns the drug with the given [id].
  Future<Either<Failure, Drug>> getDrugById(String id);

  /// Persists a new [drug].
  Future<Either<Failure, Drug>> addDrug(Drug drug);

  /// Persists changes to [drug].
  Future<Either<Failure, Drug>> updateDrug(Drug drug);

  /// Deletes the drug with the given [id].
  Future<Either<Failure, void>> deleteDrug(String id);

  /// Returns the active schedule for the given [drugId], if one exists.
  Future<Either<Failure, MedicationSchedule?>> getScheduleForDrug(
    String drugId,
  );

  /// Persists a new medication [schedule].
  Future<Either<Failure, MedicationSchedule>> addSchedule(
    MedicationSchedule schedule,
  );

  /// Persists changes to [schedule].
  Future<Either<Failure, MedicationSchedule>> updateSchedule(
    MedicationSchedule schedule,
  );

  /// Deletes the schedule with the given [id].
  Future<Either<Failure, void>> deleteSchedule(String id);

  /// Persists a new medication [log].
  Future<Either<Failure, MedicationLog>> addLog(MedicationLog log);

  /// Returns logs for [drugId] within the optional time range.
  Future<Either<Failure, List<MedicationLog>>> getLogsForDrug(
    String drugId, {
    DateTime? from,
    DateTime? to,
  });

  /// Returns logs recorded on [date].
  Future<Either<Failure, List<MedicationLog>>> getLogsForDate(DateTime date);

  /// Returns adherence for [drugId] in the given range.
  Future<Either<Failure, double>> getAdherenceRate(
    String drugId, {
    required DateTime from,
    required DateTime to,
  });

  /// Returns inventory for [drugId], if one exists.
  Future<Either<Failure, DrugInventory?>> getInventoryForDrug(String drugId);

  /// Persists the provided [inventory] snapshot.
  Future<Either<Failure, DrugInventory>> updateInventory(
    DrugInventory inventory,
  );

  /// Estimates the remaining days until inventory is empty for [drugId].
  Future<Either<Failure, int?>> getDaysUntilEmpty(String drugId);
}
