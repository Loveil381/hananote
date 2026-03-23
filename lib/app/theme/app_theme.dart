// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hananote/app/theme/app_colors.dart';

/// Enum for available app themes.
enum AppThemeType {
  sakura,
  lavender,
  sky,
  starryNight,
  cyberpunk,
}

/// Provides ThemeData for each theme type.
class AppTheme {
  static ThemeData getTheme(AppThemeType type) {
    switch (type) {
      case AppThemeType.sakura:
        return _buildTheme(
          primary: AppColors.sakuraPrimary,
          secondary: AppColors.sakuraSecondary,
          surface: AppColors.sakuraSurface,
          background: AppColors.sakuraBackground,
          brightness: Brightness.light,
        );
      case AppThemeType.lavender:
        return _buildTheme(
          primary: AppColors.lavenderPrimary,
          secondary: AppColors.lavenderSecondary,
          surface: AppColors.lavenderSurface,
          background: AppColors.lavenderBackground,
          brightness: Brightness.light,
        );
      case AppThemeType.sky:
        return _buildTheme(
          primary: AppColors.skyPrimary,
          secondary: AppColors.skySecondary,
          surface: AppColors.skySurface,
          background: AppColors.skyBackground,
          brightness: Brightness.light,
        );
      case AppThemeType.starryNight:
        return _buildTheme(
          primary: AppColors.starryPrimary,
          secondary: AppColors.starrySecondary,
          surface: AppColors.starrySurface,
          background: AppColors.starryBackground,
          brightness: Brightness.dark,
        );
      case AppThemeType.cyberpunk:
        return _buildTheme(
          primary: AppColors.cyberPrimary,
          secondary: AppColors.cyberSecondary,
          surface: AppColors.cyberSurface,
          background: AppColors.cyberBackground,
          brightness: Brightness.dark,
        );
    }
  }

  static ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    required Color surface,
    required Color background,
    required Brightness brightness,
  }) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: brightness == Brightness.light
          ? AppColors.textDark
          : AppColors.textLight,
      secondary: secondary,
      onSecondary: brightness == Brightness.light
          ? AppColors.textDark
          : AppColors.textLight,
      surface: surface,
      onSurface: brightness == Brightness.light
          ? AppColors.textDark
          : AppColors.textLight,
      error: AppColors.error,
      onError: AppColors.textLight,
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
    );
  }
}
