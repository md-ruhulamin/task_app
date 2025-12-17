import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF0099FF),
      secondary: const Color(0xFF0077CC),
      surface: Colors.white,
      error: const Color(0xFFD32F2F),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFF1A1A1A),
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'Roboto',
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF64B5F6),
      secondary: const Color(0xFF42A5F5),
      surface: const Color(0xFF1E1E1E),
      error: const Color(0xFFEF5350),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    fontFamily: 'Roboto',
  );
}