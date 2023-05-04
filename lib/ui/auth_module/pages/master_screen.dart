import 'package:flutter/material.dart';
import 'package:swiftsell/ui/auth_module/pages/home_screen.dart';
import 'package:swiftsell/ui/auth_module/pages/onboarding_screen.dart';

class MasterScreen extends StatelessWidget {
  const MasterScreen({Key? key}) : super(key: key);

  bool get isLoggedIn => false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) return HomeScreen();
    return OnboardingScreen();
  }
}
