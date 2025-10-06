import 'package:flutter/material.dart';

class CorporateTheme {
  // Colors
  static const Color primaryBlue = Color(0xFF0A1F44);
  static const Color accentBlue = Color(0xFF1C5D99);
  static const Color background = Color(0xFFF5F7FA);
  static const Color mutedText = Color(0xFF6C757D);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue, primary: primaryBlue, secondary: accentBlue),
    primaryColor: primaryBlue,
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: false,
      titleTextStyle: TextStyle(fontFamily: 'Poppins', fontSize: 18, fontWeight: FontWeight.w600),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
      bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 14, color: Colors.black87),
      bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 13, color: mutedText),
    ),
    iconTheme: const IconThemeData(color: primaryBlue),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue, brightness: Brightness.dark),
  );
}
