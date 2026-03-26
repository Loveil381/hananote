import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_journal_streak.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';
import 'package:hananote/features/journal/presentation/bloc/record_state.dart';
import 'package:injectable/injectable.dart';

/// Bloc for RecordPage to display dynamic streak and latest records
@injectable
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  /// Creates a [RecordBloc]
  RecordBloc(this._getJournalStreak, this._repository)
      : super(const RecordState.initial()) {
    on<LoadRecordSummary>(_onLoadRecordSummary);
    on<RefreshRecordSummary>(_onRefreshRecordSummary);
  }

  final GetJournalStreak _getJournalStreak;
  final JournalRepository _repository;

  Future<void> _onLoadRecordSummary(
    LoadRecordSummary event,
    Emitter<RecordState> emit,
  ) async {
    emit(const RecordState.loading());
    
    // Fetch streak
    final streakResult = await _getJournalStreak();
    var streak = 0;
    streakResult.fold(
      (failure) => null,
      (success) => streak = success,
    );

    // Fetch latest entry date
    final latestEntryResult = await _repository.getLatestEntry();
    DateTime? lastJournalDate;
    latestEntryResult.fold(
      (failure) => null,
      (entry) => lastJournalDate = entry?.date,
    );

    emit(
      RecordState.loaded(
        journalStreak: streak,
        lastJournalDate: lastJournalDate,
        lastPhotoDate: null,
        lastMeasurementDate: null,
        lastMeasurementSummary: null,
      ),
    );
  }

  Future<void> _onRefreshRecordSummary(
    RefreshRecordSummary event,
    Emitter<RecordState> emit,
  ) async {
    add(const RecordEvent.loadSummary());
  }
}
