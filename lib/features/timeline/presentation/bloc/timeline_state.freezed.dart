// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimelineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimelineEvent> events,
            TimelineRange selectedRange, DateTime? hrtStartDate)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimelineInitial value) initial,
    required TResult Function(TimelineLoading value) loading,
    required TResult Function(TimelineLoaded value) loaded,
    required TResult Function(TimelineError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimelineInitial value)? initial,
    TResult? Function(TimelineLoading value)? loading,
    TResult? Function(TimelineLoaded value)? loaded,
    TResult? Function(TimelineError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimelineInitial value)? initial,
    TResult Function(TimelineLoading value)? loading,
    TResult Function(TimelineLoaded value)? loaded,
    TResult Function(TimelineError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res, TimelineState>;
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res, $Val extends TimelineState>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TimelineInitialImplCopyWith<$Res> {
  factory _$$TimelineInitialImplCopyWith(_$TimelineInitialImpl value,
          $Res Function(_$TimelineInitialImpl) then) =
      __$$TimelineInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimelineInitialImplCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$TimelineInitialImpl>
    implements _$$TimelineInitialImplCopyWith<$Res> {
  __$$TimelineInitialImplCopyWithImpl(
      _$TimelineInitialImpl _value, $Res Function(_$TimelineInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimelineInitialImpl implements TimelineInitial {
  const _$TimelineInitialImpl();

  @override
  String toString() {
    return 'TimelineState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimelineInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimelineEvent> events,
            TimelineRange selectedRange, DateTime? hrtStartDate)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimelineInitial value) initial,
    required TResult Function(TimelineLoading value) loading,
    required TResult Function(TimelineLoaded value) loaded,
    required TResult Function(TimelineError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimelineInitial value)? initial,
    TResult? Function(TimelineLoading value)? loading,
    TResult? Function(TimelineLoaded value)? loaded,
    TResult? Function(TimelineError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimelineInitial value)? initial,
    TResult Function(TimelineLoading value)? loading,
    TResult Function(TimelineLoaded value)? loaded,
    TResult Function(TimelineError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TimelineInitial implements TimelineState {
  const factory TimelineInitial() = _$TimelineInitialImpl;
}

/// @nodoc
abstract class _$$TimelineLoadingImplCopyWith<$Res> {
  factory _$$TimelineLoadingImplCopyWith(_$TimelineLoadingImpl value,
          $Res Function(_$TimelineLoadingImpl) then) =
      __$$TimelineLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimelineLoadingImplCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$TimelineLoadingImpl>
    implements _$$TimelineLoadingImplCopyWith<$Res> {
  __$$TimelineLoadingImplCopyWithImpl(
      _$TimelineLoadingImpl _value, $Res Function(_$TimelineLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimelineLoadingImpl implements TimelineLoading {
  const _$TimelineLoadingImpl();

  @override
  String toString() {
    return 'TimelineState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimelineLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimelineEvent> events,
            TimelineRange selectedRange, DateTime? hrtStartDate)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimelineInitial value) initial,
    required TResult Function(TimelineLoading value) loading,
    required TResult Function(TimelineLoaded value) loaded,
    required TResult Function(TimelineError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimelineInitial value)? initial,
    TResult? Function(TimelineLoading value)? loading,
    TResult? Function(TimelineLoaded value)? loaded,
    TResult? Function(TimelineError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimelineInitial value)? initial,
    TResult Function(TimelineLoading value)? loading,
    TResult Function(TimelineLoaded value)? loaded,
    TResult Function(TimelineError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TimelineLoading implements TimelineState {
  const factory TimelineLoading() = _$TimelineLoadingImpl;
}

/// @nodoc
abstract class _$$TimelineLoadedImplCopyWith<$Res> {
  factory _$$TimelineLoadedImplCopyWith(_$TimelineLoadedImpl value,
          $Res Function(_$TimelineLoadedImpl) then) =
      __$$TimelineLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<TimelineEvent> events,
      TimelineRange selectedRange,
      DateTime? hrtStartDate});
}

/// @nodoc
class __$$TimelineLoadedImplCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$TimelineLoadedImpl>
    implements _$$TimelineLoadedImplCopyWith<$Res> {
  __$$TimelineLoadedImplCopyWithImpl(
      _$TimelineLoadedImpl _value, $Res Function(_$TimelineLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? selectedRange = null,
    Object? hrtStartDate = freezed,
  }) {
    return _then(_$TimelineLoadedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<TimelineEvent>,
      selectedRange: null == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as TimelineRange,
      hrtStartDate: freezed == hrtStartDate
          ? _value.hrtStartDate
          : hrtStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TimelineLoadedImpl implements TimelineLoaded {
  const _$TimelineLoadedImpl(
      {required final List<TimelineEvent> events,
      required this.selectedRange,
      required this.hrtStartDate})
      : _events = events;

  final List<TimelineEvent> _events;
  @override
  List<TimelineEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final TimelineRange selectedRange;
  @override
  final DateTime? hrtStartDate;

  @override
  String toString() {
    return 'TimelineState.loaded(events: $events, selectedRange: $selectedRange, hrtStartDate: $hrtStartDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineLoadedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.hrtStartDate, hrtStartDate) ||
                other.hrtStartDate == hrtStartDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      selectedRange,
      hrtStartDate);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineLoadedImplCopyWith<_$TimelineLoadedImpl> get copyWith =>
      __$$TimelineLoadedImplCopyWithImpl<_$TimelineLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimelineEvent> events,
            TimelineRange selectedRange, DateTime? hrtStartDate)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(events, selectedRange, hrtStartDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(events, selectedRange, hrtStartDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(events, selectedRange, hrtStartDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimelineInitial value) initial,
    required TResult Function(TimelineLoading value) loading,
    required TResult Function(TimelineLoaded value) loaded,
    required TResult Function(TimelineError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimelineInitial value)? initial,
    TResult? Function(TimelineLoading value)? loading,
    TResult? Function(TimelineLoaded value)? loaded,
    TResult? Function(TimelineError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimelineInitial value)? initial,
    TResult Function(TimelineLoading value)? loading,
    TResult Function(TimelineLoaded value)? loaded,
    TResult Function(TimelineError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TimelineLoaded implements TimelineState {
  const factory TimelineLoaded(
      {required final List<TimelineEvent> events,
      required final TimelineRange selectedRange,
      required final DateTime? hrtStartDate}) = _$TimelineLoadedImpl;

  List<TimelineEvent> get events;
  TimelineRange get selectedRange;
  DateTime? get hrtStartDate;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineLoadedImplCopyWith<_$TimelineLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimelineErrorImplCopyWith<$Res> {
  factory _$$TimelineErrorImplCopyWith(
          _$TimelineErrorImpl value, $Res Function(_$TimelineErrorImpl) then) =
      __$$TimelineErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimelineErrorImplCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res, _$TimelineErrorImpl>
    implements _$$TimelineErrorImplCopyWith<$Res> {
  __$$TimelineErrorImplCopyWithImpl(
      _$TimelineErrorImpl _value, $Res Function(_$TimelineErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimelineErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimelineErrorImpl implements TimelineError {
  const _$TimelineErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TimelineState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineErrorImplCopyWith<_$TimelineErrorImpl> get copyWith =>
      __$$TimelineErrorImplCopyWithImpl<_$TimelineErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimelineEvent> events,
            TimelineRange selectedRange, DateTime? hrtStartDate)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimelineEvent> events, TimelineRange selectedRange,
            DateTime? hrtStartDate)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimelineInitial value) initial,
    required TResult Function(TimelineLoading value) loading,
    required TResult Function(TimelineLoaded value) loaded,
    required TResult Function(TimelineError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimelineInitial value)? initial,
    TResult? Function(TimelineLoading value)? loading,
    TResult? Function(TimelineLoaded value)? loaded,
    TResult? Function(TimelineError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimelineInitial value)? initial,
    TResult Function(TimelineLoading value)? loading,
    TResult Function(TimelineLoaded value)? loaded,
    TResult Function(TimelineError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TimelineError implements TimelineState {
  const factory TimelineError(final String message) = _$TimelineErrorImpl;

  String get message;

  /// Create a copy of TimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineErrorImplCopyWith<_$TimelineErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
