import 'dart:developer';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:demo/app.dart';
import 'package:demo/core/utils/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupViewport();
  await LocalStorageService.init();
  runApp(const ProviderScope(child: SwiftSellApp()));
}

Future<void> setupViewport() async {
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  /// Sets windows size for Desktop
  ///
  /// [Platform] static functions throws exceptions on web app
  /// [setWindowSize] throws exceptions on web app
  try{
    await DesktopWindow.setWindowSize(Size(1200,750));
    // await DesktopWindow.setMinWindowSize(Size(400,400));
  } catch(e){
    log("Failed to set windows size - $e");
  }

}
