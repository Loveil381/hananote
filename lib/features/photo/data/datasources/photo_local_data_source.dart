import 'package:hananote/core/database/secure_database.dart';
import 'package:hananote/features/photo/data/models/photo_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// Direct SQL operations for photo metadata.
abstract interface class PhotoLocalDataSource {
  /// Saves a photo model using upsert semantics.
  Future<void> save(PhotoModel entry);

  /// Returns all photo entries.
  Future<List<PhotoModel>> getAll();

  /// Returns the latest stored photo.
  Future<PhotoModel?> getLatest();

  /// Deletes the entry with [id].
  Future<void> delete(String id);
}

/// SQLite-backed implementation of [PhotoLocalDataSource].
@LazySingleton(as: PhotoLocalDataSource)
class PhotoLocalDataSourceImpl implements PhotoLocalDataSource {
  /// Creates a [PhotoLocalDataSourceImpl].
  PhotoLocalDataSourceImpl(this._secureDatabase);

  final SecureDatabase _secureDatabase;

  Database get _db => _secureDatabase.database;

  @override
  Future<void> save(PhotoModel entry) async {
    await _db.insert(
      'photos',
      entry.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<PhotoModel>> getAll() async {
    final rows = await _db.query(
      'photos',
      orderBy: 'date DESC, created_at DESC',
    );

    return rows
        .map((row) => PhotoModel.fromJson(Map<String, dynamic>.from(row)))
        .toList();
  }

  @override
  Future<PhotoModel?> getLatest() async {
    final rows = await _db.query(
      'photos',
      orderBy: 'date DESC, created_at DESC',
      limit: 1,
    );
    if (rows.isEmpty) {
      return null;
    }

    return PhotoModel.fromJson(Map<String, dynamic>.from(rows.first));
  }

  @override
  Future<void> delete(String id) async {
    await _db.delete(
      'photos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
