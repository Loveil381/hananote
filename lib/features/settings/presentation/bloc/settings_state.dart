import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';

part 'settings_state.freezed.dart';

/// States for the SettingsBloc.
@freezed
sealed class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = SettingsInitial;
  const factory SettingsState.loading() = SettingsLoading;
  const factory SettingsState.loaded({
    required UserProfile profile,
    required AppSettings settings,
    required int activeDrugCount,
    required int? inventoryDaysRemaining,
  }) = SettingsLoaded;
  const factory SettingsState.error(String message) = SettingsError;
  const factory SettingsState.wiped() = SettingsWiped;
  const factory SettingsState.actionResult({
    required String actionKey,
    required SettingsState previousState,
  }) = SettingsActionResult;
}
