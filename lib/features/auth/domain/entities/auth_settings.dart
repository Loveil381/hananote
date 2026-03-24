import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_settings.freezed.dart';

/// Authentication and disguise-related app settings.
@freezed
class AuthSettings with _$AuthSettings {
  /// Creates [AuthSettings].
  const factory AuthSettings({
    required bool isSetup,
    required bool biometricEnabled,
    required String appDisplayName,
    required String appIconKey,
    required int autoLockMinutes,
    required int maxFailedAttempts,
  }) = _AuthSettings;
}
