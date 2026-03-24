import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/usecases/get_adherence_stats.dart';

part 'adherence_state.freezed.dart';

/// States for [AdherenceCubit].
@freezed
sealed class AdherenceState with _$AdherenceState {
  /// Not yet loaded.
  const factory AdherenceState.initial() = AdherenceInitial;

  /// Fetching adherence statistics.
  const factory AdherenceState.loading() = AdherenceLoading;

  /// Stats loaded successfully.
  const factory AdherenceState.loaded({
    required List<DrugAdherenceStat> stats,

    /// Mean adherence rate across all active drugs; 0.0 when no drugs.
    required double overallRate,
  }) = AdherenceLoaded;

  /// Failed to load stats.
  const factory AdherenceState.error({
    required String message,
  }) = AdherenceError;
}
