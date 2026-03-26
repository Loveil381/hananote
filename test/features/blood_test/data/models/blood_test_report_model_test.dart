import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/blood_test/data/models/blood_test_report_model.dart';

import '../../fixtures.dart';

void main() {
  group('BloodTestReportModel', () {
    test('round-trips between domain and json without serializing readings',
        () {
      final model = buildReportModel();

      final json = model.toJson();

      expect(json['id'], 'report-1');
      expect(json['test_date'], DateTime(2026, 3, 20, 9).toIso8601String());
      expect(json.containsKey('readings'), isFalse);

      final fromJson = BloodTestReportModel.fromJson(json);
      expect(fromJson.readings, isEmpty);
      expect(
        fromJson.copyWith(readings: model.readings).toDomain(),
        buildReport(),
      );
    });
  });
}
