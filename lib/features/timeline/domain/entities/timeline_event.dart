import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';

part 'timeline_event.freezed.dart';

/// Unified read-only timeline event aggregated from multiple features.
@freezed
class TimelineEvent with _$TimelineEvent {
  /// Creates a [TimelineEvent].
  const factory TimelineEvent({
    required String id,
    required DateTime date,
    required TimelineEventType type,
    required String title,
    String? subtitle,
    Map<String, dynamic>? metadata,
  }) = _TimelineEvent;
}
