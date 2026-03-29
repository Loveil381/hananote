import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/blood_test/domain/entities/enums.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/timeline/domain/entities/enums.dart';

/// Localized labels for [DrugCategory].
extension DrugCategoryL10n on DrugCategory {
  /// Returns the localized category name for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        DrugCategory.estrogen => l10n.enumCatEstrogen,
        DrugCategory.antiAndrogen => l10n.enumCatAntiAndrogen,
        DrugCategory.progestogen => l10n.enumCatProgestogen,
        DrugCategory.auxiliary => l10n.enumCatAuxiliary,
      };
}

/// Localized labels for [AdministrationRoute].
extension AdministrationRouteL10n on AdministrationRoute {
  /// Returns the localized route name for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        AdministrationRoute.oral => l10n.enumRouteOral,
        AdministrationRoute.sublingual => l10n.enumRouteSublingual,
        AdministrationRoute.transdermalPatch => l10n.enumRoutePatch,
        AdministrationRoute.transdermalGel => l10n.enumRouteGel,
        AdministrationRoute.intramuscularInjection => l10n.enumRouteIM,
        AdministrationRoute.subcutaneousInjection => l10n.enumRouteSC,
        AdministrationRoute.rectal => l10n.enumRouteRectal,
      };
}

/// Localized labels for [DosageUnit].
extension DosageUnitL10n on DosageUnit {
  /// Returns the localized unit label for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        DosageUnit.mg => 'mg',
        DosageUnit.mcg => 'mcg',
        DosageUnit.pump => l10n.enumUnitPump,
        DosageUnit.ml => 'ml',
        DosageUnit.patch => l10n.enumUnitPatch,
      };
}

/// Localized labels for [HormoneType].
extension HormoneTypeL10n on HormoneType {
  /// Returns the localized hormone name for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        HormoneType.estradiol => l10n.enumHormoneEstradiol,
        HormoneType.testosterone => l10n.enumHormoneTestosterone,
        HormoneType.prolactin => l10n.enumHormoneProlactin,
        HormoneType.progesterone => l10n.enumHormoneProgesterone,
        HormoneType.lh => 'LH',
        HormoneType.fsh => 'FSH',
        HormoneType.shbg => 'SHBG',
      };
}

/// Localized labels for [HormoneStatus].
extension HormoneStatusL10n on HormoneStatus {
  /// Returns the localized status label for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        HormoneStatus.normal => l10n.enumStatusNormal,
        HormoneStatus.warning => l10n.enumStatusWarning,
        HormoneStatus.critical => l10n.enumStatusCritical,
      };
}

/// Localized labels for [TimelineEventType].
extension TimelineEventTypeL10n on TimelineEventType {
  /// Returns the localized event type label for the current locale.
  String localizedName(AppLocalizations l10n) => switch (this) {
        TimelineEventType.medication => l10n.enumTimelineMedication,
        TimelineEventType.bloodTest => l10n.enumTimelineBloodTest,
        TimelineEventType.journal => l10n.enumTimelineJournal,
        TimelineEventType.milestone => l10n.enumTimelineMilestone,
      };
}
