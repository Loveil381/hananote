import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// All authentication states that drive the startup flow.
@freezed
sealed class AuthState with _$AuthState {
  /// Initial idle state before auth status is checked.
  const factory AuthState.initial() = AuthInitial;

  /// State for first-time setup.
  const factory AuthState.needsSetup() = AuthNeedsSetup;

  /// State when the app is locked.
  const factory AuthState.locked({required bool biometricAvailable}) =
      AuthLocked;

  /// State while an auth action is in progress.
  const factory AuthState.unlocking() = AuthUnlocking;

  /// State after successful unlock or setup.
  const factory AuthState.unlocked() = AuthUnlocked;

  /// Transient error state for UI feedback.
  const factory AuthState.error({required String message}) = AuthError;

  /// State after data has been wiped.
  const factory AuthState.wiped() = AuthWiped;
}
