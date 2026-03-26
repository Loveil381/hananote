// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hormone_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HormoneReading {
  String get id => throw _privateConstructorUsedError;
  String get reportId => throw _privateConstructorUsedError;
  HormoneType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of HormoneReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HormoneReadingCopyWith<HormoneReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HormoneReadingCopyWith<$Res> {
  factory $HormoneReadingCopyWith(
          HormoneReading value, $Res Function(HormoneReading) then) =
      _$HormoneReadingCopyWithImpl<$Res, HormoneReading>;
  @useResult
  $Res call(
      {String id,
      String reportId,
      HormoneType type,
      double value,
      String unit,
      String? notes});
}

/// @nodoc
class _$HormoneReadingCopyWithImpl<$Res, $Val extends HormoneReading>
    implements $HormoneReadingCopyWith<$Res> {
  _$HormoneReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HormoneReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reportId = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HormoneType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HormoneReadingImplCopyWith<$Res>
    implements $HormoneReadingCopyWith<$Res> {
  factory _$$HormoneReadingImplCopyWith(_$HormoneReadingImpl value,
          $Res Function(_$HormoneReadingImpl) then) =
      __$$HormoneReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String reportId,
      HormoneType type,
      double value,
      String unit,
      String? notes});
}

/// @nodoc
class __$$HormoneReadingImplCopyWithImpl<$Res>
    extends _$HormoneReadingCopyWithImpl<$Res, _$HormoneReadingImpl>
    implements _$$HormoneReadingImplCopyWith<$Res> {
  __$$HormoneReadingImplCopyWithImpl(
      _$HormoneReadingImpl _value, $Res Function(_$HormoneReadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HormoneReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reportId = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? notes = freezed,
  }) {
    return _then(_$HormoneReadingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HormoneType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HormoneReadingImpl implements _HormoneReading {
  const _$HormoneReadingImpl(
      {required this.id,
      required this.reportId,
      required this.type,
      required this.value,
      required this.unit,
      this.notes});

  @override
  final String id;
  @override
  final String reportId;
  @override
  final HormoneType type;
  @override
  final double value;
  @override
  final String unit;
  @override
  final String? notes;

  @override
  String toString() {
    return 'HormoneReading(id: $id, reportId: $reportId, type: $type, value: $value, unit: $unit, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HormoneReadingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, reportId, type, value, unit, notes);

  /// Create a copy of HormoneReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HormoneReadingImplCopyWith<_$HormoneReadingImpl> get copyWith =>
      __$$HormoneReadingImplCopyWithImpl<_$HormoneReadingImpl>(
          this, _$identity);
}

abstract class _HormoneReading implements HormoneReading {
  const factory _HormoneReading(
      {required final String id,
      required final String reportId,
      required final HormoneType type,
      required final double value,
      required final String unit,
      final String? notes}) = _$HormoneReadingImpl;

  @override
  String get id;
  @override
  String get reportId;
  @override
  HormoneType get type;
  @override
  double get value;
  @override
  String get unit;
  @override
  String? get notes;

  /// Create a copy of HormoneReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HormoneReadingImplCopyWith<_$HormoneReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
