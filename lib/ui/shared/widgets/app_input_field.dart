import 'package:flutter/material.dart';
import 'package:swiftsell/core/utils/context_extension.dart';

class AppInputField extends StatelessWidget {
  final String title;
  final Widget field;
  const AppInputField({Key? key, required this.title, required this.field}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textTheme.bodySmall),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
