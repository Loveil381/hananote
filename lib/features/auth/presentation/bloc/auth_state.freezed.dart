// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthNeedsSetupImplCopyWith<$Res> {
  factory _$$AuthNeedsSetupImplCopyWith(_$AuthNeedsSetupImpl value,
          $Res Function(_$AuthNeedsSetupImpl) then) =
      __$$AuthNeedsSetupImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthNeedsSetupImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthNeedsSetupImpl>
    implements _$$AuthNeedsSetupImplCopyWith<$Res> {
  __$$AuthNeedsSetupImplCopyWithImpl(
      _$AuthNeedsSetupImpl _value, $Res Function(_$AuthNeedsSetupImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthNeedsSetupImpl implements AuthNeedsSetup {
  const _$AuthNeedsSetupImpl();

  @override
  String toString() {
    return 'AuthState.needsSetup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthNeedsSetupImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return needsSetup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return needsSetup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (needsSetup != null) {
      return needsSetup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return needsSetup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return needsSetup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (needsSetup != null) {
      return needsSetup(this);
    }
    return orElse();
  }
}

abstract class AuthNeedsSetup implements AuthState {
  const factory AuthNeedsSetup() = _$AuthNeedsSetupImpl;
}

/// @nodoc
abstract class _$$AuthLockedImplCopyWith<$Res> {
  factory _$$AuthLockedImplCopyWith(
          _$AuthLockedImpl value, $Res Function(_$AuthLockedImpl) then) =
      __$$AuthLockedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool biometricAvailable});
}

/// @nodoc
class __$$AuthLockedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLockedImpl>
    implements _$$AuthLockedImplCopyWith<$Res> {
  __$$AuthLockedImplCopyWithImpl(
      _$AuthLockedImpl _value, $Res Function(_$AuthLockedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? biometricAvailable = null,
  }) {
    return _then(_$AuthLockedImpl(
      biometricAvailable: null == biometricAvailable
          ? _value.biometricAvailable
          : biometricAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthLockedImpl implements AuthLocked {
  const _$AuthLockedImpl({required this.biometricAvailable});

  @override
  final bool biometricAvailable;

  @override
  String toString() {
    return 'AuthState.locked(biometricAvailable: $biometricAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLockedImpl &&
            (identical(other.biometricAvailable, biometricAvailable) ||
                other.biometricAvailable == biometricAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, biometricAvailable);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLockedImplCopyWith<_$AuthLockedImpl> get copyWith =>
      __$$AuthLockedImplCopyWithImpl<_$AuthLockedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return locked(biometricAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return locked?.call(biometricAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (locked != null) {
      return locked(biometricAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return locked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return locked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (locked != null) {
      return locked(this);
    }
    return orElse();
  }
}

abstract class AuthLocked implements AuthState {
  const factory AuthLocked({required final bool biometricAvailable}) =
      _$AuthLockedImpl;

  bool get biometricAvailable;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthLockedImplCopyWith<_$AuthLockedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthUnlockingImplCopyWith<$Res> {
  factory _$$AuthUnlockingImplCopyWith(
          _$AuthUnlockingImpl value, $Res Function(_$AuthUnlockingImpl) then) =
      __$$AuthUnlockingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnlockingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnlockingImpl>
    implements _$$AuthUnlockingImplCopyWith<$Res> {
  __$$AuthUnlockingImplCopyWithImpl(
      _$AuthUnlockingImpl _value, $Res Function(_$AuthUnlockingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthUnlockingImpl implements AuthUnlocking {
  const _$AuthUnlockingImpl();

  @override
  String toString() {
    return 'AuthState.unlocking()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthUnlockingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return unlocking();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return unlocking?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (unlocking != null) {
      return unlocking();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return unlocking(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return unlocking?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (unlocking != null) {
      return unlocking(this);
    }
    return orElse();
  }
}

abstract class AuthUnlocking implements AuthState {
  const factory AuthUnlocking() = _$AuthUnlockingImpl;
}

/// @nodoc
abstract class _$$AuthUnlockedImplCopyWith<$Res> {
  factory _$$AuthUnlockedImplCopyWith(
          _$AuthUnlockedImpl value, $Res Function(_$AuthUnlockedImpl) then) =
      __$$AuthUnlockedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthUnlockedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthUnlockedImpl>
    implements _$$AuthUnlockedImplCopyWith<$Res> {
  __$$AuthUnlockedImplCopyWithImpl(
      _$AuthUnlockedImpl _value, $Res Function(_$AuthUnlockedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthUnlockedImpl implements AuthUnlocked {
  const _$AuthUnlockedImpl();

  @override
  String toString() {
    return 'AuthState.unlocked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthUnlockedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return unlocked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return unlocked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return unlocked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return unlocked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (unlocked != null) {
      return unlocked(this);
    }
    return orElse();
  }
}

abstract class AuthUnlocked implements AuthState {
  const factory AuthUnlocked() = _$AuthUnlockedImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
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
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError({required final String message}) = _$AuthErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthWipedImplCopyWith<$Res> {
  factory _$$AuthWipedImplCopyWith(
          _$AuthWipedImpl value, $Res Function(_$AuthWipedImpl) then) =
      __$$AuthWipedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthWipedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthWipedImpl>
    implements _$$AuthWipedImplCopyWith<$Res> {
  __$$AuthWipedImplCopyWithImpl(
      _$AuthWipedImpl _value, $Res Function(_$AuthWipedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthWipedImpl implements AuthWiped {
  const _$AuthWipedImpl();

  @override
  String toString() {
    return 'AuthState.wiped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthWipedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() needsSetup,
    required TResult Function(bool biometricAvailable) locked,
    required TResult Function() unlocking,
    required TResult Function() unlocked,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return wiped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? needsSetup,
    TResult? Function(bool biometricAvailable)? locked,
    TResult? Function()? unlocking,
    TResult? Function()? unlocked,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return wiped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? needsSetup,
    TResult Function(bool biometricAvailable)? locked,
    TResult Function()? unlocking,
    TResult Function()? unlocked,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (wiped != null) {
      return wiped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthNeedsSetup value) needsSetup,
    required TResult Function(AuthLocked value) locked,
    required TResult Function(AuthUnlocking value) unlocking,
    required TResult Function(AuthUnlocked value) unlocked,
    required TResult Function(AuthError value) error,
    required TResult Function(AuthWiped value) wiped,
  }) {
    return wiped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthNeedsSetup value)? needsSetup,
    TResult? Function(AuthLocked value)? locked,
    TResult? Function(AuthUnlocking value)? unlocking,
    TResult? Function(AuthUnlocked value)? unlocked,
    TResult? Function(AuthError value)? error,
    TResult? Function(AuthWiped value)? wiped,
  }) {
    return wiped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthNeedsSetup value)? needsSetup,
    TResult Function(AuthLocked value)? locked,
    TResult Function(AuthUnlocking value)? unlocking,
    TResult Function(AuthUnlocked value)? unlocked,
    TResult Function(AuthError value)? error,
    TResult Function(AuthWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (wiped != null) {
      return wiped(this);
    }
    return orElse();
  }
}

abstract class AuthWiped implements AuthState {
  const factory AuthWiped() = _$AuthWipedImpl;
}
