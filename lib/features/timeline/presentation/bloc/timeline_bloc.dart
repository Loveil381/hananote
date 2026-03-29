import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:hananote/features/timeline/domain/entities/timeline_event.dart';
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
    on<FilterTimelineEvents>(_onFilterTimelineEvents);
  }

  final GetTimelineEvents _getTimelineEvents;
  final SettingsRepository _settingsRepository;

  TimelineFilterRange _selectedRange = TimelineFilterRange.all;
  List<TimelineEvent>? _allEvents;

  Future<void> _onLoadTimeline(
    LoadTimeline event,
    Emitter<TimelineState> emit,
  ) async {
    emit(const TimelineLoading());

    final hrtStartDate = await _loadHrtStartDate();
    final timelineResult = await _getTimelineEvents();

    timelineResult.fold(
      (failure) => emit(TimelineError(failureMessage(failure))),
      (events) {
        _allEvents = events;
        _emitFiltered(emit, hrtStartDate);
      },
    );
  }

  void _onFilterTimelineEvents(
    FilterTimelineEvents event,
    Emitter<TimelineState> emit,
  ) {
    if (event.range == _selectedRange && _allEvents != null) {
      return;
    }

    _selectedRange = event.range;
    
    DateTime? hrtStartDate;
    if (state is TimelineLoaded) {
      hrtStartDate = (state as TimelineLoaded).hrtStartDate;
    }
    _emitFiltered(emit, hrtStartDate);
  }

  void _emitFiltered(Emitter<TimelineState> emit, DateTime? hrtStartDate) {
    if (_allEvents == null) return;
    final dateRange = _selectedRange.dateRange;
    final filteredEvents = dateRange == null
        ? _allEvents!
        : _allEvents!.where((e) {
            return e.date.isAfter(dateRange.from) ||
                e.date.isAtSameMomentAs(dateRange.from);
          }).toList();

    emit(
      TimelineLoaded(
        events: filteredEvents,
        selectedRange: _selectedRange,
        hrtStartDate: hrtStartDate,
      ),
    );
  }

  Future<DateTime?> _loadHrtStartDate() async {
    final profileResult = await _settingsRepository.getUserProfile();
    return profileResult.fold((_) => null, (profile) => profile.hrtStartDate);
  }
}
