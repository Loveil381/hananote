/// SQL DDL for all photo related tables.
abstract class PhotoTables {
  /// Creates the `photos` table.
  static const String createPhotosTable = '''
    CREATE TABLE IF NOT EXISTS photos (
      id TEXT PRIMARY KEY,
      date TEXT NOT NULL,
      encrypted_path TEXT NOT NULL,
      encrypted_thumb_path TEXT NOT NULL,
      original_size_bytes INTEGER NOT NULL,
      notes TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT
    )
  ''';

  /// All photo table creation statements.
  static const List<String> allCreateStatements = [createPhotosTable];

  /// Indices for common photo queries.
  static const List<String> createIndices = [
    'CREATE INDEX IF NOT EXISTS idx_photos_date ON photos(date)',
  ];
}
