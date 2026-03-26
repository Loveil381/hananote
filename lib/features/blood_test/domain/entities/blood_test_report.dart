import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';

part 'blood_test_report.freezed.dart';

/// A blood test report containing one or more hormone readings.
@freezed
class BloodTestReport with _$BloodTestReport {
  /// Creates a [BloodTestReport].
  const factory BloodTestReport({
    required String id,
    required DateTime testDate,
    required List<HormoneReading> readings,
    required DateTime createdAt,
    String? labName,
    String? notes,
  }) = _BloodTestReport;
}
