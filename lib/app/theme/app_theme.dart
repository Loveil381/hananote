// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hananote/app/theme/hana_colors.dart';

/// Enum for available app themes.
enum AppThemeType {
  sakura,
  lavender, // Stubbed for now
  sky, // Stubbed for now
  starryNight, // Stubbed for now
  cyberpunk, // Stubbed for now
}

/// Provides ThemeData for each theme type.
class AppTheme {
  static ThemeData getTheme(AppThemeType type) {
    // Currently only sakura is fully implemented per DESIGN.md v2
    switch (type) {
      case AppThemeType.sakura:
      case AppThemeType.lavender:
      case AppThemeType.sky:
      case AppThemeType.starryNight:
      case AppThemeType.cyberpunk:
        return _buildSakuraTheme();
    }
  }

  static ThemeData _buildSakuraTheme() {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: HanaColors.primary,
      onPrimary: HanaColors.onPrimary,
      primaryContainer: HanaColors.primaryContainer,
      onPrimaryContainer: HanaColors.onPrimaryContainer,
      secondary: HanaColors.secondary,
      onSecondary: HanaColors.onSecondary,
      secondaryContainer: HanaColors.secondaryContainer,
      onSecondaryContainer: HanaColors.onSecondaryContainer,
      tertiary: HanaColors.tertiary,
      onTertiary: HanaColors.onTertiary,
      tertiaryContainer: HanaColors.tertiaryContainer,
      onTertiaryContainer: HanaColors.onTertiaryContainer,
      error: HanaColors.error,
      onError: HanaColors.onError,
      errorContainer: HanaColors.errorContainer,
      onErrorContainer: HanaColors.onErrorContainer,
      surface: HanaColors.surface,
      onSurface: HanaColors.onSurface,
      surfaceContainerHighest: HanaColors.surfaceVariant,
      onSurfaceVariant: HanaColors.onSurfaceVariant,
      outline: HanaColors.outline,
      outlineVariant: HanaColors.outlineVariant,
      inverseSurface: HanaColors.inverseSurface,
      onInverseSurface: HanaColors.inverseOnSurface,
      inversePrimary: HanaColors.inversePrimary,
      surfaceTint: HanaColors.surfaceTint,
    );

    const textTheme = TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(fontFamily: 'BeVietnamPro'),
      bodyMedium: TextStyle(fontFamily: 'BeVietnamPro'),
      bodySmall: TextStyle(fontFamily: 'BeVietnamPro'),
      labelLarge: TextStyle(fontFamily: 'BeVietnamPro'),
      labelMedium: TextStyle(fontFamily: 'BeVietnamPro'),
      labelSmall: TextStyle(fontFamily: 'BeVietnamPro'),
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: HanaColors.background,
      textTheme: textTheme,
      cardTheme: const CardThemeData(
        color: HanaColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: HanaColors.primary,
          foregroundColor: HanaColors.onPrimary,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: HanaColors.primary,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
    );
  }
}
