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
            titleTextStyle: TextStyle(
              fontSize: 20,
            )));
  }
}
