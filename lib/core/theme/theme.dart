import 'package:flutter/material.dart';

import 'custom_colors.dart';

abstract class LightTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.light,
        ],
      );
}

abstract class DarkTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Inter",
        extensions: <ThemeExtension<dynamic>>[
          CustomColors.dark,
        ],
      );
}
