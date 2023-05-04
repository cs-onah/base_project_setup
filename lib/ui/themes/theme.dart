library theme;

import 'package:flutter/material.dart';

part 'colors.dart';
part 'fonts.dart';
part 'text_styles.dart';

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
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: _Colors.scaffoldColor,
    cardColor: _Colors.white,
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      color: _Colors.darkBlue,
    ),
    snackBarTheme: SnackBarThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: AppTextStyles.body2Regular,
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: _Colors.blue,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: _Colors.darkBlue),
        ),
        elevation: 0,
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.blue),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13.5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.body2Regular.copyWith(color: _Colors.blue),
      ),
    ),
    textTheme: TextTheme()
  );
  return themeData;
}
