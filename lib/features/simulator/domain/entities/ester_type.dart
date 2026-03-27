import 'package:hananote/features/simulator/domain/entities/pk_parameters.dart';

/// Supported estradiol preparations for the PK simulator.
enum EsterType {
  /// Estradiol valerate intramuscular injection.
  estradiolValerate,

  /// Estradiol cypionate intramuscular injection.
  estradiolCypionate,

  /// Estradiol enanthate intramuscular injection.
  estradiolEnanthate,

  /// Oral estradiol.
  oralEstradiol,

  /// Sublingual estradiol.
  sublingualEstradiol,

  /// Transdermal patch.
  transdermalPatch,

  /// Transdermal gel.
  transdermalGel,
}

/// Presentation and model presets for [EsterType].
extension EsterTypeX on EsterType {
  /// Localized label.
  String get displayName => switch (this) {
        EsterType.estradiolValerate => '戊酸雌二醇肌注',
        EsterType.estradiolCypionate => '环戊丙酸雌二醇肌注',
        EsterType.estradiolEnanthate => '庚酸雌二醇肌注',
        EsterType.oralEstradiol => '口服雌二醇',
        EsterType.sublingualEstradiol => '舌下雌二醇',
        EsterType.transdermalPatch => '雌二醇贴片',
        EsterType.transdermalGel => '雌二醇凝胶',
      };

  /// Default deterministic rate constants used by V1.
  PkParameters get defaultParameters => switch (this) {
        EsterType.estradiolValerate => const PkParameters(
            k1: 0.4,
            k2: 3,
            k3: 0.35,
          ),
        EsterType.estradiolCypionate => const PkParameters(
            k1: 0.15,
            k2: 2,
            k3: 0.08,
          ),
        EsterType.estradiolEnanthate => const PkParameters(
            k1: 0.2,
            k2: 2.5,
            k3: 0.12,
          ),
        EsterType.oralEstradiol => const PkParameters(
            k1: 4,
            k2: 4.2,
            k3: 0.7,
          ),
        EsterType.sublingualEstradiol => const PkParameters(
            k1: 6,
            k2: 6.3,
            k3: 0.7,
          ),
        EsterType.transdermalPatch => const PkParameters(
            k1: 0.08,
            k2: 1.2,
            k3: 0.08,
          ),
        EsterType.transdermalGel => const PkParameters(
            k1: 0.12,
            k2: 1.5,
            k3: 0.1,
          ),
      };

  /// Dose fraction reaching systemic circulation.
  double get bioavailability => switch (this) {
        EsterType.oralEstradiol => 0.05,
        EsterType.sublingualEstradiol => 0.25,
        _ => 1.0,
      };

  /// Whether this preparation is better modeled as zero-order release.
  bool get usesPatchModel =>
      this == EsterType.transdermalPatch || this == EsterType.transdermalGel;
}
