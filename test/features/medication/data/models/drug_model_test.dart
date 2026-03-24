import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/medication/data/models/drug_model.dart';

import '../fixtures.dart';

void main() {
  group('DrugModel', () {
    test('round-trips between json and domain', () {
      final domain = buildDrug();
      final model = DrugModel.fromDomain(domain);

      final json = model.toJson();
      final decoded = DrugModel.fromJson(json);

      expect(decoded, model);
      expect(decoded.toDomain(), domain);
    });

    test('serializes sqlite field names correctly', () {
      final model = buildDrugModel();

      final json = model.toJson();

      expect(json['generic_name'], 'Estradiol Valerate');
      expect(json['administration_route'], 'oral');
      expect(json['default_dosage_unit'], 'mg');
      expect(json['is_active'], 1);
    });
  });
}
