import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/journal/domain/repositories/journal_repository.dart';
import 'package:hananote/features/blood_test/domain/repositories/blood_test_repository.dart';
import 'package:hananote/features/measurement/domain/repositories/measurement_repository.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

@injectable
class ExportData {
  const ExportData(
    this._medicationRepo,
    this._journalRepo,
    this._bloodTestRepo,
    this._measurementRepo,
    this._settingsRepo,
  );

  final MedicationRepository _medicationRepo;
  final JournalRepository _journalRepo;
  final BloodTestRepository _bloodTestRepo;
  final MeasurementRepository _measurementRepo;
  final SettingsRepository _settingsRepo;

  Future<Either<Failure, String>> call() async {
    try {
      final drugsResult = await _medicationRepo.getAllDrugs();
      final drugs = drugsResult.getOrElse((_) => []);
      
      final schedules = <MedicationSchedule>[];
      for (final drug in drugs) {
        final schedResult = await _medicationRepo.getScheduleForDrug(drug.id);
        schedResult.fold((_) => null, (s) {
          if (s != null) schedules.add(s);
        });
      }

      final journalsResult = await _journalRepo.getAllEntries();
      final journals = journalsResult.getOrElse((_) => []);

      final bloodTestsResult = await _bloodTestRepo.getAllReports();
      final bloodTests = bloodTestsResult.getOrElse((_) => []);

      final measurementsResult = await _measurementRepo.getAll();
      final measurements = measurementsResult.getOrElse((_) => []);

      final profileResult = await _settingsRepo.getUserProfile();
      final profile = profileResult.getOrElse((_) => throw Exception('Profile load failed'));

      final exportData = {
        'exportDate': DateTime.now().toIso8601String(),
        'version': '1.0',
        'drugs': drugs.map((e) => {
          'id': e.id,
          'name': e.name,
          'genericName': e.genericName,
          'category': e.category.toString().split('.').last,
          'administrationRoute': e.administrationRoute.toString().split('.').last,
          'defaultDosageUnit': e.defaultDosageUnit.toString().split('.').last,
          'isActive': e.isActive,
          'createdAt': e.createdAt.toIso8601String(),
          'notes': e.notes,
        }).toList(),
        'schedules': schedules.map((e) => {
          'drugId': e.drugId,
          'frequency': e.frequency.toString(),
          'scheduleTimes': e.scheduleTimes.map((t) => '${t.hour}:${t.minute}').toList(),
        }).toList(),
        'journals': journals.map((e) => {
          'id': e.id,
          'date': e.date.toIso8601String(),
          'content': e.content,
          'mood': e.mood.toString().split('.').last,
          'tags': e.tags,
          'createdAt': e.createdAt.toIso8601String(),
          'updatedAt': e.updatedAt?.toIso8601String(),
        }).toList(),
        'bloodTests': bloodTests.map((e) => {
          'id': e.id,
          'testDate': e.testDate.toIso8601String(),
          'readings': e.readings.map((r) => {
            'type': r.type.toString().split('.').last,
            'value': r.value,
            'unit': r.unit,
          }).toList(),
          'createdAt': e.createdAt.toIso8601String(),
          'labName': e.labName,
          'notes': e.notes,
        }).toList(),
        'measurements': measurements.map((e) => {
          'id': e.id,
          'date': e.date.toIso8601String(),
          'createdAt': e.createdAt.toIso8601String(),
          'bust': e.bust,
          'underbust': e.underbust,
          'waist': e.waist,
          'hip': e.hip,
          'thigh': e.thigh,
          'bicep': e.bicep,
          'shoulder': e.shoulder,
          'neck': e.neck,
          'weight': e.weight,
          'notes': e.notes,
          'updatedAt': e.updatedAt?.toIso8601String(),
        }).toList(),
        'profile': profile.toJson(),
      };

      return Right(jsonEncode(exportData));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }
}
