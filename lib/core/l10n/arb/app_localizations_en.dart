// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HanaNote';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'Cancel';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String get addDrug => 'Add Medication';

  @override
  String get editDrug => 'Edit Medication';

  @override
  String get drugName => 'Medication Name';

  @override
  String get genericName => 'Generic Name';

  @override
  String get dosage => 'Dosage';

  @override
  String get frequency => 'Frequency';

  @override
  String get takeDose => 'Take Dose';

  @override
  String get skipDose => 'Skip Dose';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get confirm => 'Confirm';

  @override
  String get inventory => 'Inventory';

  @override
  String get remaining => 'Remaining';

  @override
  String get lowStock => 'Low Stock';

  @override
  String daysLeft(String days) {
    return '$days Days Left';
  }

  @override
  String nextTime(String time) {
    return 'Next: $time';
  }

  @override
  String get completedDose => 'Completed';

  @override
  String get noActiveDrugs => 'No active medications';

  @override
  String get addFirstDrug => 'Add your first medication';

  @override
  String get category => 'Category';

  @override
  String get route => 'Route';

  @override
  String get unit => 'Unit';

  @override
  String get notes => 'Notes';

  @override
  String get injectionSite => 'Injection Site';

  @override
  String get patchSite => 'Patch Site';

  @override
  String get quantity => 'Quantity';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get today => 'Today';

  @override
  String get medications => 'Medications';
}
