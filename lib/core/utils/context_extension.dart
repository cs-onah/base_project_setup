import 'package:flutter/material.dart';
import 'package:demo/core/constants/route_names.dart';
import 'package:demo/ui/shared/widgets/snackbar_feedback_widget.dart';

extension BuildContextExt on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;

  Color get primaryColor => themeData.primaryColor;

  Color get cardColor => themeData.cardColor;

  Color get errorColor => themeData.colorScheme.error;

  Color get secondaryColor => themeData.colorScheme.secondary;

  Color get scaffoldBackgroundColor => themeData.scaffoldBackgroundColor;

  double get height => MediaQuery.of(this).size.height;

  EdgeInsets get screenPadding => MediaQuery.of(this).padding;

  double get width => MediaQuery.of(this).size.width;

  void showErrorSnackBar(dynamic error) =>
      ScaffoldMessenger.of(this).showSnackBar(
        appSnackBar(
          this,
          message: "$error",
          feedbackType: SnackBarFeedbackType.error,
        ),
      );

  void showSuccessSnackBar(dynamic message) =>
      ScaffoldMessenger.of(this).showSnackBar(
        appSnackBar(
          this,
          message: "$message",
          feedbackType: SnackBarFeedbackType.error,
        ),
      );

  ///Navigation
  T customTheme<T>() => Theme.of(this).extension<T>()!;

  T arg<T>() => ModalRoute.of(this)!.settings.arguments as T;

  bool get canPop => Navigator.of(this).canPop();

  void popToFirstScreen() =>
      Navigator.of(this).popUntil((route) => route.isFirst);

  void pushAndRemoveUntilMasterPage() =>
      pushNamedAndRemoveUntil(RouteNames.masterScreen, (route) => false);

  void pop<T>([T? result]) => Navigator.pop(this, result);

  void openDrawer() => Scaffold.of(this).openDrawer();

  void maybePop<T>([T? result]) => Navigator.maybePop(this, result);

  Future<T?> push<T>(Widget widget, {bool fullscreenDialog = false}) =>
      Navigator.push<T>(
          this,
          MaterialPageRoute(
              builder: (context) => widget,
              fullscreenDialog: fullscreenDialog));

  void pushReplacement(Widget widget) => Navigator.pushReplacement(
      this, MaterialPageRoute(builder: (context) => widget));

  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.of(this).pushNamed(routeName, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

  void closeDrawer() => Scaffold.of(this).closeDrawer();
}
