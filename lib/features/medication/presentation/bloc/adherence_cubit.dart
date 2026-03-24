import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/usecases/get_adherence_stats.dart';
import 'package:hananote/features/medication/presentation/bloc/adherence_state.dart';

/// Manages medication adherence statistics.
///
/// Calls [GetAdherenceStats] for a given date range and computes an
/// overall (mean) rate across all active drugs.
class AdherenceCubit extends Cubit<AdherenceState> {
  /// Creates an [AdherenceCubit].
  AdherenceCubit(this._getAdherenceStats)
      : super(const AdherenceState.initial());

  final GetAdherenceStats _getAdherenceStats;

  /// Loads adherence stats for the [from]–[to] range.
  Future<void> loadStats({
    required DateTime from,
    required DateTime to,
  }) async {
    emit(const AdherenceState.loading());
    final params = GetAdherenceStatsParams(from: from, to: to);
    final result = await _getAdherenceStats(params);
    result.fold(
      (failure) => emit(AdherenceState.error(message: failureMessage(failure))),
      (stats) {
        final overallRate = stats.isEmpty
            ? 0.0
            : stats.map((s) => s.rate).reduce((a, b) => a + b) / stats.length;
        emit(
          AdherenceState.loaded(
            stats: stats,
            overallRate: overallRate,
          ),
        );
      },
    );
  }
}
