import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_event.freezed.dart';

/// Available date ranges for the timeline filter.
enum TimelineFilterRange {
  /// Events from the last month.
  oneMonth,

  /// Events from the last three months.
  threeMonths,

  /// Events from the last six months.
  sixMonths,

  /// Events from the last year.
  oneYear,

  /// No date limit.
  all,
}

/// Presentation helpers for [TimelineFilterRange].
extension TimelineFilterRangeX on TimelineFilterRange {
  /// Localized label.
  String get displayName => switch (this) {
        TimelineFilterRange.oneMonth => '1月',
        TimelineFilterRange.threeMonths => '3月',
        TimelineFilterRange.sixMonths => '6月',
        TimelineFilterRange.oneYear => '1年',
        TimelineFilterRange.all => '全部',
      };

  /// Date range represented by the selected filter.
  ({DateTime from, DateTime to})? get dateRange {
    if (this == TimelineFilterRange.all) {
      return null;
    }

    final now = DateTime.now();
    final to = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final from = switch (this) {
      TimelineFilterRange.oneMonth => to.subtract(const Duration(days: 30)),
      TimelineFilterRange.threeMonths => to.subtract(const Duration(days: 90)),
      TimelineFilterRange.sixMonths => to.subtract(const Duration(days: 180)),
      TimelineFilterRange.oneYear => to.subtract(const Duration(days: 365)),
      TimelineFilterRange.all => to,
    };

    return (from: from, to: to);
  }
}

/// Events handled by the timeline bloc.
@freezed
sealed class TimelineBlocEvent with _$TimelineBlocEvent {
  /// Loads the selected timeline range.
  const factory TimelineBlocEvent.loadTimeline() = LoadTimeline;

  /// Changes the selected filter range and filters events locally.
  const factory TimelineBlocEvent.filterTimelineEvents({
    required TimelineFilterRange range,
  }) = FilterTimelineEvents;
}
