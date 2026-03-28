import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/usecases/delete_photo.dart';
import 'package:hananote/features/photo/domain/usecases/get_photo_history.dart';
import 'package:hananote/features/photo/domain/usecases/load_photo_thumbnail.dart';
import 'package:hananote/features/photo/domain/usecases/save_photo.dart';
import 'package:hananote/features/photo/presentation/services/photo_picker_service.dart';
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';

part 'photo_bloc.freezed.dart';
part 'photo_event.dart';
part 'photo_state.dart';

/// Bloc for loading encrypted photo history and on-demand thumbnails.
@injectable
class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  /// Creates a [PhotoBloc].
  PhotoBloc(
    this._getPhotoHistory,
    this._savePhoto,
    this._deletePhoto,
    this._loadPhotoThumbnail,
    this._photoPickerService,
  ) : super(const PhotoState.initial()) {
    on<_LoadHistory>(_onLoadHistory);
    on<_CapturePhoto>(_onCapturePhoto);
    on<_PickFromGallery>(_onPickFromGallery);
    on<_DeletePhoto>(_onDeletePhoto);
    on<_LoadThumbnail>(_onLoadThumbnail);
  }

  final GetPhotoHistory _getPhotoHistory;
  final SavePhoto _savePhoto;
  final DeletePhoto _deletePhoto;
  final LoadPhotoThumbnail _loadPhotoThumbnail;
  final PhotoPickerService _photoPickerService;

  Future<void> _onLoadHistory(
    _LoadHistory event,
    Emitter<PhotoState> emit,
  ) async {
    emit(const PhotoState.loading());

    final result = await _getPhotoHistory();
    result.fold(
      (failure) => emit(PhotoState.error(failureMessage(failure))),
      (entries) => emit(
        PhotoState.loaded(
          entries: entries,
          thumbnailCache: <String, Uint8List>{},
        ),
      ),
    );
  }

  Future<void> _onCapturePhoto(
    _CapturePhoto event,
    Emitter<PhotoState> emit,
  ) async {
    await _pickAndSave(
      source: PhotoPickerSource.camera,
      emit: emit,
    );
  }

  Future<void> _onPickFromGallery(
    _PickFromGallery event,
    Emitter<PhotoState> emit,
  ) async {
    await _pickAndSave(
      source: PhotoPickerSource.gallery,
      emit: emit,
    );
  }

  Future<void> _onDeletePhoto(
    _DeletePhoto event,
    Emitter<PhotoState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) {
      return;
    }

    final result = await _deletePhoto(event.entry);
    if (result.isLeft()) {
      await _emitTransientError(
        emit,
        failureMessage(
          result.swap().getOrElse((_) => throw StateError('unreachable')),
        ),
        fallbackState: currentState,
      );
      return;
    }

    final updatedEntries = currentState.entries
        .where((entry) => entry.id != event.entry.id)
        .toList(growable: false);
    final updatedCache = Map<String, Uint8List>.from(
      currentState.thumbnailCache,
    )..remove(event.entry.id);

    emit(
      currentState.copyWith(
        entries: updatedEntries,
        thumbnailCache: updatedCache,
      ),
    );
  }

  Future<void> _onLoadThumbnail(
    _LoadThumbnail event,
    Emitter<PhotoState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded ||
        currentState.thumbnailCache.containsKey(event.entry.id)) {
      return;
    }

    final result = await _loadPhotoThumbnail(event.entry);
    result.fold(
      (_) => null,
      (thumbnailBytes) {
        final updatedCache = Map<String, Uint8List>.from(
          currentState.thumbnailCache,
        )..[event.entry.id] = thumbnailBytes;

        emit(currentState.copyWith(thumbnailCache: updatedCache));
      },
    );
  }

  Future<void> _pickAndSave({
    required PhotoPickerSource source,
    required Emitter<PhotoState> emit,
  }) async {
    final previousLoadedState = state is _Loaded ? state as _Loaded : null;
    final imageBytes = await _photoPickerService.pickImage(source);
    if (imageBytes == null) {
      return;
    }

    final processedBytes = imageBytes.length > 10 * 1024 * 1024
        ? await compute(_resizeForEncryption, imageBytes)
        : imageBytes;

    emit(const PhotoState.loading());

    final result = await _savePhoto(
      imageBytes: processedBytes,
      date: DateTime.now(),
    );

    final failure = result.fold<Failure?>((value) => value, (_) => null);
    if (failure != null) {
      if (previousLoadedState != null) {
        emit(previousLoadedState);
      } else {
        emit(PhotoState.error(failureMessage(failure)));
      }
      return;
    }

    await _reloadHistory(emit);
  }

  Future<void> _reloadHistory(Emitter<PhotoState> emit) async {
    final result = await _getPhotoHistory();
    result.fold(
      (failure) => emit(PhotoState.error(failureMessage(failure))),
      (entries) => emit(
        PhotoState.loaded(
          entries: entries,
          thumbnailCache: <String, Uint8List>{},
        ),
      ),
    );
  }

  Future<void> _emitTransientError(
    Emitter<PhotoState> emit,
    String message, {
    required _Loaded fallbackState,
  }) async {
    emit(PhotoState.error(message));
    await Future.microtask(() {});
    emit(fallbackState);
  }
}

Uint8List _resizeForEncryption(Uint8List imageBytes) {
  final decoded = img.decodeImage(imageBytes);
  if (decoded == null) {
    return imageBytes;
  }
  if (decoded.width <= 2048 && decoded.height <= 2048) {
    return imageBytes;
  }

  final resized = img.copyResize(
    decoded,
    width: decoded.width >= decoded.height ? 2048 : null,
    height: decoded.height > decoded.width ? 2048 : null,
    interpolation: img.Interpolation.linear,
  );

  return Uint8List.fromList(img.encodeJpg(resized, quality: 85));
}
