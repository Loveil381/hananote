// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimelineBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTimeline,
    required TResult Function(TimelineFilterRange range) filterTimelineEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineFilterRange range)? filterTimelineEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineFilterRange range)? filterTimelineEvents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimeline value) loadTimeline,
    required TResult Function(FilterTimelineEvents value) filterTimelineEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(FilterTimelineEvents value)? filterTimelineEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(FilterTimelineEvents value)? filterTimelineEvents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineBlocEventCopyWith<$Res> {
  factory $TimelineBlocEventCopyWith(
          TimelineBlocEvent value, $Res Function(TimelineBlocEvent) then) =
      _$TimelineBlocEventCopyWithImpl<$Res, TimelineBlocEvent>;
}

/// @nodoc
class _$TimelineBlocEventCopyWithImpl<$Res, $Val extends TimelineBlocEvent>
    implements $TimelineBlocEventCopyWith<$Res> {
  _$TimelineBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadTimelineImplCopyWith<$Res> {
  factory _$$LoadTimelineImplCopyWith(
          _$LoadTimelineImpl value, $Res Function(_$LoadTimelineImpl) then) =
      __$$LoadTimelineImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadTimelineImplCopyWithImpl<$Res>
    extends _$TimelineBlocEventCopyWithImpl<$Res, _$LoadTimelineImpl>
    implements _$$LoadTimelineImplCopyWith<$Res> {
  __$$LoadTimelineImplCopyWithImpl(
      _$LoadTimelineImpl _value, $Res Function(_$LoadTimelineImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadTimelineImpl implements LoadTimeline {
  const _$LoadTimelineImpl();

  @override
  String toString() {
    return 'TimelineBlocEvent.loadTimeline()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadTimelineImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTimeline,
    required TResult Function(TimelineFilterRange range) filterTimelineEvents,
  }) {
    return loadTimeline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineFilterRange range)? filterTimelineEvents,
  }) {
    return loadTimeline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineFilterRange range)? filterTimelineEvents,
    required TResult orElse(),
  }) {
    if (loadTimeline != null) {
      return loadTimeline();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimeline value) loadTimeline,
    required TResult Function(FilterTimelineEvents value) filterTimelineEvents,
  }) {
    return loadTimeline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(FilterTimelineEvents value)? filterTimelineEvents,
  }) {
    return loadTimeline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(FilterTimelineEvents value)? filterTimelineEvents,
    required TResult orElse(),
  }) {
    if (loadTimeline != null) {
      return loadTimeline(this);
    }
    return orElse();
  }
}

abstract class LoadTimeline implements TimelineBlocEvent {
  const factory LoadTimeline() = _$LoadTimelineImpl;
}

/// @nodoc
abstract class _$$FilterTimelineEventsImplCopyWith<$Res> {
  factory _$$FilterTimelineEventsImplCopyWith(_$FilterTimelineEventsImpl value,
          $Res Function(_$FilterTimelineEventsImpl) then) =
      __$$FilterTimelineEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimelineFilterRange range});
}

/// @nodoc
class __$$FilterTimelineEventsImplCopyWithImpl<$Res>
    extends _$TimelineBlocEventCopyWithImpl<$Res, _$FilterTimelineEventsImpl>
    implements _$$FilterTimelineEventsImplCopyWith<$Res> {
  __$$FilterTimelineEventsImplCopyWithImpl(_$FilterTimelineEventsImpl _value,
      $Res Function(_$FilterTimelineEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$FilterTimelineEventsImpl(
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as TimelineFilterRange,
    ));
  }
}

/// @nodoc

class _$FilterTimelineEventsImpl implements FilterTimelineEvents {
  const _$FilterTimelineEventsImpl({required this.range});

  @override
  final TimelineFilterRange range;

  @override
  String toString() {
    return 'TimelineBlocEvent.filterTimelineEvents(range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTimelineEventsImpl &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTimelineEventsImplCopyWith<_$FilterTimelineEventsImpl>
      get copyWith =>
          __$$FilterTimelineEventsImplCopyWithImpl<_$FilterTimelineEventsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTimeline,
    required TResult Function(TimelineFilterRange range) filterTimelineEvents,
  }) {
    return filterTimelineEvents(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineFilterRange range)? filterTimelineEvents,
  }) {
    return filterTimelineEvents?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineFilterRange range)? filterTimelineEvents,
    required TResult orElse(),
  }) {
    if (filterTimelineEvents != null) {
      return filterTimelineEvents(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimeline value) loadTimeline,
    required TResult Function(FilterTimelineEvents value) filterTimelineEvents,
  }) {
    return filterTimelineEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(FilterTimelineEvents value)? filterTimelineEvents,
  }) {
    return filterTimelineEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(FilterTimelineEvents value)? filterTimelineEvents,
    required TResult orElse(),
  }) {
    if (filterTimelineEvents != null) {
      return filterTimelineEvents(this);
    }
    return orElse();
  }
}

abstract class FilterTimelineEvents implements TimelineBlocEvent {
  const factory FilterTimelineEvents(
      {required final TimelineFilterRange range}) = _$FilterTimelineEventsImpl;

  TimelineFilterRange get range;

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterTimelineEventsImplCopyWith<_$FilterTimelineEventsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
