// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SettingsInitialImplCopyWith<$Res> {
  factory _$$SettingsInitialImplCopyWith(_$SettingsInitialImpl value,
          $Res Function(_$SettingsInitialImpl) then) =
      __$$SettingsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsInitialImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsInitialImpl>
    implements _$$SettingsInitialImplCopyWith<$Res> {
  __$$SettingsInitialImplCopyWithImpl(
      _$SettingsInitialImpl _value, $Res Function(_$SettingsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsInitialImpl implements SettingsInitial {
  const _$SettingsInitialImpl();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
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
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SettingsInitial implements SettingsState {
  const factory SettingsInitial() = _$SettingsInitialImpl;
}

/// @nodoc
abstract class _$$SettingsLoadingImplCopyWith<$Res> {
  factory _$$SettingsLoadingImplCopyWith(_$SettingsLoadingImpl value,
          $Res Function(_$SettingsLoadingImpl) then) =
      __$$SettingsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsLoadingImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsLoadingImpl>
    implements _$$SettingsLoadingImplCopyWith<$Res> {
  __$$SettingsLoadingImplCopyWithImpl(
      _$SettingsLoadingImpl _value, $Res Function(_$SettingsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsLoadingImpl implements SettingsLoading {
  const _$SettingsLoadingImpl();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? wiped,
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
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SettingsLoading implements SettingsState {
  const factory SettingsLoading() = _$SettingsLoadingImpl;
}

/// @nodoc
abstract class _$$SettingsLoadedImplCopyWith<$Res> {
  factory _$$SettingsLoadedImplCopyWith(_$SettingsLoadedImpl value,
          $Res Function(_$SettingsLoadedImpl) then) =
      __$$SettingsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UserProfile profile,
      AppSettings settings,
      int activeDrugCount,
      int? inventoryDaysRemaining});

  $UserProfileCopyWith<$Res> get profile;
  $AppSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$SettingsLoadedImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsLoadedImpl>
    implements _$$SettingsLoadedImplCopyWith<$Res> {
  __$$SettingsLoadedImplCopyWithImpl(
      _$SettingsLoadedImpl _value, $Res Function(_$SettingsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? settings = null,
    Object? activeDrugCount = null,
    Object? inventoryDaysRemaining = freezed,
  }) {
    return _then(_$SettingsLoadedImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as AppSettings,
      activeDrugCount: null == activeDrugCount
          ? _value.activeDrugCount
          : activeDrugCount // ignore: cast_nullable_to_non_nullable
              as int,
      inventoryDaysRemaining: freezed == inventoryDaysRemaining
          ? _value.inventoryDaysRemaining
          : inventoryDaysRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get profile {
    return $UserProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res> get settings {
    return $AppSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$SettingsLoadedImpl implements SettingsLoaded {
  const _$SettingsLoadedImpl(
      {required this.profile,
      required this.settings,
      required this.activeDrugCount,
      required this.inventoryDaysRemaining});

  @override
  final UserProfile profile;
  @override
  final AppSettings settings;
  @override
  final int activeDrugCount;
  @override
  final int? inventoryDaysRemaining;

  @override
  String toString() {
    return 'SettingsState.loaded(profile: $profile, settings: $settings, activeDrugCount: $activeDrugCount, inventoryDaysRemaining: $inventoryDaysRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsLoadedImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.activeDrugCount, activeDrugCount) ||
                other.activeDrugCount == activeDrugCount) &&
            (identical(other.inventoryDaysRemaining, inventoryDaysRemaining) ||
                other.inventoryDaysRemaining == inventoryDaysRemaining));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, profile, settings, activeDrugCount, inventoryDaysRemaining);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsLoadedImplCopyWith<_$SettingsLoadedImpl> get copyWith =>
      __$$SettingsLoadedImplCopyWithImpl<_$SettingsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return loaded(profile, settings, activeDrugCount, inventoryDaysRemaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return loaded?.call(
        profile, settings, activeDrugCount, inventoryDaysRemaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? wiped,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profile, settings, activeDrugCount, inventoryDaysRemaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SettingsLoaded implements SettingsState {
  const factory SettingsLoaded(
      {required final UserProfile profile,
      required final AppSettings settings,
      required final int activeDrugCount,
      required final int? inventoryDaysRemaining}) = _$SettingsLoadedImpl;

  UserProfile get profile;
  AppSettings get settings;
  int get activeDrugCount;
  int? get inventoryDaysRemaining;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsLoadedImplCopyWith<_$SettingsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsErrorImplCopyWith<$Res> {
  factory _$$SettingsErrorImplCopyWith(
          _$SettingsErrorImpl value, $Res Function(_$SettingsErrorImpl) then) =
      __$$SettingsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SettingsErrorImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsErrorImpl>
    implements _$$SettingsErrorImplCopyWith<$Res> {
  __$$SettingsErrorImplCopyWithImpl(
      _$SettingsErrorImpl _value, $Res Function(_$SettingsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SettingsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SettingsErrorImpl implements SettingsError {
  const _$SettingsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SettingsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsErrorImplCopyWith<_$SettingsErrorImpl> get copyWith =>
      __$$SettingsErrorImplCopyWithImpl<_$SettingsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
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
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SettingsError implements SettingsState {
  const factory SettingsError(final String message) = _$SettingsErrorImpl;

  String get message;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsErrorImplCopyWith<_$SettingsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SettingsWipedImplCopyWith<$Res> {
  factory _$$SettingsWipedImplCopyWith(
          _$SettingsWipedImpl value, $Res Function(_$SettingsWipedImpl) then) =
      __$$SettingsWipedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsWipedImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsWipedImpl>
    implements _$$SettingsWipedImplCopyWith<$Res> {
  __$$SettingsWipedImplCopyWithImpl(
      _$SettingsWipedImpl _value, $Res Function(_$SettingsWipedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SettingsWipedImpl implements SettingsWiped {
  const _$SettingsWipedImpl();

  @override
  String toString() {
    return 'SettingsState.wiped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsWipedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() wiped,
  }) {
    return wiped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? wiped,
  }) {
    return wiped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfile profile, AppSettings settings,
            int activeDrugCount, int? inventoryDaysRemaining)?
        loaded,
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
    required TResult Function(SettingsInitial value) initial,
    required TResult Function(SettingsLoading value) loading,
    required TResult Function(SettingsLoaded value) loaded,
    required TResult Function(SettingsError value) error,
    required TResult Function(SettingsWiped value) wiped,
  }) {
    return wiped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SettingsInitial value)? initial,
    TResult? Function(SettingsLoading value)? loading,
    TResult? Function(SettingsLoaded value)? loaded,
    TResult? Function(SettingsError value)? error,
    TResult? Function(SettingsWiped value)? wiped,
  }) {
    return wiped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SettingsInitial value)? initial,
    TResult Function(SettingsLoading value)? loading,
    TResult Function(SettingsLoaded value)? loaded,
    TResult Function(SettingsError value)? error,
    TResult Function(SettingsWiped value)? wiped,
    required TResult orElse(),
  }) {
    if (wiped != null) {
      return wiped(this);
    }
    return orElse();
  }
}

abstract class SettingsWiped implements SettingsState {
  const factory SettingsWiped() = _$SettingsWipedImpl;
}
