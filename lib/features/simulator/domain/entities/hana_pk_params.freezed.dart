// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hana_pk_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HanaPkParams {
  double get kEl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double tau, double beta, double formationFraction, double kEl)
        weibullInjection,
    required TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)
        oralE1S,
    required TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)
        hanaSublingual,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult? Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult? Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeibullInjectionParams value) weibullInjection,
    required TResult Function(OralE1SParams value) oralE1S,
    required TResult Function(HanaSublingualParams value) hanaSublingual,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeibullInjectionParams value)? weibullInjection,
    TResult? Function(OralE1SParams value)? oralE1S,
    TResult? Function(HanaSublingualParams value)? hanaSublingual,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeibullInjectionParams value)? weibullInjection,
    TResult Function(OralE1SParams value)? oralE1S,
    TResult Function(HanaSublingualParams value)? hanaSublingual,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HanaPkParamsCopyWith<HanaPkParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HanaPkParamsCopyWith<$Res> {
  factory $HanaPkParamsCopyWith(
          HanaPkParams value, $Res Function(HanaPkParams) then) =
      _$HanaPkParamsCopyWithImpl<$Res, HanaPkParams>;
  @useResult
  $Res call({double kEl});
}

/// @nodoc
class _$HanaPkParamsCopyWithImpl<$Res, $Val extends HanaPkParams>
    implements $HanaPkParamsCopyWith<$Res> {
  _$HanaPkParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kEl = null,
  }) {
    return _then(_value.copyWith(
      kEl: null == kEl
          ? _value.kEl
          : kEl // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeibullInjectionParamsImplCopyWith<$Res>
    implements $HanaPkParamsCopyWith<$Res> {
  factory _$$WeibullInjectionParamsImplCopyWith(
          _$WeibullInjectionParamsImpl value,
          $Res Function(_$WeibullInjectionParamsImpl) then) =
      __$$WeibullInjectionParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double tau, double beta, double formationFraction, double kEl});
}

/// @nodoc
class __$$WeibullInjectionParamsImplCopyWithImpl<$Res>
    extends _$HanaPkParamsCopyWithImpl<$Res, _$WeibullInjectionParamsImpl>
    implements _$$WeibullInjectionParamsImplCopyWith<$Res> {
  __$$WeibullInjectionParamsImplCopyWithImpl(
      _$WeibullInjectionParamsImpl _value,
      $Res Function(_$WeibullInjectionParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tau = null,
    Object? beta = null,
    Object? formationFraction = null,
    Object? kEl = null,
  }) {
    return _then(_$WeibullInjectionParamsImpl(
      tau: null == tau
          ? _value.tau
          : tau // ignore: cast_nullable_to_non_nullable
              as double,
      beta: null == beta
          ? _value.beta
          : beta // ignore: cast_nullable_to_non_nullable
              as double,
      formationFraction: null == formationFraction
          ? _value.formationFraction
          : formationFraction // ignore: cast_nullable_to_non_nullable
              as double,
      kEl: null == kEl
          ? _value.kEl
          : kEl // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$WeibullInjectionParamsImpl implements WeibullInjectionParams {
  const _$WeibullInjectionParamsImpl(
      {required this.tau,
      required this.beta,
      required this.formationFraction,
      this.kEl = 0.05})
      : assert(tau > 0 && beta > 0 && beta <= 2,
            'tau must be > 0 and beta in (0, 2]'),
        assert(formationFraction > 0 && formationFraction <= 1,
            'formationFraction must be in (0, 1]');

  @override
  final double tau;
  @override
  final double beta;
  @override
  final double formationFraction;
  @override
  @JsonKey()
  final double kEl;

  @override
  String toString() {
    return 'HanaPkParams.weibullInjection(tau: $tau, beta: $beta, formationFraction: $formationFraction, kEl: $kEl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeibullInjectionParamsImpl &&
            (identical(other.tau, tau) || other.tau == tau) &&
            (identical(other.beta, beta) || other.beta == beta) &&
            (identical(other.formationFraction, formationFraction) ||
                other.formationFraction == formationFraction) &&
            (identical(other.kEl, kEl) || other.kEl == kEl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tau, beta, formationFraction, kEl);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeibullInjectionParamsImplCopyWith<_$WeibullInjectionParamsImpl>
      get copyWith => __$$WeibullInjectionParamsImplCopyWithImpl<
          _$WeibullInjectionParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double tau, double beta, double formationFraction, double kEl)
        weibullInjection,
    required TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)
        oralE1S,
    required TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)
        hanaSublingual,
  }) {
    return weibullInjection(tau, beta, formationFraction, kEl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult? Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult? Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
  }) {
    return weibullInjection?.call(tau, beta, formationFraction, kEl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
    required TResult orElse(),
  }) {
    if (weibullInjection != null) {
      return weibullInjection(tau, beta, formationFraction, kEl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeibullInjectionParams value) weibullInjection,
    required TResult Function(OralE1SParams value) oralE1S,
    required TResult Function(HanaSublingualParams value) hanaSublingual,
  }) {
    return weibullInjection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeibullInjectionParams value)? weibullInjection,
    TResult? Function(OralE1SParams value)? oralE1S,
    TResult? Function(HanaSublingualParams value)? hanaSublingual,
  }) {
    return weibullInjection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeibullInjectionParams value)? weibullInjection,
    TResult Function(OralE1SParams value)? oralE1S,
    TResult Function(HanaSublingualParams value)? hanaSublingual,
    required TResult orElse(),
  }) {
    if (weibullInjection != null) {
      return weibullInjection(this);
    }
    return orElse();
  }
}

abstract class WeibullInjectionParams implements HanaPkParams {
  const factory WeibullInjectionParams(
      {required final double tau,
      required final double beta,
      required final double formationFraction,
      final double kEl}) = _$WeibullInjectionParamsImpl;

  double get tau;
  double get beta;
  double get formationFraction;
  @override
  double get kEl;

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeibullInjectionParamsImplCopyWith<_$WeibullInjectionParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OralE1SParamsImplCopyWith<$Res>
    implements $HanaPkParamsCopyWith<$Res> {
  factory _$$OralE1SParamsImplCopyWith(
          _$OralE1SParamsImpl value, $Res Function(_$OralE1SParamsImpl) then) =
      __$$OralE1SParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double ka,
      double bioavailability,
      double fE1S,
      double kRec,
      double kElS,
      double kEl});
}

/// @nodoc
class __$$OralE1SParamsImplCopyWithImpl<$Res>
    extends _$HanaPkParamsCopyWithImpl<$Res, _$OralE1SParamsImpl>
    implements _$$OralE1SParamsImplCopyWith<$Res> {
  __$$OralE1SParamsImplCopyWithImpl(
      _$OralE1SParamsImpl _value, $Res Function(_$OralE1SParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ka = null,
    Object? bioavailability = null,
    Object? fE1S = null,
    Object? kRec = null,
    Object? kElS = null,
    Object? kEl = null,
  }) {
    return _then(_$OralE1SParamsImpl(
      ka: null == ka
          ? _value.ka
          : ka // ignore: cast_nullable_to_non_nullable
              as double,
      bioavailability: null == bioavailability
          ? _value.bioavailability
          : bioavailability // ignore: cast_nullable_to_non_nullable
              as double,
      fE1S: null == fE1S
          ? _value.fE1S
          : fE1S // ignore: cast_nullable_to_non_nullable
              as double,
      kRec: null == kRec
          ? _value.kRec
          : kRec // ignore: cast_nullable_to_non_nullable
              as double,
      kElS: null == kElS
          ? _value.kElS
          : kElS // ignore: cast_nullable_to_non_nullable
              as double,
      kEl: null == kEl
          ? _value.kEl
          : kEl // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OralE1SParamsImpl implements OralE1SParams {
  const _$OralE1SParamsImpl(
      {this.ka = 0.3,
      this.bioavailability = 0.04,
      this.fE1S = 0.35,
      this.kRec = 0.04,
      this.kElS = 0.04,
      this.kEl = 0.38})
      : assert(ka > 0 && kEl > 0 && kRec > 0 && kElS > 0,
            'rate constants must be positive');

  @override
  @JsonKey()
  final double ka;
  @override
  @JsonKey()
  final double bioavailability;
  @override
  @JsonKey()
  final double fE1S;
  @override
  @JsonKey()
  final double kRec;
  @override
  @JsonKey()
  final double kElS;
  @override
  @JsonKey()
  final double kEl;

  @override
  String toString() {
    return 'HanaPkParams.oralE1S(ka: $ka, bioavailability: $bioavailability, fE1S: $fE1S, kRec: $kRec, kElS: $kElS, kEl: $kEl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OralE1SParamsImpl &&
            (identical(other.ka, ka) || other.ka == ka) &&
            (identical(other.bioavailability, bioavailability) ||
                other.bioavailability == bioavailability) &&
            (identical(other.fE1S, fE1S) || other.fE1S == fE1S) &&
            (identical(other.kRec, kRec) || other.kRec == kRec) &&
            (identical(other.kElS, kElS) || other.kElS == kElS) &&
            (identical(other.kEl, kEl) || other.kEl == kEl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ka, bioavailability, fE1S, kRec, kElS, kEl);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OralE1SParamsImplCopyWith<_$OralE1SParamsImpl> get copyWith =>
      __$$OralE1SParamsImplCopyWithImpl<_$OralE1SParamsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double tau, double beta, double formationFraction, double kEl)
        weibullInjection,
    required TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)
        oralE1S,
    required TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)
        hanaSublingual,
  }) {
    return oralE1S(ka, bioavailability, fE1S, kRec, kElS, kEl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult? Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult? Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
  }) {
    return oralE1S?.call(ka, bioavailability, fE1S, kRec, kElS, kEl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
    required TResult orElse(),
  }) {
    if (oralE1S != null) {
      return oralE1S(ka, bioavailability, fE1S, kRec, kElS, kEl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeibullInjectionParams value) weibullInjection,
    required TResult Function(OralE1SParams value) oralE1S,
    required TResult Function(HanaSublingualParams value) hanaSublingual,
  }) {
    return oralE1S(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeibullInjectionParams value)? weibullInjection,
    TResult? Function(OralE1SParams value)? oralE1S,
    TResult? Function(HanaSublingualParams value)? hanaSublingual,
  }) {
    return oralE1S?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeibullInjectionParams value)? weibullInjection,
    TResult Function(OralE1SParams value)? oralE1S,
    TResult Function(HanaSublingualParams value)? hanaSublingual,
    required TResult orElse(),
  }) {
    if (oralE1S != null) {
      return oralE1S(this);
    }
    return orElse();
  }
}

abstract class OralE1SParams implements HanaPkParams {
  const factory OralE1SParams(
      {final double ka,
      final double bioavailability,
      final double fE1S,
      final double kRec,
      final double kElS,
      final double kEl}) = _$OralE1SParamsImpl;

  double get ka;
  double get bioavailability;
  double get fE1S;
  double get kRec;
  double get kElS;
  @override
  double get kEl;

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OralE1SParamsImplCopyWith<_$OralE1SParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HanaSublingualParamsImplCopyWith<$Res>
    implements $HanaPkParamsCopyWith<$Res> {
  factory _$$HanaSublingualParamsImplCopyWith(_$HanaSublingualParamsImpl value,
          $Res Function(_$HanaSublingualParamsImpl) then) =
      __$$HanaSublingualParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double theta,
      double kSL,
      double kaOral,
      double bioavailabilityOral,
      double fE1S,
      double kRec,
      double kElS,
      double kEl});
}

/// @nodoc
class __$$HanaSublingualParamsImplCopyWithImpl<$Res>
    extends _$HanaPkParamsCopyWithImpl<$Res, _$HanaSublingualParamsImpl>
    implements _$$HanaSublingualParamsImplCopyWith<$Res> {
  __$$HanaSublingualParamsImplCopyWithImpl(_$HanaSublingualParamsImpl _value,
      $Res Function(_$HanaSublingualParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theta = null,
    Object? kSL = null,
    Object? kaOral = null,
    Object? bioavailabilityOral = null,
    Object? fE1S = null,
    Object? kRec = null,
    Object? kElS = null,
    Object? kEl = null,
  }) {
    return _then(_$HanaSublingualParamsImpl(
      theta: null == theta
          ? _value.theta
          : theta // ignore: cast_nullable_to_non_nullable
              as double,
      kSL: null == kSL
          ? _value.kSL
          : kSL // ignore: cast_nullable_to_non_nullable
              as double,
      kaOral: null == kaOral
          ? _value.kaOral
          : kaOral // ignore: cast_nullable_to_non_nullable
              as double,
      bioavailabilityOral: null == bioavailabilityOral
          ? _value.bioavailabilityOral
          : bioavailabilityOral // ignore: cast_nullable_to_non_nullable
              as double,
      fE1S: null == fE1S
          ? _value.fE1S
          : fE1S // ignore: cast_nullable_to_non_nullable
              as double,
      kRec: null == kRec
          ? _value.kRec
          : kRec // ignore: cast_nullable_to_non_nullable
              as double,
      kElS: null == kElS
          ? _value.kElS
          : kElS // ignore: cast_nullable_to_non_nullable
              as double,
      kEl: null == kEl
          ? _value.kEl
          : kEl // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$HanaSublingualParamsImpl implements HanaSublingualParams {
  const _$HanaSublingualParamsImpl(
      {required this.theta,
      this.kSL = 1.8,
      this.kaOral = 0.3,
      this.bioavailabilityOral = 0.04,
      this.fE1S = 0.35,
      this.kRec = 0.04,
      this.kElS = 0.04,
      this.kEl = 0.38})
      : assert(theta >= 0 && theta <= 1, 'theta must be in [0, 1]');

  @override
  final double theta;
  @override
  @JsonKey()
  final double kSL;
  @override
  @JsonKey()
  final double kaOral;
  @override
  @JsonKey()
  final double bioavailabilityOral;
  @override
  @JsonKey()
  final double fE1S;
  @override
  @JsonKey()
  final double kRec;
  @override
  @JsonKey()
  final double kElS;
  @override
  @JsonKey()
  final double kEl;

  @override
  String toString() {
    return 'HanaPkParams.hanaSublingual(theta: $theta, kSL: $kSL, kaOral: $kaOral, bioavailabilityOral: $bioavailabilityOral, fE1S: $fE1S, kRec: $kRec, kElS: $kElS, kEl: $kEl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HanaSublingualParamsImpl &&
            (identical(other.theta, theta) || other.theta == theta) &&
            (identical(other.kSL, kSL) || other.kSL == kSL) &&
            (identical(other.kaOral, kaOral) || other.kaOral == kaOral) &&
            (identical(other.bioavailabilityOral, bioavailabilityOral) ||
                other.bioavailabilityOral == bioavailabilityOral) &&
            (identical(other.fE1S, fE1S) || other.fE1S == fE1S) &&
            (identical(other.kRec, kRec) || other.kRec == kRec) &&
            (identical(other.kElS, kElS) || other.kElS == kElS) &&
            (identical(other.kEl, kEl) || other.kEl == kEl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theta, kSL, kaOral,
      bioavailabilityOral, fE1S, kRec, kElS, kEl);

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HanaSublingualParamsImplCopyWith<_$HanaSublingualParamsImpl>
      get copyWith =>
          __$$HanaSublingualParamsImplCopyWithImpl<_$HanaSublingualParamsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double tau, double beta, double formationFraction, double kEl)
        weibullInjection,
    required TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)
        oralE1S,
    required TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)
        hanaSublingual,
  }) {
    return hanaSublingual(
        theta, kSL, kaOral, bioavailabilityOral, fE1S, kRec, kElS, kEl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult? Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult? Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
  }) {
    return hanaSublingual?.call(
        theta, kSL, kaOral, bioavailabilityOral, fE1S, kRec, kElS, kEl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double tau, double beta, double formationFraction, double kEl)?
        weibullInjection,
    TResult Function(double ka, double bioavailability, double fE1S,
            double kRec, double kElS, double kEl)?
        oralE1S,
    TResult Function(
            double theta,
            double kSL,
            double kaOral,
            double bioavailabilityOral,
            double fE1S,
            double kRec,
            double kElS,
            double kEl)?
        hanaSublingual,
    required TResult orElse(),
  }) {
    if (hanaSublingual != null) {
      return hanaSublingual(
          theta, kSL, kaOral, bioavailabilityOral, fE1S, kRec, kElS, kEl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeibullInjectionParams value) weibullInjection,
    required TResult Function(OralE1SParams value) oralE1S,
    required TResult Function(HanaSublingualParams value) hanaSublingual,
  }) {
    return hanaSublingual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeibullInjectionParams value)? weibullInjection,
    TResult? Function(OralE1SParams value)? oralE1S,
    TResult? Function(HanaSublingualParams value)? hanaSublingual,
  }) {
    return hanaSublingual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeibullInjectionParams value)? weibullInjection,
    TResult Function(OralE1SParams value)? oralE1S,
    TResult Function(HanaSublingualParams value)? hanaSublingual,
    required TResult orElse(),
  }) {
    if (hanaSublingual != null) {
      return hanaSublingual(this);
    }
    return orElse();
  }
}

abstract class HanaSublingualParams implements HanaPkParams {
  const factory HanaSublingualParams(
      {required final double theta,
      final double kSL,
      final double kaOral,
      final double bioavailabilityOral,
      final double fE1S,
      final double kRec,
      final double kElS,
      final double kEl}) = _$HanaSublingualParamsImpl;

  double get theta;
  double get kSL;
  double get kaOral;
  double get bioavailabilityOral;
  double get fE1S;
  double get kRec;
  double get kElS;
  @override
  double get kEl;

  /// Create a copy of HanaPkParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HanaSublingualParamsImplCopyWith<_$HanaSublingualParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
