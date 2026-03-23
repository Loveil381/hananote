import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/medication_log.dart';
import 'package:hananote/features/medication/domain/entities/medication_schedule.dart';

Drug buildDrug({
  String id = 'drug-1',
  String name = 'Estradiol',
  String genericName = 'Estradiol Valerate',
  DrugCategory category = DrugCategory.estrogen,
  AdministrationRoute administrationRoute = AdministrationRoute.oral,
  DosageUnit defaultDosageUnit = DosageUnit.mg,
  String? notes = 'daily dose',
  bool isActive = true,
  DateTime? createdAt,
}) {
  return Drug(
    id: id,
    name: name,
    genericName: genericName,
    category: category,
    administrationRoute: administrationRoute,
    defaultDosageUnit: defaultDosageUnit,
    isActive: isActive,
    createdAt: createdAt ?? DateTime(2026, 3),
    notes: notes,
  );
}

MedicationSchedule buildSchedule({
  String id = 'schedule-1',
  String drugId = 'drug-1',
  double dosageAmount = 2,
  DosageUnit dosageUnit = DosageUnit.mg,
  MedicationFrequency? frequency,
  AdministrationRoute administrationRoute = AdministrationRoute.oral,
  List<TimeOfDay> scheduleTimes = const [TimeOfDay(hour: 8, minute: 0)],
  int? intervalDays,
  DateTime? startDate,
  DateTime? endDate,
  String? notes = 'scheduled',
  bool isActive = true,
}) {
  return MedicationSchedule(
    id: id,
    drugId: drugId,
    dosageAmount: dosageAmount,
    dosageUnit: dosageUnit,
    frequency: frequency ?? const MedicationFrequency.daily(timesPerDay: 1),
    administrationRoute: administrationRoute,
    scheduleTimes: scheduleTimes,
    intervalDays: intervalDays,
    startDate: startDate ?? DateTime(2026, 3, 1, 8),
    endDate: endDate,
    isActive: isActive,
    notes: notes,
  );
}

MedicationLog buildLog({
  String id = 'log-1',
  String scheduleId = 'schedule-1',
  String drugId = 'drug-1',
  DateTime? timestamp,
  double dosageAmount = 2,
  DosageUnit dosageUnit = DosageUnit.mg,
  AdministrationRoute administrationRoute = AdministrationRoute.oral,
  LogStatus status = LogStatus.taken,
  InjectionSite? injectionSite,
  PatchSite? patchSite,
  int? patchCount,
  int? gelPumps,
  SkinReaction? skinReaction,
  String? notes = 'done',
}) {
  return MedicationLog(
    id: id,
    scheduleId: scheduleId,
    drugId: drugId,
    timestamp: timestamp ?? DateTime(2026, 3, 23, 8),
    dosageAmount: dosageAmount,
    dosageUnit: dosageUnit,
    administrationRoute: administrationRoute,
    status: status,
    injectionSite: injectionSite,
    patchSite: patchSite,
    patchCount: patchCount,
    gelPumps: gelPumps,
    skinReaction: skinReaction,
    notes: notes,
  );
}

DrugInventory buildInventory({
  String id = 'inventory-1',
  String drugId = 'drug-1',
  double quantity = 30,
  DosageUnit unit = DosageUnit.mg,
  DateTime? purchaseDate,
  DateTime? expirationDate,
  String? batchNumber = 'batch-1',
  String? notes = 'stock',
  DateTime? updatedAt,
}) {
  return DrugInventory(
    id: id,
    drugId: drugId,
    quantity: quantity,
    unit: unit,
    purchaseDate: purchaseDate ?? DateTime(2026, 3),
    expirationDate: expirationDate,
    batchNumber: batchNumber,
    updatedAt: updatedAt ?? DateTime(2026, 3),
    notes: notes,
  );
}
