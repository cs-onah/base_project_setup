import 'package:flutter/material.dart';

class ColorThemeExt extends ThemeExtension<ColorThemeExt> {
  final Color green;
  final Color red;
  final Color yellow;
  final Color blue;

  ColorThemeExt({required this.green, required this.red, required this.yellow, required this.blue});
  @override
  ThemeExtension<ColorThemeExt> copyWith({
    Color? green,
    Color? red,
    Color? yellow,
    Color? blue,
  }) {
    return ColorThemeExt(
      green: green ?? this.green,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
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
