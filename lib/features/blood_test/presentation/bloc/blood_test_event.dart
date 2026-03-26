import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';

part 'blood_test_event.freezed.dart';

/// Range for trend data chart.
enum TrendRange {
  /// One month backward
  oneMonth,

  /// Three months backward
  threeMonths,

  /// Six months backward
  sixMonths,

  /// One year backward
  oneYear,
}

/// Events for the Blood Test Dashboard.
@freezed
sealed class BloodTestEvent with _$BloodTestEvent {
  /// Load the dashboard data (reports, latest readings, initial trend).
  const factory BloodTestEvent.loadDashboard() = LoadBloodTestDashboard;

  /// Select a hormone to display on the trend chart.
  const factory BloodTestEvent.selectHormoneForTrend(HormoneType type) =
      SelectHormoneForTrend;

  /// Select the time range for the trend chart.
  const factory BloodTestEvent.selectTrendRange(TrendRange range) =
      SelectTrendRange;
}
