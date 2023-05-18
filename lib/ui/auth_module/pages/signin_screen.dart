import 'package:flutter/material.dart';
import 'package:demo/core/utils/context_extension.dart';
import 'package:demo/core/utils/validators.dart';
import 'package:demo/ui/auth_module/providers/textfield_controllers.dart';
import 'package:demo/ui/shared/widgets/app_input_field.dart';
import 'package:demo/ui/shared/widgets/custom_app_bar.dart';
import 'package:demo/ui/shared/widgets/password_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget with Validators {
  SignInScreen({Key? key}) : super(key: key);

  final signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(emailProvider);
    ref.watch(passwordProvider);

    final email = ref.read(emailProvider.notifier);
    final password = ref.read(passwordProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(showBackButton: true),
      body: Form(
        key: signInKey,
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            Center(
              child: Text(
                "Welcome back 👋",
                style: context.textTheme.headlineMedium,
              ),
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
                onChanged: (value) => email.state = value,
                decoration: InputDecoration(hintText: "Enter your mail"),
                validator: validateEmail,
              ),
            ),
            const SizedBox(height: 16),
            AppInputField(
              title: "Password",
              field: PasswordField(
                hintText: "Enter Password",
                onChanged: (value) => password.state = value,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: validateAction(() => ref.invalidate(passwordProvider)),
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }

  VoidCallback? validateAction(VoidCallback callback) {
    if (signInKey.currentState?.validate() ?? false) {
      return callback;
    }
    return null;
  }
}
