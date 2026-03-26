// ignore_for_file: invalid_annotation_target, sort_unnamed_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/data/models/hormone_reading_model.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';

part 'blood_test_report_model.freezed.dart';
part 'blood_test_report_model.g.dart';

/// Data-layer representation of a [BloodTestReport].
@freezed
class BloodTestReportModel with _$BloodTestReportModel {
  /// Creates a [BloodTestReportModel].
  const BloodTestReportModel._();

  /// Creates a [BloodTestReportModel].
  const factory BloodTestReportModel({
    required String id,
    @JsonKey(name: 'test_date') required String testDate,
    @JsonKey(name: 'created_at') required String createdAt,
    @Default(<HormoneReadingModel>[])
    @JsonKey(includeFromJson: false, includeToJson: false)
    List<HormoneReadingModel> readings,
    @JsonKey(name: 'lab_name') String? labName,
    String? notes,
  }) = _BloodTestReportModel;

  /// Creates a [BloodTestReportModel] from JSON.
  factory BloodTestReportModel.fromJson(Map<String, dynamic> json) =>
      _$BloodTestReportModelFromJson(json);

  /// Creates a [BloodTestReportModel] from a domain entity.
  factory BloodTestReportModel.fromDomain(BloodTestReport entity) {
    return BloodTestReportModel(
      id: entity.id,
      testDate: entity.testDate.toIso8601String(),
      readings: entity.readings.map(HormoneReadingModel.fromDomain).toList(),
      labName: entity.labName,
      notes: entity.notes,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }

  /// Converts this model to a domain entity.
  BloodTestReport toDomain() {
    return BloodTestReport(
      id: id,
      testDate: DateTime.parse(testDate),
      readings: readings.map((reading) => reading.toDomain()).toList(),
      labName: labName,
      notes: notes,
      createdAt: DateTime.parse(createdAt),
    );
  }
}
