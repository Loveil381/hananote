// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayScheduleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayScheduleInitial value) initial,
    required TResult Function(TodayScheduleLoading value) loading,
    required TResult Function(TodayScheduleLoaded value) loaded,
    required TResult Function(TodayScheduleError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayScheduleInitial value)? initial,
    TResult? Function(TodayScheduleLoading value)? loading,
    TResult? Function(TodayScheduleLoaded value)? loaded,
    TResult? Function(TodayScheduleError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayScheduleInitial value)? initial,
    TResult Function(TodayScheduleLoading value)? loading,
    TResult Function(TodayScheduleLoaded value)? loaded,
    TResult Function(TodayScheduleError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayScheduleStateCopyWith<$Res> {
  factory $TodayScheduleStateCopyWith(
          TodayScheduleState value, $Res Function(TodayScheduleState) then) =
      _$TodayScheduleStateCopyWithImpl<$Res, TodayScheduleState>;
}

/// @nodoc
class _$TodayScheduleStateCopyWithImpl<$Res, $Val extends TodayScheduleState>
    implements $TodayScheduleStateCopyWith<$Res> {
  _$TodayScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TodayScheduleInitialImplCopyWith<$Res> {
  factory _$$TodayScheduleInitialImplCopyWith(_$TodayScheduleInitialImpl value,
          $Res Function(_$TodayScheduleInitialImpl) then) =
      __$$TodayScheduleInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodayScheduleInitialImplCopyWithImpl<$Res>
    extends _$TodayScheduleStateCopyWithImpl<$Res, _$TodayScheduleInitialImpl>
    implements _$$TodayScheduleInitialImplCopyWith<$Res> {
  __$$TodayScheduleInitialImplCopyWithImpl(_$TodayScheduleInitialImpl _value,
      $Res Function(_$TodayScheduleInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodayScheduleInitialImpl implements TodayScheduleInitial {
  const _$TodayScheduleInitialImpl();

  @override
  String toString() {
    return 'TodayScheduleState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)
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
    TResult? Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    required TResult Function(TodayScheduleInitial value) initial,
    required TResult Function(TodayScheduleLoading value) loading,
    required TResult Function(TodayScheduleLoaded value) loaded,
    required TResult Function(TodayScheduleError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayScheduleInitial value)? initial,
    TResult? Function(TodayScheduleLoading value)? loading,
    TResult? Function(TodayScheduleLoaded value)? loaded,
    TResult? Function(TodayScheduleError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayScheduleInitial value)? initial,
    TResult Function(TodayScheduleLoading value)? loading,
    TResult Function(TodayScheduleLoaded value)? loaded,
    TResult Function(TodayScheduleError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodayScheduleInitial implements TodayScheduleState {
  const factory TodayScheduleInitial() = _$TodayScheduleInitialImpl;
}

/// @nodoc
abstract class _$$TodayScheduleLoadingImplCopyWith<$Res> {
  factory _$$TodayScheduleLoadingImplCopyWith(_$TodayScheduleLoadingImpl value,
          $Res Function(_$TodayScheduleLoadingImpl) then) =
      __$$TodayScheduleLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodayScheduleLoadingImplCopyWithImpl<$Res>
    extends _$TodayScheduleStateCopyWithImpl<$Res, _$TodayScheduleLoadingImpl>
    implements _$$TodayScheduleLoadingImplCopyWith<$Res> {
  __$$TodayScheduleLoadingImplCopyWithImpl(_$TodayScheduleLoadingImpl _value,
      $Res Function(_$TodayScheduleLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodayScheduleLoadingImpl implements TodayScheduleLoading {
  const _$TodayScheduleLoadingImpl();

  @override
  String toString() {
    return 'TodayScheduleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)
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
    TResult? Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    required TResult Function(TodayScheduleInitial value) initial,
    required TResult Function(TodayScheduleLoading value) loading,
    required TResult Function(TodayScheduleLoaded value) loaded,
    required TResult Function(TodayScheduleError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayScheduleInitial value)? initial,
    TResult? Function(TodayScheduleLoading value)? loading,
    TResult? Function(TodayScheduleLoaded value)? loaded,
    TResult? Function(TodayScheduleError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayScheduleInitial value)? initial,
    TResult Function(TodayScheduleLoading value)? loading,
    TResult Function(TodayScheduleLoaded value)? loaded,
    TResult Function(TodayScheduleError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodayScheduleLoading implements TodayScheduleState {
  const factory TodayScheduleLoading() = _$TodayScheduleLoadingImpl;
}

/// @nodoc
abstract class _$$TodayScheduleLoadedImplCopyWith<$Res> {
  factory _$$TodayScheduleLoadedImplCopyWith(_$TodayScheduleLoadedImpl value,
          $Res Function(_$TodayScheduleLoadedImpl) then) =
      __$$TodayScheduleLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<TodayScheduleItem> items,
      DateTime date,
      int completedCount,
      int totalCount});
}

/// @nodoc
class __$$TodayScheduleLoadedImplCopyWithImpl<$Res>
    extends _$TodayScheduleStateCopyWithImpl<$Res, _$TodayScheduleLoadedImpl>
    implements _$$TodayScheduleLoadedImplCopyWith<$Res> {
  __$$TodayScheduleLoadedImplCopyWithImpl(_$TodayScheduleLoadedImpl _value,
      $Res Function(_$TodayScheduleLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? date = null,
    Object? completedCount = null,
    Object? totalCount = null,
  }) {
    return _then(_$TodayScheduleLoadedImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TodayScheduleItem>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedCount: null == completedCount
          ? _value.completedCount
          : completedCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TodayScheduleLoadedImpl implements TodayScheduleLoaded {
  const _$TodayScheduleLoadedImpl(
      {required final List<TodayScheduleItem> items,
      required this.date,
      required this.completedCount,
      required this.totalCount})
      : _items = items;

  final List<TodayScheduleItem> _items;
  @override
  List<TodayScheduleItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DateTime date;
  @override
  final int completedCount;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'TodayScheduleState.loaded(items: $items, date: $date, completedCount: $completedCount, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      date,
      completedCount,
      totalCount);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayScheduleLoadedImplCopyWith<_$TodayScheduleLoadedImpl> get copyWith =>
      __$$TodayScheduleLoadedImplCopyWithImpl<_$TodayScheduleLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(items, date, completedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(items, date, completedCount, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items, date, completedCount, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodayScheduleInitial value) initial,
    required TResult Function(TodayScheduleLoading value) loading,
    required TResult Function(TodayScheduleLoaded value) loaded,
    required TResult Function(TodayScheduleError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayScheduleInitial value)? initial,
    TResult? Function(TodayScheduleLoading value)? loading,
    TResult? Function(TodayScheduleLoaded value)? loaded,
    TResult? Function(TodayScheduleError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayScheduleInitial value)? initial,
    TResult Function(TodayScheduleLoading value)? loading,
    TResult Function(TodayScheduleLoaded value)? loaded,
    TResult Function(TodayScheduleError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TodayScheduleLoaded implements TodayScheduleState {
  const factory TodayScheduleLoaded(
      {required final List<TodayScheduleItem> items,
      required final DateTime date,
      required final int completedCount,
      required final int totalCount}) = _$TodayScheduleLoadedImpl;

  List<TodayScheduleItem> get items;
  DateTime get date;
  int get completedCount;
  int get totalCount;

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayScheduleLoadedImplCopyWith<_$TodayScheduleLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodayScheduleErrorImplCopyWith<$Res> {
  factory _$$TodayScheduleErrorImplCopyWith(_$TodayScheduleErrorImpl value,
          $Res Function(_$TodayScheduleErrorImpl) then) =
      __$$TodayScheduleErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TodayScheduleErrorImplCopyWithImpl<$Res>
    extends _$TodayScheduleStateCopyWithImpl<$Res, _$TodayScheduleErrorImpl>
    implements _$$TodayScheduleErrorImplCopyWith<$Res> {
  __$$TodayScheduleErrorImplCopyWithImpl(_$TodayScheduleErrorImpl _value,
      $Res Function(_$TodayScheduleErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TodayScheduleErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TodayScheduleErrorImpl implements TodayScheduleError {
  const _$TodayScheduleErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TodayScheduleState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayScheduleErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayScheduleErrorImplCopyWith<_$TodayScheduleErrorImpl> get copyWith =>
      __$$TodayScheduleErrorImplCopyWithImpl<_$TodayScheduleErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)
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
    TResult? Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    TResult Function(List<TodayScheduleItem> items, DateTime date,
            int completedCount, int totalCount)?
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
    required TResult Function(TodayScheduleInitial value) initial,
    required TResult Function(TodayScheduleLoading value) loading,
    required TResult Function(TodayScheduleLoaded value) loaded,
    required TResult Function(TodayScheduleError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodayScheduleInitial value)? initial,
    TResult? Function(TodayScheduleLoading value)? loading,
    TResult? Function(TodayScheduleLoaded value)? loaded,
    TResult? Function(TodayScheduleError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodayScheduleInitial value)? initial,
    TResult Function(TodayScheduleLoading value)? loading,
    TResult Function(TodayScheduleLoaded value)? loaded,
    TResult Function(TodayScheduleError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodayScheduleError implements TodayScheduleState {
  const factory TodayScheduleError({required final String message}) =
      _$TodayScheduleErrorImpl;

  String get message;

  /// Create a copy of TodayScheduleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayScheduleErrorImplCopyWith<_$TodayScheduleErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
