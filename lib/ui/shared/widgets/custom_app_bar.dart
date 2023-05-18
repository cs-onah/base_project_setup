import 'package:flutter/material.dart';
import 'package:demo/core/utils/context_extension.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final bool? showBackButton;
  final String? title;
  final List<Widget>? actions;
  const CustomAppBar({Key? key, this.showBackButton, this.title, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: context.themeData.appBarTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              if (showBackButton ?? false) TextButton.icon(
                style: TextButton.styleFrom(
                  iconColor: context.textTheme.bodyMedium?.color,
                ),
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back_ios, size: 14),
                label: Text("Back", style: context.textTheme.bodyMedium),
              ),
              if(title != null) TextButton.icon(
                style: TextButton.styleFrom(
                  iconColor: context.textTheme.titleMedium?.color,
                ),
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back_ios),
                label: Text("$title", style: context.textTheme.titleMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

