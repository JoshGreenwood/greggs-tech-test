import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/theme/app_colours.dart';

class ThemeFactory {
  ThemeFactory._();

  static ThemeData build() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColours.primary),
      useMaterial3: true,
      primaryColor: AppColours.primary,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColours.primaryHighlight,
      ),
      appBarTheme: const AppBarTheme(
          color: AppColours.primary,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          iconTheme: IconThemeData(color: Colors.white)),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          side:
              WidgetStatePropertyAll(BorderSide(color: Colors.white, width: 2)),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: const WidgetStatePropertyAll(
              TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          backgroundColor: WidgetStateProperty.all(AppColours.secondary),
        ),
      ),
    );
  }
}
