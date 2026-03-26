import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_all_blood_test_reports.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_hormone_trend.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_bloc.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockGetAllBloodTestReports extends Mock
    implements GetAllBloodTestReports {}

class _MockGetHormoneTrend extends Mock implements GetHormoneTrend {}

void main() {
  late _MockGetAllBloodTestReports getAllReports;
  late _MockGetHormoneTrend getTrend;

  final newestEstradiol = buildReading(
    id: 'reading-estradiol-newest',
    reportId: 'report-newest',
    value: 182,
  );
  final olderEstradiol = buildReading(
    id: 'reading-estradiol-older',
    reportId: 'report-older',
    value: 148,
  );
  final latestTestosterone = buildReading(
    id: 'reading-testosterone-newest',
    reportId: 'report-newest',
    type: HormoneType.testosterone,
    value: 34,
  );

  final reports = <BloodTestReport>[
    buildReport(
      id: 'report-newest',
      testDate: DateTime(2026, 3, 20, 9),
      readings: [newestEstradiol, latestTestosterone],
    ),
    buildReport(
      id: 'report-older',
      testDate: DateTime(2026, 2, 10, 9),
      readings: [olderEstradiol],
    ),
  ];

  final defaultTrend = <HormoneReading>[
    olderEstradiol,
    newestEstradiol,
  ];

  BloodTestState buildLoadedState({
    HormoneType selectedHormone = HormoneType.estradiol,
    TrendRange selectedRange = TrendRange.threeMonths,
    List<HormoneReading>? trendData,
  }) {
    return BloodTestState.loaded(
      reports: reports,
      latestReadings: {
        HormoneType.estradiol: newestEstradiol,
        HormoneType.testosterone: latestTestosterone,
      },
      selectedTrendHormone: selectedHormone,
      selectedRange: selectedRange,
      trendData: trendData ?? defaultTrend,
      lastUpdated: reports.first.testDate,
    );
  }

  BloodTestBloc buildBloc() => BloodTestBloc(
        getAllReports: getAllReports,
        getTrend: getTrend,
      );

  setUpAll(() {
    registerFallbackValue(HormoneType.estradiol);
    registerFallbackValue(DateTime(2026));
  });

  setUp(() {
    getAllReports = _MockGetAllBloodTestReports();
    getTrend = _MockGetHormoneTrend();
  });

  test('initial state is BloodTestInitial', () {
    expect(buildBloc().state, isA<BloodTestInitial>());
  });

  group('LoadBloodTestDashboard', () {
    blocTest<BloodTestBloc, BloodTestState>(
      'emits [loading, loaded] with default hormone and range',
      build: buildBloc,
      setUp: () {
        when(() => getAllReports()).thenAnswer((_) async => right(reports));
        when(
          () => getTrend(
            HormoneType.estradiol,
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer((_) async => right(defaultTrend));
      },
      act: (bloc) => bloc.add(const BloodTestEvent.loadDashboard()),
      expect: () => [
        isA<BloodTestLoading>(),
        isA<BloodTestLoaded>()
            .having((state) => state.reports, 'reports', reports)
            .having(
              (state) => state.latestReadings[HormoneType.estradiol],
              'latest estradiol',
              newestEstradiol,
            )
            .having(
              (state) => state.latestReadings[HormoneType.testosterone],
              'latest testosterone',
              latestTestosterone,
            )
            .having(
              (state) => state.selectedTrendHormone,
              'selectedTrendHormone',
              HormoneType.estradiol,
            )
            .having(
              (state) => state.selectedRange,
              'selectedRange',
              TrendRange.threeMonths,
            )
            .having((state) => state.trendData, 'trendData', defaultTrend)
            .having(
              (state) => state.lastUpdated,
              'lastUpdated',
              reports.first.testDate,
            ),
      ],
      verify: (_) {
        verify(() => getAllReports()).called(1);
        final captured = verify(
          () => getTrend(
            HormoneType.estradiol,
            from: captureAny(named: 'from'),
            to: captureAny(named: 'to'),
          ),
        ).captured;

        final from = captured[0] as DateTime;
        final to = captured[1] as DateTime;
        expect(from.isBefore(to), isTrue);
      },
    );
  });

  group('SelectHormoneForTrend', () {
    blocTest<BloodTestBloc, BloodTestState>(
      'updates the selected hormone and trend data',
      build: buildBloc,
      seed: buildLoadedState,
      setUp: () {
        when(
          () => getTrend(
            HormoneType.testosterone,
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer(
          (_) async => right([
            buildReading(
              id: 'trend-testosterone-1',
              reportId: 'report-older',
              type: HormoneType.testosterone,
              value: 42,
            ),
            latestTestosterone,
          ]),
        );
      },
      act: (bloc) => bloc.add(
        const BloodTestEvent.selectHormoneForTrend(HormoneType.testosterone),
      ),
      expect: () => [
        isA<BloodTestLoaded>()
            .having(
              (state) => state.selectedTrendHormone,
              'selectedTrendHormone',
              HormoneType.testosterone,
            )
            .having(
              (state) => state.selectedRange,
              'selectedRange',
              TrendRange.threeMonths,
            )
            .having(
          (state) => state.trendData.map((reading) => reading.value).toList(),
          'trend values',
          [42.0, 34.0],
        ),
      ],
      verify: (_) {
        final captured = verify(
          () => getTrend(
            HormoneType.testosterone,
            from: captureAny(named: 'from'),
            to: captureAny(named: 'to'),
          ),
        ).captured;

        expect(
          (captured[0] as DateTime).isBefore(captured[1] as DateTime),
          isTrue,
        );
      },
    );
  });

  group('SelectTrendRange', () {
    blocTest<BloodTestBloc, BloodTestState>(
      'updates the selected range and trend data',
      build: buildBloc,
      seed: buildLoadedState,
      setUp: () {
        when(
          () => getTrend(
            HormoneType.estradiol,
            from: any(named: 'from'),
            to: any(named: 'to'),
          ),
        ).thenAnswer(
          (_) async => right([
            buildReading(
              id: 'trend-estradiol-0',
              reportId: 'report-oldest',
              value: 132,
            ),
            ...defaultTrend,
          ]),
        );
      },
      act: (bloc) =>
          bloc.add(const BloodTestEvent.selectTrendRange(TrendRange.sixMonths)),
      expect: () => [
        isA<BloodTestLoaded>()
            .having(
              (state) => state.selectedTrendHormone,
              'selectedTrendHormone',
              HormoneType.estradiol,
            )
            .having(
              (state) => state.selectedRange,
              'selectedRange',
              TrendRange.sixMonths,
            )
            .having(
          (state) => state.trendData.map((reading) => reading.value).toList(),
          'trend values',
          [132.0, 148.0, 182.0],
        ),
      ],
      verify: (_) {
        final captured = verify(
          () => getTrend(
            HormoneType.estradiol,
            from: captureAny(named: 'from'),
            to: captureAny(named: 'to'),
          ),
        ).captured;

        expect(
          (captured[0] as DateTime).isBefore(captured[1] as DateTime),
          isTrue,
        );
      },
    );
  });
}
