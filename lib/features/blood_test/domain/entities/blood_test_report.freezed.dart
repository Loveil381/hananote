// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_test_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BloodTestReport {
  String get id => throw _privateConstructorUsedError;
  DateTime get testDate => throw _privateConstructorUsedError;
  List<HormoneReading> get readings => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get labName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of BloodTestReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodTestReportCopyWith<BloodTestReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodTestReportCopyWith<$Res> {
  factory $BloodTestReportCopyWith(
          BloodTestReport value, $Res Function(BloodTestReport) then) =
      _$BloodTestReportCopyWithImpl<$Res, BloodTestReport>;
  @useResult
  $Res call(
      {String id,
      DateTime testDate,
      List<HormoneReading> readings,
      DateTime createdAt,
      String? labName,
      String? notes});
}

/// @nodoc
class _$BloodTestReportCopyWithImpl<$Res, $Val extends BloodTestReport>
    implements $BloodTestReportCopyWith<$Res> {
  _$BloodTestReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodTestReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testDate = null,
    Object? readings = null,
    Object? createdAt = null,
    Object? labName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      testDate: null == testDate
          ? _value.testDate
          : testDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<HormoneReading>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      labName: freezed == labName
          ? _value.labName
          : labName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodTestReportImplCopyWith<$Res>
    implements $BloodTestReportCopyWith<$Res> {
  factory _$$BloodTestReportImplCopyWith(_$BloodTestReportImpl value,
          $Res Function(_$BloodTestReportImpl) then) =
      __$$BloodTestReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime testDate,
      List<HormoneReading> readings,
      DateTime createdAt,
      String? labName,
      String? notes});
}

/// @nodoc
class __$$BloodTestReportImplCopyWithImpl<$Res>
    extends _$BloodTestReportCopyWithImpl<$Res, _$BloodTestReportImpl>
    implements _$$BloodTestReportImplCopyWith<$Res> {
  __$$BloodTestReportImplCopyWithImpl(
      _$BloodTestReportImpl _value, $Res Function(_$BloodTestReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodTestReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testDate = null,
    Object? readings = null,
    Object? createdAt = null,
    Object? labName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$BloodTestReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      testDate: null == testDate
          ? _value.testDate
          : testDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readings: null == readings
          ? _value._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<HormoneReading>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      labName: freezed == labName
          ? _value.labName
          : labName // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BloodTestReportImpl implements _BloodTestReport {
  const _$BloodTestReportImpl(
      {required this.id,
      required this.testDate,
      required final List<HormoneReading> readings,
      required this.createdAt,
      this.labName,
      this.notes})
      : _readings = readings;

  @override
  final String id;
  @override
  final DateTime testDate;
  final List<HormoneReading> _readings;
  @override
  List<HormoneReading> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  final DateTime createdAt;
  @override
  final String? labName;
  @override
  final String? notes;

  @override
  String toString() {
    return 'BloodTestReport(id: $id, testDate: $testDate, readings: $readings, createdAt: $createdAt, labName: $labName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodTestReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testDate, testDate) ||
                other.testDate == testDate) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.labName, labName) || other.labName == labName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      testDate,
      const DeepCollectionEquality().hash(_readings),
      createdAt,
      labName,
      notes);

  /// Create a copy of BloodTestReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodTestReportImplCopyWith<_$BloodTestReportImpl> get copyWith =>
      __$$BloodTestReportImplCopyWithImpl<_$BloodTestReportImpl>(
          this, _$identity);
}

abstract class _BloodTestReport implements BloodTestReport {
  const factory _BloodTestReport(
      {required final String id,
      required final DateTime testDate,
      required final List<HormoneReading> readings,
      required final DateTime createdAt,
      final String? labName,
      final String? notes}) = _$BloodTestReportImpl;

  @override
  String get id;
  @override
  DateTime get testDate;
  @override
  List<HormoneReading> get readings;
  @override
  DateTime get createdAt;
  @override
  String? get labName;
  @override
  String? get notes;

  /// Create a copy of BloodTestReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodTestReportImplCopyWith<_$BloodTestReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
