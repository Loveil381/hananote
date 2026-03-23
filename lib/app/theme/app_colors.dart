// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

/// App color palette supporting multiple themes.
abstract class AppColors {
  // Sakura theme (default)
  static const sakuraPrimary = Color(0xFFFF8FAB);
  static const sakuraSecondary = Color(0xFFCDB4DB);
  static const sakuraSurface = Color(0xFFFFF5F7);
  static const sakuraBackground = Color(0xFFFFFAFB);

  // Lavender theme
  static const lavenderPrimary = Color(0xFFB8A9C9);
  static const lavenderSecondary = Color(0xFF9B8EC0);
  static const lavenderSurface = Color(0xFFF5F0FA);
  static const lavenderBackground = Color(0xFFFCFAFF);

  // Sky theme
  static const skyPrimary = Color(0xFF87CEEB);
  static const skySecondary = Color(0xFF6CB4D9);
  static const skySurface = Color(0xFFF0F8FF);
  static const skyBackground = Color(0xFFFAFDFF);

  // Starry Night theme (dark)
  static const starryPrimary = Color(0xFF7B68EE);
  static const starrySecondary = Color(0xFF9370DB);
  static const starrySurface = Color(0xFF1A1A2E);
  static const starryBackground = Color(0xFF0F0F1A);

  // Cyberpunk theme (dark)
  static const cyberPrimary = Color(0xFFFF2E97);
  static const cyberSecondary = Color(0xFF00F5FF);
  static const cyberSurface = Color(0xFF1A1A2E);
  static const cyberBackground = Color(0xFF0A0A14);

  // Shared
  static const textDark = Color(0xFF2D2D3A);
  static const textLight = Color(0xFFF0F0F5);
  static const success = Color(0xFF66BB6A);
  static const warning = Color(0xFFFFB74D);
  static const error = Color(0xFFEF5350);
}
