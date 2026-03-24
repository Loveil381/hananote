// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicationScheduleModel _$MedicationScheduleModelFromJson(
    Map<String, dynamic> json) {
  return _MedicationScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$MedicationScheduleModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'drug_id')
  String get drugId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dosage_amount')
  double get dosageAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dosage_unit')
  String get dosageUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'frequency_type')
  String get frequencyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'frequency_value')
  String get frequencyValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'administration_route')
  String get administrationRoute => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_times')
  String get scheduleTimes => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'interval_days')
  int? get intervalDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this MedicationScheduleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicationScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationScheduleModelCopyWith<MedicationScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationScheduleModelCopyWith<$Res> {
  factory $MedicationScheduleModelCopyWith(MedicationScheduleModel value,
          $Res Function(MedicationScheduleModel) then) =
      _$MedicationScheduleModelCopyWithImpl<$Res, MedicationScheduleModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'drug_id') String drugId,
      @JsonKey(name: 'dosage_amount') double dosageAmount,
      @JsonKey(name: 'dosage_unit') String dosageUnit,
      @JsonKey(name: 'frequency_type') String frequencyType,
      @JsonKey(name: 'frequency_value') String frequencyValue,
      @JsonKey(name: 'administration_route') String administrationRoute,
      @JsonKey(name: 'schedule_times') String scheduleTimes,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'interval_days') int? intervalDays,
      @JsonKey(name: 'end_date') String? endDate,
      String? notes});
}

/// @nodoc
class _$MedicationScheduleModelCopyWithImpl<$Res,
        $Val extends MedicationScheduleModel>
    implements $MedicationScheduleModelCopyWith<$Res> {
  _$MedicationScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? frequencyType = null,
    Object? frequencyValue = null,
    Object? administrationRoute = null,
    Object? scheduleTimes = null,
    Object? startDate = null,
    Object? isActive = null,
    Object? intervalDays = freezed,
    Object? endDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyValue: null == frequencyValue
          ? _value.frequencyValue
          : frequencyValue // ignore: cast_nullable_to_non_nullable
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleTimes: null == scheduleTimes
          ? _value.scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      intervalDays: freezed == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationScheduleModelImplCopyWith<$Res>
    implements $MedicationScheduleModelCopyWith<$Res> {
  factory _$$MedicationScheduleModelImplCopyWith(
          _$MedicationScheduleModelImpl value,
          $Res Function(_$MedicationScheduleModelImpl) then) =
      __$$MedicationScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'drug_id') String drugId,
      @JsonKey(name: 'dosage_amount') double dosageAmount,
      @JsonKey(name: 'dosage_unit') String dosageUnit,
      @JsonKey(name: 'frequency_type') String frequencyType,
      @JsonKey(name: 'frequency_value') String frequencyValue,
      @JsonKey(name: 'administration_route') String administrationRoute,
      @JsonKey(name: 'schedule_times') String scheduleTimes,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'interval_days') int? intervalDays,
      @JsonKey(name: 'end_date') String? endDate,
      String? notes});
}

/// @nodoc
class __$$MedicationScheduleModelImplCopyWithImpl<$Res>
    extends _$MedicationScheduleModelCopyWithImpl<$Res,
        _$MedicationScheduleModelImpl>
    implements _$$MedicationScheduleModelImplCopyWith<$Res> {
  __$$MedicationScheduleModelImplCopyWithImpl(
      _$MedicationScheduleModelImpl _value,
      $Res Function(_$MedicationScheduleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? frequencyType = null,
    Object? frequencyValue = null,
    Object? administrationRoute = null,
    Object? scheduleTimes = null,
    Object? startDate = null,
    Object? isActive = null,
    Object? intervalDays = freezed,
    Object? endDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MedicationScheduleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyType: null == frequencyType
          ? _value.frequencyType
          : frequencyType // ignore: cast_nullable_to_non_nullable
              as String,
      frequencyValue: null == frequencyValue
          ? _value.frequencyValue
          : frequencyValue // ignore: cast_nullable_to_non_nullable
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleTimes: null == scheduleTimes
          ? _value.scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      intervalDays: freezed == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
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
class _$MedicationScheduleModelImpl extends _MedicationScheduleModel {
  const _$MedicationScheduleModelImpl(
      {required this.id,
      @JsonKey(name: 'drug_id') required this.drugId,
      @JsonKey(name: 'dosage_amount') required this.dosageAmount,
      @JsonKey(name: 'dosage_unit') required this.dosageUnit,
      @JsonKey(name: 'frequency_type') required this.frequencyType,
      @JsonKey(name: 'frequency_value') required this.frequencyValue,
      @JsonKey(name: 'administration_route') required this.administrationRoute,
      @JsonKey(name: 'schedule_times') required this.scheduleTimes,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'interval_days') this.intervalDays,
      @JsonKey(name: 'end_date') this.endDate,
      this.notes})
      : super._();

  factory _$MedicationScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationScheduleModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'drug_id')
  final String drugId;
  @override
  @JsonKey(name: 'dosage_amount')
  final double dosageAmount;
  @override
  @JsonKey(name: 'dosage_unit')
  final String dosageUnit;
  @override
  @JsonKey(name: 'frequency_type')
  final String frequencyType;
  @override
  @JsonKey(name: 'frequency_value')
  final String frequencyValue;
  @override
  @JsonKey(name: 'administration_route')
  final String administrationRoute;
  @override
  @JsonKey(name: 'schedule_times')
  final String scheduleTimes;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'interval_days')
  final int? intervalDays;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MedicationScheduleModel(id: $id, drugId: $drugId, dosageAmount: $dosageAmount, dosageUnit: $dosageUnit, frequencyType: $frequencyType, frequencyValue: $frequencyValue, administrationRoute: $administrationRoute, scheduleTimes: $scheduleTimes, startDate: $startDate, isActive: $isActive, intervalDays: $intervalDays, endDate: $endDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationScheduleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drugId, drugId) || other.drugId == drugId) &&
            (identical(other.dosageAmount, dosageAmount) ||
                other.dosageAmount == dosageAmount) &&
            (identical(other.dosageUnit, dosageUnit) ||
                other.dosageUnit == dosageUnit) &&
            (identical(other.frequencyType, frequencyType) ||
                other.frequencyType == frequencyType) &&
            (identical(other.frequencyValue, frequencyValue) ||
                other.frequencyValue == frequencyValue) &&
            (identical(other.administrationRoute, administrationRoute) ||
                other.administrationRoute == administrationRoute) &&
            (identical(other.scheduleTimes, scheduleTimes) ||
                other.scheduleTimes == scheduleTimes) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.intervalDays, intervalDays) ||
                other.intervalDays == intervalDays) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      drugId,
      dosageAmount,
      dosageUnit,
      frequencyType,
      frequencyValue,
      administrationRoute,
      scheduleTimes,
      startDate,
      isActive,
      intervalDays,
      endDate,
      notes);

  /// Create a copy of MedicationScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationScheduleModelImplCopyWith<_$MedicationScheduleModelImpl>
      get copyWith => __$$MedicationScheduleModelImplCopyWithImpl<
          _$MedicationScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _MedicationScheduleModel extends MedicationScheduleModel {
  const factory _MedicationScheduleModel(
      {required final String id,
      @JsonKey(name: 'drug_id') required final String drugId,
      @JsonKey(name: 'dosage_amount') required final double dosageAmount,
      @JsonKey(name: 'dosage_unit') required final String dosageUnit,
      @JsonKey(name: 'frequency_type') required final String frequencyType,
      @JsonKey(name: 'frequency_value') required final String frequencyValue,
      @JsonKey(name: 'administration_route')
      required final String administrationRoute,
      @JsonKey(name: 'schedule_times') required final String scheduleTimes,
      @JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'is_active') required final int isActive,
      @JsonKey(name: 'interval_days') final int? intervalDays,
      @JsonKey(name: 'end_date') final String? endDate,
      final String? notes}) = _$MedicationScheduleModelImpl;
  const _MedicationScheduleModel._() : super._();

  factory _MedicationScheduleModel.fromJson(Map<String, dynamic> json) =
      _$MedicationScheduleModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'drug_id')
  String get drugId;
  @override
  @JsonKey(name: 'dosage_amount')
  double get dosageAmount;
  @override
  @JsonKey(name: 'dosage_unit')
  String get dosageUnit;
  @override
  @JsonKey(name: 'frequency_type')
  String get frequencyType;
  @override
  @JsonKey(name: 'frequency_value')
  String get frequencyValue;
  @override
  @JsonKey(name: 'administration_route')
  String get administrationRoute;
  @override
  @JsonKey(name: 'schedule_times')
  String get scheduleTimes;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'is_active')
  int get isActive;
  @override
  @JsonKey(name: 'interval_days')
  int? get intervalDays;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  String? get notes;

  /// Create a copy of MedicationScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationScheduleModelImplCopyWith<_$MedicationScheduleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
