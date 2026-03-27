import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_params.freezed.dart';

/// Route-specific pharmacokinetic parameters for the V2 simulator.
@freezed
sealed class RouteParams with _$RouteParams {
  /// Injection with dual parallel depots, ester hydrolysis, and clearance.
  @Assert('fracFast > 0 && fracFast < 1', 'fracFast must be between 0 and 1')
  @Assert(
    'k1Fast > 0 && k1Slow > 0 && k2 > 0 && k3 > 0',
    'all rate constants must be positive',
  )
  @Assert(
    'formationFraction > 0 && formationFraction <= 1',
    'formationFraction must be between 0 and 1',
  )
  const factory RouteParams.injection({
    required double fracFast,
    required double k1Fast,
    required double k1Slow,
    required double k2,
    required double formationFraction,
    @Default(0.05) double k3,
  }) = InjectionParams;

  /// Oral one-compartment Bateman model.
  @Assert('kAbs > 0 && kClear > 0', 'rate constants must be positive')
  @Assert(
    'bioavailability > 0 && bioavailability <= 1',
    'bioavailability must be between 0 and 1',
  )
  const factory RouteParams.oral({
    required double kAbs,
    @Default(0.03) double bioavailability,
    @Default(0.41) double kClear,
  }) = OralParams;

  /// Sublingual dual-path model with mucosal and swallowed components.
  @Assert('theta >= 0 && theta <= 1', 'theta must be between 0 and 1')
  @Assert(
    'kSL > 0 && kAbsOral > 0 && kClear > 0',
    'rate constants must be positive',
  )
  const factory RouteParams.sublingual({
    required double theta,
    required double kAbsOral,
    @Default(1.8) double kSL,
    @Default(0) double k2Hydrolysis,
    @Default(0.03) double bioavailabilityOral,
    @Default(0.41) double kClear,
  }) = SublingualParams;

  /// Zero-order transdermal patch input.
  @Assert(
    'releaseRateMcgPerDay > 0 && wearDurationH > 0 && kClear > 0',
    'patch parameters must be positive',
  )
  const factory RouteParams.patch({
    required double releaseRateMcgPerDay,
    required double wearDurationH,
    @Default(0.41) double kClear,
  }) = PatchParams;

  /// Gel modeled as a Bateman absorption process.
  @Assert('kAbs > 0 && kClear > 0', 'rate constants must be positive')
  @Assert(
    'bioavailability > 0 && bioavailability <= 1',
    'bioavailability must be between 0 and 1',
  )
  const factory RouteParams.gel({
    @Default(0.022) double kAbs,
    @Default(0.05) double bioavailability,
    @Default(0.41) double kClear,
  }) = GelParams;
}
