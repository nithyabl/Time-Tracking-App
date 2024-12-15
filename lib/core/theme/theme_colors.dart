import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_app_new/presentation/screens/home/bloc/theme/theme_cubit.dart';

class ThemeColors {
  static Color textColor = Colors.black;
  static Color buttonColor = Colors.white;
  static Color backgroundColor = Colors.grey[850]!; // Default to dark mode
  static Color secondaryBackgroundColor = Colors.grey[800]!;
  static Color closeIconColor = Colors.white;
  static Color boardHeaderColor = Colors.white;
  static Color headerBackgroundColor = Colors.grey[900]!;
  static Color tertiaryBackgroundColor = Colors.black;
  static Color dialogBackground = Colors.grey[900]!;

  static void updateColors(BuildContext context) {
    final currentThemeMode = context.read<ThemeCubit>().getCurrentThemeMode();
    final isDarkMode = currentThemeMode == 'dark';

    textColor = isDarkMode ? Colors.white : Colors.black;
    buttonColor = isDarkMode ? Colors.grey[700]! : Colors.white;
    backgroundColor = isDarkMode ? Colors.grey[850]! : Colors.white;
    secondaryBackgroundColor = isDarkMode
        ? Colors.grey[800]!
        : const Color.fromARGB(255, 240, 240, 240);
    closeIconColor = isDarkMode ? Colors.white : Colors.black;
    boardHeaderColor = isDarkMode ? Colors.white : Colors.brown;
    headerBackgroundColor = isDarkMode
        ? Colors.grey[900]!
        : const Color.fromARGB(255, 226, 178, 160);
    tertiaryBackgroundColor = isDarkMode
        ? Colors.grey[900]!
        : const Color.fromARGB(255, 251, 240, 237);
    dialogBackground = isDarkMode
        ? Colors.grey[900]!
        : const Color.fromARGB(255, 255, 249, 247);
  }
}
