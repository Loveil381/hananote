import 'package:hananote/features/medication/domain/entities/enums.dart';

/// A pre-configured drug template for quick HRT medication setup.
class DrugTemplate {
  /// Creates a [DrugTemplate].
  const DrugTemplate({
    required this.name,
    required this.genericName,
    required this.category,
    required this.route,
    required this.unit,
    required this.commonDosage,
    this.emoji = '',
  });

  /// Display name (brand or common name).
  final String name;

  /// Generic / chemical name.
  final String genericName;

  /// Drug category.
  final DrugCategory category;

  /// Administration route.
  final AdministrationRoute route;

  /// Default dosage unit.
  final DosageUnit unit;

  /// Common dosage amount (for hint text).
  final double commonDosage;

  /// Emoji icon for visual identification.
  final String emoji;
}

/// Pre-defined HRT drug templates commonly used by MTF community.
class HrtDrugTemplates {
  HrtDrugTemplates._();

  // -- Estrogens --

  static const estradiolOral = DrugTemplate(
    name: '补佳乐',
    genericName: '戊酸雌二醇片',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 2,
    emoji: '💊',
  );

  static const estradiolSublingual = DrugTemplate(
    name: '诺坤复',
    genericName: '雌二醇片（舌下）',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.sublingual,
    unit: DosageUnit.mg,
    commonDosage: 1,
    emoji: '💊',
  );

  static const estradiolPatch = DrugTemplate(
    name: '雌二醇贴片',
    genericName: '雌二醇透皮贴片',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.transdermalPatch,
    unit: DosageUnit.patch,
    commonDosage: 1,
    emoji: '🩹',
  );

  static const estradiolGel = DrugTemplate(
    name: '爱斯妥',
    genericName: '雌二醇凝胶',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.transdermalGel,
    unit: DosageUnit.pump,
    commonDosage: 2,
    emoji: '🧴',
  );

  static const estradiolValerateIm = DrugTemplate(
    name: '补佳乐注射',
    genericName: '戊酸雌二醇注射液',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 10,
    emoji: '💉',
  );

  static const estradiolCypionateIm = DrugTemplate(
    name: 'EV 注射',
    genericName: '环戊丙酸雌二醇',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 5,
    emoji: '💉',
  );

  // -- Anti-Androgens --

  static const spironolactone = DrugTemplate(
    name: '螺内酯',
    genericName: '螺内酯片',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 50,
    emoji: '🛡',
  );

  static const cyproteroneAcetate = DrugTemplate(
    name: '色谱龙',
    genericName: '醋酸环丙孕酮',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 12.5,
    emoji: '🛡',
  );

  static const bicalutamide = DrugTemplate(
    name: '比卡鲁胺',
    genericName: '比卡鲁胺片',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 50,
    emoji: '🛡',
  );

  // -- Progestogens --

  static const progesterone = DrugTemplate(
    name: '黄体酮',
    genericName: '微粒化黄体酮胶囊',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 100,
    emoji: '🌙',
  );

  static const progesteroneRectal = DrugTemplate(
    name: '黄体酮（塞入）',
    genericName: '微粒化黄体酮胶囊',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.rectal,
    unit: DosageUnit.mg,
    commonDosage: 100,
    emoji: '🌙',
  );

  /// All available templates grouped by category.
  static const Map<DrugCategory, List<DrugTemplate>> byCategory = {
    DrugCategory.estrogen: [
      estradiolOral,
      estradiolSublingual,
      estradiolGel,
      estradiolPatch,
      estradiolValerateIm,
      estradiolCypionateIm,
    ],
    DrugCategory.antiAndrogen: [
      spironolactone,
      cyproteroneAcetate,
      bicalutamide,
    ],
    DrugCategory.progestogen: [
      progesterone,
      progesteroneRectal,
    ],
  };

  /// All templates as a flat list.
  static List<DrugTemplate> get all =>
      byCategory.values.expand((list) => list).toList();
}
