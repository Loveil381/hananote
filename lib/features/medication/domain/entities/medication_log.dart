import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'medication_log.freezed.dart';

/// A record of a medication dose that was taken or skipped.
@freezed
class MedicationLog with _$MedicationLog {
  /// Creates a [MedicationLog].
  @Assert('dosageAmount >= 0', 'dosageAmount must be zero or positive')
  const factory MedicationLog({
    required String id,
    required String scheduleId,
    required String drugId,
    required DateTime timestamp,
    required double dosageAmount,
    required DosageUnit dosageUnit,
    required AdministrationRoute administrationRoute,
    required LogStatus status,
    InjectionSite? injectionSite,
    PatchSite? patchSite,
    int? patchCount,
    int? gelPumps,
    SkinReaction? skinReaction,
    String? notes,
  }) = _MedicationLog;
}
