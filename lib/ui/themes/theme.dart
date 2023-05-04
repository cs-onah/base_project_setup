library theme;

import 'package:flutter/material.dart';

part 'colors.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = _Colors.blue;
  const Color secondaryColor = _Colors.lighterBlue;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    error: _Colors.red,
  );
  final themeData = ThemeData(
    colorScheme: colorScheme,
  );
  return themeData;
}
