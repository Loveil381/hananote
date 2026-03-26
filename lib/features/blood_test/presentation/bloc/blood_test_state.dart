import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/presentation/bloc/blood_test_event.dart';

part 'blood_test_state.freezed.dart';

/// States for the Blood Test Dashboard.
@freezed
sealed class BloodTestState with _$BloodTestState {
  /// Initial state before loading.
  const factory BloodTestState.initial() = BloodTestInitial;

  /// Loading state.
  const factory BloodTestState.loading() = BloodTestLoading;

  /// Success state containing dashboard data.
  const factory BloodTestState.loaded({
    required List<BloodTestReport> reports,
    required Map<HormoneType, HormoneReading> latestReadings,
    required HormoneType selectedTrendHormone,
    required TrendRange selectedRange,
    required List<HormoneReading> trendData,
    required DateTime? lastUpdated,
  }) = BloodTestLoaded;

  /// Error state.
  const factory BloodTestState.error(String message) = BloodTestError;
}
