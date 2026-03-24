// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthSettings {
  bool get isSetup => throw _privateConstructorUsedError;
  bool get biometricEnabled => throw _privateConstructorUsedError;
  String get appDisplayName => throw _privateConstructorUsedError;
  String get appIconKey => throw _privateConstructorUsedError;
  int get autoLockMinutes => throw _privateConstructorUsedError;
  int get maxFailedAttempts => throw _privateConstructorUsedError;

  /// Create a copy of AuthSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthSettingsCopyWith<AuthSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSettingsCopyWith<$Res> {
  factory $AuthSettingsCopyWith(
          AuthSettings value, $Res Function(AuthSettings) then) =
      _$AuthSettingsCopyWithImpl<$Res, AuthSettings>;
  @useResult
  $Res call(
      {bool isSetup,
      bool biometricEnabled,
      String appDisplayName,
      String appIconKey,
      int autoLockMinutes,
      int maxFailedAttempts});
}

/// @nodoc
class _$AuthSettingsCopyWithImpl<$Res, $Val extends AuthSettings>
    implements $AuthSettingsCopyWith<$Res> {
  _$AuthSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSetup = null,
    Object? biometricEnabled = null,
    Object? appDisplayName = null,
    Object? appIconKey = null,
    Object? autoLockMinutes = null,
    Object? maxFailedAttempts = null,
  }) {
    return _then(_value.copyWith(
      isSetup: null == isSetup
          ? _value.isSetup
          : isSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appDisplayName: null == appDisplayName
          ? _value.appDisplayName
          : appDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      appIconKey: null == appIconKey
          ? _value.appIconKey
          : appIconKey // ignore: cast_nullable_to_non_nullable
              as String,
      autoLockMinutes: null == autoLockMinutes
          ? _value.autoLockMinutes
          : autoLockMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      maxFailedAttempts: null == maxFailedAttempts
          ? _value.maxFailedAttempts
          : maxFailedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSettingsImplCopyWith<$Res>
    implements $AuthSettingsCopyWith<$Res> {
  factory _$$AuthSettingsImplCopyWith(
          _$AuthSettingsImpl value, $Res Function(_$AuthSettingsImpl) then) =
      __$$AuthSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSetup,
      bool biometricEnabled,
      String appDisplayName,
      String appIconKey,
      int autoLockMinutes,
      int maxFailedAttempts});
}

/// @nodoc
class __$$AuthSettingsImplCopyWithImpl<$Res>
    extends _$AuthSettingsCopyWithImpl<$Res, _$AuthSettingsImpl>
    implements _$$AuthSettingsImplCopyWith<$Res> {
  __$$AuthSettingsImplCopyWithImpl(
      _$AuthSettingsImpl _value, $Res Function(_$AuthSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSetup = null,
    Object? biometricEnabled = null,
    Object? appDisplayName = null,
    Object? appIconKey = null,
    Object? autoLockMinutes = null,
    Object? maxFailedAttempts = null,
  }) {
    return _then(_$AuthSettingsImpl(
      isSetup: null == isSetup
          ? _value.isSetup
          : isSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricEnabled: null == biometricEnabled
          ? _value.biometricEnabled
          : biometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      appDisplayName: null == appDisplayName
          ? _value.appDisplayName
          : appDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      appIconKey: null == appIconKey
          ? _value.appIconKey
          : appIconKey // ignore: cast_nullable_to_non_nullable
              as String,
      autoLockMinutes: null == autoLockMinutes
          ? _value.autoLockMinutes
          : autoLockMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      maxFailedAttempts: null == maxFailedAttempts
          ? _value.maxFailedAttempts
          : maxFailedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AuthSettingsImpl implements _AuthSettings {
  const _$AuthSettingsImpl(
      {required this.isSetup,
      required this.biometricEnabled,
      required this.appDisplayName,
      required this.appIconKey,
      required this.autoLockMinutes,
      required this.maxFailedAttempts});

  @override
  final bool isSetup;
  @override
  final bool biometricEnabled;
  @override
  final String appDisplayName;
  @override
  final String appIconKey;
  @override
  final int autoLockMinutes;
  @override
  final int maxFailedAttempts;

  @override
  String toString() {
    return 'AuthSettings(isSetup: $isSetup, biometricEnabled: $biometricEnabled, appDisplayName: $appDisplayName, appIconKey: $appIconKey, autoLockMinutes: $autoLockMinutes, maxFailedAttempts: $maxFailedAttempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSettingsImpl &&
            (identical(other.isSetup, isSetup) || other.isSetup == isSetup) &&
            (identical(other.biometricEnabled, biometricEnabled) ||
                other.biometricEnabled == biometricEnabled) &&
            (identical(other.appDisplayName, appDisplayName) ||
                other.appDisplayName == appDisplayName) &&
            (identical(other.appIconKey, appIconKey) ||
                other.appIconKey == appIconKey) &&
            (identical(other.autoLockMinutes, autoLockMinutes) ||
                other.autoLockMinutes == autoLockMinutes) &&
            (identical(other.maxFailedAttempts, maxFailedAttempts) ||
                other.maxFailedAttempts == maxFailedAttempts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSetup, biometricEnabled,
      appDisplayName, appIconKey, autoLockMinutes, maxFailedAttempts);

  /// Create a copy of AuthSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSettingsImplCopyWith<_$AuthSettingsImpl> get copyWith =>
      __$$AuthSettingsImplCopyWithImpl<_$AuthSettingsImpl>(this, _$identity);
}

abstract class _AuthSettings implements AuthSettings {
  const factory _AuthSettings(
      {required final bool isSetup,
      required final bool biometricEnabled,
      required final String appDisplayName,
      required final String appIconKey,
      required final int autoLockMinutes,
      required final int maxFailedAttempts}) = _$AuthSettingsImpl;

  @override
  bool get isSetup;
  @override
  bool get biometricEnabled;
  @override
  String get appDisplayName;
  @override
  String get appIconKey;
  @override
  int get autoLockMinutes;
  @override
  int get maxFailedAttempts;

  /// Create a copy of AuthSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSettingsImplCopyWith<_$AuthSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
