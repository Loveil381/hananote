import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/pk_result.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';
import 'package:injectable/injectable.dart';

/// Runs the PK simulator using either an override regimen or active medication.
@injectable
class RunPkSimulation {
  /// Creates a [RunPkSimulation].
  RunPkSimulation(this._repository);

  final MedicationRepository _repository;
  static const PkEngine _engine = PkEngine();

  /// Executes the simulation.
  Future<Either<Failure, PkSimulationResult>> call({
    DosingRegimen? overrideRegimen,
  }) async {
    if (overrideRegimen != null) {
      return right(
        _engine.simulate(
          overrideRegimen,
          paramsOverride: overrideRegimen.esterType.defaultParameters,
        ),
      );
    }

    final regimenOrFailure = await _inferRegimenFromActiveMedication();
    return regimenOrFailure.fold(
      left,
      (regimen) => right(
        _engine.simulate(
          regimen,
          paramsOverride: regimen.esterType.defaultParameters,
        ),
      ),
    );
  }

  Future<Either<Failure, DosingRegimen>>
      _inferRegimenFromActiveMedication() async {
    final drugsResult = await _repository.getAllDrugs();
    if (drugsResult.isLeft()) {
      return drugsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final activeEstrogenDrugs = drugsResult
        .getOrElse((_) => const <Drug>[])
        .where(
          (drug) => drug.isActive && drug.category == DrugCategory.estrogen,
        )
        .toList();

    for (final drug in activeEstrogenDrugs) {
      final scheduleResult = await _repository.getScheduleForDrug(drug.id);
      if (scheduleResult.isLeft()) {
        return scheduleResult.fold(
          left,
          (_) => throw StateError('unreachable'),
        );
      }

      final schedule = scheduleResult.getOrElse((_) => null);
      if (schedule == null || !schedule.isActive) {
        continue;
      }

      return right(_buildRegimen(drug, schedule));
    }

    return left(
      const Failure.validation(
        message: 'No active estrogen medication found for PK simulation.',
      ),
    );
  }

  DosingRegimen _buildRegimen(Drug drug, MedicationSchedule schedule) {
    final esterType = _inferEsterType(drug);
    return DosingRegimen(
      esterType: esterType,
      doseAmount: schedule.dosageAmount,
      intervalDays: _inferIntervalDays(schedule),
      startDate: schedule.startDate,
      wearDurationDays: esterType == EsterType.transdermalPatch
          ? (schedule.intervalDays?.toDouble() ?? 7)
          : null,
      sublingualHoldTime: esterType == EsterType.sublingualEstradiol
          ? SublingualHoldTime.standard
          : null,
    );
  }

  EsterType _inferEsterType(Drug drug) {
    final haystack =
        '${drug.name} ${drug.genericName}'.toLowerCase().replaceAll('-', ' ');

    if (drug.administrationRoute == AdministrationRoute.oral ||
        drug.administrationRoute == AdministrationRoute.rectal) {
      return EsterType.oralEstradiol;
    }
    if (drug.administrationRoute == AdministrationRoute.sublingual) {
      return EsterType.sublingualEstradiol;
    }
    if (drug.administrationRoute == AdministrationRoute.transdermalPatch) {
      return EsterType.transdermalPatch;
    }
    if (drug.administrationRoute == AdministrationRoute.transdermalGel) {
      return EsterType.transdermalGel;
    }
    if (haystack.contains('环戊丙酸') ||
        haystack.contains('cypionate') ||
        haystack.contains(' ec ')) {
      return EsterType.estradiolCypionate;
    }
    if (haystack.contains('庚酸') ||
        haystack.contains('enanthate') ||
        haystack.contains('een')) {
      return EsterType.estradiolEnanthate;
    }
    if (haystack.contains('戊酸') || haystack.contains('valerate')) {
      return EsterType.estradiolValerate;
    }

    return EsterType.estradiolValerate;
  }

  double _inferIntervalDays(MedicationSchedule schedule) {
    return switch (schedule.frequency) {
      DailyMedicationFrequency(:final timesPerDay) => 1 / timesPerDay,
      EveryNDaysMedicationFrequency(:final days) => days.toDouble(),
      WeeklyMedicationFrequency() => 7,
      CustomMedicationFrequency() =>
        schedule.intervalDays?.toDouble() ?? _fallbackCustomInterval(schedule),
    };
  }

  double _fallbackCustomInterval(MedicationSchedule schedule) {
    if (schedule.scheduleTimes.length > 1) {
      return 1 / schedule.scheduleTimes.length;
    }

    return 1;
  }
}
