// ignore_for_file: public_member_api_docs, avoid_redundant_argument_values

import 'package:hananote/features/medication/data/models/drug_inventory_model.dart';
import 'package:hananote/features/medication/data/models/drug_model.dart';
import 'package:hananote/features/medication/data/models/medication_log_model.dart';
import 'package:hananote/features/medication/data/models/medication_schedule_model.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

Drug buildDrug({
  String id = 'drug-1',
  String name = 'Estradiol',
  AdministrationRoute administrationRoute = AdministrationRoute.oral,
  DosageUnit defaultDosageUnit = DosageUnit.mg,
  bool isActive = true,
}) {
  return Drug(
    id: id,
    name: name,
    genericName: 'Estradiol Valerate',
    category: DrugCategory.estrogen,
    administrationRoute: administrationRoute,
    defaultDosageUnit: defaultDosageUnit,
    isActive: isActive,
    createdAt: DateTime(2026, 3, 1, 8),
    notes: 'note',
  );
}

MedicationSchedule buildSchedule({
  String id = 'schedule-1',
  String drugId = 'drug-1',
  MedicationFrequency frequency =
      const MedicationFrequency.daily(timesPerDay: 2),
  AdministrationRoute administrationRoute = AdministrationRoute.oral,
  DosageUnit dosageUnit = DosageUnit.mg,
  List<TimeOfDay> scheduleTimes = const [
    TimeOfDay(hour: 8, minute: 0),
    TimeOfDay(hour: 20, minute: 0),
  ],
  DateTime? startDate,
}) {
  return MedicationSchedule(
    id: id,
    drugId: drugId,
    dosageAmount: 2,
    dosageUnit: dosageUnit,
    frequency: frequency,
    administrationRoute: administrationRoute,
    startDate: startDate ?? DateTime(2026, 3, 1, 8),
    isActive: true,
    scheduleTimes: scheduleTimes,
    intervalDays:
        frequency is EveryNDaysMedicationFrequency ? frequency.days : null,
    notes: 'schedule',
  );
}

MedicationLog buildLog({
  String id = 'log-1',
  String scheduleId = 'schedule-1',
  String drugId = 'drug-1',
  DateTime? timestamp,
  LogStatus status = LogStatus.taken,
}) {
  return MedicationLog(
    id: id,
    scheduleId: scheduleId,
    drugId: drugId,
    timestamp: timestamp ?? DateTime(2026, 3, 23, 8, 5),
    dosageAmount: 2,
    dosageUnit: DosageUnit.mg,
    administrationRoute: AdministrationRoute.oral,
    status: status,
    notes: 'logged',
  );
}

DrugInventory buildInventory({
  String id = 'inventory-1',
  String drugId = 'drug-1',
  double quantity = 30,
  DosageUnit unit = DosageUnit.mg,
}) {
  return DrugInventory(
    id: id,
    drugId: drugId,
    quantity: quantity,
    unit: unit,
    purchaseDate: DateTime(2026, 3, 1),
    updatedAt: DateTime(2026, 3, 23),
    expirationDate: DateTime(2027, 3, 1),
    batchNumber: 'batch-1',
    notes: 'inventory',
  );
}

DrugModel buildDrugModel() => DrugModel.fromDomain(buildDrug());

MedicationScheduleModel buildScheduleModel({
  MedicationFrequency frequency =
      const MedicationFrequency.daily(timesPerDay: 2),
}) {
  return MedicationScheduleModel.fromDomain(
    buildSchedule(frequency: frequency),
  );
}

MedicationLogModel buildLogModel({
  DateTime? timestamp,
  LogStatus status = LogStatus.taken,
}) {
  return MedicationLogModel.fromDomain(
    buildLog(timestamp: timestamp, status: status),
  );
}

DrugInventoryModel buildInventoryModel({double quantity = 30}) {
  return DrugInventoryModel.fromDomain(buildInventory(quantity: quantity));
}
