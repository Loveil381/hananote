// Release prep note: Internal enums remain undocumented to keep the domain
// layer terse until the broader API doc pass.
// ignore_for_file: public_member_api_docs

import 'package:hananote/features/simulator/domain/entities/hana_pk_params.dart';
import 'package:hananote/features/simulator/domain/entities/route_params.dart';

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

/// Standard sublingual hold-time presets.
enum SublingualHoldTime {
  quick(minutes: 2, theta: 0.01),
  casual(minutes: 5, theta: 0.04),
  standard(minutes: 10, theta: 0.11),
  strict(minutes: 15, theta: 0.18);

  const SublingualHoldTime({
    required this.minutes,
    required this.theta,
  });

  final int minutes;
  final double theta;
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

  /// Default V2 route parameters in h^-1.
  RouteParams get defaultParameters => switch (this) {
        EsterType.estradiolValerate => const RouteParams.injection(
            fracFast: 0.4,
            k1Fast: 0.0216,
            k1Slow: 0.0138,
            k2: 0.07,
            formationFraction: 0.0623,
          ),
        EsterType.estradiolCypionate => const RouteParams.injection(
            fracFast: 0.229,
            k1Fast: 0.00504,
            k1Slow: 0.00451,
            k2: 0.045,
            formationFraction: 0.1173,
          ),
        EsterType.estradiolEnanthate => const RouteParams.injection(
            fracFast: 0.05,
            k1Fast: 0.001,
            k1Slow: 0.005,
            k2: 0.015,
            formationFraction: 0.12,
          ),
        EsterType.oralEstradiol => const RouteParams.oral(
            kAbs: 0.08,
          ),
        EsterType.sublingualEstradiol => const RouteParams.sublingual(
            theta: 0.11,
            kAbsOral: 0.08,
          ),
        EsterType.transdermalPatch => const RouteParams.patch(
            releaseRateMcgPerDay: 100,
            wearDurationH: 168,
          ),
        EsterType.transdermalGel => const RouteParams.gel(),
      };

  /// Default Hana-PK parameters for injectable and oral routes.
  ///
  /// Returns [WeibullInjectionParams] for IM esters and [OralE1SParams] /
  /// [HanaSublingualParams] for oral/sublingual routes.
  /// Returns `null` for patch and gel (those delegate to `PkEngine`).
  HanaPkParams? get hanaPkDefaults => switch (this) {
        EsterType.estradiolValerate => const HanaPkParams.weibullInjection(
            tau: 36,
            beta: 1.8,
            formationFraction: 0.062,
          ),
        EsterType.estradiolCypionate => const HanaPkParams.weibullInjection(
            tau: 80,
            beta: 1.6,
            formationFraction: 0.117,
          ),
        EsterType.estradiolEnanthate => const HanaPkParams.weibullInjection(
            tau: 120,
            beta: 1.4,
            formationFraction: 0.12,
          ),
        EsterType.oralEstradiol => const HanaPkParams.oralE1S(),
        EsterType.sublingualEstradiol => const HanaPkParams.hanaSublingual(
            theta: 0.11,
          ),
        EsterType.transdermalPatch => null,
        EsterType.transdermalGel => null,
      };
}
