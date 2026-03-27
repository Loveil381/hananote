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
    required TResult Function(TimelineRange range) selectRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineRange range)? selectRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineRange range)? selectRange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimeline value) loadTimeline,
    required TResult Function(SelectTimelineRange value) selectRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(SelectTimelineRange value)? selectRange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(SelectTimelineRange value)? selectRange,
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
    required TResult Function(TimelineRange range) selectRange,
  }) {
    return loadTimeline();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineRange range)? selectRange,
  }) {
    return loadTimeline?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineRange range)? selectRange,
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
    required TResult Function(SelectTimelineRange value) selectRange,
  }) {
    return loadTimeline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(SelectTimelineRange value)? selectRange,
  }) {
    return loadTimeline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(SelectTimelineRange value)? selectRange,
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
abstract class _$$SelectTimelineRangeImplCopyWith<$Res> {
  factory _$$SelectTimelineRangeImplCopyWith(_$SelectTimelineRangeImpl value,
          $Res Function(_$SelectTimelineRangeImpl) then) =
      __$$SelectTimelineRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimelineRange range});
}

/// @nodoc
class __$$SelectTimelineRangeImplCopyWithImpl<$Res>
    extends _$TimelineBlocEventCopyWithImpl<$Res, _$SelectTimelineRangeImpl>
    implements _$$SelectTimelineRangeImplCopyWith<$Res> {
  __$$SelectTimelineRangeImplCopyWithImpl(_$SelectTimelineRangeImpl _value,
      $Res Function(_$SelectTimelineRangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? range = null,
  }) {
    return _then(_$SelectTimelineRangeImpl(
      null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as TimelineRange,
    ));
  }
}

/// @nodoc

class _$SelectTimelineRangeImpl implements SelectTimelineRange {
  const _$SelectTimelineRangeImpl(this.range);

  @override
  final TimelineRange range;

  @override
  String toString() {
    return 'TimelineBlocEvent.selectRange(range: $range)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTimelineRangeImpl &&
            (identical(other.range, range) || other.range == range));
  }

  @override
  int get hashCode => Object.hash(runtimeType, range);

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTimelineRangeImplCopyWith<_$SelectTimelineRangeImpl> get copyWith =>
      __$$SelectTimelineRangeImplCopyWithImpl<_$SelectTimelineRangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTimeline,
    required TResult Function(TimelineRange range) selectRange,
  }) {
    return selectRange(range);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadTimeline,
    TResult? Function(TimelineRange range)? selectRange,
  }) {
    return selectRange?.call(range);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTimeline,
    TResult Function(TimelineRange range)? selectRange,
    required TResult orElse(),
  }) {
    if (selectRange != null) {
      return selectRange(range);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimeline value) loadTimeline,
    required TResult Function(SelectTimelineRange value) selectRange,
  }) {
    return selectRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimeline value)? loadTimeline,
    TResult? Function(SelectTimelineRange value)? selectRange,
  }) {
    return selectRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimeline value)? loadTimeline,
    TResult Function(SelectTimelineRange value)? selectRange,
    required TResult orElse(),
  }) {
    if (selectRange != null) {
      return selectRange(this);
    }
    return orElse();
  }
}

abstract class SelectTimelineRange implements TimelineBlocEvent {
  const factory SelectTimelineRange(final TimelineRange range) =
      _$SelectTimelineRangeImpl;

  TimelineRange get range;

  /// Create a copy of TimelineBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectTimelineRangeImplCopyWith<_$SelectTimelineRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
