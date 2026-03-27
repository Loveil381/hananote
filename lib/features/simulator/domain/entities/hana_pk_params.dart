import 'package:freezed_annotation/freezed_annotation.dart';

part 'hana_pk_params.freezed.dart';

/// Parameter types for the experimental Hana-PK engine.
///
/// Each variant encodes the pharmacokinetic constants for a specific
/// administration route as modelled by the Hana-PK engine.
@freezed
sealed class HanaPkParams with _$HanaPkParams {
  /// Weibull absorption + single-compartment elimination for IM injections.
  ///
  /// [tau] is the Weibull scale (characteristic time, hours).
  /// [beta] is the shape parameter (0 < β ≤ 2).
  /// [formationFraction] is the ester-to-E2 conversion fraction.
  /// [kEl] is the E2 elimination rate constant (h⁻¹); defaults to 0.05 h⁻¹
  /// matching the injection E2 compartment clearance (V2 PkEngine k3).
  @Assert(
    'tau > 0 && beta > 0 && beta <= 2',
    'tau must be > 0 and beta in (0, 2]',
  )
  @Assert(
    'formationFraction > 0 && formationFraction <= 1',
    'formationFraction must be in (0, 1]',
  )
  const factory HanaPkParams.weibullInjection({
    required double tau,
    required double beta,
    required double formationFraction,
    @Default(0.05) double kEl,
  }) = WeibullInjectionParams;

  /// Three-pool oral model with an explicit E1S reservoir.
  ///
  /// [ka] absorption rate from gut (h⁻¹).
  /// [bioavailability] direct E2 fraction (F_direct).
  /// [fE1S] fraction converted to E1S in gut wall (F_E1S).
  /// [kRec] E1S → E2 reconversion rate (h⁻¹).
  /// [kElS] E1S clearance rate (h⁻¹).
  /// [kEl] E2 elimination rate (h⁻¹).
  @Assert(
    'ka > 0 && kEl > 0 && kRec > 0 && kElS > 0',
    'rate constants must be positive',
  )
  const factory HanaPkParams.oralE1S({
    @Default(0.3) double ka,
    @Default(0.04) double bioavailability,
    @Default(0.35) double fE1S,
    @Default(0.04) double kRec,
    @Default(0.04) double kElS,
    @Default(0.38) double kEl,
  }) = OralE1SParams;

  /// θ-split dual-path sublingual model.
  ///
  /// [theta] is the fast-path (mucosal) fraction.
  /// Fast path: Bateman with [kSL] and [kEl].
  /// Slow path: E1S reservoir oral model.
  @Assert('theta >= 0 && theta <= 1', 'theta must be in [0, 1]')
  const factory HanaPkParams.hanaSublingual({
    required double theta,
    @Default(1.8) double kSL,
    @Default(0.3) double kaOral,
    @Default(0.04) double bioavailabilityOral,
    @Default(0.35) double fE1S,
    @Default(0.04) double kRec,
    @Default(0.04) double kElS,
    @Default(0.38) double kEl,
  }) = HanaSublingualParams;
}
