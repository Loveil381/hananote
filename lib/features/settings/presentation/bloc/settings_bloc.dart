import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/usecases/get_profile_dashboard.dart';
import 'package:hananote/features/settings/domain/usecases/update_app_settings.dart';
import 'package:hananote/features/settings/domain/usecases/wipe_all_data.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';
import 'package:injectable/injectable.dart';

/// BLoC for managing the settings dashboard state.
@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  /// Creates a [SettingsBloc].
  SettingsBloc(
    this._getProfileDashboard,
    this._updateAppSettings,
    this._wipeAllData,
  ) : super(const SettingsInitial()) {
    on<LoadSettingsDashboard>(_onLoadDashboard);
    on<ToggleAppLock>(_onToggleAppLock);
    on<TogglePrivacyMode>(_onTogglePrivacyMode);
    on<ToggleBlurOverlay>(_onToggleBlurOverlay);
    on<WipeSettingsData>(_onWipeData);
  }

  final GetProfileDashboard _getProfileDashboard;
  final UpdateAppSettings _updateAppSettings;
  final WipeAllData _wipeAllData;

  Future<void> _onLoadDashboard(
    LoadSettingsDashboard event,
    Emitter<SettingsState> emit,
  ) async {
    emit(const SettingsLoading());

    final failureOrDashboard = await _getProfileDashboard();

    failureOrDashboard.fold(
      (failure) => emit(SettingsError(failureMessage(failure))),
      (dashboard) => emit(
        SettingsLoaded(
          profile: dashboard.profile,
          settings: dashboard.settings,
          activeDrugCount: dashboard.activeDrugCount,
          inventoryDaysRemaining: dashboard.inventoryDaysRemaining,
        ),
      ),
    );
  }

  Future<void> _onToggleAppLock(
    ToggleAppLock event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsLoaded) {
      final currentState = state as SettingsLoaded;
      final newSettings = currentState.settings.copyWith(
        appLockEnabled: event.enabled,
      );

      final failureOrSettings = await _updateAppSettings(newSettings);

      failureOrSettings.fold(
        (failure) => emit(SettingsError(failureMessage(failure))),
        (updatedSettings) => emit(
          currentState.copyWith(settings: updatedSettings),
        ),
      );
    }
  }

  Future<void> _onTogglePrivacyMode(
    TogglePrivacyMode event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsLoaded) {
      final currentState = state as SettingsLoaded;
      final newSettings = currentState.settings.copyWith(
        privacyModeEnabled: event.enabled,
      );

      final failureOrSettings = await _updateAppSettings(newSettings);

      failureOrSettings.fold(
        (failure) => emit(SettingsError(failureMessage(failure))),
        (updatedSettings) => emit(
          currentState.copyWith(settings: updatedSettings),
        ),
      );
    }
  }

  Future<void> _onToggleBlurOverlay(
    ToggleBlurOverlay event,
    Emitter<SettingsState> emit,
  ) async {
    if (state is SettingsLoaded) {
      final currentState = state as SettingsLoaded;
      final newSettings = currentState.settings.copyWith(
        blurOverlayEnabled: event.enabled,
      );

      final failureOrSettings = await _updateAppSettings(newSettings);

      failureOrSettings.fold(
        (failure) => emit(SettingsError(failureMessage(failure))),
        (updatedSettings) => emit(
          currentState.copyWith(settings: updatedSettings),
        ),
      );
    }
  }

  Future<void> _onWipeData(
    WipeSettingsData event,
    Emitter<SettingsState> emit,
  ) async {
    final failureOrSuccess = await _wipeAllData();

    failureOrSuccess.fold(
      (failure) => emit(SettingsError(failureMessage(failure))),
      (_) => emit(const SettingsWiped()),
    );
  }
}
