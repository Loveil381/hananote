import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_all_blood_test_reports.dart';
import 'package:hananote/features/blood_test/domain/usecases/get_hormone_trend.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_state.dart';
import 'package:injectable/injectable.dart';

/// BLoC for managing the state of the blood test dashboard.
@injectable
class BloodTestBloc extends Bloc<BloodTestEvent, BloodTestState> {
  /// Constructs a [BloodTestBloc].
  BloodTestBloc({
    required GetAllBloodTestReports getAllReports,
    required GetHormoneTrend getTrend,
  })  : _getAllReports = getAllReports,
        _getTrend = getTrend,
        super(const BloodTestState.initial()) {
    on<LoadBloodTestDashboard>(_onLoadDashboard);
    on<SelectHormoneForTrend>(_onSelectHormoneForTrend);
    on<SelectTrendRange>(_onSelectTrendRange);
  }

  final GetAllBloodTestReports _getAllReports;
  final GetHormoneTrend _getTrend;

  Future<void> _onLoadDashboard(
    LoadBloodTestDashboard event,
    Emitter<BloodTestState> emit,
  ) async {
    emit(const BloodTestState.loading());

    final reportsResult = await _getAllReports();
    await reportsResult.fold(
      (f) async => emit(BloodTestState.error(f.message)),
      (reports) async {
        // Collect latest reading per hormone.
        final latestReadings = <HormoneType, HormoneReading>{};

        for (final report in reports) {
          for (final reading in report.readings) {
            final type = reading.type;
            if (!latestReadings.containsKey(type)) {
              latestReadings[type] = reading;
            } else {
              // Ensure we keep the latest via date comparison if needed.
              // Assuming reports are sorted descending by date.
            }
          }
        }

        final lastUpdated = reports.isNotEmpty ? reports.first.testDate : null;

        const defaultHormone = HormoneType.estradiol;
        const defaultRange = TrendRange.threeMonths;

        final trendResult = await _fetchTrendData(defaultHormone, defaultRange);

        trendResult.fold(
          (f) => emit(BloodTestState.error(f.message)),
          (trendData) => emit(
            BloodTestState.loaded(
              reports: reports,
              latestReadings: latestReadings,
              selectedTrendHormone: defaultHormone,
              selectedRange: defaultRange,
              trendData: trendData,
              lastUpdated: lastUpdated,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSelectHormoneForTrend(
    SelectHormoneForTrend event,
    Emitter<BloodTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is! BloodTestLoaded) return;

    if (currentState.selectedTrendHormone == event.type) return;

    final trendResult = await _fetchTrendData(
      event.type,
      currentState.selectedRange,
    );

    trendResult.fold(
      (f) => emit(BloodTestState.error(f.message)),
      (trendData) => emit(
        currentState.copyWith(
          selectedTrendHormone: event.type,
          trendData: trendData,
        ),
      ),
    );
  }

  Future<void> _onSelectTrendRange(
    SelectTrendRange event,
    Emitter<BloodTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is! BloodTestLoaded) return;

    if (currentState.selectedRange == event.range) return;

    final trendResult = await _fetchTrendData(
      currentState.selectedTrendHormone,
      event.range,
    );

    trendResult.fold(
      (f) => emit(BloodTestState.error(f.message)),
      (trendData) => emit(
        currentState.copyWith(
          selectedRange: event.range,
          trendData: trendData,
        ),
      ),
    );
  }

  Future<Either<Failure, List<HormoneReading>>> _fetchTrendData(
    HormoneType type,
    TrendRange range,
  ) {
    final now = DateTime.now();
    final startDate = switch (range) {
      TrendRange.oneMonth => DateTime(now.year, now.month - 1, now.day),
      TrendRange.threeMonths => DateTime(now.year, now.month - 3, now.day),
      TrendRange.sixMonths => DateTime(now.year, now.month - 6, now.day),
      TrendRange.oneYear => DateTime(now.year - 1, now.month, now.day),
    };

    return _getTrend(
      type,
      from: startDate,
      to: now,
    );
  }
}
