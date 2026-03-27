import 'package:flutter_test/flutter_test.dart';

import '../../fixtures.dart';

void main() {
  test('creates a measurement entry with optional fields', () {
    final entry = buildMeasurementEntry(
      weight: null,
    );

    expect(entry.bust, 86);
    expect(entry.waist, 72);
    expect(entry.hip, 92);
    expect(entry.weight, isNull);
  });

  test('copyWith updates only the provided fields', () {
    final entry = buildMeasurementEntry();

    final updated = entry.copyWith(
      waist: 70,
      notes: 'Updated note',
    );

    expect(updated.waist, 70);
    expect(updated.notes, 'Updated note');
    expect(updated.bust, entry.bust);
    expect(updated.hip, entry.hip);
  });

  test('supports value equality', () {
    final first = buildMeasurementEntry();
    final second = buildMeasurementEntry();

    expect(first, second);
  });
}
