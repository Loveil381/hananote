/// Shared test fixtures for BLoC/Cubit tests.
///
/// Re-exports domain fixtures and adds mock repository setup.
library;

export 'package:hananote/features/medication/domain/entities/drug.dart';
export 'package:hananote/features/medication/domain/entities/drug_inventory.dart';
export 'package:hananote/features/medication/domain/entities/enums.dart';
export 'package:hananote/features/medication/domain/entities/medication_log.dart';
export 'package:hananote/features/medication/domain/entities/medication_schedule.dart';
export 'package:hananote/features/medication/domain/usecases/get_today_schedule.dart'
    show TodayScheduleItem;
