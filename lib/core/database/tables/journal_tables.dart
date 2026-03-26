/// SQL DDL for all journal related tables.
abstract class JournalTables {
  /// Creates the `journal_entries` table.
  static const String createEntriesTable = '''
    CREATE TABLE journal_entries (
      id TEXT PRIMARY KEY,
      date TEXT NOT NULL UNIQUE,
      content TEXT NOT NULL,
      mood TEXT NOT NULL,
      tags TEXT,
      notes TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT
    )
  ''';

  /// All journal table creation statements.
  static const List<String> allCreateStatements = [createEntriesTable];

  /// Indices for common journal queries.
  static const List<String> createIndices = [
    'CREATE INDEX idx_journal_entries_date ON journal_entries(date)',
  ];
}
