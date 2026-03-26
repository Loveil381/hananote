// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_test_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodTestReportModel _$BloodTestReportModelFromJson(Map<String, dynamic> json) {
  return _BloodTestReportModel.fromJson(json);
}

/// @nodoc
mixin _$BloodTestReportModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'test_date')
  String get testDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<HormoneReadingModel> get readings => throw _privateConstructorUsedError;
  @JsonKey(name: 'lab_name')
  String? get labName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this BloodTestReportModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BloodTestReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BloodTestReportModelCopyWith<BloodTestReportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodTestReportModelCopyWith<$Res> {
  factory $BloodTestReportModelCopyWith(BloodTestReportModel value,
          $Res Function(BloodTestReportModel) then) =
      _$BloodTestReportModelCopyWithImpl<$Res, BloodTestReportModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'test_date') String testDate,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<HormoneReadingModel> readings,
      @JsonKey(name: 'lab_name') String? labName,
      String? notes});
}

/// @nodoc
class _$BloodTestReportModelCopyWithImpl<$Res,
        $Val extends BloodTestReportModel>
    implements $BloodTestReportModelCopyWith<$Res> {
  _$BloodTestReportModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BloodTestReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testDate = null,
    Object? createdAt = null,
    Object? readings = null,
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
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      readings: null == readings
          ? _value.readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<HormoneReadingModel>,
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
abstract class _$$BloodTestReportModelImplCopyWith<$Res>
    implements $BloodTestReportModelCopyWith<$Res> {
  factory _$$BloodTestReportModelImplCopyWith(_$BloodTestReportModelImpl value,
          $Res Function(_$BloodTestReportModelImpl) then) =
      __$$BloodTestReportModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'test_date') String testDate,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<HormoneReadingModel> readings,
      @JsonKey(name: 'lab_name') String? labName,
      String? notes});
}

/// @nodoc
class __$$BloodTestReportModelImplCopyWithImpl<$Res>
    extends _$BloodTestReportModelCopyWithImpl<$Res, _$BloodTestReportModelImpl>
    implements _$$BloodTestReportModelImplCopyWith<$Res> {
  __$$BloodTestReportModelImplCopyWithImpl(_$BloodTestReportModelImpl _value,
      $Res Function(_$BloodTestReportModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BloodTestReportModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testDate = null,
    Object? createdAt = null,
    Object? readings = null,
    Object? labName = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$BloodTestReportModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      testDate: null == testDate
          ? _value.testDate
          : testDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      readings: null == readings
          ? _value._readings
          : readings // ignore: cast_nullable_to_non_nullable
              as List<HormoneReadingModel>,
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
@JsonSerializable()
class _$BloodTestReportModelImpl extends _BloodTestReportModel {
  const _$BloodTestReportModelImpl(
      {required this.id,
      @JsonKey(name: 'test_date') required this.testDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<HormoneReadingModel> readings = const <HormoneReadingModel>[],
      @JsonKey(name: 'lab_name') this.labName,
      this.notes})
      : _readings = readings,
        super._();

  factory _$BloodTestReportModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodTestReportModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'test_date')
  final String testDate;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<HormoneReadingModel> _readings;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<HormoneReadingModel> get readings {
    if (_readings is EqualUnmodifiableListView) return _readings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readings);
  }

  @override
  @JsonKey(name: 'lab_name')
  final String? labName;
  @override
  final String? notes;

  @override
  String toString() {
    return 'BloodTestReportModel(id: $id, testDate: $testDate, createdAt: $createdAt, readings: $readings, labName: $labName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodTestReportModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testDate, testDate) ||
                other.testDate == testDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._readings, _readings) &&
            (identical(other.labName, labName) || other.labName == labName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, testDate, createdAt,
      const DeepCollectionEquality().hash(_readings), labName, notes);

  /// Create a copy of BloodTestReportModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodTestReportModelImplCopyWith<_$BloodTestReportModelImpl>
      get copyWith =>
          __$$BloodTestReportModelImplCopyWithImpl<_$BloodTestReportModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodTestReportModelImplToJson(
      this,
    );
  }
}

abstract class _BloodTestReportModel extends BloodTestReportModel {
  const factory _BloodTestReportModel(
      {required final String id,
      @JsonKey(name: 'test_date') required final String testDate,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<HormoneReadingModel> readings,
      @JsonKey(name: 'lab_name') final String? labName,
      final String? notes}) = _$BloodTestReportModelImpl;
  const _BloodTestReportModel._() : super._();

  factory _BloodTestReportModel.fromJson(Map<String, dynamic> json) =
      _$BloodTestReportModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'test_date')
  String get testDate;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<HormoneReadingModel> get readings;
  @override
  @JsonKey(name: 'lab_name')
  String? get labName;
  @override
  String? get notes;

  /// Create a copy of BloodTestReportModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BloodTestReportModelImplCopyWith<_$BloodTestReportModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
