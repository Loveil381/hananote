import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';

/// Domain contract for managing blood test reports and hormone trends.
abstract interface class BloodTestRepository {
  /// Returns all stored reports.
  Future<Either<Failure, List<BloodTestReport>>> getAllReports();

  /// Returns the report identified by [id].
  Future<Either<Failure, BloodTestReport>> getReportById(String id);

  /// Persists [report] and returns the stored entity.
  Future<Either<Failure, BloodTestReport>> addReport(BloodTestReport report);

  /// Deletes the report identified by [id].
  Future<Either<Failure, void>> deleteReport(String id);

  /// Returns readings of the requested [type] within the optional date range.
  Future<Either<Failure, List<HormoneReading>>> getReadingsByType(
    HormoneType type, {
    DateTime? from,
    DateTime? to,
  });

  /// Returns the latest recorded reading of the requested [type], if present.
  Future<Either<Failure, HormoneReading?>> getLatestReading(HormoneType type);
}
