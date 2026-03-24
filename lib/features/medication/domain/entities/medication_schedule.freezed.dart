// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeOfDay {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeOfDayCopyWith<TimeOfDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeOfDayCopyWith<$Res> {
  factory $TimeOfDayCopyWith(TimeOfDay value, $Res Function(TimeOfDay) then) =
      _$TimeOfDayCopyWithImpl<$Res, TimeOfDay>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$TimeOfDayCopyWithImpl<$Res, $Val extends TimeOfDay>
    implements $TimeOfDayCopyWith<$Res> {
  _$TimeOfDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeOfDayImplCopyWith<$Res>
    implements $TimeOfDayCopyWith<$Res> {
  factory _$$TimeOfDayImplCopyWith(
          _$TimeOfDayImpl value, $Res Function(_$TimeOfDayImpl) then) =
      __$$TimeOfDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$TimeOfDayImplCopyWithImpl<$Res>
    extends _$TimeOfDayCopyWithImpl<$Res, _$TimeOfDayImpl>
    implements _$$TimeOfDayImplCopyWith<$Res> {
  __$$TimeOfDayImplCopyWithImpl(
      _$TimeOfDayImpl _value, $Res Function(_$TimeOfDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$TimeOfDayImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimeOfDayImpl implements _TimeOfDay {
  const _$TimeOfDayImpl({required this.hour, required this.minute})
      : assert(hour >= 0 && hour < 24, 'hour must be between 0 and 23'),
        assert(minute >= 0 && minute < 60, 'minute must be between 0 and 59');

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'TimeOfDay(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOfDayImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOfDayImplCopyWith<_$TimeOfDayImpl> get copyWith =>
      __$$TimeOfDayImplCopyWithImpl<_$TimeOfDayImpl>(this, _$identity);
}

abstract class _TimeOfDay implements TimeOfDay {
  const factory _TimeOfDay(
      {required final int hour, required final int minute}) = _$TimeOfDayImpl;

  @override
  int get hour;
  @override
  int get minute;

  /// Create a copy of TimeOfDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeOfDayImplCopyWith<_$TimeOfDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MedicationFrequency {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int timesPerDay) daily,
    required TResult Function(int days) everyNDays,
    required TResult Function(int dayOfWeek) weekly,
    required TResult Function(String description) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int timesPerDay)? daily,
    TResult? Function(int days)? everyNDays,
    TResult? Function(int dayOfWeek)? weekly,
    TResult? Function(String description)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int timesPerDay)? daily,
    TResult Function(int days)? everyNDays,
    TResult Function(int dayOfWeek)? weekly,
    TResult Function(String description)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyMedicationFrequency value) daily,
    required TResult Function(EveryNDaysMedicationFrequency value) everyNDays,
    required TResult Function(WeeklyMedicationFrequency value) weekly,
    required TResult Function(CustomMedicationFrequency value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyMedicationFrequency value)? daily,
    TResult? Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult? Function(WeeklyMedicationFrequency value)? weekly,
    TResult? Function(CustomMedicationFrequency value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyMedicationFrequency value)? daily,
    TResult Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult Function(WeeklyMedicationFrequency value)? weekly,
    TResult Function(CustomMedicationFrequency value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationFrequencyCopyWith<$Res> {
  factory $MedicationFrequencyCopyWith(
          MedicationFrequency value, $Res Function(MedicationFrequency) then) =
      _$MedicationFrequencyCopyWithImpl<$Res, MedicationFrequency>;
}

/// @nodoc
class _$MedicationFrequencyCopyWithImpl<$Res, $Val extends MedicationFrequency>
    implements $MedicationFrequencyCopyWith<$Res> {
  _$MedicationFrequencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DailyMedicationFrequencyImplCopyWith<$Res> {
  factory _$$DailyMedicationFrequencyImplCopyWith(
          _$DailyMedicationFrequencyImpl value,
          $Res Function(_$DailyMedicationFrequencyImpl) then) =
      __$$DailyMedicationFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int timesPerDay});
}

/// @nodoc
class __$$DailyMedicationFrequencyImplCopyWithImpl<$Res>
    extends _$MedicationFrequencyCopyWithImpl<$Res,
        _$DailyMedicationFrequencyImpl>
    implements _$$DailyMedicationFrequencyImplCopyWith<$Res> {
  __$$DailyMedicationFrequencyImplCopyWithImpl(
      _$DailyMedicationFrequencyImpl _value,
      $Res Function(_$DailyMedicationFrequencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timesPerDay = null,
  }) {
    return _then(_$DailyMedicationFrequencyImpl(
      timesPerDay: null == timesPerDay
          ? _value.timesPerDay
          : timesPerDay // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DailyMedicationFrequencyImpl implements DailyMedicationFrequency {
  const _$DailyMedicationFrequencyImpl({required this.timesPerDay})
      : assert(timesPerDay > 0, 'timesPerDay must be positive');

  @override
  final int timesPerDay;

  @override
  String toString() {
    return 'MedicationFrequency.daily(timesPerDay: $timesPerDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMedicationFrequencyImpl &&
            (identical(other.timesPerDay, timesPerDay) ||
                other.timesPerDay == timesPerDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timesPerDay);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMedicationFrequencyImplCopyWith<_$DailyMedicationFrequencyImpl>
      get copyWith => __$$DailyMedicationFrequencyImplCopyWithImpl<
          _$DailyMedicationFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int timesPerDay) daily,
    required TResult Function(int days) everyNDays,
    required TResult Function(int dayOfWeek) weekly,
    required TResult Function(String description) custom,
  }) {
    return daily(timesPerDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int timesPerDay)? daily,
    TResult? Function(int days)? everyNDays,
    TResult? Function(int dayOfWeek)? weekly,
    TResult? Function(String description)? custom,
  }) {
    return daily?.call(timesPerDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int timesPerDay)? daily,
    TResult Function(int days)? everyNDays,
    TResult Function(int dayOfWeek)? weekly,
    TResult Function(String description)? custom,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily(timesPerDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyMedicationFrequency value) daily,
    required TResult Function(EveryNDaysMedicationFrequency value) everyNDays,
    required TResult Function(WeeklyMedicationFrequency value) weekly,
    required TResult Function(CustomMedicationFrequency value) custom,
  }) {
    return daily(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyMedicationFrequency value)? daily,
    TResult? Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult? Function(WeeklyMedicationFrequency value)? weekly,
    TResult? Function(CustomMedicationFrequency value)? custom,
  }) {
    return daily?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyMedicationFrequency value)? daily,
    TResult Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult Function(WeeklyMedicationFrequency value)? weekly,
    TResult Function(CustomMedicationFrequency value)? custom,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily(this);
    }
    return orElse();
  }
}

abstract class DailyMedicationFrequency implements MedicationFrequency {
  const factory DailyMedicationFrequency({required final int timesPerDay}) =
      _$DailyMedicationFrequencyImpl;

  int get timesPerDay;

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMedicationFrequencyImplCopyWith<_$DailyMedicationFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EveryNDaysMedicationFrequencyImplCopyWith<$Res> {
  factory _$$EveryNDaysMedicationFrequencyImplCopyWith(
          _$EveryNDaysMedicationFrequencyImpl value,
          $Res Function(_$EveryNDaysMedicationFrequencyImpl) then) =
      __$$EveryNDaysMedicationFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int days});
}

/// @nodoc
class __$$EveryNDaysMedicationFrequencyImplCopyWithImpl<$Res>
    extends _$MedicationFrequencyCopyWithImpl<$Res,
        _$EveryNDaysMedicationFrequencyImpl>
    implements _$$EveryNDaysMedicationFrequencyImplCopyWith<$Res> {
  __$$EveryNDaysMedicationFrequencyImplCopyWithImpl(
      _$EveryNDaysMedicationFrequencyImpl _value,
      $Res Function(_$EveryNDaysMedicationFrequencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$EveryNDaysMedicationFrequencyImpl(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EveryNDaysMedicationFrequencyImpl
    implements EveryNDaysMedicationFrequency {
  const _$EveryNDaysMedicationFrequencyImpl({required this.days})
      : assert(days > 0, 'days must be positive');

  @override
  final int days;

  @override
  String toString() {
    return 'MedicationFrequency.everyNDays(days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EveryNDaysMedicationFrequencyImpl &&
            (identical(other.days, days) || other.days == days));
  }

  @override
  int get hashCode => Object.hash(runtimeType, days);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EveryNDaysMedicationFrequencyImplCopyWith<
          _$EveryNDaysMedicationFrequencyImpl>
      get copyWith => __$$EveryNDaysMedicationFrequencyImplCopyWithImpl<
          _$EveryNDaysMedicationFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int timesPerDay) daily,
    required TResult Function(int days) everyNDays,
    required TResult Function(int dayOfWeek) weekly,
    required TResult Function(String description) custom,
  }) {
    return everyNDays(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int timesPerDay)? daily,
    TResult? Function(int days)? everyNDays,
    TResult? Function(int dayOfWeek)? weekly,
    TResult? Function(String description)? custom,
  }) {
    return everyNDays?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int timesPerDay)? daily,
    TResult Function(int days)? everyNDays,
    TResult Function(int dayOfWeek)? weekly,
    TResult Function(String description)? custom,
    required TResult orElse(),
  }) {
    if (everyNDays != null) {
      return everyNDays(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyMedicationFrequency value) daily,
    required TResult Function(EveryNDaysMedicationFrequency value) everyNDays,
    required TResult Function(WeeklyMedicationFrequency value) weekly,
    required TResult Function(CustomMedicationFrequency value) custom,
  }) {
    return everyNDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyMedicationFrequency value)? daily,
    TResult? Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult? Function(WeeklyMedicationFrequency value)? weekly,
    TResult? Function(CustomMedicationFrequency value)? custom,
  }) {
    return everyNDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyMedicationFrequency value)? daily,
    TResult Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult Function(WeeklyMedicationFrequency value)? weekly,
    TResult Function(CustomMedicationFrequency value)? custom,
    required TResult orElse(),
  }) {
    if (everyNDays != null) {
      return everyNDays(this);
    }
    return orElse();
  }
}

abstract class EveryNDaysMedicationFrequency implements MedicationFrequency {
  const factory EveryNDaysMedicationFrequency({required final int days}) =
      _$EveryNDaysMedicationFrequencyImpl;

  int get days;

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EveryNDaysMedicationFrequencyImplCopyWith<
          _$EveryNDaysMedicationFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeeklyMedicationFrequencyImplCopyWith<$Res> {
  factory _$$WeeklyMedicationFrequencyImplCopyWith(
          _$WeeklyMedicationFrequencyImpl value,
          $Res Function(_$WeeklyMedicationFrequencyImpl) then) =
      __$$WeeklyMedicationFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int dayOfWeek});
}

/// @nodoc
class __$$WeeklyMedicationFrequencyImplCopyWithImpl<$Res>
    extends _$MedicationFrequencyCopyWithImpl<$Res,
        _$WeeklyMedicationFrequencyImpl>
    implements _$$WeeklyMedicationFrequencyImplCopyWith<$Res> {
  __$$WeeklyMedicationFrequencyImplCopyWithImpl(
      _$WeeklyMedicationFrequencyImpl _value,
      $Res Function(_$WeeklyMedicationFrequencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeek = null,
  }) {
    return _then(_$WeeklyMedicationFrequencyImpl(
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WeeklyMedicationFrequencyImpl implements WeeklyMedicationFrequency {
  const _$WeeklyMedicationFrequencyImpl({required this.dayOfWeek})
      : assert(dayOfWeek >= DateTime.monday && dayOfWeek <= DateTime.sunday,
            'dayOfWeek must be between 1 and 7');

  @override
  final int dayOfWeek;

  @override
  String toString() {
    return 'MedicationFrequency.weekly(dayOfWeek: $dayOfWeek)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyMedicationFrequencyImpl &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeek);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyMedicationFrequencyImplCopyWith<_$WeeklyMedicationFrequencyImpl>
      get copyWith => __$$WeeklyMedicationFrequencyImplCopyWithImpl<
          _$WeeklyMedicationFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int timesPerDay) daily,
    required TResult Function(int days) everyNDays,
    required TResult Function(int dayOfWeek) weekly,
    required TResult Function(String description) custom,
  }) {
    return weekly(dayOfWeek);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int timesPerDay)? daily,
    TResult? Function(int days)? everyNDays,
    TResult? Function(int dayOfWeek)? weekly,
    TResult? Function(String description)? custom,
  }) {
    return weekly?.call(dayOfWeek);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int timesPerDay)? daily,
    TResult Function(int days)? everyNDays,
    TResult Function(int dayOfWeek)? weekly,
    TResult Function(String description)? custom,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(dayOfWeek);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyMedicationFrequency value) daily,
    required TResult Function(EveryNDaysMedicationFrequency value) everyNDays,
    required TResult Function(WeeklyMedicationFrequency value) weekly,
    required TResult Function(CustomMedicationFrequency value) custom,
  }) {
    return weekly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyMedicationFrequency value)? daily,
    TResult? Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult? Function(WeeklyMedicationFrequency value)? weekly,
    TResult? Function(CustomMedicationFrequency value)? custom,
  }) {
    return weekly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyMedicationFrequency value)? daily,
    TResult Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult Function(WeeklyMedicationFrequency value)? weekly,
    TResult Function(CustomMedicationFrequency value)? custom,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(this);
    }
    return orElse();
  }
}

abstract class WeeklyMedicationFrequency implements MedicationFrequency {
  const factory WeeklyMedicationFrequency({required final int dayOfWeek}) =
      _$WeeklyMedicationFrequencyImpl;

  int get dayOfWeek;

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyMedicationFrequencyImplCopyWith<_$WeeklyMedicationFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomMedicationFrequencyImplCopyWith<$Res> {
  factory _$$CustomMedicationFrequencyImplCopyWith(
          _$CustomMedicationFrequencyImpl value,
          $Res Function(_$CustomMedicationFrequencyImpl) then) =
      __$$CustomMedicationFrequencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$CustomMedicationFrequencyImplCopyWithImpl<$Res>
    extends _$MedicationFrequencyCopyWithImpl<$Res,
        _$CustomMedicationFrequencyImpl>
    implements _$$CustomMedicationFrequencyImplCopyWith<$Res> {
  __$$CustomMedicationFrequencyImplCopyWithImpl(
      _$CustomMedicationFrequencyImpl _value,
      $Res Function(_$CustomMedicationFrequencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$CustomMedicationFrequencyImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomMedicationFrequencyImpl implements CustomMedicationFrequency {
  const _$CustomMedicationFrequencyImpl({required this.description});

  @override
  final String description;

  @override
  String toString() {
    return 'MedicationFrequency.custom(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomMedicationFrequencyImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomMedicationFrequencyImplCopyWith<_$CustomMedicationFrequencyImpl>
      get copyWith => __$$CustomMedicationFrequencyImplCopyWithImpl<
          _$CustomMedicationFrequencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int timesPerDay) daily,
    required TResult Function(int days) everyNDays,
    required TResult Function(int dayOfWeek) weekly,
    required TResult Function(String description) custom,
  }) {
    return custom(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int timesPerDay)? daily,
    TResult? Function(int days)? everyNDays,
    TResult? Function(int dayOfWeek)? weekly,
    TResult? Function(String description)? custom,
  }) {
    return custom?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int timesPerDay)? daily,
    TResult Function(int days)? everyNDays,
    TResult Function(int dayOfWeek)? weekly,
    TResult Function(String description)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyMedicationFrequency value) daily,
    required TResult Function(EveryNDaysMedicationFrequency value) everyNDays,
    required TResult Function(WeeklyMedicationFrequency value) weekly,
    required TResult Function(CustomMedicationFrequency value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DailyMedicationFrequency value)? daily,
    TResult? Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult? Function(WeeklyMedicationFrequency value)? weekly,
    TResult? Function(CustomMedicationFrequency value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyMedicationFrequency value)? daily,
    TResult Function(EveryNDaysMedicationFrequency value)? everyNDays,
    TResult Function(WeeklyMedicationFrequency value)? weekly,
    TResult Function(CustomMedicationFrequency value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }
}

abstract class CustomMedicationFrequency implements MedicationFrequency {
  const factory CustomMedicationFrequency({required final String description}) =
      _$CustomMedicationFrequencyImpl;

  String get description;

  /// Create a copy of MedicationFrequency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomMedicationFrequencyImplCopyWith<_$CustomMedicationFrequencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MedicationSchedule {
  String get id => throw _privateConstructorUsedError;
  String get drugId => throw _privateConstructorUsedError;
  double get dosageAmount => throw _privateConstructorUsedError;
  DosageUnit get dosageUnit => throw _privateConstructorUsedError;
  MedicationFrequency get frequency => throw _privateConstructorUsedError;
  AdministrationRoute get administrationRoute =>
      throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<TimeOfDay> get scheduleTimes => throw _privateConstructorUsedError;
  int? get intervalDays => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicationScheduleCopyWith<MedicationSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationScheduleCopyWith<$Res> {
  factory $MedicationScheduleCopyWith(
          MedicationSchedule value, $Res Function(MedicationSchedule) then) =
      _$MedicationScheduleCopyWithImpl<$Res, MedicationSchedule>;
  @useResult
  $Res call(
      {String id,
      String drugId,
      double dosageAmount,
      DosageUnit dosageUnit,
      MedicationFrequency frequency,
      AdministrationRoute administrationRoute,
      DateTime startDate,
      bool isActive,
      List<TimeOfDay> scheduleTimes,
      int? intervalDays,
      DateTime? endDate,
      String? notes});

  $MedicationFrequencyCopyWith<$Res> get frequency;
}

/// @nodoc
class _$MedicationScheduleCopyWithImpl<$Res, $Val extends MedicationSchedule>
    implements $MedicationScheduleCopyWith<$Res> {
  _$MedicationScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? frequency = null,
    Object? administrationRoute = null,
    Object? startDate = null,
    Object? isActive = null,
    Object? scheduleTimes = null,
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
              as DosageUnit,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as MedicationFrequency,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleTimes: null == scheduleTimes
          ? _value.scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      intervalDays: freezed == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MedicationFrequencyCopyWith<$Res> get frequency {
    return $MedicationFrequencyCopyWith<$Res>(_value.frequency, (value) {
      return _then(_value.copyWith(frequency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MedicationScheduleImplCopyWith<$Res>
    implements $MedicationScheduleCopyWith<$Res> {
  factory _$$MedicationScheduleImplCopyWith(_$MedicationScheduleImpl value,
          $Res Function(_$MedicationScheduleImpl) then) =
      __$$MedicationScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String drugId,
      double dosageAmount,
      DosageUnit dosageUnit,
      MedicationFrequency frequency,
      AdministrationRoute administrationRoute,
      DateTime startDate,
      bool isActive,
      List<TimeOfDay> scheduleTimes,
      int? intervalDays,
      DateTime? endDate,
      String? notes});

  @override
  $MedicationFrequencyCopyWith<$Res> get frequency;
}

/// @nodoc
class __$$MedicationScheduleImplCopyWithImpl<$Res>
    extends _$MedicationScheduleCopyWithImpl<$Res, _$MedicationScheduleImpl>
    implements _$$MedicationScheduleImplCopyWith<$Res> {
  __$$MedicationScheduleImplCopyWithImpl(_$MedicationScheduleImpl _value,
      $Res Function(_$MedicationScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? dosageAmount = null,
    Object? dosageUnit = null,
    Object? frequency = null,
    Object? administrationRoute = null,
    Object? startDate = null,
    Object? isActive = null,
    Object? scheduleTimes = null,
    Object? intervalDays = freezed,
    Object? endDate = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$MedicationScheduleImpl(
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
              as DosageUnit,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as MedicationFrequency,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      scheduleTimes: null == scheduleTimes
          ? _value._scheduleTimes
          : scheduleTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDay>,
      intervalDays: freezed == intervalDays
          ? _value.intervalDays
          : intervalDays // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MedicationScheduleImpl implements _MedicationSchedule {
  const _$MedicationScheduleImpl(
      {required this.id,
      required this.drugId,
      required this.dosageAmount,
      required this.dosageUnit,
      required this.frequency,
      required this.administrationRoute,
      required this.startDate,
      required this.isActive,
      final List<TimeOfDay> scheduleTimes = const <TimeOfDay>[],
      this.intervalDays,
      this.endDate,
      this.notes})
      : assert(dosageAmount > 0, 'dosageAmount must be positive'),
        _scheduleTimes = scheduleTimes;

  @override
  final String id;
  @override
  final String drugId;
  @override
  final double dosageAmount;
  @override
  final DosageUnit dosageUnit;
  @override
  final MedicationFrequency frequency;
  @override
  final AdministrationRoute administrationRoute;
  @override
  final DateTime startDate;
  @override
  final bool isActive;
  final List<TimeOfDay> _scheduleTimes;
  @override
  @JsonKey()
  List<TimeOfDay> get scheduleTimes {
    if (_scheduleTimes is EqualUnmodifiableListView) return _scheduleTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleTimes);
  }

  @override
  final int? intervalDays;
  @override
  final DateTime? endDate;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MedicationSchedule(id: $id, drugId: $drugId, dosageAmount: $dosageAmount, dosageUnit: $dosageUnit, frequency: $frequency, administrationRoute: $administrationRoute, startDate: $startDate, isActive: $isActive, scheduleTimes: $scheduleTimes, intervalDays: $intervalDays, endDate: $endDate, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drugId, drugId) || other.drugId == drugId) &&
            (identical(other.dosageAmount, dosageAmount) ||
                other.dosageAmount == dosageAmount) &&
            (identical(other.dosageUnit, dosageUnit) ||
                other.dosageUnit == dosageUnit) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.administrationRoute, administrationRoute) ||
                other.administrationRoute == administrationRoute) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._scheduleTimes, _scheduleTimes) &&
            (identical(other.intervalDays, intervalDays) ||
                other.intervalDays == intervalDays) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      drugId,
      dosageAmount,
      dosageUnit,
      frequency,
      administrationRoute,
      startDate,
      isActive,
      const DeepCollectionEquality().hash(_scheduleTimes),
      intervalDays,
      endDate,
      notes);

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationScheduleImplCopyWith<_$MedicationScheduleImpl> get copyWith =>
      __$$MedicationScheduleImplCopyWithImpl<_$MedicationScheduleImpl>(
          this, _$identity);
}

abstract class _MedicationSchedule implements MedicationSchedule {
  const factory _MedicationSchedule(
      {required final String id,
      required final String drugId,
      required final double dosageAmount,
      required final DosageUnit dosageUnit,
      required final MedicationFrequency frequency,
      required final AdministrationRoute administrationRoute,
      required final DateTime startDate,
      required final bool isActive,
      final List<TimeOfDay> scheduleTimes,
      final int? intervalDays,
      final DateTime? endDate,
      final String? notes}) = _$MedicationScheduleImpl;

  @override
  String get id;
  @override
  String get drugId;
  @override
  double get dosageAmount;
  @override
  DosageUnit get dosageUnit;
  @override
  MedicationFrequency get frequency;
  @override
  AdministrationRoute get administrationRoute;
  @override
  DateTime get startDate;
  @override
  bool get isActive;
  @override
  List<TimeOfDay> get scheduleTimes;
  @override
  int? get intervalDays;
  @override
  DateTime? get endDate;
  @override
  String? get notes;

  /// Create a copy of MedicationSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicationScheduleImplCopyWith<_$MedicationScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
