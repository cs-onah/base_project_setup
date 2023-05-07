import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swiftsell/core/constants/image_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/ui/auth_module/widgets/bar_indicator.dart';
import 'package:swiftsell/ui/shared/widgets/image_render_widget.dart';
import 'package:swiftsell/ui/themes/colors_theme_extension.dart';

class DesktopOnboardingFragment extends HookWidget {
  const DesktopOnboardingFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final grey = context.customTheme<ColorThemeExt>().lighterBlue;
    final page = useValueNotifier(0);
    final pageController = PageController(initialPage: page.value);
    useEffect(() {
      final carouselEffect = Timer.periodic(Duration(seconds: 3), (timer) {
        if (pageController.page == 2) {
          pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        } else {
          pageController.nextPage(
            duration: Duration(milliseconds: 700),
            curve: Curves.linear,
          );
        }
      });
      return () => carouselEffect.cancel();
    });
    return Container(
      color: context.customTheme<ColorThemeExt>().blueBg,
      padding: EdgeInsets.all(80),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400, minWidth: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(),
              Expanded(
                flex: 10,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) => page.value = value,
                  children: [
                    _buildCarouselItem(
                      context,
                      title: "Inventory \nmanagement system",
                      caption: "enables businesses to keep track of the products "
                          "they have in store and also the of "
                          "quantities of each item.",
                      imagePath: ImagePath.onboardingDesktop,
                    ),
                    _buildCarouselItem(
                      context,
                      title: "Point of sales\nmanagement system",
                      caption: "enables businesses to keep track of the products"
                          " they have in store and also the of"
                          " quantities of each item,",
                      imagePath: ImagePath.onboardingDesktop,
                    ),
                    _buildCarouselItem(
                      context,
                      title: "Employee\nManagement system",
                      caption: "Create and manage employee accounts with unique"
                          "credentials and Set roles and"
                          "permissions for employees.",
                      imagePath: ImagePath.onboardingDesktop,
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (_, val, __)=> BarIndicator(
                    color: grey.withOpacity(.5),
                    selectedColor: grey,
                    selectedIndex: val,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, {
        required String title,
        required String caption,
        required String imagePath,
      }) {
    final grey = context.customTheme<ColorThemeExt>().lighterBlue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: ImageRenderWidget.asset(imagePath: ImagePath.onboardingDesktop)),
        const SizedBox(height: 32),
        Text(
          "Inventory\nmanagement system",
          style: context.textTheme.displayLarge?.copyWith(color: grey),
        ),
        const SizedBox(height: 8),
        Text(
          "enables businesses to keep track of the products "
              "they have in stock the quantities of each item, "
              "and the location of the items within the store or warehouse",
          style: context.textTheme.bodyMedium?.copyWith(color: grey),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}
