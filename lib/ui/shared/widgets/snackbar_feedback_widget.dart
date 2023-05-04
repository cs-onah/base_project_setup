import 'package:flutter/material.dart';
import 'package:swiftsell/core/constants/svg_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/ui/shared/widgets/svg_render_widget.dart';
import 'package:swiftsell/ui/themes/colors_theme_extension.dart';

enum SnackBarFeedbackType { success, error, info, warning }

SnackBar appSnackBar(
  BuildContext context, {
  required String message,
  String? title,
  required SnackBarFeedbackType feedbackType,
  bool autoDismiss = true,
}) {
  Color color = context.customTheme<ColorThemeExt>().blue;

  switch (feedbackType) {
    case SnackBarFeedbackType.warning:
      color = context.customTheme<ColorThemeExt>().yellow;
      break;
    case SnackBarFeedbackType.success:
      color = context.customTheme<ColorThemeExt>().green;
      break;
    case SnackBarFeedbackType.error:
      color = context.customTheme<ColorThemeExt>().red;
      break;
    default:
      color = context.customTheme<ColorThemeExt>().blue;
  }

  String svgPath = SvgPath.snackBarInfoIcon;
  switch (feedbackType) {
    case SnackBarFeedbackType.warning:
      svgPath = SvgPath.snackBarWarningIcon;
      break;
    case SnackBarFeedbackType.success:
      svgPath = SvgPath.snackBarSuccessIcon;
      break;
    case SnackBarFeedbackType.error:
      svgPath = SvgPath.snackBarErrorIcon;
      break;
    default:
      svgPath = SvgPath.snackBarInfoIcon;
  }

  return SnackBar(
    shape: RoundedRectangleBorder(side: BorderSide(color: color)),
    backgroundColor: color.withOpacity(.4),
    content: SnackBarFeedbackWidget(
      color: color,
      message: message,
      svgPath: svgPath,
      feedbackType: feedbackType,
      title: title,
      autoDismiss: autoDismiss,
    ),
  );
}

class SnackBarFeedbackWidget extends StatelessWidget {
  final String message;
  final String? title;
  final SnackBarFeedbackType feedbackType;
  final Color color;
  final String svgPath;
  final bool autoDismiss;
  const SnackBarFeedbackWidget({
    Key? key,
    required this.message,
    this.title,
    this.feedbackType = SnackBarFeedbackType.info,
    this.autoDismiss = true,
    required this.color,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgRenderWidget(svgPath: svgPath),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text("${title}", style: TextStyle(color: darken(color, .5)),),
              ),
            Text(message)
          ],
        ),
        if (!autoDismiss)
          IconButton(onPressed: context.pop, icon: Icon(Icons.close)),
      ],
    );
  }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
