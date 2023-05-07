import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swiftsell/core/constants/image_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/ui/shared/widgets/image_render_widget.dart';
import 'package:swiftsell/ui/themes/colors_theme_extension.dart';
import 'package:swiftsell/ui/transitions/slide_opacity_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(),
            Spacer(flex: 4),
            SlideOpacityTransition(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageRenderWidget.asset(imagePath: ImagePath.logoWhite),
                  const SizedBox(width: 10),
                  Text(
                    "Swiftsell",
                    style: context.textTheme.displayLarge?.copyWith(
                      color: context.customTheme<ColorThemeExt>().lighterBlue,
                    ),
                  )
                ],
              ),
            ),
            Spacer(flex: 2),
            SlideOpacityTransition(
              duration: Duration(milliseconds: 1500),
              child: AnimatedLinearProgressBar(
                onLoadComplete: () => context.pushAndRemoveUntilMasterPage(),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

class AnimatedLinearProgressBar extends HookWidget {
  final VoidCallback? onLoadComplete;
  const AnimatedLinearProgressBar({Key? key, this.onLoadComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    controller.addStatusListener((AnimationStatus status) async {
      if (status == AnimationStatus.completed) {
        onLoadComplete?.call();
      }
    });

    controller.animateTo(0.96);
    return SizedBox(
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
    );
  }
}
