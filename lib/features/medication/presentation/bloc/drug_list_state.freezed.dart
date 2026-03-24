// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DrugListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Drug> drugs) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Drug> drugs)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Drug> drugs)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DrugListInitial value) initial,
    required TResult Function(DrugListLoading value) loading,
    required TResult Function(DrugListLoaded value) loaded,
    required TResult Function(DrugListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DrugListInitial value)? initial,
    TResult? Function(DrugListLoading value)? loading,
    TResult? Function(DrugListLoaded value)? loaded,
    TResult? Function(DrugListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DrugListInitial value)? initial,
    TResult Function(DrugListLoading value)? loading,
    TResult Function(DrugListLoaded value)? loaded,
    TResult Function(DrugListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugListStateCopyWith<$Res> {
  factory $DrugListStateCopyWith(
          DrugListState value, $Res Function(DrugListState) then) =
      _$DrugListStateCopyWithImpl<$Res, DrugListState>;
}

/// @nodoc
class _$DrugListStateCopyWithImpl<$Res, $Val extends DrugListState>
    implements $DrugListStateCopyWith<$Res> {
  _$DrugListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DrugListInitialImplCopyWith<$Res> {
  factory _$$DrugListInitialImplCopyWith(_$DrugListInitialImpl value,
          $Res Function(_$DrugListInitialImpl) then) =
      __$$DrugListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DrugListInitialImplCopyWithImpl<$Res>
    extends _$DrugListStateCopyWithImpl<$Res, _$DrugListInitialImpl>
    implements _$$DrugListInitialImplCopyWith<$Res> {
  __$$DrugListInitialImplCopyWithImpl(
      _$DrugListInitialImpl _value, $Res Function(_$DrugListInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DrugListInitialImpl implements DrugListInitial {
  const _$DrugListInitialImpl();

  @override
  String toString() {
    return 'DrugListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DrugListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Drug> drugs) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Drug> drugs)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Drug> drugs)? loaded,
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
    required TResult Function(DrugListInitial value) initial,
    required TResult Function(DrugListLoading value) loading,
    required TResult Function(DrugListLoaded value) loaded,
    required TResult Function(DrugListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DrugListInitial value)? initial,
    TResult? Function(DrugListLoading value)? loading,
    TResult? Function(DrugListLoaded value)? loaded,
    TResult? Function(DrugListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DrugListInitial value)? initial,
    TResult Function(DrugListLoading value)? loading,
    TResult Function(DrugListLoaded value)? loaded,
    TResult Function(DrugListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DrugListInitial implements DrugListState {
  const factory DrugListInitial() = _$DrugListInitialImpl;
}

/// @nodoc
abstract class _$$DrugListLoadingImplCopyWith<$Res> {
  factory _$$DrugListLoadingImplCopyWith(_$DrugListLoadingImpl value,
          $Res Function(_$DrugListLoadingImpl) then) =
      __$$DrugListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DrugListLoadingImplCopyWithImpl<$Res>
    extends _$DrugListStateCopyWithImpl<$Res, _$DrugListLoadingImpl>
    implements _$$DrugListLoadingImplCopyWith<$Res> {
  __$$DrugListLoadingImplCopyWithImpl(
      _$DrugListLoadingImpl _value, $Res Function(_$DrugListLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DrugListLoadingImpl implements DrugListLoading {
  const _$DrugListLoadingImpl();

  @override
  String toString() {
    return 'DrugListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DrugListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Drug> drugs) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Drug> drugs)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Drug> drugs)? loaded,
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
    required TResult Function(DrugListInitial value) initial,
    required TResult Function(DrugListLoading value) loading,
    required TResult Function(DrugListLoaded value) loaded,
    required TResult Function(DrugListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DrugListInitial value)? initial,
    TResult? Function(DrugListLoading value)? loading,
    TResult? Function(DrugListLoaded value)? loaded,
    TResult? Function(DrugListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DrugListInitial value)? initial,
    TResult Function(DrugListLoading value)? loading,
    TResult Function(DrugListLoaded value)? loaded,
    TResult Function(DrugListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DrugListLoading implements DrugListState {
  const factory DrugListLoading() = _$DrugListLoadingImpl;
}

/// @nodoc
abstract class _$$DrugListLoadedImplCopyWith<$Res> {
  factory _$$DrugListLoadedImplCopyWith(_$DrugListLoadedImpl value,
          $Res Function(_$DrugListLoadedImpl) then) =
      __$$DrugListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Drug> drugs});
}

/// @nodoc
class __$$DrugListLoadedImplCopyWithImpl<$Res>
    extends _$DrugListStateCopyWithImpl<$Res, _$DrugListLoadedImpl>
    implements _$$DrugListLoadedImplCopyWith<$Res> {
  __$$DrugListLoadedImplCopyWithImpl(
      _$DrugListLoadedImpl _value, $Res Function(_$DrugListLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drugs = null,
  }) {
    return _then(_$DrugListLoadedImpl(
      drugs: null == drugs
          ? _value._drugs
          : drugs // ignore: cast_nullable_to_non_nullable
              as List<Drug>,
    ));
  }
}

/// @nodoc

class _$DrugListLoadedImpl implements DrugListLoaded {
  const _$DrugListLoadedImpl({required final List<Drug> drugs})
      : _drugs = drugs;

  final List<Drug> _drugs;
  @override
  List<Drug> get drugs {
    if (_drugs is EqualUnmodifiableListView) return _drugs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drugs);
  }

  @override
  String toString() {
    return 'DrugListState.loaded(drugs: $drugs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugListLoadedImpl &&
            const DeepCollectionEquality().equals(other._drugs, _drugs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_drugs));

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugListLoadedImplCopyWith<_$DrugListLoadedImpl> get copyWith =>
      __$$DrugListLoadedImplCopyWithImpl<_$DrugListLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Drug> drugs) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(drugs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Drug> drugs)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(drugs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Drug> drugs)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(drugs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DrugListInitial value) initial,
    required TResult Function(DrugListLoading value) loading,
    required TResult Function(DrugListLoaded value) loaded,
    required TResult Function(DrugListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DrugListInitial value)? initial,
    TResult? Function(DrugListLoading value)? loading,
    TResult? Function(DrugListLoaded value)? loaded,
    TResult? Function(DrugListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DrugListInitial value)? initial,
    TResult Function(DrugListLoading value)? loading,
    TResult Function(DrugListLoaded value)? loaded,
    TResult Function(DrugListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DrugListLoaded implements DrugListState {
  const factory DrugListLoaded({required final List<Drug> drugs}) =
      _$DrugListLoadedImpl;

  List<Drug> get drugs;

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugListLoadedImplCopyWith<_$DrugListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DrugListErrorImplCopyWith<$Res> {
  factory _$$DrugListErrorImplCopyWith(
          _$DrugListErrorImpl value, $Res Function(_$DrugListErrorImpl) then) =
      __$$DrugListErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DrugListErrorImplCopyWithImpl<$Res>
    extends _$DrugListStateCopyWithImpl<$Res, _$DrugListErrorImpl>
    implements _$$DrugListErrorImplCopyWith<$Res> {
  __$$DrugListErrorImplCopyWithImpl(
      _$DrugListErrorImpl _value, $Res Function(_$DrugListErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DrugListErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DrugListErrorImpl implements DrugListError {
  const _$DrugListErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'DrugListState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugListErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugListErrorImplCopyWith<_$DrugListErrorImpl> get copyWith =>
      __$$DrugListErrorImplCopyWithImpl<_$DrugListErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Drug> drugs) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Drug> drugs)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Drug> drugs)? loaded,
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
    required TResult Function(DrugListInitial value) initial,
    required TResult Function(DrugListLoading value) loading,
    required TResult Function(DrugListLoaded value) loaded,
    required TResult Function(DrugListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DrugListInitial value)? initial,
    TResult? Function(DrugListLoading value)? loading,
    TResult? Function(DrugListLoaded value)? loaded,
    TResult? Function(DrugListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DrugListInitial value)? initial,
    TResult Function(DrugListLoading value)? loading,
    TResult Function(DrugListLoaded value)? loaded,
    TResult Function(DrugListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DrugListError implements DrugListState {
  const factory DrugListError({required final String message}) =
      _$DrugListErrorImpl;

  String get message;

  /// Create a copy of DrugListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugListErrorImplCopyWith<_$DrugListErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
