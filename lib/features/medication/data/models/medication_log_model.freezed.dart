// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MedicationLogModel _$MedicationLogModelFromJson(Map<String, dynamic> json) {
  return _MedicationLogModel.fromJson(json);
}

/// @nodoc
mixin _$MedicationLogModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  String get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'drug_id')
  String get drugId => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'dosage_amount')
  double get dosageAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dosage_unit')
  String get dosageUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'administration_route')
  String get administrationRoute => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'injection_site')
  String? get injectionSite => throw _privateConstructorUsedError;
  @JsonKey(name: 'patch_site')
  String? get patchSite => throw _privateConstructorUsedError;
  @JsonKey(name: 'patch_count')
  int? get patchCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'gel_pumps')
  int? get gelPumps => throw _privateConstructorUsedError;
  @JsonKey(name: 'skin_reaction')
  String? get skinReaction => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this MedicationLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicationLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationLogModelCopyWith<MedicationLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationLogModelCopyWith<$Res> {
  factory $MedicationLogModelCopyWith(
          MedicationLogModel value, $Res Function(MedicationLogModel) then) =
      _$MedicationLogModelCopyWithImpl<$Res, MedicationLogModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'schedule_id') String scheduleId,
      @JsonKey(name: 'drug_id') String drugId,
      String timestamp,
      @JsonKey(name: 'dosage_amount') double dosageAmount,
      @JsonKey(name: 'dosage_unit') String dosageUnit,
      @JsonKey(name: 'administration_route') String administrationRoute,
      String status,
      @JsonKey(name: 'injection_site') String? injectionSite,
      @JsonKey(name: 'patch_site') String? patchSite,
      @JsonKey(name: 'patch_count') int? patchCount,
      @JsonKey(name: 'gel_pumps') int? gelPumps,
      @JsonKey(name: 'skin_reaction') String? skinReaction,
      String? notes});
}

/// @nodoc
class _$MedicationLogModelCopyWithImpl<$Res, $Val extends MedicationLogModel>
    implements $MedicationLogModelCopyWith<$Res> {
  _$MedicationLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduleId = null,
    Object? drugId = null,
    Object? timestamp = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? administrationRoute = null,
    Object? status = null,
    Object? injectionSite = freezed,
    Object? patchSite = freezed,
    Object? patchCount = freezed,
    Object? gelPumps = freezed,
    Object? skinReaction = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      injectionSite: freezed == injectionSite
          ? _value.injectionSite
          : injectionSite // ignore: cast_nullable_to_non_nullable
              as String?,
      patchSite: freezed == patchSite
          ? _value.patchSite
          : patchSite // ignore: cast_nullable_to_non_nullable
              as String?,
      patchCount: freezed == patchCount
          ? _value.patchCount
          : patchCount // ignore: cast_nullable_to_non_nullable
              as int?,
      gelPumps: freezed == gelPumps
          ? _value.gelPumps
          : gelPumps // ignore: cast_nullable_to_non_nullable
              as int?,
      skinReaction: freezed == skinReaction
          ? _value.skinReaction
          : skinReaction // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationLogModelImplCopyWith<$Res>
    implements $MedicationLogModelCopyWith<$Res> {
  factory _$$MedicationLogModelImplCopyWith(_$MedicationLogModelImpl value,
          $Res Function(_$MedicationLogModelImpl) then) =
      __$$MedicationLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'schedule_id') String scheduleId,
      @JsonKey(name: 'drug_id') String drugId,
      String timestamp,
      @JsonKey(name: 'dosage_amount') double dosageAmount,
      @JsonKey(name: 'dosage_unit') String dosageUnit,
      @JsonKey(name: 'administration_route') String administrationRoute,
      String status,
      @JsonKey(name: 'injection_site') String? injectionSite,
      @JsonKey(name: 'patch_site') String? patchSite,
      @JsonKey(name: 'patch_count') int? patchCount,
      @JsonKey(name: 'gel_pumps') int? gelPumps,
      @JsonKey(name: 'skin_reaction') String? skinReaction,
      String? notes});
}

/// @nodoc
class __$$MedicationLogModelImplCopyWithImpl<$Res>
    extends _$MedicationLogModelCopyWithImpl<$Res, _$MedicationLogModelImpl>
    implements _$$MedicationLogModelImplCopyWith<$Res> {
  __$$MedicationLogModelImplCopyWithImpl(_$MedicationLogModelImpl _value,
      $Res Function(_$MedicationLogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scheduleId = null,
    Object? drugId = null,
    Object? timestamp = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? administrationRoute = null,
    Object? status = null,
    Object? injectionSite = freezed,
    Object? patchSite = freezed,
    Object? patchCount = freezed,
    Object? gelPumps = freezed,
    Object? skinReaction = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MedicationLogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleId: null == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      injectionSite: freezed == injectionSite
          ? _value.injectionSite
          : injectionSite // ignore: cast_nullable_to_non_nullable
              as String?,
      patchSite: freezed == patchSite
          ? _value.patchSite
          : patchSite // ignore: cast_nullable_to_non_nullable
              as String?,
      patchCount: freezed == patchCount
          ? _value.patchCount
          : patchCount // ignore: cast_nullable_to_non_nullable
              as int?,
      gelPumps: freezed == gelPumps
          ? _value.gelPumps
          : gelPumps // ignore: cast_nullable_to_non_nullable
              as int?,
      skinReaction: freezed == skinReaction
          ? _value.skinReaction
          : skinReaction // ignore: cast_nullable_to_non_nullable
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
class _$MedicationLogModelImpl extends _MedicationLogModel {
  const _$MedicationLogModelImpl(
      {required this.id,
      @JsonKey(name: 'schedule_id') required this.scheduleId,
      @JsonKey(name: 'drug_id') required this.drugId,
      required this.timestamp,
      @JsonKey(name: 'dosage_amount') required this.dosageAmount,
      @JsonKey(name: 'dosage_unit') required this.dosageUnit,
      @JsonKey(name: 'administration_route') required this.administrationRoute,
      required this.status,
      @JsonKey(name: 'injection_site') this.injectionSite,
      @JsonKey(name: 'patch_site') this.patchSite,
      @JsonKey(name: 'patch_count') this.patchCount,
      @JsonKey(name: 'gel_pumps') this.gelPumps,
      @JsonKey(name: 'skin_reaction') this.skinReaction,
      this.notes})
      : super._();

  factory _$MedicationLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationLogModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'schedule_id')
  final String scheduleId;
  @override
  @JsonKey(name: 'drug_id')
  final String drugId;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'dosage_amount')
  final double dosageAmount;
  @override
  @JsonKey(name: 'dosage_unit')
  final String dosageUnit;
  @override
  @JsonKey(name: 'administration_route')
  final String administrationRoute;
  @override
  final String status;
  @override
  @JsonKey(name: 'injection_site')
  final String? injectionSite;
  @override
  @JsonKey(name: 'patch_site')
  final String? patchSite;
  @override
  @JsonKey(name: 'patch_count')
  final int? patchCount;
  @override
  @JsonKey(name: 'gel_pumps')
  final int? gelPumps;
  @override
  @JsonKey(name: 'skin_reaction')
  final String? skinReaction;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MedicationLogModel(id: $id, scheduleId: $scheduleId, drugId: $drugId, timestamp: $timestamp, dosageAmount: $dosageAmount, dosageUnit: $dosageUnit, administrationRoute: $administrationRoute, status: $status, injectionSite: $injectionSite, patchSite: $patchSite, patchCount: $patchCount, gelPumps: $gelPumps, skinReaction: $skinReaction, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationLogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.drugId, drugId) || other.drugId == drugId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.dosageAmount, dosageAmount) ||
                other.dosageAmount == dosageAmount) &&
            (identical(other.dosageUnit, dosageUnit) ||
                other.dosageUnit == dosageUnit) &&
            (identical(other.administrationRoute, administrationRoute) ||
                other.administrationRoute == administrationRoute) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.injectionSite, injectionSite) ||
                other.injectionSite == injectionSite) &&
            (identical(other.patchSite, patchSite) ||
                other.patchSite == patchSite) &&
            (identical(other.patchCount, patchCount) ||
                other.patchCount == patchCount) &&
            (identical(other.gelPumps, gelPumps) ||
                other.gelPumps == gelPumps) &&
            (identical(other.skinReaction, skinReaction) ||
                other.skinReaction == skinReaction) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      scheduleId,
      drugId,
      timestamp,
      dosageAmount,
      dosageUnit,
      administrationRoute,
      status,
      injectionSite,
      patchSite,
      patchCount,
      gelPumps,
      skinReaction,
      notes);

  /// Create a copy of MedicationLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationLogModelImplCopyWith<_$MedicationLogModelImpl> get copyWith =>
      __$$MedicationLogModelImplCopyWithImpl<_$MedicationLogModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationLogModelImplToJson(
      this,
    );
  }
}

abstract class _MedicationLogModel extends MedicationLogModel {
  const factory _MedicationLogModel(
      {required final String id,
      @JsonKey(name: 'schedule_id') required final String scheduleId,
      @JsonKey(name: 'drug_id') required final String drugId,
      required final String timestamp,
      @JsonKey(name: 'dosage_amount') required final double dosageAmount,
      @JsonKey(name: 'dosage_unit') required final String dosageUnit,
      @JsonKey(name: 'administration_route')
      required final String administrationRoute,
      required final String status,
      @JsonKey(name: 'injection_site') final String? injectionSite,
      @JsonKey(name: 'patch_site') final String? patchSite,
      @JsonKey(name: 'patch_count') final int? patchCount,
      @JsonKey(name: 'gel_pumps') final int? gelPumps,
      @JsonKey(name: 'skin_reaction') final String? skinReaction,
      final String? notes}) = _$MedicationLogModelImpl;
  const _MedicationLogModel._() : super._();

  factory _MedicationLogModel.fromJson(Map<String, dynamic> json) =
      _$MedicationLogModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'schedule_id')
  String get scheduleId;
  @override
  @JsonKey(name: 'drug_id')
  String get drugId;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'dosage_amount')
  double get dosageAmount;
  @override
  @JsonKey(name: 'dosage_unit')
  String get dosageUnit;
  @override
  @JsonKey(name: 'administration_route')
  String get administrationRoute;
  @override
  String get status;
  @override
  @JsonKey(name: 'injection_site')
  String? get injectionSite;
  @override
  @JsonKey(name: 'patch_site')
  String? get patchSite;
  @override
  @JsonKey(name: 'patch_count')
  int? get patchCount;
  @override
  @JsonKey(name: 'gel_pumps')
  int? get gelPumps;
  @override
  @JsonKey(name: 'skin_reaction')
  String? get skinReaction;
  @override
  String? get notes;

  /// Create a copy of MedicationLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationLogModelImplCopyWith<_$MedicationLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
