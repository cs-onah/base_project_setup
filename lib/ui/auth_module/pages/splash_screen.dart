import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swiftsell/core/constants/image_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/ui/shared/widgets/image_render_widget.dart';
import 'package:swiftsell/ui/themes/colors_theme_extension.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 5),
    );
    controller.addStatusListener((AnimationStatus status) async {
      if (status == AnimationStatus.completed) {
        context.pushAndRemoveUntilMasterPage();
      }
    });
    controller.animateTo(0.9);
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(),
            Spacer(flex: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageRenderWidget.asset(imagePath: ImagePath.logoWhite),
                const SizedBox(width: 10),
                Text(
                  "Swiftsell",
                  style: context.textTheme.displayLarge,
                )
              ],
            ),
            Spacer(flex: 2),
            SizedBox(
              width: 190,
              child: AnimatedBuilder(
                animation: controller,
                builder: (_, __) => LinearProgressIndicator(
                  minHeight: 3,
                  value: controller.value,
                  backgroundColor: context.customTheme<ColorThemeExt>().yellow,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
