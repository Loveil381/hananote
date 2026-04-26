import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_bloc.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_state.dart';
import 'package:hananote/features/blood_test/presentation/pages/data_page.dart';
import 'package:mocktail/mocktail.dart';

class _MockBloodTestBloc extends MockBloc<BloodTestEvent, BloodTestState>
    implements BloodTestBloc {}

void main() {
  late _MockBloodTestBloc bloodTestBloc;

  setUpAll(() {
    registerFallbackValue(const BloodTestEvent.loadDashboard());
  });

  setUp(() {
    bloodTestBloc = _MockBloodTestBloc();
    when(() => bloodTestBloc.stream).thenAnswer((_) => const Stream.empty());
  });

  BloodTestReport buildReport({
    required String id,
    required DateTime date,
    required double estradiol,
  }) {
    return BloodTestReport(
      id: id,
      testDate: date,
      createdAt: date,
      readings: [
        HormoneReading(
          id: 'reading-$id',
          reportId: id,
          type: HormoneType.estradiol,
          value: estradiol,
          unit: 'pg/mL',
        ),
      ],
    );
  }

  Widget buildApp(Widget child) {
    return MaterialApp(
      locale: const Locale('zh'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: child,
    );
  }

  testWidgets('shows no trend data when fewer than two reports exist', (
    tester,
  ) async {
    final report = buildReport(
      id: 'report-1',
      date: DateTime(2026, 3),
      estradiol: 128,
    );

    when(() => bloodTestBloc.state).thenReturn(
      BloodTestState.loaded(
        reports: [report],
        latestReadings: {
          HormoneType.estradiol: report.readings.first,
        },
        selectedTrendHormone: HormoneType.estradiol,
        selectedRange: TrendRange.threeMonths,
        trendData: [report.readings.first],
        lastUpdated: report.testDate,
      ),
    );

    await tester.pumpWidget(
      buildApp(
        BlocProvider<BloodTestBloc>.value(
          value: bloodTestBloc,
          child: const DataPage(),
        ),
      ),
    );

    expect(find.text('暂无趋势数据'), findsOneWidget);
  });

  testWidgets('shows trend chart when two or more reports exist', (
    tester,
  ) async {
    final report1 = buildReport(
      id: 'report-1',
      date: DateTime(2026),
      estradiol: 100,
    );
    final report2 = buildReport(
      id: 'report-2',
      date: DateTime(2026, 2),
      estradiol: 150,
    );

    when(() => bloodTestBloc.state).thenReturn(
      BloodTestState.loaded(
        reports: [report1, report2],
        latestReadings: {
          HormoneType.estradiol: report2.readings.first,
        },
        selectedTrendHormone: HormoneType.estradiol,
        selectedRange: TrendRange.threeMonths,
        trendData: [report1.readings.first, report2.readings.first],
        lastUpdated: report2.testDate,
      ),
    );

    await tester.pumpWidget(
      buildApp(
        BlocProvider<BloodTestBloc>.value(
          value: bloodTestBloc,
          child: const DataPage(),
        ),
      ),
    );

    // When there are 2+ reports, the "no trend data" text should not show
    expect(find.text('暂无趋势数据'), findsNothing);
  });

  testWidgets('shows error message in error state', (tester) async {
    when(() => bloodTestBloc.state).thenReturn(
      const BloodTestState.error('数据加载失败'),
    );

    await tester.pumpWidget(
      buildApp(
        BlocProvider<BloodTestBloc>.value(
          value: bloodTestBloc,
          child: const DataPage(),
        ),
      ),
    );

    expect(find.text('数据加载失败'), findsOneWidget);
  });
}
