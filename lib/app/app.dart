import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/router.dart';
import 'package:hananote/app/theme/app_theme.dart';
import 'package:hananote/core/privacy/app_blur_overlay.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_event.dart';
import 'package:hananote/features/settings/presentation/bloc/settings_state.dart';

/// Main application widget.
class HanaNote extends StatelessWidget {
  /// Constructor for [HanaNote].
  const HanaNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SettingsBloc>()..add(const LoadSettingsDashboard()),
      child: BlocProvider(
        create: (_) => getIt<AuthCubit>()..checkAuthStatus(),
        child: MaterialApp.router(
          routerConfig: appRouter,
          title: 'HanaNote',
          theme: AppTheme.getTheme(AppThemeType.sakura),
          builder: (context, child) {
            final settingsState = context.watch<SettingsBloc>().state;
            final blurEnabled = settingsState is! SettingsLoaded ||
                settingsState.settings.blurOverlayEnabled;

            return AppBlurOverlay(
              enabled: blurEnabled,
              child: child ?? const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
