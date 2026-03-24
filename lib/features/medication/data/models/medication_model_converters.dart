import 'dart:convert';

import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

/// Shared conversion helpers for medication data models.
abstract final class MedicationModelConverters {
  /// Encodes a boolean into a SQLite-friendly integer.
  static int boolToInt({required bool value}) => value ? 1 : 0;

  /// Decodes a SQLite boolean integer.
  static bool intToBool(int value) => value == 1;

  /// Encodes a [DateTime] into an ISO-8601 string.
  static String dateTimeToString(DateTime value) => value.toIso8601String();

  /// Decodes an ISO-8601 string into a [DateTime].
  static DateTime stringToDateTime(String value) => DateTime.parse(value);

  /// Serializes schedule times into a JSON string.
  static String scheduleTimesToJson(List<TimeOfDay> times) {
    return jsonEncode(
      times
          .map(
            (time) => <String, dynamic>{
              'hour': time.hour,
              'minute': time.minute,
            },
          )
          .toList(),
    );
  }

  /// Deserializes schedule times from a JSON string.
  static List<TimeOfDay> scheduleTimesFromJson(String json) {
    final decoded = jsonDecode(json);
    if (decoded is! List<dynamic>) {
      throw const FormatException('scheduleTimes must decode to a list.');
    }

    return decoded
        .map(
          (item) => TimeOfDay(
            hour: (item as Map<String, dynamic>)['hour'] as int,
            minute: item['minute'] as int,
          ),
        )
        .toList();
  }

  /// Serializes a [MedicationFrequency] into DB fields.
  static ({String type, String value}) frequencyToDatabase(
    MedicationFrequency frequency,
  ) {
    return switch (frequency) {
      DailyMedicationFrequency(:final timesPerDay) => (
          type: 'daily',
          value: timesPerDay.toString(),
        ),
      EveryNDaysMedicationFrequency(:final days) => (
          type: 'everyNDays',
          value: days.toString(),
        ),
      WeeklyMedicationFrequency(:final dayOfWeek) => (
          type: 'weekly',
          value: dayOfWeek.toString(),
        ),
      CustomMedicationFrequency(:final description) => (
          type: 'custom',
          value: description,
        ),
    };
  }

  /// Deserializes database fields into a [MedicationFrequency].
  static MedicationFrequency frequencyFromDatabase({
    required String type,
    required String value,
  }) {
    return switch (type) {
      'daily' => MedicationFrequency.daily(timesPerDay: int.parse(value)),
      'everyNDays' => MedicationFrequency.everyNDays(days: int.parse(value)),
      'weekly' => MedicationFrequency.weekly(dayOfWeek: int.parse(value)),
      'custom' => MedicationFrequency.custom(description: value),
      _ => throw FormatException('Unsupported frequency type: $type'),
    };
  }
}
