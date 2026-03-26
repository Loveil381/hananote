import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';

part 'hormone_reading.freezed.dart';

/// A single hormone value recorded as part of a blood test report.
@freezed
class HormoneReading with _$HormoneReading {
  /// Creates a [HormoneReading].
  const factory HormoneReading({
    required String id,
    required String reportId,
    required HormoneType type,
    required double value,
    required String unit,
    String? notes,
  }) = _HormoneReading;
}
