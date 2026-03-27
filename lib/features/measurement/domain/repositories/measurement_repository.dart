import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';

/// Contract for measurement persistence and queries.
abstract class MeasurementRepository {
  /// Saves a measurement [entry].
  Future<Either<Failure, MeasurementEntry>> save(MeasurementEntry entry);

  /// Returns all stored measurement entries.
  Future<Either<Failure, List<MeasurementEntry>>> getAll();

  /// Returns the latest measurement entry, if present.
  Future<Either<Failure, MeasurementEntry?>> getLatest();

  /// Returns all entries within the inclusive date range.
  Future<Either<Failure, List<MeasurementEntry>>> getByDateRange(
    DateTime from,
    DateTime to,
  );

  /// Deletes the entry with [id].
  Future<Either<Failure, Unit>> delete(String id);
}
