import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/journal/data/models/journal_entry_model.dart';

import '../../fixtures.dart';

void main() {
  group('JournalEntryModel', () {
    test('round-trips between json and domain', () {
      final domain = buildJournalEntry();
      final model = JournalEntryModel.fromDomain(domain);

      final json = model.toJson();
      final decoded = JournalEntryModel.fromJson(json);

      expect(decoded, model);
      expect(decoded.toDomain(), model.toDomain());
    });

    test('normalizes the entry date and stores tags as a json string', () {
      final model = buildJournalEntryModel(
        date: DateTime(2026, 3, 20, 21, 45),
        tags: const ['mood', 'sleep'],
      );

      final json = model.toJson();

      expect(json['date'], DateTime(2026, 3, 20).toIso8601String());
      expect(json['tags'], '["mood","sleep"]');
      expect(json['created_at'], DateTime(2026, 3, 20, 22).toIso8601String());
    });
  });
}
