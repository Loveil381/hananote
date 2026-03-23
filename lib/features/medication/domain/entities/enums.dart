/// Domain enumerations and route/unit compatibility rules for medication.
library;

/// Supported medication categories.
enum DrugCategory {
  /// Estrogen-based medication.
  estrogen,

  /// Anti-androgen medication.
  antiAndrogen,

  /// Progestogen medication.
  progestogen,

  /// Auxiliary medication or supplement.
  auxiliary,
}

/// Supported administration routes.
enum AdministrationRoute {
  /// Oral tablets or capsules.
  oral,

  /// Sublingual administration under the tongue.
  sublingual,

  /// Transdermal patch administration.
  transdermalPatch,

  /// Transdermal gel administration.
  transdermalGel,

  /// Intramuscular injection.
  intramuscularInjection,

  /// Subcutaneous injection.
  subcutaneousInjection,

  /// Rectal administration.
  rectal,
}

/// Supported dosage units.
enum DosageUnit {
  /// Milligrams.
  mg,

  /// Micrograms.
  mcg,

  /// Pump count.
  pump,

  /// Patch count.
  patch,

  /// Milliliters.
  ml,
}

/// Frequency type markers for medication schedules.
enum MedicationFrequencyType {
  /// A medication taken every day.
  daily,

  /// A medication taken every N days.
  everyNDays,

  /// A medication taken weekly.
  weekly,

  /// A custom human-readable schedule.
  custom,
}

/// Medication log status.
enum LogStatus {
  /// The medication was taken on time.
  taken,

  /// The medication was skipped.
  skipped,

  /// The medication was taken later than planned.
  late,
}

/// Supported injection sites.
enum InjectionSite {
  /// Left glute.
  leftGlute,

  /// Right glute.
  rightGlute,

  /// Left thigh.
  leftThigh,

  /// Right thigh.
  rightThigh,
}

/// Supported patch placement sites.
enum PatchSite {
  /// Lower abdomen.
  lowerAbdomen,

  /// Upper abdomen.
  upperAbdomen,

  /// Left hip.
  leftHip,

  /// Right hip.
  rightHip,

  /// Left upper arm.
  leftUpperArm,

  /// Right upper arm.
  rightUpperArm,

  /// Left buttock.
  leftButtock,

  /// Right buttock.
  rightButtock,
}

/// Skin reaction states for topical medication.
enum SkinReaction {
  /// No reaction observed.
  none,

  /// Redness observed.
  redness,

  /// Itching observed.
  itching,

  /// Allergic reaction observed.
  allergy,
}

/// Domain helpers for route-specific validation.
extension AdministrationRouteX on AdministrationRoute {
  /// Returns the units that are valid for the route.
  Set<DosageUnit> get supportedUnits => switch (this) {
        AdministrationRoute.oral => {DosageUnit.mg, DosageUnit.mcg},
        AdministrationRoute.sublingual => {DosageUnit.mg, DosageUnit.mcg},
        AdministrationRoute.transdermalPatch => {
            DosageUnit.patch,
            DosageUnit.mcg,
          },
        AdministrationRoute.transdermalGel => {
            DosageUnit.pump,
            DosageUnit.mg,
            DosageUnit.ml,
          },
        AdministrationRoute.intramuscularInjection => {
            DosageUnit.mg,
            DosageUnit.ml,
          },
        AdministrationRoute.subcutaneousInjection => {
            DosageUnit.mg,
            DosageUnit.ml,
          },
        AdministrationRoute.rectal => {DosageUnit.mg, DosageUnit.mcg},
      };

  /// Whether the route is injection-based.
  bool get isInjection =>
      this == AdministrationRoute.intramuscularInjection ||
      this == AdministrationRoute.subcutaneousInjection;

  /// Whether the route is patch-based.
  bool get isPatch => this == AdministrationRoute.transdermalPatch;

  /// Whether the route is gel-based.
  bool get isGel => this == AdministrationRoute.transdermalGel;

  /// Whether the route typically uses timed reminders during a day.
  bool get supportsScheduleTimes => switch (this) {
        AdministrationRoute.oral ||
        AdministrationRoute.sublingual ||
        AdministrationRoute.transdermalGel ||
        AdministrationRoute.rectal =>
          true,
        AdministrationRoute.transdermalPatch ||
        AdministrationRoute.intramuscularInjection ||
        AdministrationRoute.subcutaneousInjection =>
          false,
      };
}
