import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

/// Image source options exposed to presentation logic without plugin types.
enum PhotoPickerSource {
  /// Capture a new photo from the camera.
  camera,

  /// Select an existing photo from the gallery.
  gallery,
}

/// Abstraction over `image_picker` to keep bloc tests plugin-free.
// Release prep note: kept as a tiny interface so the picker stays mockable in
// bloc tests without leaking plugin types into test setup.
// ignore: one_member_abstracts
abstract interface class PhotoPickerService {
  /// Opens the selected source and returns image bytes, or `null` if cancelled.
  Future<Uint8List?> pickImage(PhotoPickerSource source);
}

/// `image_picker` backed implementation for selecting or capturing a photo.
@LazySingleton(as: PhotoPickerService)
class ImagePickerService implements PhotoPickerService {
  /// Creates an [ImagePickerService].
  ImagePickerService() : _picker = ImagePicker();

  final ImagePicker _picker;

  @override
  Future<Uint8List?> pickImage(PhotoPickerSource source) async {
    final pickedFile = await _picker.pickImage(
      source: switch (source) {
        PhotoPickerSource.camera => ImageSource.camera,
        PhotoPickerSource.gallery => ImageSource.gallery,
      },
      maxWidth: 2048,
      maxHeight: 2048,
      requestFullMetadata: false,
    );

    return pickedFile?.readAsBytes();
  }
}
