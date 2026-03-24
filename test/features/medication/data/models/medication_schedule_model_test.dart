import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/features/medication/data/models/medication_schedule_model.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

import '../fixtures.dart';

void main() {
  group('MedicationScheduleModel', () {
    test('serializes and deserializes daily frequency', () {
      final model = MedicationScheduleModel.fromDomain(
        buildSchedule(
          frequency: const MedicationFrequency.daily(timesPerDay: 3),
        ),
      );

      final decoded = MedicationScheduleModel.fromJson(model.toJson());

      expect(decoded.frequencyType, 'daily');
      expect(decoded.frequencyValue, '3');
      expect(
        decoded.toDomain().frequency,
        const MedicationFrequency.daily(timesPerDay: 3),
      );
    });

    test('serializes and deserializes everyNDays frequency', () {
      final model = MedicationScheduleModel.fromDomain(
        buildSchedule(
          frequency: const MedicationFrequency.everyNDays(days: 7),
          scheduleTimes: const [],
        ),
      );

      final decoded = MedicationScheduleModel.fromJson(model.toJson());

      expect(decoded.frequencyType, 'everyNDays');
      expect(decoded.frequencyValue, '7');
      expect(
        decoded.toDomain().frequency,
        const MedicationFrequency.everyNDays(days: 7),
      );
    });

    test('serializes and deserializes weekly frequency', () {
      final model = MedicationScheduleModel.fromDomain(
        buildSchedule(
          frequency:
              const MedicationFrequency.weekly(dayOfWeek: DateTime.friday),
          scheduleTimes: const [TimeOfDay(hour: 18, minute: 30)],
        ),
      );

      final decoded = MedicationScheduleModel.fromJson(model.toJson());

      expect(decoded.frequencyType, 'weekly');
      expect(decoded.frequencyValue, '${DateTime.friday}');
      expect(
        decoded.toDomain().frequency,
        const MedicationFrequency.weekly(dayOfWeek: DateTime.friday),
      );
    });

    test('serializes and deserializes custom frequency and schedule times', () {
      final model = MedicationScheduleModel.fromDomain(
        buildSchedule(
          frequency: const MedicationFrequency.custom(description: 'as needed'),
        ),
      );

      final decoded = MedicationScheduleModel.fromJson(model.toJson());
      final domain = decoded.toDomain();

      expect(decoded.frequencyType, 'custom');
      expect(decoded.frequencyValue, 'as needed');
      expect(
        domain.frequency,
        const MedicationFrequency.custom(description: 'as needed'),
      );
      expect(domain.scheduleTimes, const [
        TimeOfDay(hour: 8, minute: 0),
        TimeOfDay(hour: 20, minute: 0),
      ]);
    });
  });
}
