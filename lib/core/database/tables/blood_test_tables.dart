/// SQL DDL for all blood test related tables.
abstract class BloodTestTables {
  /// Creates the `blood_test_reports` table.
  static const String createReportsTable = '''
    CREATE TABLE blood_test_reports (
      id TEXT PRIMARY KEY,
      test_date TEXT NOT NULL,
      lab_name TEXT,
      notes TEXT,
      created_at TEXT NOT NULL
    )
  ''';

  /// Creates the `hormone_readings` table.
  static const String createReadingsTable = '''
    CREATE TABLE hormone_readings (
      id TEXT PRIMARY KEY,
      report_id TEXT NOT NULL,
      hormone_type TEXT NOT NULL,
      value REAL NOT NULL,
      unit TEXT NOT NULL,
      notes TEXT,
      FOREIGN KEY (report_id) REFERENCES blood_test_reports(id) ON DELETE CASCADE
    )
  ''';

  /// All blood test table creation statements.
  static const List<String> allCreateStatements = [
    createReportsTable,
    createReadingsTable,
  ];

  /// Indices for common blood test queries.
  static const List<String> createIndices = [
    'CREATE INDEX idx_readings_report_id ON hormone_readings(report_id)',
    'CREATE INDEX idx_readings_hormone_type ON hormone_readings(hormone_type)',
  ];
}
