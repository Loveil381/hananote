import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart';

part 'today_schedule_state.freezed.dart';

/// States for `TodayScheduleBloc`.
@freezed
sealed class TodayScheduleState with _$TodayScheduleState {
  /// Not yet loaded.
  const factory TodayScheduleState.initial() = TodayScheduleInitial;

  /// Fetching today's schedule.
  const factory TodayScheduleState.loading() = TodayScheduleLoading;

  /// Schedule loaded successfully.
  const factory TodayScheduleState.loaded({
    required List<TodayScheduleItem> items,
    required DateTime date,
    required int completedCount,
    required int totalCount,
  }) = TodayScheduleLoaded;

  /// Failed to load or mutate schedule.
  const factory TodayScheduleState.error({
    required String message,
  }) = TodayScheduleError;
}
