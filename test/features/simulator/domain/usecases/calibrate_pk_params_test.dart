import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/blood_test/domain/entities/blood_test_report.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/blood_test/domain/entities/hormone_reading.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/simulator/domain/entities/dosing_regimen.dart';
import 'package:hananote/features/simulator/domain/entities/ester_type.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';
import 'package:hananote/features/simulator/domain/services/pk_engine.dart';
import 'package:hananote/features/simulator/domain/usecases/calibrate_pk_params.dart';
import 'package:mocktail/mocktail.dart';

class _MockBloodTestRepository extends Mock implements BloodTestRepository {}

void main() {
  late _MockBloodTestRepository repository;
  late CalibratePkParams useCase;
  const engine = PkEngine();

  final regimen = DosingRegimen(
    esterType: EsterType.estradiolValerate,
    doseAmount: 5,
    intervalDays: 5,
    startDate: DateTime(2026),
  );
  final populationParams =
      EsterType.estradiolValerate.defaultParameters as InjectionParams;
  final higherExposureParams = populationParams.copyWith(
    formationFraction: populationParams.formationFraction * 1.3,
  );

  setUp(() {
    repository = _MockBloodTestRepository();
    useCase = CalibratePkParams(repository);
  });

  BloodTestReport buildReport({
    required String id,
    required DateTime testDate,
    required double estradiolPgMl,
  }) {
    return BloodTestReport(
      id: id,
      testDate: testDate,
      createdAt: testDate,
      readings: [
        HormoneReading(
          id: 'reading-$id',
          reportId: id,
          type: HormoneType.estradiol,
          value: estradiolPgMl,
          unit: 'pg/mL',
        ),
      ],
    );
  }

  List<BloodTestReport> syntheticReports(RouteParams params) {
    final hours = [48.0, 120.0, 240.0];
    return [
      for (var i = 0; i < hours.length; i++)
        buildReport(
          id: 'report-$i',
          testDate: regimen.startDate.add(
            Duration(hours: hours[i].round()),
          ),
          estradiolPgMl: engine.concentrationAt(
            hours[i],
            regimen,
            params,
          ),
        ),
    ];
  }

  group('CalibratePkParams', () {
    test('returns updated parameters within a reasonable range', () async {
      when(() => repository.getAllReports()).thenAnswer(
        (_) async => right(syntheticReports(higherExposureParams)),
      );

      final result = await useCase(
        populationParams: populationParams,
        regimen: regimen,
      );

      expect(result.isRight(), isTrue);
      final calibrated =
          result.getOrElse((_) => throw StateError('expected params'))
              as InjectionParams;
      expect(
        calibrated.formationFraction,
        inInclusiveRange(
          populationParams.formationFraction * 0.5,
          populationParams.formationFraction * 1.5,
        ),
      );
      expect(calibrated, isNot(equals(populationParams)));
    });

    test('returns the original parameters when fewer than two labs exist',
        () async {
      when(() => repository.getAllReports()).thenAnswer(
        (_) async => right(
          syntheticReports(higherExposureParams).take(1).toList(),
        ),
      );

      final result = await useCase(
        populationParams: populationParams,
        regimen: regimen,
      );

      expect(result, right<Failure, RouteParams>(populationParams));
    });

    test('propagates repository failures', () async {
      const failure = Failure.database(message: 'load failed');
      when(() => repository.getAllReports())
          .thenAnswer((_) async => left(failure));

      final result = await useCase(
        populationParams: populationParams,
        regimen: regimen,
      );

      expect(result, left<Failure, RouteParams>(failure));
    });

    test('moves parameters toward higher observed exposure', () async {
      when(() => repository.getAllReports()).thenAnswer(
        (_) async => right(syntheticReports(higherExposureParams)),
      );

      final result = await useCase(
        populationParams: populationParams,
        regimen: regimen,
      );

      final calibrated =
          result.getOrElse((_) => throw StateError('expected params'))
              as InjectionParams;
      expect(
        calibrated.formationFraction > populationParams.formationFraction ||
            calibrated.k3 < populationParams.k3,
        isTrue,
      );
    });
  });
}
