import 'package:flutter/material.dart';
import 'package:demo/ui/auth_module/pages/desktop/desktop_signin_screen.dart';
import 'package:demo/ui/auth_module/pages/home_screen.dart';
import 'package:demo/ui/auth_module/pages/onboarding_screen.dart';
import 'package:demo/ui/shared/responsive_screen.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({Key? key}) : super(key: key);

  bool get isLoggedIn => false;

  @override
  Widget build(BuildContext context) {
    if(isLoggedIn){
      return HomeScreen();
    }

    if(ResponsiveScreen.isDesktop(context)){
      return DesktopSignInScreen();
    } else {
      return OnboardingScreen();
    }
  }
}
