// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';

part 'photo_model.freezed.dart';
part 'photo_model.g.dart';

/// SQLite and JSON model for [PhotoEntry].
@freezed
class PhotoModel with _$PhotoModel {
  /// Creates a [PhotoModel].
  const factory PhotoModel({
    required String id,
    required DateTime date,
    @JsonKey(name: 'encrypted_path') required String encryptedPath,
    @JsonKey(name: 'encrypted_thumb_path') required String encryptedThumbPath,
    @JsonKey(name: 'original_size_bytes') required int originalSizeBytes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    String? notes,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PhotoModel;

  /// Creates a [PhotoModel] from JSON.
  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);

  /// Creates a [PhotoModel] from a domain entity.
  factory PhotoModel.fromEntity(PhotoEntry entity) {
    return PhotoModel(
      id: entity.id,
      date: entity.date,
      encryptedPath: entity.encryptedPath,
      encryptedThumbPath: entity.encryptedThumbPath,
      originalSizeBytes: entity.originalSizeBytes,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

/// Mapping helpers for [PhotoModel].
extension PhotoModelX on PhotoModel {
  /// Converts the model to a domain entity.
  PhotoEntry toEntity() {
    return PhotoEntry(
      id: id,
      date: date,
      encryptedPath: encryptedPath,
      encryptedThumbPath: encryptedThumbPath,
      originalSizeBytes: originalSizeBytes,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
