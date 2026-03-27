// ignore_for_file: public_member_api_docs

import 'dart:convert';
import 'dart:typed_data';

import 'package:hananote/features/photo/data/models/photo_model.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:image/image.dart' as img;

PhotoEntry buildPhotoEntry({
  String id = 'photo-1',
  DateTime? date,
  String encryptedPath = 'photos/photo-1.enc',
  String encryptedThumbPath = 'photos/photo-1_thumb.enc',
  int originalSizeBytes = 4096,
  String? notes = 'Front profile',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return PhotoEntry(
    id: id,
    date: date ?? DateTime(2026, 3, 27),
    encryptedPath: encryptedPath,
    encryptedThumbPath: encryptedThumbPath,
    originalSizeBytes: originalSizeBytes,
    notes: notes,
    createdAt: createdAt ?? DateTime(2026, 3, 27, 21),
    updatedAt: updatedAt,
  );
}

PhotoModel buildPhotoModel({
  String id = 'photo-1',
  DateTime? date,
  String encryptedPath = 'photos/photo-1.enc',
  String encryptedThumbPath = 'photos/photo-1_thumb.enc',
  int originalSizeBytes = 4096,
  String? notes = 'Front profile',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return PhotoModel(
    id: id,
    date: date ?? DateTime(2026, 3, 27),
    encryptedPath: encryptedPath,
    encryptedThumbPath: encryptedThumbPath,
    originalSizeBytes: originalSizeBytes,
    notes: notes,
    createdAt: createdAt ?? DateTime(2026, 3, 27, 21),
    updatedAt: updatedAt,
  );
}

Uint8List buildTestImageBytes({
  int width = 512,
  int height = 320,
  int color = 0xFFE699B8,
}) {
  final image = img.Image(width: width, height: height);
  img.fill(
    image,
    color: img.ColorUint32.rgba(
      (color >> 16) & 0xFF,
      (color >> 8) & 0xFF,
      color & 0xFF,
      (color >> 24) & 0xFF,
    ),
  );

  return Uint8List.fromList(img.encodeJpg(image, quality: 90));
}

Uint8List buildPlainBytes([String value = 'encrypted-photo-test']) {
  return Uint8List.fromList(utf8.encode(value));
}
