import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Colors.brown,
      primary: Colors.brown,
      secondary: Colors.brown,
      surface: Colors.grey[900]!,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      error: Colors.brown,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    cardColor: Colors.grey[850],
    dividerColor: Colors.grey[700],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[850],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: Colors.deepOrange),
      unselectedLabelStyle: const TextStyle(color: Colors.white70),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,
      ),
    ),
  );

  static ThemeData getTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return darkTheme;
    } else {
      return lightTheme;
    }
  }
}
