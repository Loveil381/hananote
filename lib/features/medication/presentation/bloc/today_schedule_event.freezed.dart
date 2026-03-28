// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_schedule_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayScheduleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) load,
    required TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)
        logDose,
    required TResult Function(
            MedicationSchedule schedule, Drug drug, String? notes)
        skipDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? load,
    TResult? Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult? Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? load,
    TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodaySchedule value) load,
    required TResult Function(LogDoseTodaySchedule value) logDose,
    required TResult Function(SkipDoseTodaySchedule value) skipDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodaySchedule value)? load,
    TResult? Function(LogDoseTodaySchedule value)? logDose,
    TResult? Function(SkipDoseTodaySchedule value)? skipDose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodaySchedule value)? load,
    TResult Function(LogDoseTodaySchedule value)? logDose,
    TResult Function(SkipDoseTodaySchedule value)? skipDose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayScheduleEventCopyWith<$Res> {
  factory $TodayScheduleEventCopyWith(
          TodayScheduleEvent value, $Res Function(TodayScheduleEvent) then) =
      _$TodayScheduleEventCopyWithImpl<$Res, TodayScheduleEvent>;
}

/// @nodoc
class _$TodayScheduleEventCopyWithImpl<$Res, $Val extends TodayScheduleEvent>
    implements $TodayScheduleEventCopyWith<$Res> {
  _$TodayScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTodayScheduleImplCopyWith<$Res> {
  factory _$$LoadTodayScheduleImplCopyWith(_$LoadTodayScheduleImpl value,
          $Res Function(_$LoadTodayScheduleImpl) then) =
      __$$LoadTodayScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class __$$LoadTodayScheduleImplCopyWithImpl<$Res>
    extends _$TodayScheduleEventCopyWithImpl<$Res, _$LoadTodayScheduleImpl>
    implements _$$LoadTodayScheduleImplCopyWith<$Res> {
  __$$LoadTodayScheduleImplCopyWithImpl(_$LoadTodayScheduleImpl _value,
      $Res Function(_$LoadTodayScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$LoadTodayScheduleImpl(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$LoadTodayScheduleImpl implements LoadTodaySchedule {
  const _$LoadTodayScheduleImpl({this.date});

  @override
  final DateTime? date;

  @override
  String toString() {
    return 'TodayScheduleEvent.load(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTodayScheduleImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTodayScheduleImplCopyWith<_$LoadTodayScheduleImpl> get copyWith =>
      __$$LoadTodayScheduleImplCopyWithImpl<_$LoadTodayScheduleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) load,
    required TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)
        logDose,
    required TResult Function(
            MedicationSchedule schedule, Drug drug, String? notes)
        skipDose,
  }) {
    return load(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? load,
    TResult? Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult? Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
  }) {
    return load?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? load,
    TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodaySchedule value) load,
    required TResult Function(LogDoseTodaySchedule value) logDose,
    required TResult Function(SkipDoseTodaySchedule value) skipDose,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodaySchedule value)? load,
    TResult? Function(LogDoseTodaySchedule value)? logDose,
    TResult? Function(SkipDoseTodaySchedule value)? skipDose,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodaySchedule value)? load,
    TResult Function(LogDoseTodaySchedule value)? logDose,
    TResult Function(SkipDoseTodaySchedule value)? skipDose,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadTodaySchedule implements TodayScheduleEvent {
  const factory LoadTodaySchedule({final DateTime? date}) =
      _$LoadTodayScheduleImpl;

  DateTime? get date;

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTodayScheduleImplCopyWith<_$LoadTodayScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogDoseTodayScheduleImplCopyWith<$Res> {
  factory _$$LogDoseTodayScheduleImplCopyWith(_$LogDoseTodayScheduleImpl value,
          $Res Function(_$LogDoseTodayScheduleImpl) then) =
      __$$LogDoseTodayScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MedicationSchedule schedule,
      Drug drug,
      DateTime? scheduledDateTime,
      InjectionSite? injectionSite,
      PatchSite? patchSite,
      int? patchCount,
      int? gelPumps,
      SkinReaction? skinReaction,
      String? notes});

  $MedicationScheduleCopyWith<$Res> get schedule;
  $DrugCopyWith<$Res> get drug;
}

/// @nodoc
class __$$LogDoseTodayScheduleImplCopyWithImpl<$Res>
    extends _$TodayScheduleEventCopyWithImpl<$Res, _$LogDoseTodayScheduleImpl>
    implements _$$LogDoseTodayScheduleImplCopyWith<$Res> {
  __$$LogDoseTodayScheduleImplCopyWithImpl(_$LogDoseTodayScheduleImpl _value,
      $Res Function(_$LogDoseTodayScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? drug = null,
    Object? scheduledDateTime = freezed,
    Object? injectionSite = freezed,
    Object? patchSite = freezed,
    Object? patchCount = freezed,
    Object? gelPumps = freezed,
    Object? skinReaction = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$LogDoseTodayScheduleImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as MedicationSchedule,
      drug: null == drug
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as Drug,
      scheduledDateTime: freezed == scheduledDateTime
          ? _value.scheduledDateTime
          : scheduledDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MedicationScheduleCopyWith<$Res> get schedule {
    return $MedicationScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrugCopyWith<$Res> get drug {
    return $DrugCopyWith<$Res>(_value.drug, (value) {
      return _then(_value.copyWith(drug: value));
    });
  }
}

/// @nodoc

class _$LogDoseTodayScheduleImpl implements LogDoseTodaySchedule {
  const _$LogDoseTodayScheduleImpl(
      {required this.schedule,
      required this.drug,
      this.scheduledDateTime,
      this.injectionSite,
      this.patchSite,
      this.patchCount,
      this.gelPumps,
      this.skinReaction,
      this.notes});

  @override
  final MedicationSchedule schedule;
  @override
  final Drug drug;
  @override
  final DateTime? scheduledDateTime;
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
    return 'TodayScheduleEvent.logDose(schedule: $schedule, drug: $drug, scheduledDateTime: $scheduledDateTime, injectionSite: $injectionSite, patchSite: $patchSite, patchCount: $patchCount, gelPumps: $gelPumps, skinReaction: $skinReaction, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogDoseTodayScheduleImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.drug, drug) || other.drug == drug) &&
            (identical(other.scheduledDateTime, scheduledDateTime) ||
                other.scheduledDateTime == scheduledDateTime) &&
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
      schedule,
      drug,
      scheduledDateTime,
      injectionSite,
      patchSite,
      patchCount,
      gelPumps,
      skinReaction,
      notes);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogDoseTodayScheduleImplCopyWith<_$LogDoseTodayScheduleImpl>
      get copyWith =>
          __$$LogDoseTodayScheduleImplCopyWithImpl<_$LogDoseTodayScheduleImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) load,
    required TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)
        logDose,
    required TResult Function(
            MedicationSchedule schedule, Drug drug, String? notes)
        skipDose,
  }) {
    return logDose(schedule, drug, scheduledDateTime, injectionSite, patchSite,
        patchCount, gelPumps, skinReaction, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? load,
    TResult? Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult? Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
  }) {
    return logDose?.call(schedule, drug, scheduledDateTime, injectionSite,
        patchSite, patchCount, gelPumps, skinReaction, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? load,
    TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
    required TResult orElse(),
  }) {
    if (logDose != null) {
      return logDose(schedule, drug, scheduledDateTime, injectionSite,
          patchSite, patchCount, gelPumps, skinReaction, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodaySchedule value) load,
    required TResult Function(LogDoseTodaySchedule value) logDose,
    required TResult Function(SkipDoseTodaySchedule value) skipDose,
  }) {
    return logDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodaySchedule value)? load,
    TResult? Function(LogDoseTodaySchedule value)? logDose,
    TResult? Function(SkipDoseTodaySchedule value)? skipDose,
  }) {
    return logDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodaySchedule value)? load,
    TResult Function(LogDoseTodaySchedule value)? logDose,
    TResult Function(SkipDoseTodaySchedule value)? skipDose,
    required TResult orElse(),
  }) {
    if (logDose != null) {
      return logDose(this);
    }
    return orElse();
  }
}

abstract class LogDoseTodaySchedule implements TodayScheduleEvent {
  const factory LogDoseTodaySchedule(
      {required final MedicationSchedule schedule,
      required final Drug drug,
      final DateTime? scheduledDateTime,
      final InjectionSite? injectionSite,
      final PatchSite? patchSite,
      final int? patchCount,
      final int? gelPumps,
      final SkinReaction? skinReaction,
      final String? notes}) = _$LogDoseTodayScheduleImpl;

  MedicationSchedule get schedule;
  Drug get drug;
  DateTime? get scheduledDateTime;
  InjectionSite? get injectionSite;
  PatchSite? get patchSite;
  int? get patchCount;
  int? get gelPumps;
  SkinReaction? get skinReaction;
  String? get notes;

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogDoseTodayScheduleImplCopyWith<_$LogDoseTodayScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SkipDoseTodayScheduleImplCopyWith<$Res> {
  factory _$$SkipDoseTodayScheduleImplCopyWith(
          _$SkipDoseTodayScheduleImpl value,
          $Res Function(_$SkipDoseTodayScheduleImpl) then) =
      __$$SkipDoseTodayScheduleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MedicationSchedule schedule, Drug drug, String? notes});

  $MedicationScheduleCopyWith<$Res> get schedule;
  $DrugCopyWith<$Res> get drug;
}

/// @nodoc
class __$$SkipDoseTodayScheduleImplCopyWithImpl<$Res>
    extends _$TodayScheduleEventCopyWithImpl<$Res, _$SkipDoseTodayScheduleImpl>
    implements _$$SkipDoseTodayScheduleImplCopyWith<$Res> {
  __$$SkipDoseTodayScheduleImplCopyWithImpl(_$SkipDoseTodayScheduleImpl _value,
      $Res Function(_$SkipDoseTodayScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? drug = null,
    Object? notes = freezed,
  }) {
    return _then(_$SkipDoseTodayScheduleImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as MedicationSchedule,
      drug: null == drug
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as Drug,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MedicationScheduleCopyWith<$Res> get schedule {
    return $MedicationScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrugCopyWith<$Res> get drug {
    return $DrugCopyWith<$Res>(_value.drug, (value) {
      return _then(_value.copyWith(drug: value));
    });
  }
}

/// @nodoc

class _$SkipDoseTodayScheduleImpl implements SkipDoseTodaySchedule {
  const _$SkipDoseTodayScheduleImpl(
      {required this.schedule, required this.drug, this.notes});

  @override
  final MedicationSchedule schedule;
  @override
  final Drug drug;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TodayScheduleEvent.skipDose(schedule: $schedule, drug: $drug, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkipDoseTodayScheduleImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.drug, drug) || other.drug == drug) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule, drug, notes);

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SkipDoseTodayScheduleImplCopyWith<_$SkipDoseTodayScheduleImpl>
      get copyWith => __$$SkipDoseTodayScheduleImplCopyWithImpl<
          _$SkipDoseTodayScheduleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime? date) load,
    required TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)
        logDose,
    required TResult Function(
            MedicationSchedule schedule, Drug drug, String? notes)
        skipDose,
  }) {
    return skipDose(schedule, drug, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime? date)? load,
    TResult? Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult? Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
  }) {
    return skipDose?.call(schedule, drug, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime? date)? load,
    TResult Function(
            MedicationSchedule schedule,
            Drug drug,
            DateTime? scheduledDateTime,
            InjectionSite? injectionSite,
            PatchSite? patchSite,
            int? patchCount,
            int? gelPumps,
            SkinReaction? skinReaction,
            String? notes)?
        logDose,
    TResult Function(MedicationSchedule schedule, Drug drug, String? notes)?
        skipDose,
    required TResult orElse(),
  }) {
    if (skipDose != null) {
      return skipDose(schedule, drug, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTodaySchedule value) load,
    required TResult Function(LogDoseTodaySchedule value) logDose,
    required TResult Function(SkipDoseTodaySchedule value) skipDose,
  }) {
    return skipDose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTodaySchedule value)? load,
    TResult? Function(LogDoseTodaySchedule value)? logDose,
    TResult? Function(SkipDoseTodaySchedule value)? skipDose,
  }) {
    return skipDose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTodaySchedule value)? load,
    TResult Function(LogDoseTodaySchedule value)? logDose,
    TResult Function(SkipDoseTodaySchedule value)? skipDose,
    required TResult orElse(),
  }) {
    if (skipDose != null) {
      return skipDose(this);
    }
    return orElse();
  }
}

abstract class SkipDoseTodaySchedule implements TodayScheduleEvent {
  const factory SkipDoseTodaySchedule(
      {required final MedicationSchedule schedule,
      required final Drug drug,
      final String? notes}) = _$SkipDoseTodayScheduleImpl;

  MedicationSchedule get schedule;
  Drug get drug;
  String? get notes;

  /// Create a copy of TodayScheduleEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SkipDoseTodayScheduleImplCopyWith<_$SkipDoseTodayScheduleImpl>
      get copyWith => throw _privateConstructorUsedError;
}
