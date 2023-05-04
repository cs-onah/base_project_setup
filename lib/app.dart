import 'package:flutter/material.dart';
import 'package:swiftsell/core/constants/route_names.dart';

class SwiftSellApp extends StatelessWidget {
  const SwiftSellApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: appTheme,
      title: 'SwiftSell',
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: RouteNames.generateRoute,
    );
  }
}
