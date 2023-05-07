import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swiftsell/core/constants/image_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/ui/auth_module/widgets/bar_indicator.dart';
import 'package:swiftsell/ui/shared/widgets/image_render_widget.dart';
import 'package:swiftsell/ui/themes/colors_theme_extension.dart';

class OnboardingScreen extends HookWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page = useValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.customTheme<ColorThemeExt>().red.withOpacity(.2),
            ),
            child: Center(
              child: Text(
                "?",
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.customTheme<ColorThemeExt>().red,
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView(
                onPageChanged: (value) => page.value = value,
                children: const [
                  OnboardingInfoView(
                    title: "Inventory \nmanagement system",
                    caption: "enables businesses to keep track of the products "
                        "they have in store and also the of "
                        "quantities of each item.",
                    imagePath: ImagePath.onboardingMobile,
                  ),
                  OnboardingInfoView(
                    title: "Point of sales\nmanagement system",
                    caption: "enables businesses to keep track of the products"
                        " they have in store and also the of"
                        " quantities of each item,",
                    imagePath: ImagePath.posOnboardingMobile,
                  ),
                  OnboardingInfoView(
                    title: "Employee\nManagement system",
                    caption: "Create and manage employee accounts with unique"
                        "credentials and Set roles and"
                        "permissions for employees.",
                    imagePath: ImagePath.employeeOnboardingMobile,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  ValueListenableBuilder(
                    valueListenable: page,
                    builder: (_, s, __) => BarIndicator(selectedIndex: s),
                  ),
                  Spacer(flex: 1),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Create Account")),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: Text("I Already have an account"),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingInfoView extends StatelessWidget {
  final String title, caption, imagePath;
  const OnboardingInfoView({
    Key? key,
    required this.title,
    required this.caption,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageRenderWidget.asset(imagePath: imagePath),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textTheme.displayLarge,
        ),
        const SizedBox(height: 8),
        Text(
          caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
