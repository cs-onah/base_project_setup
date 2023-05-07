import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swiftsell/core/constants/image_path.dart';
import 'package:swiftsell/core/utils/context_extension.dart';
import 'package:swiftsell/core/utils/validators.dart';
import 'package:swiftsell/ui/auth_module/providers/textfield_controllers.dart';
import 'package:swiftsell/ui/auth_module/widgets/desktop_onboarding_fragment.dart';
import 'package:swiftsell/ui/shared/widgets/app_input_field.dart';
import 'package:swiftsell/ui/shared/widgets/image_render_widget.dart';
import 'package:swiftsell/ui/shared/widgets/password_form_field.dart';

class DesktopSignInScreen extends StatelessWidget {
  const DesktopSignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(flex: 2, child: DesktopOnboardingFragment()),
          Flexible(flex: 3, child: _DesktopSignInFragment()),
        ],
      ),
    );
  }
}

class _DesktopSignInFragment extends ConsumerWidget with Validators {
   _DesktopSignInFragment({Key? key}) : super(key: key);

  final signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(emailProvider);
    ref.watch(passwordProvider);

    final email = ref.read(emailProvider.notifier);
    final password = ref.read(passwordProvider.notifier);
    return Container(
      padding: EdgeInsets.all(100),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 430, minWidth: 100),
          child: Form(
            key: signInKey,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageRenderWidget.asset(imagePath: ImagePath.logoBlue),
                    const SizedBox(width: 8),
                    Text("Swiftsell", style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 64),
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
