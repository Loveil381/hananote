import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/journal/domain/entities/enums.dart';

part 'journal_entry.freezed.dart';

/// Domain entity representing a daily journal entry.
@freezed
class JournalEntry with _$JournalEntry {
  /// Creates a [JournalEntry].
  const factory JournalEntry({
    required String id,
    required DateTime date,
    required String content,
    required MoodLevel mood,
    required DateTime createdAt,
    List<String>? tags,
    String? notes,
    DateTime? updatedAt,
  }) = _JournalEntry;
}
