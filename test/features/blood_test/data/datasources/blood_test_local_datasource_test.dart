// Release prep note: These tests keep explicit argument values to make mocked
// persistence interactions easier to scan during failures.
// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/blood_test/data/datasources/blood_test_local_datasource.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

import '../../fixtures.dart';

class _MockSecureDatabase extends Mock implements SecureDatabase {}

class _MockDatabase extends Mock implements Database {}

void main() {
  late _MockDatabase database;
  late _MockSecureDatabase secureDatabase;
  late BloodTestLocalDataSource dataSource;

  setUp(() {
    database = _MockDatabase();
    secureDatabase = _MockSecureDatabase();
    when(() => secureDatabase.database).thenReturn(database);
    dataSource = BloodTestLocalDataSourceImpl(secureDatabase);
  });

  group('BloodTestLocalDataSource', () {
    test('groups joined report rows into reports with readings', () async {
      when(
        () => database.rawQuery(any()),
      ).thenAnswer(
        (_) async => [
          buildJoinedRow(),
          buildJoinedRow(
            readingId: 'reading-2',
            type: HormoneType.testosterone,
            value: 22,
          ),
        ],
      );

      final result = await dataSource.getAllReports();

      expect(result, hasLength(1));
      expect(result.first.id, 'report-1');
      expect(result.first.readings, hasLength(2));
      expect(
        result.first.readings.map((reading) => reading.hormoneType),
        [HormoneType.estradiol.name, HormoneType.testosterone.name],
      );
    });

    test('returns null when a report is not found', () async {
      when(
        () => database.rawQuery(any(), any()),
      ).thenAnswer((_) async => <Map<String, Object?>>[]);

      final result = await dataSource.getReportById('missing');

      expect(result, isNull);
    });

    test('filters hormone readings by type and date range', () async {
      final from = DateTime(2026, 3, 1);
      final to = DateTime(2026, 3, 31);
      final reading = buildReadingModel();
      when(
        () => database.rawQuery(
          any(),
          [
            HormoneType.estradiol.name,
            from.toIso8601String(),
            to.toIso8601String(),
          ],
        ),
      ).thenAnswer((_) async => [reading.toJson()]);

      final result = await dataSource.getReadingsByType(
        HormoneType.estradiol,
        from: from,
        to: to,
      );

      expect(result, [reading]);
    });

    test('returns the latest reading for a hormone type', () async {
      final reading = buildReadingModel(
        id: 'reading-latest',
        value: 180,
      );
      when(
        () => database.rawQuery(
          any(),
          [HormoneType.estradiol.name],
        ),
      ).thenAnswer((_) async => [reading.toJson()]);

      final result = await dataSource.getLatestReading(HormoneType.estradiol);

      expect(result, reading);
    });
  });
}
