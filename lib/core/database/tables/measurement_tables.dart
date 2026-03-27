/// SQL DDL for all measurement related tables.
abstract class MeasurementTables {
  /// Creates the `measurements` table.
  static const String createMeasurementsTable = '''
    CREATE TABLE IF NOT EXISTS measurements (
      id TEXT PRIMARY KEY,
      date TEXT NOT NULL,
      bust REAL,
      underbust REAL,
      waist REAL,
      hip REAL,
      thigh REAL,
      bicep REAL,
      shoulder REAL,
      neck REAL,
      weight REAL,
      notes TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT
    )
  ''';

  /// All measurement table creation statements.
  static const List<String> allCreateStatements = [createMeasurementsTable];

  /// Indices for common measurement queries.
  static const List<String> createIndices = [
    'CREATE INDEX IF NOT EXISTS idx_measurements_date ON measurements(date)',
  ];
}
