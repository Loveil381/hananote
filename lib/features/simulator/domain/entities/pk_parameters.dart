import 'package:freezed_annotation/freezed_annotation.dart';

part 'pk_parameters.freezed.dart';

/// Pharmacokinetic rate constants for the simplified estradiol model.
@freezed
class PkParameters with _$PkParameters {
  /// Creates a [PkParameters] instance.
  @Assert('k1 > 0', 'k1 must be positive')
  @Assert('k2 > 0', 'k2 must be positive')
  @Assert('k3 > 0', 'k3 must be positive')
  const factory PkParameters({
    required double k1,
    required double k2,
    required double k3,
  }) = _PkParameters;
}
