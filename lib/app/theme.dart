import 'package:flutter/material.dart';

class AppColors {
  static const backgroundDark = Color(0xFF1F1A17);
  static const surfaceDark = Color(0xFF2B2420);
  static const accentWarm = Color(0xFFD89B55);
  static const textPrimary = Color(0xFFF5E9D7);
  static const textSecondary = Color(0xFFC8B8A6);
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentWarm,
      surface: AppColors.surfaceDark,
      onPrimary: AppColors.backgroundDark,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 56,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 16,
      ),
    ),
  );
}