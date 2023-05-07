import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiftsell/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await lockOrientation();
  runApp(const ProviderScope(child: SwiftSellApp()));
}

Future<void> lockOrientation() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // Size size = await DesktopWindow.getWindowSize();
  // await DesktopWindow.setWindowSize(Size(500,500));
  // await DesktopWindow.setMinWindowSize(Size(400,400));
}
