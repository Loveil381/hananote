import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';

void main() {
  group('TimelineEventTypeX', () {
    test('returns localized display names', () {
      expect(TimelineEventType.medication.displayName, '服药记录');
      expect(TimelineEventType.bloodTest.displayName, '血液检测');
      expect(TimelineEventType.journal.displayName, '日记');
      expect(TimelineEventType.milestone.displayName, '里程碑');
    });

    test('returns the expected icons', () {
      expect(TimelineEventType.medication.icon, Icons.medication_rounded);
      expect(TimelineEventType.bloodTest.icon, Icons.favorite_rounded);
      expect(TimelineEventType.journal.icon, Icons.menu_book_rounded);
      expect(TimelineEventType.milestone.icon, Icons.star_rounded);
    });
  });

  group('TimelineRangeX', () {
    test('returns null for the all range', () {
      expect(TimelineRange.all.dateRange, isNull);
    });

    test('returns the expected day spans for bounded ranges', () {
      expect(
        TimelineRange.oneMonth.dateRange!.to
            .difference(TimelineRange.oneMonth.dateRange!.from)
            .inDays,
        30,
      );
      expect(
        TimelineRange.threeMonths.dateRange!.to
            .difference(TimelineRange.threeMonths.dateRange!.from)
            .inDays,
        90,
      );
      expect(
        TimelineRange.sixMonths.dateRange!.to
            .difference(TimelineRange.sixMonths.dateRange!.from)
            .inDays,
        180,
      );
      expect(
        TimelineRange.oneYear.dateRange!.to
            .difference(TimelineRange.oneYear.dateRange!.from)
            .inDays,
        365,
      );
    });
  });
}
