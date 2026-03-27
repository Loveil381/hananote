// Release prep note: Shared test fixtures stay undocumented to avoid adding
// boilerplate to throwaway test-only builders and constants.
// ignore_for_file: public_member_api_docs

import 'package:hananote/features/journal/data/models/journal_entry_model.dart';
import 'package:hananote/features/journal/domain/entities/enums.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';

JournalEntry buildJournalEntry({
  String id = 'entry-1',
  DateTime? date,
  String content = 'Today felt calm.',
  MoodLevel mood = MoodLevel.good,
  List<String>? tags,
  String? notes = 'Private note',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return JournalEntry(
    id: id,
    date: date ?? DateTime(2026, 3, 20, 21, 30),
    content: content,
    mood: mood,
    tags: tags ?? const ['sleep', 'energy'],
    notes: notes,
    createdAt: createdAt ?? DateTime(2026, 3, 20, 22),
    updatedAt: updatedAt,
  );
}

JournalEntryModel buildJournalEntryModel({
  String id = 'entry-1',
  DateTime? date,
  String content = 'Today felt calm.',
  MoodLevel mood = MoodLevel.good,
  List<String>? tags,
  String? notes = 'Private note',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  return JournalEntryModel.fromDomain(
    buildJournalEntry(
      id: id,
      date: date,
      content: content,
      mood: mood,
      tags: tags,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    ),
  );
}

Map<String, Object?> buildJournalEntryRow({
  String id = 'entry-1',
  DateTime? date,
  String content = 'Today felt calm.',
  MoodLevel mood = MoodLevel.good,
  String? tags = '["sleep","energy"]',
  String? notes = 'Private note',
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final entryDate = date ?? DateTime(2026, 3, 20, 21, 30);
  return <String, Object?>{
    'id': id,
    'date': DateTime(entryDate.year, entryDate.month, entryDate.day)
        .toIso8601String(),
    'content': content,
    'mood': mood.name,
    'tags': tags,
    'notes': notes,
    'created_at': (createdAt ?? DateTime(2026, 3, 20, 22)).toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };
}
