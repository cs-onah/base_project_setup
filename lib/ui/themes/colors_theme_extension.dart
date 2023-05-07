import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color green;
  final Color red;
  final Color yellow;
  final Color blue;
  final Color lighterBlue;
  final Color textBlack;
  /// Use context.theme.cardColor instead
  final Color white;

  ColorThemeExt({required this.green, required this.red, required this.yellow, required this.blue, required this.lighterBlue, required this.white, required this.textBlack,});
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? green,
    Color? red,
    Color? yellow,
    Color? blue,
    Color? lighterBlue,
    Color? textBlack,
    Color? white,
  }) {
    return ColorThemeExt(
      green: green ?? this.green,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      lighterBlue: lighterBlue ?? this.lighterBlue,
      textBlack: textBlack ?? this.textBlack,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<ColorThemeExt> lerp(
    covariant ThemeExtension<ColorThemeExt>? other,
    double t,
  ) {
    return this;
  }
}
