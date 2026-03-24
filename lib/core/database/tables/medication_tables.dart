/// SQL DDL for all medication-related tables.
abstract class MedicationTables {
  /// Creates the `drugs` table.
  static const String createDrugsTable = '''
    CREATE TABLE drugs (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      generic_name TEXT NOT NULL,
      category TEXT NOT NULL,
      administration_route TEXT NOT NULL,
      default_dosage_unit TEXT NOT NULL,
      is_active INTEGER NOT NULL DEFAULT 1,
      created_at TEXT NOT NULL,
      notes TEXT
    )
  ''';

  /// Creates the `medication_schedules` table.
  static const String createSchedulesTable = '''
    CREATE TABLE medication_schedules (
      id TEXT PRIMARY KEY,
      drug_id TEXT NOT NULL,
      dosage_amount REAL NOT NULL,
      dosage_unit TEXT NOT NULL,
      frequency_type TEXT NOT NULL,
      frequency_value TEXT NOT NULL,
      administration_route TEXT NOT NULL,
      schedule_times TEXT NOT NULL,
      interval_days INTEGER,
      start_date TEXT NOT NULL,
      end_date TEXT,
      is_active INTEGER NOT NULL DEFAULT 1,
      notes TEXT,
      FOREIGN KEY (drug_id) REFERENCES drugs(id) ON DELETE CASCADE
    )
  ''';

  /// Creates the `medication_logs` table.
  static const String createLogsTable = '''
    CREATE TABLE medication_logs (
      id TEXT PRIMARY KEY,
      schedule_id TEXT NOT NULL,
      drug_id TEXT NOT NULL,
      timestamp TEXT NOT NULL,
      dosage_amount REAL NOT NULL,
      dosage_unit TEXT NOT NULL,
      administration_route TEXT NOT NULL,
      status TEXT NOT NULL,
      injection_site TEXT,
      patch_site TEXT,
      patch_count INTEGER,
      gel_pumps INTEGER,
      skin_reaction TEXT,
      notes TEXT,
      FOREIGN KEY (schedule_id) REFERENCES medication_schedules(id),
      FOREIGN KEY (drug_id) REFERENCES drugs(id) ON DELETE CASCADE
    )
  ''';

  /// Creates the `drug_inventory` table.
  static const String createInventoryTable = '''
    CREATE TABLE drug_inventory (
      id TEXT PRIMARY KEY,
      drug_id TEXT NOT NULL UNIQUE,
      quantity REAL NOT NULL,
      unit TEXT NOT NULL,
      purchase_date TEXT NOT NULL,
      expiration_date TEXT,
      batch_number TEXT,
      notes TEXT,
      updated_at TEXT NOT NULL,
      FOREIGN KEY (drug_id) REFERENCES drugs(id) ON DELETE CASCADE
    )
  ''';

  /// All medication table creation statements.
  static const List<String> allCreateStatements = [
    createDrugsTable,
    createSchedulesTable,
    createLogsTable,
    createInventoryTable,
  ];

  /// Indices for common medication queries.
  static const List<String> createIndices = [
    'CREATE INDEX idx_schedules_drug_id ON medication_schedules(drug_id)',
    'CREATE INDEX idx_logs_drug_id ON medication_logs(drug_id)',
    'CREATE INDEX idx_logs_timestamp ON medication_logs(timestamp)',
    'CREATE INDEX idx_logs_schedule_id ON medication_logs(schedule_id)',
    'CREATE INDEX idx_inventory_drug_id ON drug_inventory(drug_id)',
  ];
}
