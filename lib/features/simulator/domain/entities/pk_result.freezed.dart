// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pk_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PkCurvePoint {
  double get time => throw _privateConstructorUsedError;
  double get concentration => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  /// Create a copy of PkCurvePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PkCurvePointCopyWith<PkCurvePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PkCurvePointCopyWith<$Res> {
  factory $PkCurvePointCopyWith(
          PkCurvePoint value, $Res Function(PkCurvePoint) then) =
      _$PkCurvePointCopyWithImpl<$Res, PkCurvePoint>;
  @useResult
  $Res call({double time, double concentration, DateTime dateTime});
}

/// @nodoc
class _$PkCurvePointCopyWithImpl<$Res, $Val extends PkCurvePoint>
    implements $PkCurvePointCopyWith<$Res> {
  _$PkCurvePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PkCurvePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? concentration = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      concentration: null == concentration
          ? _value.concentration
          : concentration // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PkCurvePointImplCopyWith<$Res>
    implements $PkCurvePointCopyWith<$Res> {
  factory _$$PkCurvePointImplCopyWith(
          _$PkCurvePointImpl value, $Res Function(_$PkCurvePointImpl) then) =
      __$$PkCurvePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double time, double concentration, DateTime dateTime});
}

/// @nodoc
class __$$PkCurvePointImplCopyWithImpl<$Res>
    extends _$PkCurvePointCopyWithImpl<$Res, _$PkCurvePointImpl>
    implements _$$PkCurvePointImplCopyWith<$Res> {
  __$$PkCurvePointImplCopyWithImpl(
      _$PkCurvePointImpl _value, $Res Function(_$PkCurvePointImpl) _then)
      : super(_value, _then);

  /// Create a copy of PkCurvePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? concentration = null,
    Object? dateTime = null,
  }) {
    return _then(_$PkCurvePointImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      concentration: null == concentration
          ? _value.concentration
          : concentration // ignore: cast_nullable_to_non_nullable
              as double,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PkCurvePointImpl implements _PkCurvePoint {
  const _$PkCurvePointImpl(
      {required this.time,
      required this.concentration,
      required this.dateTime});

  @override
  final double time;
  @override
  final double concentration;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'PkCurvePoint(time: $time, concentration: $concentration, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PkCurvePointImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.concentration, concentration) ||
                other.concentration == concentration) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time, concentration, dateTime);

  /// Create a copy of PkCurvePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PkCurvePointImplCopyWith<_$PkCurvePointImpl> get copyWith =>
      __$$PkCurvePointImplCopyWithImpl<_$PkCurvePointImpl>(this, _$identity);
}

abstract class _PkCurvePoint implements PkCurvePoint {
  const factory _PkCurvePoint(
      {required final double time,
      required final double concentration,
      required final DateTime dateTime}) = _$PkCurvePointImpl;

  @override
  double get time;
  @override
  double get concentration;
  @override
  DateTime get dateTime;

  /// Create a copy of PkCurvePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PkCurvePointImplCopyWith<_$PkCurvePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PkSimulationResult {
  List<PkCurvePoint> get curvePoints => throw _privateConstructorUsedError;
  double get steadyStateTrough => throw _privateConstructorUsedError;
  double get steadyStatePeak => throw _privateConstructorUsedError;
  double get steadyStateAverage => throw _privateConstructorUsedError;
  double get timeToSteadyState => throw _privateConstructorUsedError;
  double get aucPerInterval => throw _privateConstructorUsedError;
  DosingRegimen get regimen => throw _privateConstructorUsedError;

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PkSimulationResultCopyWith<PkSimulationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PkSimulationResultCopyWith<$Res> {
  factory $PkSimulationResultCopyWith(
          PkSimulationResult value, $Res Function(PkSimulationResult) then) =
      _$PkSimulationResultCopyWithImpl<$Res, PkSimulationResult>;
  @useResult
  $Res call(
      {List<PkCurvePoint> curvePoints,
      double steadyStateTrough,
      double steadyStatePeak,
      double steadyStateAverage,
      double timeToSteadyState,
      double aucPerInterval,
      DosingRegimen regimen});

  $DosingRegimenCopyWith<$Res> get regimen;
}

/// @nodoc
class _$PkSimulationResultCopyWithImpl<$Res, $Val extends PkSimulationResult>
    implements $PkSimulationResultCopyWith<$Res> {
  _$PkSimulationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curvePoints = null,
    Object? steadyStateTrough = null,
    Object? steadyStatePeak = null,
    Object? steadyStateAverage = null,
    Object? timeToSteadyState = null,
    Object? aucPerInterval = null,
    Object? regimen = null,
  }) {
    return _then(_value.copyWith(
      curvePoints: null == curvePoints
          ? _value.curvePoints
          : curvePoints // ignore: cast_nullable_to_non_nullable
              as List<PkCurvePoint>,
      steadyStateTrough: null == steadyStateTrough
          ? _value.steadyStateTrough
          : steadyStateTrough // ignore: cast_nullable_to_non_nullable
              as double,
      steadyStatePeak: null == steadyStatePeak
          ? _value.steadyStatePeak
          : steadyStatePeak // ignore: cast_nullable_to_non_nullable
              as double,
      steadyStateAverage: null == steadyStateAverage
          ? _value.steadyStateAverage
          : steadyStateAverage // ignore: cast_nullable_to_non_nullable
              as double,
      timeToSteadyState: null == timeToSteadyState
          ? _value.timeToSteadyState
          : timeToSteadyState // ignore: cast_nullable_to_non_nullable
              as double,
      aucPerInterval: null == aucPerInterval
          ? _value.aucPerInterval
          : aucPerInterval // ignore: cast_nullable_to_non_nullable
              as double,
      regimen: null == regimen
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as DosingRegimen,
    ) as $Val);
  }

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DosingRegimenCopyWith<$Res> get regimen {
    return $DosingRegimenCopyWith<$Res>(_value.regimen, (value) {
      return _then(_value.copyWith(regimen: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PkSimulationResultImplCopyWith<$Res>
    implements $PkSimulationResultCopyWith<$Res> {
  factory _$$PkSimulationResultImplCopyWith(_$PkSimulationResultImpl value,
          $Res Function(_$PkSimulationResultImpl) then) =
      __$$PkSimulationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PkCurvePoint> curvePoints,
      double steadyStateTrough,
      double steadyStatePeak,
      double steadyStateAverage,
      double timeToSteadyState,
      double aucPerInterval,
      DosingRegimen regimen});

  @override
  $DosingRegimenCopyWith<$Res> get regimen;
}

/// @nodoc
class __$$PkSimulationResultImplCopyWithImpl<$Res>
    extends _$PkSimulationResultCopyWithImpl<$Res, _$PkSimulationResultImpl>
    implements _$$PkSimulationResultImplCopyWith<$Res> {
  __$$PkSimulationResultImplCopyWithImpl(_$PkSimulationResultImpl _value,
      $Res Function(_$PkSimulationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? curvePoints = null,
    Object? steadyStateTrough = null,
    Object? steadyStatePeak = null,
    Object? steadyStateAverage = null,
    Object? timeToSteadyState = null,
    Object? aucPerInterval = null,
    Object? regimen = null,
  }) {
    return _then(_$PkSimulationResultImpl(
      curvePoints: null == curvePoints
          ? _value._curvePoints
          : curvePoints // ignore: cast_nullable_to_non_nullable
              as List<PkCurvePoint>,
      steadyStateTrough: null == steadyStateTrough
          ? _value.steadyStateTrough
          : steadyStateTrough // ignore: cast_nullable_to_non_nullable
              as double,
      steadyStatePeak: null == steadyStatePeak
          ? _value.steadyStatePeak
          : steadyStatePeak // ignore: cast_nullable_to_non_nullable
              as double,
      steadyStateAverage: null == steadyStateAverage
          ? _value.steadyStateAverage
          : steadyStateAverage // ignore: cast_nullable_to_non_nullable
              as double,
      timeToSteadyState: null == timeToSteadyState
          ? _value.timeToSteadyState
          : timeToSteadyState // ignore: cast_nullable_to_non_nullable
              as double,
      aucPerInterval: null == aucPerInterval
          ? _value.aucPerInterval
          : aucPerInterval // ignore: cast_nullable_to_non_nullable
              as double,
      regimen: null == regimen
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as DosingRegimen,
    ));
  }
}

/// @nodoc

class _$PkSimulationResultImpl implements _PkSimulationResult {
  const _$PkSimulationResultImpl(
      {required final List<PkCurvePoint> curvePoints,
      required this.steadyStateTrough,
      required this.steadyStatePeak,
      required this.steadyStateAverage,
      required this.timeToSteadyState,
      required this.aucPerInterval,
      required this.regimen})
      : _curvePoints = curvePoints;

  final List<PkCurvePoint> _curvePoints;
  @override
  List<PkCurvePoint> get curvePoints {
    if (_curvePoints is EqualUnmodifiableListView) return _curvePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_curvePoints);
  }

  @override
  final double steadyStateTrough;
  @override
  final double steadyStatePeak;
  @override
  final double steadyStateAverage;
  @override
  final double timeToSteadyState;
  @override
  final double aucPerInterval;
  @override
  final DosingRegimen regimen;

  @override
  String toString() {
    return 'PkSimulationResult(curvePoints: $curvePoints, steadyStateTrough: $steadyStateTrough, steadyStatePeak: $steadyStatePeak, steadyStateAverage: $steadyStateAverage, timeToSteadyState: $timeToSteadyState, aucPerInterval: $aucPerInterval, regimen: $regimen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PkSimulationResultImpl &&
            const DeepCollectionEquality()
                .equals(other._curvePoints, _curvePoints) &&
            (identical(other.steadyStateTrough, steadyStateTrough) ||
                other.steadyStateTrough == steadyStateTrough) &&
            (identical(other.steadyStatePeak, steadyStatePeak) ||
                other.steadyStatePeak == steadyStatePeak) &&
            (identical(other.steadyStateAverage, steadyStateAverage) ||
                other.steadyStateAverage == steadyStateAverage) &&
            (identical(other.timeToSteadyState, timeToSteadyState) ||
                other.timeToSteadyState == timeToSteadyState) &&
            (identical(other.aucPerInterval, aucPerInterval) ||
                other.aucPerInterval == aucPerInterval) &&
            (identical(other.regimen, regimen) || other.regimen == regimen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_curvePoints),
      steadyStateTrough,
      steadyStatePeak,
      steadyStateAverage,
      timeToSteadyState,
      aucPerInterval,
      regimen);

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PkSimulationResultImplCopyWith<_$PkSimulationResultImpl> get copyWith =>
      __$$PkSimulationResultImplCopyWithImpl<_$PkSimulationResultImpl>(
          this, _$identity);
}

abstract class _PkSimulationResult implements PkSimulationResult {
  const factory _PkSimulationResult(
      {required final List<PkCurvePoint> curvePoints,
      required final double steadyStateTrough,
      required final double steadyStatePeak,
      required final double steadyStateAverage,
      required final double timeToSteadyState,
      required final double aucPerInterval,
      required final DosingRegimen regimen}) = _$PkSimulationResultImpl;

  @override
  List<PkCurvePoint> get curvePoints;
  @override
  double get steadyStateTrough;
  @override
  double get steadyStatePeak;
  @override
  double get steadyStateAverage;
  @override
  double get timeToSteadyState;
  @override
  double get aucPerInterval;
  @override
  DosingRegimen get regimen;

  /// Create a copy of PkSimulationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PkSimulationResultImplCopyWith<_$PkSimulationResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
