import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hananote/features/journal/domain/entities/enums.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';
import 'package:json_annotation/json_annotation.dart';

part 'journal_entry_model.g.dart';

/// Data-layer representation of a [JournalEntry].
@JsonSerializable()
class JournalEntryModel extends Equatable {
  /// Creates a [JournalEntryModel].
  const JournalEntryModel({
    required this.id,
    required this.date,
    required this.content,
    required this.mood,
    required this.createdAt,
    this.tags,
    this.notes,
    this.updatedAt,
  });

  /// Creates a [JournalEntryModel] from JSON.
  factory JournalEntryModel.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryModelFromJson(json);

  /// Creates a [JournalEntryModel] from a domain entity.
  factory JournalEntryModel.fromDomain(JournalEntry entity) {
    return JournalEntryModel(
      id: entity.id,
      date: _dateOnlyToString(entity.date),
      content: entity.content,
      mood: entity.mood.name,
      tags: entity.tags,
      notes: entity.notes,
      createdAt: entity.createdAt.toIso8601String(),
      updatedAt: entity.updatedAt?.toIso8601String(),
    );
  }

  /// Stable identifier.
  final String id;

  /// Entry date stored as an ISO-8601 date-only string.
  final String date;

  /// Main journal content.
  final String content;

  /// Serialized mood enum name.
  final String mood;

  /// Optional list of tags stored as a JSON string.
  @JsonKey(fromJson: _tagsFromJson, toJson: _tagsToJson)
  final List<String>? tags;

  /// Optional notes.
  final String? notes;

  /// Entry creation time.
  @JsonKey(name: 'created_at')
  final String createdAt;

  /// Last update time, if present.
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Converts this model to JSON.
  Map<String, dynamic> toJson() => _$JournalEntryModelToJson(this);

  /// Converts this model to a domain entity.
  JournalEntry toDomain() {
    return JournalEntry(
      id: id,
      date: _stringToDateOnly(date),
      content: content,
      mood: MoodLevel.values.byName(mood),
      tags: tags,
      notes: notes,
      createdAt: DateTime.parse(createdAt),
      updatedAt: updatedAt == null ? null : DateTime.parse(updatedAt!),
    );
  }

  @override
  List<Object?> get props => [
        id,
        date,
        content,
        mood,
        tags,
        notes,
        createdAt,
        updatedAt,
      ];

  static List<String>? _tagsFromJson(Object? value) {
    if (value == null) {
      return null;
    }
    if (value is List<dynamic>) {
      return value.map((item) => item as String).toList();
    }

    final decoded = jsonDecode(value as String);
    if (decoded is! List<dynamic>) {
      throw const FormatException('Journal tags must decode to a list.');
    }
    return decoded.map((item) => item as String).toList();
  }

  static String? _tagsToJson(List<String>? value) {
    if (value == null) {
      return null;
    }
    return jsonEncode(value);
  }

  static String _dateOnlyToString(DateTime value) {
    final dateOnly = DateTime(value.year, value.month, value.day);
    return dateOnly.toIso8601String();
  }

  static DateTime _stringToDateOnly(String value) {
    final parsed = DateTime.parse(value);
    return DateTime(parsed.year, parsed.month, parsed.day);
  }
}
