import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/journal/domain/entities/enums.dart';

void main() {
  group('MoodLevelX', () {
    test('exposes the expected display names', () {
      expect(MoodLevel.veryBad.displayName, '很差');
      expect(MoodLevel.bad.displayName, '不太好');
      expect(MoodLevel.neutral.displayName, '一般');
      expect(MoodLevel.good.displayName, '不错');
      expect(MoodLevel.veryGood.displayName, '很好');
    });

    test('exposes the expected emoji values', () {
      expect(MoodLevel.veryBad.emoji, '😢');
      expect(MoodLevel.bad.emoji, '😔');
      expect(MoodLevel.neutral.emoji, '😐');
      expect(MoodLevel.good.emoji, '😊');
      expect(MoodLevel.veryGood.emoji, '🥰');
    });

    test('exposes the expected numeric values', () {
      expect(MoodLevel.veryBad.numericValue, 1);
      expect(MoodLevel.bad.numericValue, 2);
      expect(MoodLevel.neutral.numericValue, 3);
      expect(MoodLevel.good.numericValue, 4);
      expect(MoodLevel.veryGood.numericValue, 5);
    });
  });
}
