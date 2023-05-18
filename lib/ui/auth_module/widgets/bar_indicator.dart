import 'package:flutter/material.dart';
import 'package:demo/core/utils/context_extension.dart';
import 'package:demo/ui/themes/colors_theme_extension.dart';

class BarIndicator extends StatelessWidget {
  final int selectedIndex, length;
  final Color? selectedColor, color;
  const BarIndicator(
      {Key? key,
      this.selectedIndex = 0,
      this.length = 3,
      this.selectedColor,
      this.color})
      : super(key: key);

  double get barWidth => 70;
  double get spacing => 8;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (barWidth * length) + (spacing * (length - 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < length; i++) dot(context, selectedIndex == i)
        ],
      ),
    );
  }

  Widget dot(BuildContext context, [bool isSelected = false]) {
    if (isSelected) {
      return Container(
        width: barWidth,
        height: 6,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: selectedColor ?? context.primaryColor,
        ),
      );
    }
    return Container(
      width: barWidth,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color ?? context.customTheme<ColorThemeExt>().lighterBlue,
      ),
    );
  }
}
