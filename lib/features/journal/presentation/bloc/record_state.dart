import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_state.freezed.dart';

/// State for RecordBloc
@freezed
sealed class RecordState with _$RecordState {
  const factory RecordState.initial() = RecordInitial;
  const factory RecordState.loading() = RecordLoading;
  const factory RecordState.loaded({
    required int journalStreak,
    required DateTime? lastJournalDate,
    required DateTime? lastPhotoDate,
    required DateTime? lastMeasurementDate,
    required String? lastMeasurementSummary,
  }) = RecordLoaded;
  const factory RecordState.error(String message) = RecordError;
}
