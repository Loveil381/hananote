import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';
import 'package:hananote/features/timeline/domain/entities/timeline_event.dart';
import 'package:hananote/features/timeline/domain/usecases/get_timeline_events.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_bloc.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_event.dart';
import 'package:hananote/features/timeline/presentation/bloc/timeline_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockGetTimelineEvents extends Mock implements GetTimelineEvents {}

class _MockSettingsRepository extends Mock implements SettingsRepository {}

void main() {
  late _MockGetTimelineEvents getTimelineEvents;
  late _MockSettingsRepository settingsRepository;

  final profile = UserProfile.withCalculatedHrtDayCount(
    displayName: '小花',
    hrtStartDate: DateTime(2025, 11, 30),
    today: DateTime(2026, 3, 27),
  );

  final events = [
    TimelineEvent(
      id: 'event-1',
      date: DateTime(2026, 3, 20),
      type: TimelineEventType.bloodTest,
      title: '血液检测',
      subtitle: 'E2 150 pg/mL',
    ),
  ];

  TimelineBloc buildBloc() => TimelineBloc(
        getTimelineEvents,
        settingsRepository,
      );

  setUp(() {
    getTimelineEvents = _MockGetTimelineEvents();
    settingsRepository = _MockSettingsRepository();
  });

  test('initial state is TimelineInitial', () {
    expect(buildBloc().state, isA<TimelineInitial>());
  });

  group('LoadTimeline', () {
    blocTest<TimelineBloc, TimelineState>(
      'emits [loading, loaded] when data loads successfully',
      build: buildBloc,
      setUp: () {
        when(() => settingsRepository.getUserProfile())
            .thenAnswer((_) async => right(profile));
        when(
          () => getTimelineEvents(
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer((_) async => right(events));
      },
      act: (bloc) => bloc.add(const TimelineBlocEvent.loadTimeline()),
      expect: () => [
        isA<TimelineLoading>(),
        isA<TimelineLoaded>()
            .having((state) => state.events, 'events', events)
            .having(
              (state) => state.selectedRange,
              'selectedRange',
              TimelineRange.oneMonth,
            )
            .having(
              (state) => state.hrtStartDate,
              'hrtStartDate',
              profile.hrtStartDate,
            ),
      ],
      verify: (_) {
        verify(() => settingsRepository.getUserProfile()).called(1);
        verify(
          () => getTimelineEvents(
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).called(1);
      },
    );
  });

  group('SelectTimelineRange', () {
    blocTest<TimelineBloc, TimelineState>(
      'reloads the timeline with the selected range',
      build: buildBloc,
      seed: () => TimelineState.loaded(
        events: events,
        selectedRange: TimelineRange.oneMonth,
        hrtStartDate: profile.hrtStartDate,
      ),
      setUp: () {
        when(() => settingsRepository.getUserProfile())
            .thenAnswer((_) async => right(profile));
        when(
          () => getTimelineEvents(
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer((_) async => right(events));
      },
      act: (bloc) => bloc.add(
        const TimelineBlocEvent.selectRange(TimelineRange.threeMonths),
      ),
      expect: () => [
        isA<TimelineLoading>(),
        isA<TimelineLoaded>()
            .having(
              (state) => state.selectedRange,
              'selectedRange',
              TimelineRange.threeMonths,
            )
            .having((state) => state.events, 'events', events),
      ],
    );
  });

  group('failure handling', () {
    blocTest<TimelineBloc, TimelineState>(
      'emits error when loading timeline data fails',
      build: buildBloc,
      setUp: () {
        when(() => settingsRepository.getUserProfile())
            .thenAnswer((_) async => right(profile));
        when(
          () => getTimelineEvents(
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer(
          (_) async => left(
            const Failure.storage(message: 'timeline unavailable'),
          ),
        );
      },
      act: (bloc) => bloc.add(const TimelineBlocEvent.loadTimeline()),
      expect: () => [
        isA<TimelineLoading>(),
        isA<TimelineError>().having(
          (state) => state.message,
          'message',
          'timeline unavailable',
        ),
      ],
    );
  });
}
