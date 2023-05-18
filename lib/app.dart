import 'package:flutter/material.dart';
import 'package:demo/core/constants/route_names.dart';
import 'package:demo/ui/themes/theme.dart';

class SwiftSellApp extends StatelessWidget {
  const SwiftSellApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'SwiftSell',
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: RouteNames.generateRoute,
    );
  }
}
