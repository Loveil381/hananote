import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/journal/domain/usecases/get_journal_streak.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';
import 'package:hananote/features/journal/presentation/bloc/record_state.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_type.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/photo/domain/repositories/photo_repository.dart';
import 'package:injectable/injectable.dart';

/// Bloc for RecordPage to display dynamic streak and latest records
@lazySingleton
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  /// Creates a [RecordBloc]
  RecordBloc(
    this._getJournalStreak,
    this._repository,
    this._measurementRepository,
    this._photoRepository,
  ) : super(const RecordState.initial()) {
    on<LoadRecordSummary>(_onLoadRecordSummary);
    on<RefreshRecordSummary>(_onRefreshRecordSummary);
  }

  final GetJournalStreak _getJournalStreak;
  final JournalRepository _repository;
  final MeasurementRepository _measurementRepository;
  final PhotoRepository _photoRepository;

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

    final latestMeasurementResult = await _measurementRepository.getLatest();
    DateTime? lastMeasurementDate;
    String? lastMeasurementSummary;
    latestMeasurementResult.fold(
      (failure) => null,
      (entry) {
        lastMeasurementDate = entry?.date;
        lastMeasurementSummary =
            entry == null ? null : _buildMeasurementSummary(entry);
      },
    );

    final latestPhotoResult = await _photoRepository.getLatest();
    DateTime? lastPhotoDate;
    latestPhotoResult.fold(
      (failure) => null,
      (entry) => lastPhotoDate = entry?.date,
    );

    emit(
      RecordState.loaded(
        journalStreak: streak,
        lastJournalDate: lastJournalDate,
        lastPhotoDate: lastPhotoDate,
        lastMeasurementDate: lastMeasurementDate,
        lastMeasurementSummary: lastMeasurementSummary,
      ),
    );
  }

  Future<void> _onRefreshRecordSummary(
    RefreshRecordSummary event,
    Emitter<RecordState> emit,
  ) async {
    add(const RecordEvent.loadSummary());
  }

  static String? _buildMeasurementSummary(MeasurementEntry entry) {
    final parts = <String>[];
    for (final type in MeasurementTypes.summary) {
      final value = entry.valueFor(type);
      if (value != null) {
        parts.add(
          '${_summaryLabel(type)}: ${_formatValue(value)}${type.unit}',
        );
      }
    }

    if (parts.isEmpty) {
      return null;
    }

    return parts.join(' · ');
  }

  static String _summaryLabel(MeasurementType type) {
    return switch (type) {
      MeasurementType.bust => '胸',
      MeasurementType.waist => '腰',
      MeasurementType.hip => '臀',
      _ => type.displayName,
    };
  }

  static String _formatValue(double value) {
    return value == value.roundToDouble()
        ? value.toStringAsFixed(0)
        : value.toStringAsFixed(1);
  }
}
