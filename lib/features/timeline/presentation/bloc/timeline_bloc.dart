import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:hananote/features/timeline/domain/usecases/get_timeline_events.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_state.dart';
import 'package:injectable/injectable.dart';

/// BLoC for the unified timeline screen.
@injectable
class TimelineBloc extends Bloc<TimelineBlocEvent, TimelineState> {
  /// Creates a [TimelineBloc].
  TimelineBloc(this._getTimelineEvents, this._settingsRepository)
      : super(const TimelineInitial()) {
    on<LoadTimeline>(_onLoadTimeline);
    on<SelectTimelineRange>(_onSelectTimelineRange);
  }

  final GetTimelineEvents _getTimelineEvents;
  final SettingsRepository _settingsRepository;

  TimelineRange _selectedRange = TimelineRange.oneMonth;

  Future<void> _onLoadTimeline(
    LoadTimeline event,
    Emitter<TimelineState> emit,
  ) async {
    emit(const TimelineLoading());

    final hrtStartDate = await _loadHrtStartDate();
    final dateRange = _selectedRange.dateRange;
    final timelineResult = await _getTimelineEvents(
      from: dateRange?.from,
      to: dateRange?.to,
    );

    timelineResult.fold(
      (failure) => emit(TimelineError(failureMessage(failure))),
      (events) => emit(
        TimelineLoaded(
          events: events,
          selectedRange: _selectedRange,
          hrtStartDate: hrtStartDate,
        ),
      ),
    );
  }

  Future<void> _onSelectTimelineRange(
    SelectTimelineRange event,
    Emitter<TimelineState> emit,
  ) async {
    if (event.range == _selectedRange) {
      return;
    }

    _selectedRange = event.range;
    await _onLoadTimeline(const LoadTimeline(), emit);
  }

  Future<DateTime?> _loadHrtStartDate() async {
    final profileResult = await _settingsRepository.getUserProfile();
    return profileResult.fold((_) => null, (profile) => profile.hrtStartDate);
  }
}
