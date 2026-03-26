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
    required DateTime? lastPhotoDate,      // null for now (Phase 2)
    required DateTime? lastMeasurementDate, // null for now (Phase 2)
    required String? lastMeasurementSummary, // null for now (Phase 2)
  }) = RecordLoaded;
  const factory RecordState.error(String message) = RecordError;
}
