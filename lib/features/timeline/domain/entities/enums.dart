import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

/// Supported event categories shown in the timeline.
enum TimelineEventType {
  /// Medication log entries.
  medication,

  /// Blood test reports.
  bloodTest,

  /// Journal entries.
  journal,

  /// HRT milestone events.
  milestone,
}

/// Presentation helpers for [TimelineEventType].
extension TimelineEventTypeX on TimelineEventType {
  /// Localized display name.
  String get displayName => switch (this) {
        TimelineEventType.medication => '服药记录',
        TimelineEventType.bloodTest => '血液检测',
        TimelineEventType.journal => '日记',
        TimelineEventType.milestone => '里程碑',
      };

  /// Icon used for this timeline event.
  IconData get icon => switch (this) {
        TimelineEventType.medication => Icons.medication_rounded,
        TimelineEventType.bloodTest => Icons.favorite_rounded,
        TimelineEventType.journal => Icons.menu_book_rounded,
        TimelineEventType.milestone => Icons.star_rounded,
      };

  /// Accent border color used on timeline cards.
  Color get borderColor => switch (this) {
        TimelineEventType.medication => HanaColors.primary,
        TimelineEventType.bloodTest => const Color(0xFF4CAF50),
        TimelineEventType.journal => HanaColors.secondary,
        TimelineEventType.milestone => const Color(0xFFE0A100),
      };

  /// Foreground color used for the category icon.
  Color get iconColor => switch (this) {
        TimelineEventType.medication => HanaColors.primary,
        TimelineEventType.bloodTest => const Color(0xFF2E7D32),
        TimelineEventType.journal => HanaColors.secondary,
        TimelineEventType.milestone => const Color(0xFFB8860B),
      };
}
