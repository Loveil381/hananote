import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';

void main() {
  final expectedRanges = <HormoneType, (double min, double max)>{
    HormoneType.estradiol: (100, 200),
    HormoneType.testosterone: (0, 50),
    HormoneType.prolactin: (0, 25),
    HormoneType.progesterone: (0, 10),
    HormoneType.lh: (0, 10),
    HormoneType.fsh: (0, 10),
    HormoneType.shbg: (30, 120),
  };

  group('HormoneTypeX.targetRange', () {
    for (final entry in expectedRanges.entries) {
      test('${entry.key.name} exposes the configured target range', () {
        expect(entry.key.targetRange, entry.value);
      });
    }
  });

  group('HormoneTypeX.statusFor', () {
    for (final entry in expectedRanges.entries) {
      final type = entry.key;
      final (min, max) = entry.value;
      final span = max - min;

      test('${type.name} returns normal, warning, and critical correctly', () {
        expect(type.statusFor(min), HormoneStatus.normal);
        expect(type.statusFor((min + max) / 2), HormoneStatus.normal);
        expect(type.statusFor(max), HormoneStatus.normal);

        expect(type.statusFor(min - (span * 0.25)), HormoneStatus.warning);
        expect(type.statusFor(max + (span * 0.25)), HormoneStatus.warning);

        expect(type.statusFor(min - (span * 0.75)), HormoneStatus.critical);
        expect(type.statusFor(max + (span * 0.75)), HormoneStatus.critical);
      });
    }
  });
}
