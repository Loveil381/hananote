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
      default:
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
      displayLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
      displayMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
      displaySmall: TextStyle(fontFamily: 'PlusJakartaSans'),
      headlineLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
      headlineMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
      headlineSmall: TextStyle(fontFamily: 'PlusJakartaSans'),
      titleLarge: TextStyle(fontFamily: 'PlusJakartaSans'),
      titleMedium: TextStyle(fontFamily: 'PlusJakartaSans'),
      titleSmall: TextStyle(fontFamily: 'PlusJakartaSans'),
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
      cardTheme: CardTheme(
        color: HanaColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
          ),
          // Gradient is applied via wrapped Ink in UI components,
          // setting transparent bg and no shadow here.
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
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
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
    );
  }
}
