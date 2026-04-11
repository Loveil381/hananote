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

/// Pre-defined HRT drug templates from hrtyaku.com drug reference.
///
/// Covers 20 medications across 4 categories:
/// estrogens, anti-androgens, progestogens, 5-alpha-reductase inhibitors.
class HrtDrugTemplates {
  HrtDrugTemplates._();

  // =====================
  // ESTROGENS (雌激素类)
  // =====================

  static const estradiolOral = DrugTemplate(
    name: '补佳乐',
    genericName: '戊酸雌二醇片 (Progynova)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 2,
    emoji: '💊',
  );

  static const estradiolSublingual = DrugTemplate(
    name: '诺坤复（舌下）',
    genericName: '微粒化雌二醇片 (Estrofem)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.sublingual,
    unit: DosageUnit.mg,
    commonDosage: 1,
    emoji: '💊',
  );

  static const estradiolPatch = DrugTemplate(
    name: '雌二醇贴片',
    genericName: '雌二醇透皮贴片 (Climara/Estradot)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.transdermalPatch,
    unit: DosageUnit.mcg,
    commonDosage: 100,
    emoji: '🩹',
  );

  static const estradiolGel = DrugTemplate(
    name: '爱斯妥',
    genericName: '雌二醇凝胶 (Oestrogel)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.transdermalGel,
    unit: DosageUnit.pump,
    commonDosage: 2,
    emoji: '🧴',
  );

  static const sandrenaSachet = DrugTemplate(
    name: 'Sandrena',
    genericName: '雌二醇凝胶小包 (Sandrena/Divigel)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.transdermalGel,
    unit: DosageUnit.mg,
    commonDosage: 1,
    emoji: '🧴',
  );

  static const estradiolValerateIm = DrugTemplate(
    name: '戊酸雌二醇注射',
    genericName: '戊酸雌二醇注射液 (Progynon Depot)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 4,
    emoji: '💉',
  );

  static const estradiolCypionateIm = DrugTemplate(
    name: '环戊丙酸雌二醇',
    genericName: '环戊丙酸雌二醇注射液 (Depo-Estradiol)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 5,
    emoji: '💉',
  );

  static const estradiolEnanthateIm = DrugTemplate(
    name: '庚酸雌二醇',
    genericName: '庚酸雌二醇注射液 (EEn)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 5,
    emoji: '💉',
  );

  static const estradiolUndecylateIm = DrugTemplate(
    name: '十一酸雌二醇',
    genericName: '十一酸雌二醇注射液 (EU)',
    category: DrugCategory.estrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 40,
    emoji: '💉',
  );

  // ============================
  // ANTI-ANDROGENS (抗雄激素类)
  // ============================

  static const cyproteroneAcetate = DrugTemplate(
    name: '色谱龙',
    genericName: '醋酸环丙孕酮 (Androcur)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 12.5,
    emoji: '🛡',
  );

  static const spironolactone = DrugTemplate(
    name: '螺内酯',
    genericName: '螺内酯片 (安体舒通/Aldactone)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 100,
    emoji: '🛡',
  );

  static const bicalutamide = DrugTemplate(
    name: '比卡鲁胺',
    genericName: '比卡鲁胺片 (Casodex)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 50,
    emoji: '🛡',
  );

  static const leuprorelin = DrugTemplate(
    name: '亮丙瑞林',
    genericName: 'GnRH 激动剂 (抑那通/贝依)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.subcutaneousInjection,
    unit: DosageUnit.mg,
    commonDosage: 3.75,
    emoji: '💉',
  );

  static const goserelin = DrugTemplate(
    name: '戈舍瑞林',
    genericName: 'GnRH 激动剂 (诺雷得/Zoladex)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.subcutaneousInjection,
    unit: DosageUnit.mg,
    commonDosage: 3.6,
    emoji: '💉',
  );

  static const triptorelin = DrugTemplate(
    name: '曲普瑞林',
    genericName: 'GnRH 激动剂 (达菲林/Decapeptyl)',
    category: DrugCategory.antiAndrogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 3.75,
    emoji: '💉',
  );

  // ========================
  // PROGESTOGENS (孕激素类)
  // ========================

  static const progesterone = DrugTemplate(
    name: '黄体酮',
    genericName: '微粒化黄体酮 (安琪坦/Utrogestan)',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 100,
    emoji: '🌙',
  );

  static const progesteroneRectal = DrugTemplate(
    name: '黄体酮（塞入）',
    genericName: '微粒化黄体酮胶囊 (直肠给药)',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.rectal,
    unit: DosageUnit.mg,
    commonDosage: 100,
    emoji: '🌙',
  );

  static const dydrogesterone = DrugTemplate(
    name: '达芙通',
    genericName: '地屈孕酮片 (Duphaston)',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 10,
    emoji: '🌙',
  );

  static const hydroxyprogesterone = DrugTemplate(
    name: '仙灵',
    genericName: '己酸羟孕酮注射液 (Proluton)',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.intramuscularInjection,
    unit: DosageUnit.mg,
    commonDosage: 250,
    emoji: '💉',
  );

  static const drospirenone = DrugTemplate(
    name: '屈螺酮',
    genericName: '屈螺酮片 (Slynd)',
    category: DrugCategory.progestogen,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 4,
    emoji: '🌙',
  );

  // ========================================
  // 5-ALPHA REDUCTASE INHIBITORS (辅助药物)
  // ========================================

  static const finasteride = DrugTemplate(
    name: '非那雄胺',
    genericName: '非那雄胺片 (Propecia/Proscar)',
    category: DrugCategory.auxiliary,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 1,
    emoji: '💈',
  );

  static const dutasteride = DrugTemplate(
    name: '度他雄胺',
    genericName: '度他雄胺胶囊 (Avodart)',
    category: DrugCategory.auxiliary,
    route: AdministrationRoute.oral,
    unit: DosageUnit.mg,
    commonDosage: 0.5,
    emoji: '💈',
  );

  /// All available templates grouped by category.
  static const Map<DrugCategory, List<DrugTemplate>> byCategory = {
    DrugCategory.estrogen: [
      estradiolOral,
      estradiolSublingual,
      estradiolGel,
      sandrenaSachet,
      estradiolPatch,
      estradiolValerateIm,
      estradiolCypionateIm,
      estradiolEnanthateIm,
      estradiolUndecylateIm,
    ],
    DrugCategory.antiAndrogen: [
      cyproteroneAcetate,
      spironolactone,
      bicalutamide,
      leuprorelin,
      goserelin,
      triptorelin,
    ],
    DrugCategory.progestogen: [
      progesterone,
      progesteroneRectal,
      dydrogesterone,
      hydroxyprogesterone,
      drospirenone,
    ],
    DrugCategory.auxiliary: [
      finasteride,
      dutasteride,
    ],
  };

  /// All templates as a flat list.
  static List<DrugTemplate> get all =>
      byCategory.values.expand((list) => list).toList();
}
