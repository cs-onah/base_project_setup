import 'package:flutter/material.dart';
import 'package:swiftsell/ui/auth_module/pages/master_screen.dart';
import 'package:swiftsell/ui/auth_module/pages/signin_screen.dart';
import 'package:swiftsell/ui/auth_module/pages/splash_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String splashScreen = 'splashScreen';
  static const String masterScreen = 'masterScreen';
  static const String signInScreen = 'signInScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case masterScreen:
        return MaterialPageRoute(builder: (context) => const MasterScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (context) => SignInScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => errorView(settings.name),
        );
    }
  }

  static Widget errorView(String? name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
