import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entry.freezed.dart';

/// Domain entity representing one encrypted photo record.
@freezed
class PhotoEntry with _$PhotoEntry {
  /// Creates a [PhotoEntry].
  const factory PhotoEntry({
    required String id,
    required DateTime date,
    required String encryptedPath,
    required String encryptedThumbPath,
    required int originalSizeBytes,
    required DateTime createdAt,
    String? notes,
    DateTime? updatedAt,
  }) = _PhotoEntry;
}
