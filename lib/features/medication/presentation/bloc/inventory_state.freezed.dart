// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InventoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InventoryStatus> statuses, int lowStockCount)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InventoryStatus> statuses, int lowStockCount)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InventoryStatus> statuses, int lowStockCount)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryInitial value) initial,
    required TResult Function(InventoryLoading value) loading,
    required TResult Function(InventoryLoaded value) loaded,
    required TResult Function(InventoryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryInitial value)? initial,
    TResult? Function(InventoryLoading value)? loading,
    TResult? Function(InventoryLoaded value)? loaded,
    TResult? Function(InventoryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryInitial value)? initial,
    TResult Function(InventoryLoading value)? loading,
    TResult Function(InventoryLoaded value)? loaded,
    TResult Function(InventoryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryStateCopyWith<$Res> {
  factory $InventoryStateCopyWith(
          InventoryState value, $Res Function(InventoryState) then) =
      _$InventoryStateCopyWithImpl<$Res, InventoryState>;
}

/// @nodoc
class _$InventoryStateCopyWithImpl<$Res, $Val extends InventoryState>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InventoryInitialImplCopyWith<$Res> {
  factory _$$InventoryInitialImplCopyWith(_$InventoryInitialImpl value,
          $Res Function(_$InventoryInitialImpl) then) =
      __$$InventoryInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryInitialImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryInitialImpl>
    implements _$$InventoryInitialImplCopyWith<$Res> {
  __$$InventoryInitialImplCopyWithImpl(_$InventoryInitialImpl _value,
      $Res Function(_$InventoryInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InventoryInitialImpl implements InventoryInitial {
  const _$InventoryInitialImpl();

  @override
  String toString() {
    return 'InventoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InventoryInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InventoryStatus> statuses, int lowStockCount)
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
    TResult? Function(List<InventoryStatus> statuses, int lowStockCount)?
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
    TResult Function(List<InventoryStatus> statuses, int lowStockCount)? loaded,
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
    required TResult Function(InventoryInitial value) initial,
    required TResult Function(InventoryLoading value) loading,
    required TResult Function(InventoryLoaded value) loaded,
    required TResult Function(InventoryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryInitial value)? initial,
    TResult? Function(InventoryLoading value)? loading,
    TResult? Function(InventoryLoaded value)? loaded,
    TResult? Function(InventoryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryInitial value)? initial,
    TResult Function(InventoryLoading value)? loading,
    TResult Function(InventoryLoaded value)? loaded,
    TResult Function(InventoryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InventoryInitial implements InventoryState {
  const factory InventoryInitial() = _$InventoryInitialImpl;
}

/// @nodoc
abstract class _$$InventoryLoadingImplCopyWith<$Res> {
  factory _$$InventoryLoadingImplCopyWith(_$InventoryLoadingImpl value,
          $Res Function(_$InventoryLoadingImpl) then) =
      __$$InventoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InventoryLoadingImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryLoadingImpl>
    implements _$$InventoryLoadingImplCopyWith<$Res> {
  __$$InventoryLoadingImplCopyWithImpl(_$InventoryLoadingImpl _value,
      $Res Function(_$InventoryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InventoryLoadingImpl implements InventoryLoading {
  const _$InventoryLoadingImpl();

  @override
  String toString() {
    return 'InventoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InventoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InventoryStatus> statuses, int lowStockCount)
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
    TResult? Function(List<InventoryStatus> statuses, int lowStockCount)?
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
    TResult Function(List<InventoryStatus> statuses, int lowStockCount)? loaded,
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
    required TResult Function(InventoryInitial value) initial,
    required TResult Function(InventoryLoading value) loading,
    required TResult Function(InventoryLoaded value) loaded,
    required TResult Function(InventoryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryInitial value)? initial,
    TResult? Function(InventoryLoading value)? loading,
    TResult? Function(InventoryLoaded value)? loaded,
    TResult? Function(InventoryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryInitial value)? initial,
    TResult Function(InventoryLoading value)? loading,
    TResult Function(InventoryLoaded value)? loaded,
    TResult Function(InventoryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InventoryLoading implements InventoryState {
  const factory InventoryLoading() = _$InventoryLoadingImpl;
}

/// @nodoc
abstract class _$$InventoryLoadedImplCopyWith<$Res> {
  factory _$$InventoryLoadedImplCopyWith(_$InventoryLoadedImpl value,
          $Res Function(_$InventoryLoadedImpl) then) =
      __$$InventoryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<InventoryStatus> statuses, int lowStockCount});
}

/// @nodoc
class __$$InventoryLoadedImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryLoadedImpl>
    implements _$$InventoryLoadedImplCopyWith<$Res> {
  __$$InventoryLoadedImplCopyWithImpl(
      _$InventoryLoadedImpl _value, $Res Function(_$InventoryLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statuses = null,
    Object? lowStockCount = null,
  }) {
    return _then(_$InventoryLoadedImpl(
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<InventoryStatus>,
      lowStockCount: null == lowStockCount
          ? _value.lowStockCount
          : lowStockCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InventoryLoadedImpl implements InventoryLoaded {
  const _$InventoryLoadedImpl(
      {required final List<InventoryStatus> statuses,
      required this.lowStockCount})
      : _statuses = statuses;

  final List<InventoryStatus> _statuses;
  @override
  List<InventoryStatus> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  final int lowStockCount;

  @override
  String toString() {
    return 'InventoryState.loaded(statuses: $statuses, lowStockCount: $lowStockCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryLoadedImpl &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            (identical(other.lowStockCount, lowStockCount) ||
                other.lowStockCount == lowStockCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_statuses), lowStockCount);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryLoadedImplCopyWith<_$InventoryLoadedImpl> get copyWith =>
      __$$InventoryLoadedImplCopyWithImpl<_$InventoryLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InventoryStatus> statuses, int lowStockCount)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(statuses, lowStockCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<InventoryStatus> statuses, int lowStockCount)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(statuses, lowStockCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<InventoryStatus> statuses, int lowStockCount)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(statuses, lowStockCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InventoryInitial value) initial,
    required TResult Function(InventoryLoading value) loading,
    required TResult Function(InventoryLoaded value) loaded,
    required TResult Function(InventoryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryInitial value)? initial,
    TResult? Function(InventoryLoading value)? loading,
    TResult? Function(InventoryLoaded value)? loaded,
    TResult? Function(InventoryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryInitial value)? initial,
    TResult Function(InventoryLoading value)? loading,
    TResult Function(InventoryLoaded value)? loaded,
    TResult Function(InventoryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InventoryLoaded implements InventoryState {
  const factory InventoryLoaded(
      {required final List<InventoryStatus> statuses,
      required final int lowStockCount}) = _$InventoryLoadedImpl;

  List<InventoryStatus> get statuses;
  int get lowStockCount;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryLoadedImplCopyWith<_$InventoryLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InventoryErrorImplCopyWith<$Res> {
  factory _$$InventoryErrorImplCopyWith(_$InventoryErrorImpl value,
          $Res Function(_$InventoryErrorImpl) then) =
      __$$InventoryErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InventoryErrorImplCopyWithImpl<$Res>
    extends _$InventoryStateCopyWithImpl<$Res, _$InventoryErrorImpl>
    implements _$$InventoryErrorImplCopyWith<$Res> {
  __$$InventoryErrorImplCopyWithImpl(
      _$InventoryErrorImpl _value, $Res Function(_$InventoryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InventoryErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InventoryErrorImpl implements InventoryError {
  const _$InventoryErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'InventoryState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryErrorImplCopyWith<_$InventoryErrorImpl> get copyWith =>
      __$$InventoryErrorImplCopyWithImpl<_$InventoryErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<InventoryStatus> statuses, int lowStockCount)
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
    TResult? Function(List<InventoryStatus> statuses, int lowStockCount)?
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
    TResult Function(List<InventoryStatus> statuses, int lowStockCount)? loaded,
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
    required TResult Function(InventoryInitial value) initial,
    required TResult Function(InventoryLoading value) loading,
    required TResult Function(InventoryLoaded value) loaded,
    required TResult Function(InventoryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InventoryInitial value)? initial,
    TResult? Function(InventoryLoading value)? loading,
    TResult? Function(InventoryLoaded value)? loaded,
    TResult? Function(InventoryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InventoryInitial value)? initial,
    TResult Function(InventoryLoading value)? loading,
    TResult Function(InventoryLoaded value)? loaded,
    TResult Function(InventoryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InventoryError implements InventoryState {
  const factory InventoryError({required final String message}) =
      _$InventoryErrorImpl;

  String get message;

  /// Create a copy of InventoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryErrorImplCopyWith<_$InventoryErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
