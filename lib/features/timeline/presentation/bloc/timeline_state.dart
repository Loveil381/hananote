import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/timeline/domain/entities/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';

part 'timeline_state.freezed.dart';

/// States for the timeline screen.
@freezed
sealed class TimelineState with _$TimelineState {
  /// Initial idle state.
  const factory TimelineState.initial() = TimelineInitial;

  /// Loading state while data is fetched.
  const factory TimelineState.loading() = TimelineLoading;

  /// Loaded state containing timeline data.
  const factory TimelineState.loaded({
    required List<TimelineEvent> events,
    required TimelineFilterRange selectedRange,
    DateTime? hrtStartDate,
  }) = TimelineLoaded;

  /// Error state.
  const factory TimelineState.error(String message) = TimelineError;
}
