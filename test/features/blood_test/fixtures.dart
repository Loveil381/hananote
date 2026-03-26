// ignore_for_file: public_member_api_docs

import 'package:hananote/features/blood_test/data/models/blood_test_report_model.dart';
import 'package:hananote/features/blood_test/data/models/hormone_reading_model.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';

HormoneReading buildReading({
  String id = 'reading-1',
  String reportId = 'report-1',
  HormoneType type = HormoneType.estradiol,
  double value = 156,
  String? unit,
}) {
  return HormoneReading(
    id: id,
    reportId: reportId,
    type: type,
    value: value,
    unit: unit ?? type.defaultUnit,
    notes: 'reading note',
  );
}

BloodTestReport buildReport({
  String id = 'report-1',
  DateTime? testDate,
  List<HormoneReading>? readings,
}) {
  return BloodTestReport(
    id: id,
    testDate: testDate ?? DateTime(2026, 3, 20, 9),
    readings: readings ?? [buildReading(reportId: id)],
    labName: 'Tokyo Lab',
    notes: 'report note',
    createdAt: DateTime(2026, 3, 20, 10),
  );
}

HormoneReadingModel buildReadingModel({
  String id = 'reading-1',
  String reportId = 'report-1',
  HormoneType type = HormoneType.estradiol,
  double value = 156,
}) {
  return HormoneReadingModel.fromDomain(
    buildReading(id: id, reportId: reportId, type: type, value: value),
  );
}

BloodTestReportModel buildReportModel({
  String id = 'report-1',
  DateTime? testDate,
  List<HormoneReadingModel>? readings,
}) {
  return BloodTestReportModel.fromDomain(
    buildReport(
      id: id,
      testDate: testDate,
      readings: readings?.map((reading) => reading.toDomain()).toList(),
    ),
  );
}

Map<String, Object?> buildJoinedRow({
  String reportId = 'report-1',
  DateTime? testDate,
  String? readingId = 'reading-1',
  HormoneType type = HormoneType.estradiol,
  double value = 156,
}) {
  return <String, Object?>{
    'report_id': reportId,
    'report_test_date':
        (testDate ?? DateTime(2026, 3, 20, 9)).toIso8601String(),
    'report_lab_name': 'Tokyo Lab',
    'report_notes': 'report note',
    'report_created_at': DateTime(2026, 3, 20, 10).toIso8601String(),
    'reading_id': readingId,
    'reading_report_id': readingId == null ? null : reportId,
    'reading_hormone_type': readingId == null ? null : type.name,
    'reading_value': readingId == null ? null : value,
    'reading_unit': readingId == null ? null : type.defaultUnit,
    'reading_notes': readingId == null ? null : 'reading note',
  };
}
