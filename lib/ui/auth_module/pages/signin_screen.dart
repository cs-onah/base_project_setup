import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/core/utils/validators.dart';
import 'package:swiftsell/ui/shared/widgets/app_input_field.dart';
import 'package:swiftsell/ui/shared/widgets/custom_app_bar.dart';
import 'package:swiftsell/ui/shared/widgets/password_form_field.dart';

class SignInScreen extends HookWidget with Validators {
  SignInScreen({Key? key}) : super(key: key);

  final signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Form(
        key: signInKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Center(
              child: Text("Welcome back 👋",
                  style: context.textTheme.headlineMedium),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to swiftsell?"),
                TextButton(onPressed: () {}, child: Text("Create account")),
              ],
            ),
            const SizedBox(height: 62),
            AppInputField(
              title: "Email",
              field: TextFormField(
                decoration: InputDecoration(hintText: "Enter your mail"),
              ),
            ),
            const SizedBox(height: 16),
            AppInputField(
              title: "Password",
              field: PasswordField(hintText: "Enter Password"),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: validateAction(() {}),
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? validateAction(VoidCallback callback) {
    if (signInKey.currentState?.validate() ?? false) {
      callback.call();
    }
    return null;
  }
}
