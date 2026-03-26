import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_event.freezed.dart';

/// Events for RecordBloc
@freezed
sealed class RecordEvent with _$RecordEvent {
  const factory RecordEvent.loadSummary() = LoadRecordSummary;
  const factory RecordEvent.refresh() = RefreshRecordSummary;
}
