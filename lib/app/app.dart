import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/router.dart';
import 'package:hananote/app/theme/app_theme.dart';
import 'package:hananote/core/privacy/app_blur_overlay.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';

/// Main application widget.
class HanaNote extends StatelessWidget {
  /// Constructor for [HanaNote].
  const HanaNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthCubit>()..checkAuthStatus(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'HanaNote',
        theme: AppTheme.getTheme(AppThemeType.sakura),
        builder: (context, child) => AppBlurOverlay(
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
