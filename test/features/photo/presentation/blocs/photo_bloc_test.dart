import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/usecases/delete_photo.dart';
import 'package:hananote/features/photo/domain/usecases/get_photo_history.dart';
import 'package:hananote/features/photo/domain/usecases/load_photo_thumbnail.dart';
import 'package:hananote/features/photo/domain/usecases/save_photo.dart';
import 'package:hananote/features/photo/presentation/blocs/photo_bloc.dart';
import 'package:hananote/features/photo/presentation/services/photo_picker_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures.dart';

class _MockGetPhotoHistory extends Mock implements GetPhotoHistory {}

class _MockSavePhoto extends Mock implements SavePhoto {}

class _MockDeletePhoto extends Mock implements DeletePhoto {}

class _MockLoadPhotoThumbnail extends Mock implements LoadPhotoThumbnail {}

class _MockPhotoPickerService extends Mock implements PhotoPickerService {}

void main() {
  late _MockGetPhotoHistory getPhotoHistory;
  late _MockSavePhoto savePhoto;
  late _MockDeletePhoto deletePhoto;
  late _MockLoadPhotoThumbnail loadPhotoThumbnail;
  late _MockPhotoPickerService photoPickerService;

  final entry = buildPhotoEntry();
  final secondEntry = buildPhotoEntry(
    id: 'photo-2',
    encryptedPath: 'photos/photo-2.enc',
    encryptedThumbPath: 'photos/photo-2_thumb.enc',
  );
  final imageBytes = buildTestImageBytes();
  final thumbnailBytes = Uint8List.fromList(<int>[1, 2, 3, 4]);

  PhotoBloc buildBloc() => PhotoBloc(
        getPhotoHistory,
        savePhoto,
        deletePhoto,
        loadPhotoThumbnail,
        photoPickerService,
      );

  setUpAll(() {
    registerFallbackValue(buildPhotoEntry());
    registerFallbackValue(DateTime(2026, 3, 27));
  });

  setUp(() {
    getPhotoHistory = _MockGetPhotoHistory();
    savePhoto = _MockSavePhoto();
    deletePhoto = _MockDeletePhoto();
    loadPhotoThumbnail = _MockLoadPhotoThumbnail();
    photoPickerService = _MockPhotoPickerService();
  });

  test('initial state is PhotoState.initial', () {
    expect(buildBloc().state, const PhotoState.initial());
  });

  blocTest<PhotoBloc, PhotoState>(
    'loadHistory success emits loaded with empty thumbnail cache',
    build: buildBloc,
    setUp: () {
      when(() => getPhotoHistory()).thenAnswer((_) async => right([entry]));
    },
    act: (bloc) => bloc.add(const PhotoEvent.loadHistory()),
    expect: () => [
      const PhotoState.loading(),
      PhotoState.loaded(
        entries: [entry],
        thumbnailCache: const <String, Uint8List>{},
      ),
    ],
  );

  blocTest<PhotoBloc, PhotoState>(
    'loadHistory failure emits error',
    build: buildBloc,
    setUp: () {
      when(() => getPhotoHistory()).thenAnswer(
        (_) async => left(const Failure.storage(message: 'history failed')),
      );
    },
    act: (bloc) => bloc.add(const PhotoEvent.loadHistory()),
    expect: () => [
      const PhotoState.loading(),
      const PhotoState.error('history failed'),
    ],
  );

  blocTest<PhotoBloc, PhotoState>(
    'deletePhoto success removes entry and cached thumbnail',
    build: buildBloc,
    seed: () => PhotoState.loaded(
      entries: [entry, secondEntry],
      thumbnailCache: <String, Uint8List>{
        entry.id: thumbnailBytes,
        secondEntry.id: Uint8List.fromList(<int>[9]),
      },
    ),
    setUp: () {
      when(() => deletePhoto(entry)).thenAnswer((_) async => right(unit));
    },
    act: (bloc) => bloc.add(PhotoEvent.deletePhoto(entry)),
    expect: () => [
      PhotoState.loaded(
        entries: [secondEntry],
        thumbnailCache: <String, Uint8List>{
          secondEntry.id: Uint8List.fromList(<int>[9]),
        },
      ),
    ],
  );

  blocTest<PhotoBloc, PhotoState>(
    'loadThumbnail success updates thumbnail cache',
    build: buildBloc,
    seed: () => PhotoState.loaded(
      entries: [entry],
      thumbnailCache: const <String, Uint8List>{},
    ),
    setUp: () {
      when(() => loadPhotoThumbnail(entry))
          .thenAnswer((_) async => right(thumbnailBytes));
    },
    act: (bloc) => bloc.add(PhotoEvent.loadThumbnail(entry)),
    expect: () => [
      PhotoState.loaded(
        entries: [entry],
        thumbnailCache: <String, Uint8List>{entry.id: thumbnailBytes},
      ),
    ],
  );

  blocTest<PhotoBloc, PhotoState>(
    'capturePhoto cancelled keeps state unchanged',
    build: buildBloc,
    seed: () => PhotoState.loaded(
      entries: [entry],
      thumbnailCache: const <String, Uint8List>{},
    ),
    setUp: () {
      when(() => photoPickerService.pickImage(PhotoPickerSource.camera))
          .thenAnswer((_) async => null);
    },
    act: (bloc) => bloc.add(const PhotoEvent.capturePhoto()),
    expect: () => <PhotoState>[],
  );

  blocTest<PhotoBloc, PhotoState>(
    'capturePhoto success saves and reloads history',
    build: buildBloc,
    seed: () => const PhotoState.loaded(
      entries: <PhotoEntry>[],
      thumbnailCache: <String, Uint8List>{},
    ),
    setUp: () {
      when(() => photoPickerService.pickImage(PhotoPickerSource.camera))
          .thenAnswer((_) async => imageBytes);
      when(
        () => savePhoto(
          imageBytes: imageBytes,
          date: any(named: 'date'),
          notes: any(named: 'notes'),
        ),
      ).thenAnswer((_) async => right(entry));
      when(() => getPhotoHistory()).thenAnswer((_) async => right([entry]));
    },
    act: (bloc) => bloc.add(const PhotoEvent.capturePhoto()),
    expect: () => [
      const PhotoState.loading(),
      PhotoState.loaded(
        entries: [entry],
        thumbnailCache: const <String, Uint8List>{},
      ),
    ],
  );

  blocTest<PhotoBloc, PhotoState>(
    'pickFromGallery success saves and reloads history',
    build: buildBloc,
    seed: () => const PhotoState.loaded(
      entries: <PhotoEntry>[],
      thumbnailCache: <String, Uint8List>{},
    ),
    setUp: () {
      when(() => photoPickerService.pickImage(PhotoPickerSource.gallery))
          .thenAnswer((_) async => imageBytes);
      when(
        () => savePhoto(
          imageBytes: imageBytes,
          date: any(named: 'date'),
          notes: any(named: 'notes'),
        ),
      ).thenAnswer((_) async => right(entry));
      when(() => getPhotoHistory()).thenAnswer((_) async => right([entry]));
    },
    act: (bloc) => bloc.add(const PhotoEvent.pickFromGallery()),
    expect: () => [
      const PhotoState.loading(),
      PhotoState.loaded(
        entries: [entry],
        thumbnailCache: const <String, Uint8List>{},
      ),
    ],
  );
}
