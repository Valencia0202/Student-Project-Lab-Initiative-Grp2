import 'package:flutter/material.dart';

class CorporateTheme {
  // Define your color scheme
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color accentBlue = Color(0xFF1976D2);
  static const Color secondaryGreen = Color(0xFF4CAF50);
  static const Color backgroundGray = Color(0xffF1F5FB);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF666666);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryBlue,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: accentBlue,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      cardTheme: const CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      textTheme: TextTheme( // Remove 'const' here
        titleLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          color: textLight,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          color: textLight,
        ),
      ),
    );
  }
  // ... rest of your code
}