// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalEntryModel _$JournalEntryModelFromJson(Map<String, dynamic> json) =>
    JournalEntryModel(
      id: json['id'] as String,
      date: json['date'] as String,
      content: json['content'] as String,
      mood: json['mood'] as String,
      createdAt: json['created_at'] as String,
      tags: JournalEntryModel._tagsFromJson(json['tags']),
      notes: json['notes'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$JournalEntryModelToJson(JournalEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'content': instance.content,
      'mood': instance.mood,
      'tags': JournalEntryModel._tagsToJson(instance.tags),
      'notes': instance.notes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
