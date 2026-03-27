import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';
import 'package:injectable/injectable.dart';

/// Calibrates PK parameters against the user's blood test history.
@injectable
class CalibratePkParams {
  /// Creates a [CalibratePkParams].
  CalibratePkParams(this._bloodTestRepo);

  static const PkEngine _engine = PkEngine();
  static const double _lambda = 0.1;
  static const double _epsilon = 1e-6;
  static const List<double> _gridFactors = [0.5, 0.75, 1, 1.25, 1.5];

  final BloodTestRepository _bloodTestRepo;

  /// Uses MAP estimation to personalize PK parameters from estradiol labs.
  Future<Either<Failure, RouteParams>> call({
    required RouteParams populationParams,
    required DosingRegimen regimen,
  }) async {
    final reportsResult = await _bloodTestRepo.getAllReports();
    if (reportsResult.isLeft()) {
      return reportsResult.fold(left, (_) => throw StateError('unreachable'));
    }

    final observations = _extractEstradiolObservations(
      reportsResult.getOrElse((_) => const <BloodTestReport>[]),
      regimen,
    );
    if (observations.length < 2) {
      return right(populationParams);
    }

    return right(
      _coordinateSearch(
        populationParams: populationParams,
        regimen: regimen,
        observations: observations,
      ),
    );
  }

  RouteParams _coordinateSearch({
    required RouteParams populationParams,
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    return switch (populationParams) {
      final InjectionParams injection => _searchInjection(
          injection,
          regimen: regimen,
          observations: observations,
        ),
      final OralParams oral => _searchOral(
          oral,
          regimen: regimen,
          observations: observations,
        ),
      final SublingualParams sublingual => _searchSublingual(
          sublingual,
          regimen: regimen,
          observations: observations,
        ),
      final PatchParams patch => _searchPatch(
          patch,
          regimen: regimen,
          observations: observations,
        ),
      final GelParams gel => _searchGel(
          gel,
          regimen: regimen,
          observations: observations,
        ),
    };
  }

  InjectionParams _searchInjection(
    InjectionParams population, {
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    var best = population;

    for (var pass = 0; pass < 3; pass++) {
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) =>
            candidate.copyWith(fracFast: value.clamp(_epsilon, 1 - _epsilon)),
        populationValue: population.fracFast,
      );
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(k1Fast: value),
        populationValue: population.k1Fast,
      );
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(k1Slow: value),
        populationValue: population.k1Slow,
      );
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(k2: value),
        populationValue: population.k2,
      );
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(k3: value),
        populationValue: population.k3,
      );
      best = _pickBestInjection(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(
          formationFraction: value.clamp(_epsilon, 1),
        ),
        populationValue: population.formationFraction,
      );
    }

    return best;
  }

  OralParams _searchOral(
    OralParams population, {
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    var best = population;

    for (var pass = 0; pass < 3; pass++) {
      best = _pickBestOral(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kAbs: value),
        populationValue: population.kAbs,
      );
      best = _pickBestOral(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(
          bioavailability: value.clamp(_epsilon, 1),
        ),
        populationValue: population.bioavailability,
      );
      best = _pickBestOral(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kClear: value),
        populationValue: population.kClear,
      );
    }

    return best;
  }

  SublingualParams _searchSublingual(
    SublingualParams population, {
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    var best = population;

    for (var pass = 0; pass < 3; pass++) {
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) =>
            candidate.copyWith(theta: value.clamp(0, 1)),
        populationValue: population.theta,
      );
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kSL: value),
        populationValue: population.kSL,
      );
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kAbsOral: value),
        populationValue: population.kAbsOral,
      );
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(
          k2Hydrolysis: value.clamp(0, double.infinity),
        ),
        populationValue:
            population.k2Hydrolysis <= 0 ? 0.001 : population.k2Hydrolysis,
      );
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(
          bioavailabilityOral: value.clamp(_epsilon, 1),
        ),
        populationValue: population.bioavailabilityOral,
      );
      best = _pickBestSublingual(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kClear: value),
        populationValue: population.kClear,
      );
    }

    return best;
  }

  PatchParams _searchPatch(
    PatchParams population, {
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    var best = population;

    for (var pass = 0; pass < 3; pass++) {
      best = _pickBestPatch(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) =>
            candidate.copyWith(releaseRateMcgPerDay: value),
        populationValue: population.releaseRateMcgPerDay,
      );
      best = _pickBestPatch(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kClear: value),
        populationValue: population.kClear,
      );
    }

    return best;
  }

  GelParams _searchGel(
    GelParams population, {
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    var best = population;

    for (var pass = 0; pass < 3; pass++) {
      best = _pickBestGel(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kAbs: value),
        populationValue: population.kAbs,
      );
      best = _pickBestGel(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(
          bioavailability: value.clamp(_epsilon, 1),
        ),
        populationValue: population.bioavailability,
      );
      best = _pickBestGel(
        current: best,
        population: population,
        observations: observations,
        regimen: regimen,
        setter: (candidate, value) => candidate.copyWith(kClear: value),
        populationValue: population.kClear,
      );
    }

    return best;
  }

  InjectionParams _pickBestInjection({
    required InjectionParams current,
    required InjectionParams population,
    required List<_Observation> observations,
    required DosingRegimen regimen,
    required InjectionParams Function(InjectionParams current, double value)
        setter,
    required double populationValue,
  }) {
    var best = current;
    var bestScore = _score(
      candidate: best,
      population: population,
      regimen: regimen,
      observations: observations,
    );

    for (final value in _candidateValues(populationValue)) {
      final candidate = setter(current, value);
      final score = _score(
        candidate: candidate,
        population: population,
        regimen: regimen,
        observations: observations,
      );
      if (score < bestScore) {
        best = candidate;
        bestScore = score;
      }
    }

    return best;
  }

  OralParams _pickBestOral({
    required OralParams current,
    required OralParams population,
    required List<_Observation> observations,
    required DosingRegimen regimen,
    required OralParams Function(OralParams current, double value) setter,
    required double populationValue,
  }) {
    var best = current;
    var bestScore = _score(
      candidate: best,
      population: population,
      regimen: regimen,
      observations: observations,
    );

    for (final value in _candidateValues(populationValue)) {
      final candidate = setter(current, value);
      final score = _score(
        candidate: candidate,
        population: population,
        regimen: regimen,
        observations: observations,
      );
      if (score < bestScore) {
        best = candidate;
        bestScore = score;
      }
    }

    return best;
  }

  SublingualParams _pickBestSublingual({
    required SublingualParams current,
    required SublingualParams population,
    required List<_Observation> observations,
    required DosingRegimen regimen,
    required SublingualParams Function(SublingualParams current, double value)
        setter,
    required double populationValue,
  }) {
    var best = current;
    var bestScore = _score(
      candidate: best,
      population: population,
      regimen: regimen,
      observations: observations,
    );

    for (final value in _candidateValues(populationValue)) {
      final candidate = setter(current, value);
      final score = _score(
        candidate: candidate,
        population: population,
        regimen: regimen,
        observations: observations,
      );
      if (score < bestScore) {
        best = candidate;
        bestScore = score;
      }
    }

    return best;
  }

  PatchParams _pickBestPatch({
    required PatchParams current,
    required PatchParams population,
    required List<_Observation> observations,
    required DosingRegimen regimen,
    required PatchParams Function(PatchParams current, double value) setter,
    required double populationValue,
  }) {
    var best = current;
    var bestScore = _score(
      candidate: best,
      population: population,
      regimen: regimen,
      observations: observations,
    );

    for (final value in _candidateValues(populationValue)) {
      final candidate = setter(current, value);
      final score = _score(
        candidate: candidate,
        population: population,
        regimen: regimen,
        observations: observations,
      );
      if (score < bestScore) {
        best = candidate;
        bestScore = score;
      }
    }

    return best;
  }

  GelParams _pickBestGel({
    required GelParams current,
    required GelParams population,
    required List<_Observation> observations,
    required DosingRegimen regimen,
    required GelParams Function(GelParams current, double value) setter,
    required double populationValue,
  }) {
    var best = current;
    var bestScore = _score(
      candidate: best,
      population: population,
      regimen: regimen,
      observations: observations,
    );

    for (final value in _candidateValues(populationValue)) {
      final candidate = setter(current, value);
      final score = _score(
        candidate: candidate,
        population: population,
        regimen: regimen,
        observations: observations,
      );
      if (score < bestScore) {
        best = candidate;
        bestScore = score;
      }
    }

    return best;
  }

  List<_Observation> _extractEstradiolObservations(
    List<BloodTestReport> reports,
    DosingRegimen regimen,
  ) {
    return reports
        .map((report) {
          final estradiolReading = report.readings
              .where((reading) => reading.type == HormoneType.estradiol)
              .firstOrNull;
          if (estradiolReading == null) {
            return null;
          }

          final elapsedHours =
              report.testDate.difference(regimen.startDate).inMilliseconds /
                  Duration.millisecondsPerHour;
          if (elapsedHours < 0) {
            return null;
          }

          return _Observation(
            timeHours: elapsedHours,
            observedPgMl: estradiolReading.value,
          );
        })
        .whereType<_Observation>()
        .toList()
      ..sort((left, right) => left.timeHours.compareTo(right.timeHours));
  }

  double _score({
    required RouteParams candidate,
    required RouteParams population,
    required DosingRegimen regimen,
    required List<_Observation> observations,
  }) {
    final candidateVector = _parameterVector(candidate);
    final populationVector = _parameterVector(population);

    final squaredError = observations.fold<double>(
      0,
      (sum, observation) {
        final predicted = _engine.concentrationAt(
          observation.timeHours,
          regimen,
          candidate,
        );
        final error = predicted - observation.observedPgMl;
        return sum + error * error;
      },
    );
    final regularization = candidateVector.asMap().entries.fold<double>(
      0,
      (sum, entry) {
        final delta = entry.value - populationVector[entry.key];
        return sum + delta * delta;
      },
    );

    return squaredError + _lambda * regularization;
  }

  List<double> _parameterVector(RouteParams params) => switch (params) {
        final InjectionParams injection => [
            injection.fracFast,
            injection.k1Fast,
            injection.k1Slow,
            injection.k2,
            injection.k3,
            injection.formationFraction,
          ],
        final OralParams oral => [oral.kAbs, oral.bioavailability, oral.kClear],
        final SublingualParams sublingual => [
            sublingual.theta,
            sublingual.kSL,
            sublingual.kAbsOral,
            sublingual.k2Hydrolysis,
            sublingual.bioavailabilityOral,
            sublingual.kClear,
          ],
        final PatchParams patch => [
            patch.releaseRateMcgPerDay,
            patch.wearDurationH,
            patch.kClear,
          ],
        final GelParams gel => [gel.kAbs, gel.bioavailability, gel.kClear],
      };

  List<double> _candidateValues(double populationValue) {
    final base = populationValue <= 0 ? 0.001 : populationValue;
    return _gridFactors
        .map((factor) => (base * factor).clamp(_epsilon, double.infinity))
        .toSet()
        .toList()
      ..sort();
  }
}

class _Observation {
  const _Observation({
    required this.timeHours,
    required this.observedPgMl,
  });

  final double timeHours;
  final double observedPgMl;
}
