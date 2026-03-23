// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MedicationLog {
  String get id => throw _privateConstructorUsedError;
  String get scheduleId => throw _privateConstructorUsedError;
  String get drugId => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get dosageAmount => throw _privateConstructorUsedError;
  DosageUnit get dosageUnit => throw _privateConstructorUsedError;
  AdministrationRoute get administrationRoute =>
      throw _privateConstructorUsedError;
  LogStatus get status => throw _privateConstructorUsedError;
  InjectionSite? get injectionSite => throw _privateConstructorUsedError;
  PatchSite? get patchSite => throw _privateConstructorUsedError;
  int? get patchCount => throw _privateConstructorUsedError;
  int? get gelPumps => throw _privateConstructorUsedError;
  SkinReaction? get skinReaction => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationLogCopyWith<MedicationLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationLogCopyWith<$Res> {
  factory $MedicationLogCopyWith(
          MedicationLog value, $Res Function(MedicationLog) then) =
      _$MedicationLogCopyWithImpl<$Res, MedicationLog>;
  @useResult
  $Res call(
      {String id,
      String scheduleId,
      String drugId,
      DateTime timestamp,
      double dosageAmount,
      DosageUnit dosageUnit,
      AdministrationRoute administrationRoute,
      LogStatus status,
      InjectionSite? injectionSite,
      PatchSite? patchSite,
      int? patchCount,
      int? gelPumps,
      SkinReaction? skinReaction,
      String? notes});
}

/// @nodoc
class _$MedicationLogCopyWithImpl<$Res, $Val extends MedicationLog>
    implements $MedicationLogCopyWith<$Res> {
  _$MedicationLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationLog
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
              as DateTime,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as DosageUnit,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LogStatus,
      injectionSite: freezed == injectionSite
          ? _value.injectionSite
          : injectionSite // ignore: cast_nullable_to_non_nullable
              as InjectionSite?,
      patchSite: freezed == patchSite
          ? _value.patchSite
          : patchSite // ignore: cast_nullable_to_non_nullable
              as PatchSite?,
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
              as SkinReaction?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationLogImplCopyWith<$Res>
    implements $MedicationLogCopyWith<$Res> {
  factory _$$MedicationLogImplCopyWith(
          _$MedicationLogImpl value, $Res Function(_$MedicationLogImpl) then) =
      __$$MedicationLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String scheduleId,
      String drugId,
      DateTime timestamp,
      double dosageAmount,
      DosageUnit dosageUnit,
      AdministrationRoute administrationRoute,
      LogStatus status,
      InjectionSite? injectionSite,
      PatchSite? patchSite,
      int? patchCount,
      int? gelPumps,
      SkinReaction? skinReaction,
      String? notes});
}

/// @nodoc
class __$$MedicationLogImplCopyWithImpl<$Res>
    extends _$MedicationLogCopyWithImpl<$Res, _$MedicationLogImpl>
    implements _$$MedicationLogImplCopyWith<$Res> {
  __$$MedicationLogImplCopyWithImpl(
      _$MedicationLogImpl _value, $Res Function(_$MedicationLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationLog
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
    return _then(_$MedicationLogImpl(
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
              as DateTime,
      dosageAmount: null == dosageAmount
          ? _value.dosageAmount
          : dosageAmount // ignore: cast_nullable_to_non_nullable
              as double,
      dosageUnit: null == dosageUnit
          ? _value.dosageUnit
          : dosageUnit // ignore: cast_nullable_to_non_nullable
              as DosageUnit,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as LogStatus,
      injectionSite: freezed == injectionSite
          ? _value.injectionSite
          : injectionSite // ignore: cast_nullable_to_non_nullable
              as InjectionSite?,
      patchSite: freezed == patchSite
          ? _value.patchSite
          : patchSite // ignore: cast_nullable_to_non_nullable
              as PatchSite?,
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
              as SkinReaction?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MedicationLogImpl implements _MedicationLog {
  const _$MedicationLogImpl(
      {required this.id,
      required this.scheduleId,
      required this.drugId,
      required this.timestamp,
      required this.dosageAmount,
      required this.dosageUnit,
      required this.administrationRoute,
      required this.status,
      this.injectionSite,
      this.patchSite,
      this.patchCount,
      this.gelPumps,
      this.skinReaction,
      this.notes})
      : assert(dosageAmount >= 0, 'dosageAmount must be zero or positive');

  @override
  final String id;
  @override
  final String scheduleId;
  @override
  final String drugId;
  @override
  final DateTime timestamp;
  @override
  final double dosageAmount;
  @override
  final DosageUnit dosageUnit;
  @override
  final AdministrationRoute administrationRoute;
  @override
  final LogStatus status;
  @override
  final InjectionSite? injectionSite;
  @override
  final PatchSite? patchSite;
  @override
  final int? patchCount;
  @override
  final int? gelPumps;
  @override
  final SkinReaction? skinReaction;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MedicationLog(id: $id, scheduleId: $scheduleId, drugId: $drugId, timestamp: $timestamp, dosageAmount: $dosageAmount, dosageUnit: $dosageUnit, administrationRoute: $administrationRoute, status: $status, injectionSite: $injectionSite, patchSite: $patchSite, patchCount: $patchCount, gelPumps: $gelPumps, skinReaction: $skinReaction, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationLogImpl &&
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

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationLogImplCopyWith<_$MedicationLogImpl> get copyWith =>
      __$$MedicationLogImplCopyWithImpl<_$MedicationLogImpl>(this, _$identity);
}

abstract class _MedicationLog implements MedicationLog {
  const factory _MedicationLog(
      {required final String id,
      required final String scheduleId,
      required final String drugId,
      required final DateTime timestamp,
      required final double dosageAmount,
      required final DosageUnit dosageUnit,
      required final AdministrationRoute administrationRoute,
      required final LogStatus status,
      final InjectionSite? injectionSite,
      final PatchSite? patchSite,
      final int? patchCount,
      final int? gelPumps,
      final SkinReaction? skinReaction,
      final String? notes}) = _$MedicationLogImpl;

  @override
  String get id;
  @override
  String get scheduleId;
  @override
  String get drugId;
  @override
  DateTime get timestamp;
  @override
  double get dosageAmount;
  @override
  DosageUnit get dosageUnit;
  @override
  AdministrationRoute get administrationRoute;
  @override
  LogStatus get status;
  @override
  InjectionSite? get injectionSite;
  @override
  PatchSite? get patchSite;
  @override
  int? get patchCount;
  @override
  int? get gelPumps;
  @override
  SkinReaction? get skinReaction;
  @override
  String? get notes;

  /// Create a copy of MedicationLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationLogImplCopyWith<_$MedicationLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
