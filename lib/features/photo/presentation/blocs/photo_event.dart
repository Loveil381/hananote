part of 'photo_bloc.dart';

/// Events handled by [PhotoBloc].
@freezed
sealed class PhotoEvent with _$PhotoEvent {
  /// Loads the encrypted photo history.
  const factory PhotoEvent.loadHistory() = _LoadHistory;

  /// Opens the camera and stores the captured photo.
  const factory PhotoEvent.capturePhoto() = _CapturePhoto;

  /// Opens the gallery and stores the selected photo.
  const factory PhotoEvent.pickFromGallery() = _PickFromGallery;

  /// Deletes an encrypted photo entry and its files.
  const factory PhotoEvent.deletePhoto(PhotoEntry entry) = _DeletePhoto;

  /// Loads a thumbnail into the in-memory cache.
  const factory PhotoEvent.loadThumbnail(PhotoEntry entry) = _LoadThumbnail;
}
