part of 'photo_bloc.dart';

/// States emitted by [PhotoBloc].
@freezed
sealed class PhotoState with _$PhotoState {
  /// Initial idle state before any load starts.
  const factory PhotoState.initial() = _Initial;

  /// Indicates the list is loading or refreshing.
  const factory PhotoState.loading() = _Loading;

  /// Loaded photo list plus decrypted thumbnail cache.
  const factory PhotoState.loaded({
    required List<PhotoEntry> entries,
    required Map<String, Uint8List> thumbnailCache,
  }) = _Loaded;

  /// Shows a user-facing error message.
  const factory PhotoState.error(String message) = _Error;
}
