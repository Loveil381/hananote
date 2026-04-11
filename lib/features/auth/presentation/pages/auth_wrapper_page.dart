import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/core/constants/app_urls.dart';
import 'package:hananote/core/update/update_dialog.dart';
import 'package:hananote/core/update/update_service.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';
import 'package:hananote/features/auth/presentation/pages/lock_screen_page.dart';
import 'package:hananote/features/auth/presentation/pages/setup_page.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';

/// Root page that switches between setup, lock, and home flows.
class AuthWrapperPage extends StatelessWidget {
  /// Creates [AuthWrapperPage].
  const AuthWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthUnlocked) {
          context.read<SettingsBloc>().add(const LoadSettingsDashboard());
          context.go('/today');
          // Check for updates after the navigation settles.
          SchedulerBinding.instance.addPostFrameCallback((_) async {
            if (!context.mounted) return;

            // Wait for settings to load before checking
            final settingsBloc = context.read<SettingsBloc>();
            final currentState = settingsBloc.state;

            // Get settings — may need to wait a frame for settings load
            bool autoCheck;
            String skippedVersion;
            if (currentState is SettingsLoaded) {
              autoCheck = currentState.settings.autoCheckUpdate;
              skippedVersion = currentState.settings.skippedVersion;
            } else {
              // Settings not loaded yet, default to auto-check enabled
              autoCheck = true;
              skippedVersion = '';
            }

            if (!autoCheck) return;

            final info = await UpdateService.checkForUpdate(
              AppConstants.appVersion,
            );
            if (info != null && context.mounted) {
              // Skip if user has chosen to skip this version
              if (skippedVersion == info.latestVersion) return;
              await showUpdateDialog(context, info);
            }
          });
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return switch (state) {
            AuthInitial() || AuthUnlocking() => const _LoadingPage(),
            AuthNeedsSetup() || AuthWiped() => const SetupPage(),
            AuthLocked(:final biometricAvailable) =>
              LockScreenPage(biometricAvailable: biometricAvailable),
            AuthUnlocked() => const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            AuthError() => const _LoadingPage(),
          };
        },
      ),
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
