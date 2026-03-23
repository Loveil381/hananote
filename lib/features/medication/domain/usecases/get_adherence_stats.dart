import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';

/// Adherence summary for a single drug.
class DrugAdherenceStat {
  /// Creates a [DrugAdherenceStat].
  const DrugAdherenceStat({
    required this.drug,
    required this.rate,
  });

  /// Drug definition.
  final Drug drug;

  /// Adherence rate in the requested interval.
  final double rate;
}

/// Query parameters for [GetAdherenceStats].
class GetAdherenceStatsParams {
  /// Creates [GetAdherenceStatsParams].
  const GetAdherenceStatsParams({
    required this.from,
    required this.to,
  });

  /// Inclusive range start.
  final DateTime from;

  /// Inclusive range end.
  final DateTime to;
}

/// Computes adherence rates for all active drugs.
class GetAdherenceStats {
  /// Creates a [GetAdherenceStats] use case.
  GetAdherenceStats(this._repository);

  final MedicationRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, List<DrugAdherenceStat>>> call(
    GetAdherenceStatsParams params,
  ) async {
    final drugsResult = await _repository.getAllDrugs();
    if (drugsResult.isLeft()) {
      return drugsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final stats = <DrugAdherenceStat>[];
    final drugs =
        drugsResult.getOrElse((_) => <Drug>[]).where((drug) => drug.isActive);
    for (final drug in drugs) {
      final rateResult = await _repository.getAdherenceRate(
        drug.id,
        from: params.from,
        to: params.to,
      );
      if (rateResult.isLeft()) {
        return rateResult.fold(left, (_) => throw StateError('unreachable'));
      }

      stats.add(
        DrugAdherenceStat(
          drug: drug,
          rate: rateResult.getOrElse((_) => 0),
        ),
      );
    }

    return right(stats);
  }
}
