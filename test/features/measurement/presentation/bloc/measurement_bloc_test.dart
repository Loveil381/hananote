import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/usecases/delete_measurement.dart';
import 'package:hananote/features/measurement/domain/usecases/get_measurement_history.dart';
import 'package:hananote/features/measurement/domain/usecases/save_measurement.dart';
import 'package:hananote/features/measurement/presentation/blocs/measurement_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockGetMeasurementHistory extends Mock
    implements GetMeasurementHistory {}

class _MockSaveMeasurement extends Mock implements SaveMeasurement {}

class _MockDeleteMeasurement extends Mock implements DeleteMeasurement {}

void main() {
  late _MockGetMeasurementHistory getMeasurementHistory;
  late _MockSaveMeasurement saveMeasurement;
  late _MockDeleteMeasurement deleteMeasurement;

  final entry = buildMeasurementEntry();

  MeasurementBloc buildBloc() => MeasurementBloc(
        getMeasurementHistory,
        saveMeasurement,
        deleteMeasurement,
      );

  setUp(() {
    getMeasurementHistory = _MockGetMeasurementHistory();
    saveMeasurement = _MockSaveMeasurement();
    deleteMeasurement = _MockDeleteMeasurement();
  });

  test('initial state is MeasurementInitial', () {
    expect(buildBloc().state, isA<MeasurementInitial>());
  });

  blocTest<MeasurementBloc, MeasurementState>(
    'loadHistory emits loading then loaded on success',
    build: buildBloc,
    setUp: () {
      when(() => getMeasurementHistory())
          .thenAnswer((_) async => right([entry]));
    },
    act: (bloc) => bloc.add(const MeasurementEvent.loadHistory()),
    expect: () => [
      isA<MeasurementLoading>(),
      isA<MeasurementLoaded>().having(
        (state) => state.entries,
        'entries',
        [entry],
      ),
    ],
  );

  blocTest<MeasurementBloc, MeasurementState>(
    'loadHistory emits error on failure',
    build: buildBloc,
    setUp: () {
      when(() => getMeasurementHistory()).thenAnswer(
        (_) async => left(const Failure.storage(message: 'history failed')),
      );
    },
    act: (bloc) => bloc.add(const MeasurementEvent.loadHistory()),
    expect: () => [
      isA<MeasurementLoading>(),
      isA<MeasurementError>().having(
        (state) => state.message,
        'message',
        'history failed',
      ),
    ],
  );

  blocTest<MeasurementBloc, MeasurementState>(
    'saveMeasurement emits saved then reloads the list',
    build: buildBloc,
    setUp: () {
      when(() => saveMeasurement(entry)).thenAnswer((_) async => right(entry));
      when(() => getMeasurementHistory())
          .thenAnswer((_) async => right([entry]));
    },
    act: (bloc) => bloc.add(MeasurementEvent.saveMeasurement(entry)),
    expect: () => [
      isA<MeasurementSaving>(),
      isA<MeasurementSaved>(),
      isA<MeasurementLoading>(),
      isA<MeasurementLoaded>().having(
        (state) => state.entries,
        'entries',
        [entry],
      ),
    ],
  );

  blocTest<MeasurementBloc, MeasurementState>(
    'deleteMeasurement emits updated loaded list',
    build: buildBloc,
    setUp: () {
      when(() => deleteMeasurement(entry.id))
          .thenAnswer((_) async => right(unit));
      when(() => getMeasurementHistory())
          .thenAnswer((_) async => right(const <MeasurementEntry>[]));
    },
    act: (bloc) => bloc.add(MeasurementEvent.deleteMeasurement(entry.id)),
    expect: () => [
      isA<MeasurementLoading>(),
      isA<MeasurementLoaded>().having(
        (state) => state.entries,
        'entries',
        const <MeasurementEntry>[],
      ),
    ],
  );
}
