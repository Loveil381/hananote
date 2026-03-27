// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteParams {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteParamsCopyWith<$Res> {
  factory $RouteParamsCopyWith(
          RouteParams value, $Res Function(RouteParams) then) =
      _$RouteParamsCopyWithImpl<$Res, RouteParams>;
}

/// @nodoc
class _$RouteParamsCopyWithImpl<$Res, $Val extends RouteParams>
    implements $RouteParamsCopyWith<$Res> {
  _$RouteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InjectionParamsImplCopyWith<$Res> {
  factory _$$InjectionParamsImplCopyWith(_$InjectionParamsImpl value,
          $Res Function(_$InjectionParamsImpl) then) =
      __$$InjectionParamsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double fracFast,
      double k1Fast,
      double k1Slow,
      double k2,
      double formationFraction,
      double k3});
}

/// @nodoc
class __$$InjectionParamsImplCopyWithImpl<$Res>
    extends _$RouteParamsCopyWithImpl<$Res, _$InjectionParamsImpl>
    implements _$$InjectionParamsImplCopyWith<$Res> {
  __$$InjectionParamsImplCopyWithImpl(
      _$InjectionParamsImpl _value, $Res Function(_$InjectionParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fracFast = null,
    Object? k1Fast = null,
    Object? k1Slow = null,
    Object? k2 = null,
    Object? formationFraction = null,
    Object? k3 = null,
  }) {
    return _then(_$InjectionParamsImpl(
      fracFast: null == fracFast
          ? _value.fracFast
          : fracFast // ignore: cast_nullable_to_non_nullable
              as double,
      k1Fast: null == k1Fast
          ? _value.k1Fast
          : k1Fast // ignore: cast_nullable_to_non_nullable
              as double,
      k1Slow: null == k1Slow
          ? _value.k1Slow
          : k1Slow // ignore: cast_nullable_to_non_nullable
              as double,
      k2: null == k2
          ? _value.k2
          : k2 // ignore: cast_nullable_to_non_nullable
              as double,
      formationFraction: null == formationFraction
          ? _value.formationFraction
          : formationFraction // ignore: cast_nullable_to_non_nullable
              as double,
      k3: null == k3
          ? _value.k3
          : k3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InjectionParamsImpl implements InjectionParams {
  const _$InjectionParamsImpl(
      {required this.fracFast,
      required this.k1Fast,
      required this.k1Slow,
      required this.k2,
      required this.formationFraction,
      this.k3 = 0.05})
      : assert(
            fracFast > 0 && fracFast < 1, 'fracFast must be between 0 and 1'),
        assert(k1Fast > 0 && k1Slow > 0 && k2 > 0 && k3 > 0,
            'all rate constants must be positive'),
        assert(formationFraction > 0 && formationFraction <= 1,
            'formationFraction must be between 0 and 1');

  @override
  final double fracFast;
  @override
  final double k1Fast;
  @override
  final double k1Slow;
  @override
  final double k2;
  @override
  final double formationFraction;
  @override
  @JsonKey()
  final double k3;

  @override
  String toString() {
    return 'RouteParams.injection(fracFast: $fracFast, k1Fast: $k1Fast, k1Slow: $k1Slow, k2: $k2, formationFraction: $formationFraction, k3: $k3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InjectionParamsImpl &&
            (identical(other.fracFast, fracFast) ||
                other.fracFast == fracFast) &&
            (identical(other.k1Fast, k1Fast) || other.k1Fast == k1Fast) &&
            (identical(other.k1Slow, k1Slow) || other.k1Slow == k1Slow) &&
            (identical(other.k2, k2) || other.k2 == k2) &&
            (identical(other.formationFraction, formationFraction) ||
                other.formationFraction == formationFraction) &&
            (identical(other.k3, k3) || other.k3 == k3));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fracFast, k1Fast, k1Slow, k2, formationFraction, k3);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InjectionParamsImplCopyWith<_$InjectionParamsImpl> get copyWith =>
      __$$InjectionParamsImplCopyWithImpl<_$InjectionParamsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) {
    return injection(fracFast, k1Fast, k1Slow, k2, formationFraction, k3);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) {
    return injection?.call(fracFast, k1Fast, k1Slow, k2, formationFraction, k3);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) {
    if (injection != null) {
      return injection(fracFast, k1Fast, k1Slow, k2, formationFraction, k3);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) {
    return injection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) {
    return injection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) {
    if (injection != null) {
      return injection(this);
    }
    return orElse();
  }
}

abstract class InjectionParams implements RouteParams {
  const factory InjectionParams(
      {required final double fracFast,
      required final double k1Fast,
      required final double k1Slow,
      required final double k2,
      required final double formationFraction,
      final double k3}) = _$InjectionParamsImpl;

  double get fracFast;
  double get k1Fast;
  double get k1Slow;
  double get k2;
  double get formationFraction;
  double get k3;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InjectionParamsImplCopyWith<_$InjectionParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OralParamsImplCopyWith<$Res> {
  factory _$$OralParamsImplCopyWith(
          _$OralParamsImpl value, $Res Function(_$OralParamsImpl) then) =
      __$$OralParamsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double kAbs, double bioavailability, double kClear});
}

/// @nodoc
class __$$OralParamsImplCopyWithImpl<$Res>
    extends _$RouteParamsCopyWithImpl<$Res, _$OralParamsImpl>
    implements _$$OralParamsImplCopyWith<$Res> {
  __$$OralParamsImplCopyWithImpl(
      _$OralParamsImpl _value, $Res Function(_$OralParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kAbs = null,
    Object? bioavailability = null,
    Object? kClear = null,
  }) {
    return _then(_$OralParamsImpl(
      kAbs: null == kAbs
          ? _value.kAbs
          : kAbs // ignore: cast_nullable_to_non_nullable
              as double,
      bioavailability: null == bioavailability
          ? _value.bioavailability
          : bioavailability // ignore: cast_nullable_to_non_nullable
              as double,
      kClear: null == kClear
          ? _value.kClear
          : kClear // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OralParamsImpl implements OralParams {
  const _$OralParamsImpl(
      {required this.kAbs, this.bioavailability = 0.03, this.kClear = 0.41})
      : assert(kAbs > 0 && kClear > 0, 'rate constants must be positive'),
        assert(bioavailability > 0 && bioavailability <= 1,
            'bioavailability must be between 0 and 1');

  @override
  final double kAbs;
  @override
  @JsonKey()
  final double bioavailability;
  @override
  @JsonKey()
  final double kClear;

  @override
  String toString() {
    return 'RouteParams.oral(kAbs: $kAbs, bioavailability: $bioavailability, kClear: $kClear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OralParamsImpl &&
            (identical(other.kAbs, kAbs) || other.kAbs == kAbs) &&
            (identical(other.bioavailability, bioavailability) ||
                other.bioavailability == bioavailability) &&
            (identical(other.kClear, kClear) || other.kClear == kClear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kAbs, bioavailability, kClear);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OralParamsImplCopyWith<_$OralParamsImpl> get copyWith =>
      __$$OralParamsImplCopyWithImpl<_$OralParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) {
    return oral(kAbs, bioavailability, kClear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) {
    return oral?.call(kAbs, bioavailability, kClear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) {
    if (oral != null) {
      return oral(kAbs, bioavailability, kClear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) {
    return oral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) {
    return oral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) {
    if (oral != null) {
      return oral(this);
    }
    return orElse();
  }
}

abstract class OralParams implements RouteParams {
  const factory OralParams(
      {required final double kAbs,
      final double bioavailability,
      final double kClear}) = _$OralParamsImpl;

  double get kAbs;
  double get bioavailability;
  double get kClear;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OralParamsImplCopyWith<_$OralParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SublingualParamsImplCopyWith<$Res> {
  factory _$$SublingualParamsImplCopyWith(_$SublingualParamsImpl value,
          $Res Function(_$SublingualParamsImpl) then) =
      __$$SublingualParamsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double theta,
      double kAbsOral,
      double kSL,
      double k2Hydrolysis,
      double bioavailabilityOral,
      double kClear});
}

/// @nodoc
class __$$SublingualParamsImplCopyWithImpl<$Res>
    extends _$RouteParamsCopyWithImpl<$Res, _$SublingualParamsImpl>
    implements _$$SublingualParamsImplCopyWith<$Res> {
  __$$SublingualParamsImplCopyWithImpl(_$SublingualParamsImpl _value,
      $Res Function(_$SublingualParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theta = null,
    Object? kAbsOral = null,
    Object? kSL = null,
    Object? k2Hydrolysis = null,
    Object? bioavailabilityOral = null,
    Object? kClear = null,
  }) {
    return _then(_$SublingualParamsImpl(
      theta: null == theta
          ? _value.theta
          : theta // ignore: cast_nullable_to_non_nullable
              as double,
      kAbsOral: null == kAbsOral
          ? _value.kAbsOral
          : kAbsOral // ignore: cast_nullable_to_non_nullable
              as double,
      kSL: null == kSL
          ? _value.kSL
          : kSL // ignore: cast_nullable_to_non_nullable
              as double,
      k2Hydrolysis: null == k2Hydrolysis
          ? _value.k2Hydrolysis
          : k2Hydrolysis // ignore: cast_nullable_to_non_nullable
              as double,
      bioavailabilityOral: null == bioavailabilityOral
          ? _value.bioavailabilityOral
          : bioavailabilityOral // ignore: cast_nullable_to_non_nullable
              as double,
      kClear: null == kClear
          ? _value.kClear
          : kClear // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SublingualParamsImpl implements SublingualParams {
  const _$SublingualParamsImpl(
      {required this.theta,
      required this.kAbsOral,
      this.kSL = 1.8,
      this.k2Hydrolysis = 0,
      this.bioavailabilityOral = 0.03,
      this.kClear = 0.41})
      : assert(theta >= 0 && theta <= 1, 'theta must be between 0 and 1'),
        assert(kSL > 0 && kAbsOral > 0 && kClear > 0,
            'rate constants must be positive');

  @override
  final double theta;
  @override
  final double kAbsOral;
  @override
  @JsonKey()
  final double kSL;
  @override
  @JsonKey()
  final double k2Hydrolysis;
  @override
  @JsonKey()
  final double bioavailabilityOral;
  @override
  @JsonKey()
  final double kClear;

  @override
  String toString() {
    return 'RouteParams.sublingual(theta: $theta, kAbsOral: $kAbsOral, kSL: $kSL, k2Hydrolysis: $k2Hydrolysis, bioavailabilityOral: $bioavailabilityOral, kClear: $kClear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SublingualParamsImpl &&
            (identical(other.theta, theta) || other.theta == theta) &&
            (identical(other.kAbsOral, kAbsOral) ||
                other.kAbsOral == kAbsOral) &&
            (identical(other.kSL, kSL) || other.kSL == kSL) &&
            (identical(other.k2Hydrolysis, k2Hydrolysis) ||
                other.k2Hydrolysis == k2Hydrolysis) &&
            (identical(other.bioavailabilityOral, bioavailabilityOral) ||
                other.bioavailabilityOral == bioavailabilityOral) &&
            (identical(other.kClear, kClear) || other.kClear == kClear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theta, kAbsOral, kSL,
      k2Hydrolysis, bioavailabilityOral, kClear);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SublingualParamsImplCopyWith<_$SublingualParamsImpl> get copyWith =>
      __$$SublingualParamsImplCopyWithImpl<_$SublingualParamsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) {
    return sublingual(
        theta, kAbsOral, kSL, k2Hydrolysis, bioavailabilityOral, kClear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) {
    return sublingual?.call(
        theta, kAbsOral, kSL, k2Hydrolysis, bioavailabilityOral, kClear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) {
    if (sublingual != null) {
      return sublingual(
          theta, kAbsOral, kSL, k2Hydrolysis, bioavailabilityOral, kClear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) {
    return sublingual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) {
    return sublingual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) {
    if (sublingual != null) {
      return sublingual(this);
    }
    return orElse();
  }
}

abstract class SublingualParams implements RouteParams {
  const factory SublingualParams(
      {required final double theta,
      required final double kAbsOral,
      final double kSL,
      final double k2Hydrolysis,
      final double bioavailabilityOral,
      final double kClear}) = _$SublingualParamsImpl;

  double get theta;
  double get kAbsOral;
  double get kSL;
  double get k2Hydrolysis;
  double get bioavailabilityOral;
  double get kClear;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SublingualParamsImplCopyWith<_$SublingualParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PatchParamsImplCopyWith<$Res> {
  factory _$$PatchParamsImplCopyWith(
          _$PatchParamsImpl value, $Res Function(_$PatchParamsImpl) then) =
      __$$PatchParamsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double releaseRateMcgPerDay, double wearDurationH, double kClear});
}

/// @nodoc
class __$$PatchParamsImplCopyWithImpl<$Res>
    extends _$RouteParamsCopyWithImpl<$Res, _$PatchParamsImpl>
    implements _$$PatchParamsImplCopyWith<$Res> {
  __$$PatchParamsImplCopyWithImpl(
      _$PatchParamsImpl _value, $Res Function(_$PatchParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? releaseRateMcgPerDay = null,
    Object? wearDurationH = null,
    Object? kClear = null,
  }) {
    return _then(_$PatchParamsImpl(
      releaseRateMcgPerDay: null == releaseRateMcgPerDay
          ? _value.releaseRateMcgPerDay
          : releaseRateMcgPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      wearDurationH: null == wearDurationH
          ? _value.wearDurationH
          : wearDurationH // ignore: cast_nullable_to_non_nullable
              as double,
      kClear: null == kClear
          ? _value.kClear
          : kClear // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PatchParamsImpl implements PatchParams {
  const _$PatchParamsImpl(
      {required this.releaseRateMcgPerDay,
      required this.wearDurationH,
      this.kClear = 0.41})
      : assert(releaseRateMcgPerDay > 0 && wearDurationH > 0 && kClear > 0,
            'patch parameters must be positive');

  @override
  final double releaseRateMcgPerDay;
  @override
  final double wearDurationH;
  @override
  @JsonKey()
  final double kClear;

  @override
  String toString() {
    return 'RouteParams.patch(releaseRateMcgPerDay: $releaseRateMcgPerDay, wearDurationH: $wearDurationH, kClear: $kClear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchParamsImpl &&
            (identical(other.releaseRateMcgPerDay, releaseRateMcgPerDay) ||
                other.releaseRateMcgPerDay == releaseRateMcgPerDay) &&
            (identical(other.wearDurationH, wearDurationH) ||
                other.wearDurationH == wearDurationH) &&
            (identical(other.kClear, kClear) || other.kClear == kClear));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, releaseRateMcgPerDay, wearDurationH, kClear);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchParamsImplCopyWith<_$PatchParamsImpl> get copyWith =>
      __$$PatchParamsImplCopyWithImpl<_$PatchParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) {
    return patch(releaseRateMcgPerDay, wearDurationH, kClear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) {
    return patch?.call(releaseRateMcgPerDay, wearDurationH, kClear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(releaseRateMcgPerDay, wearDurationH, kClear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) {
    return patch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) {
    return patch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) {
    if (patch != null) {
      return patch(this);
    }
    return orElse();
  }
}

abstract class PatchParams implements RouteParams {
  const factory PatchParams(
      {required final double releaseRateMcgPerDay,
      required final double wearDurationH,
      final double kClear}) = _$PatchParamsImpl;

  double get releaseRateMcgPerDay;
  double get wearDurationH;
  double get kClear;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchParamsImplCopyWith<_$PatchParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GelParamsImplCopyWith<$Res> {
  factory _$$GelParamsImplCopyWith(
          _$GelParamsImpl value, $Res Function(_$GelParamsImpl) then) =
      __$$GelParamsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double kAbs, double bioavailability, double kClear});
}

/// @nodoc
class __$$GelParamsImplCopyWithImpl<$Res>
    extends _$RouteParamsCopyWithImpl<$Res, _$GelParamsImpl>
    implements _$$GelParamsImplCopyWith<$Res> {
  __$$GelParamsImplCopyWithImpl(
      _$GelParamsImpl _value, $Res Function(_$GelParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kAbs = null,
    Object? bioavailability = null,
    Object? kClear = null,
  }) {
    return _then(_$GelParamsImpl(
      kAbs: null == kAbs
          ? _value.kAbs
          : kAbs // ignore: cast_nullable_to_non_nullable
              as double,
      bioavailability: null == bioavailability
          ? _value.bioavailability
          : bioavailability // ignore: cast_nullable_to_non_nullable
              as double,
      kClear: null == kClear
          ? _value.kClear
          : kClear // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GelParamsImpl implements GelParams {
  const _$GelParamsImpl(
      {this.kAbs = 0.022, this.bioavailability = 0.05, this.kClear = 0.41})
      : assert(kAbs > 0 && kClear > 0, 'rate constants must be positive'),
        assert(bioavailability > 0 && bioavailability <= 1,
            'bioavailability must be between 0 and 1');

  @override
  @JsonKey()
  final double kAbs;
  @override
  @JsonKey()
  final double bioavailability;
  @override
  @JsonKey()
  final double kClear;

  @override
  String toString() {
    return 'RouteParams.gel(kAbs: $kAbs, bioavailability: $bioavailability, kClear: $kClear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GelParamsImpl &&
            (identical(other.kAbs, kAbs) || other.kAbs == kAbs) &&
            (identical(other.bioavailability, bioavailability) ||
                other.bioavailability == bioavailability) &&
            (identical(other.kClear, kClear) || other.kClear == kClear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kAbs, bioavailability, kClear);

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GelParamsImplCopyWith<_$GelParamsImpl> get copyWith =>
      __$$GelParamsImplCopyWithImpl<_$GelParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double fracFast, double k1Fast, double k1Slow,
            double k2, double formationFraction, double k3)
        injection,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        oral,
    required TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)
        sublingual,
    required TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)
        patch,
    required TResult Function(
            double kAbs, double bioavailability, double kClear)
        gel,
  }) {
    return gel(kAbs, bioavailability, kClear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult? Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult? Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult? Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult? Function(double kAbs, double bioavailability, double kClear)? gel,
  }) {
    return gel?.call(kAbs, bioavailability, kClear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double fracFast, double k1Fast, double k1Slow, double k2,
            double formationFraction, double k3)?
        injection,
    TResult Function(double kAbs, double bioavailability, double kClear)? oral,
    TResult Function(double theta, double kAbsOral, double kSL,
            double k2Hydrolysis, double bioavailabilityOral, double kClear)?
        sublingual,
    TResult Function(
            double releaseRateMcgPerDay, double wearDurationH, double kClear)?
        patch,
    TResult Function(double kAbs, double bioavailability, double kClear)? gel,
    required TResult orElse(),
  }) {
    if (gel != null) {
      return gel(kAbs, bioavailability, kClear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InjectionParams value) injection,
    required TResult Function(OralParams value) oral,
    required TResult Function(SublingualParams value) sublingual,
    required TResult Function(PatchParams value) patch,
    required TResult Function(GelParams value) gel,
  }) {
    return gel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InjectionParams value)? injection,
    TResult? Function(OralParams value)? oral,
    TResult? Function(SublingualParams value)? sublingual,
    TResult? Function(PatchParams value)? patch,
    TResult? Function(GelParams value)? gel,
  }) {
    return gel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InjectionParams value)? injection,
    TResult Function(OralParams value)? oral,
    TResult Function(SublingualParams value)? sublingual,
    TResult Function(PatchParams value)? patch,
    TResult Function(GelParams value)? gel,
    required TResult orElse(),
  }) {
    if (gel != null) {
      return gel(this);
    }
    return orElse();
  }
}

abstract class GelParams implements RouteParams {
  const factory GelParams(
      {final double kAbs,
      final double bioavailability,
      final double kClear}) = _$GelParamsImpl;

  double get kAbs;
  double get bioavailability;
  double get kClear;

  /// Create a copy of RouteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GelParamsImplCopyWith<_$GelParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
