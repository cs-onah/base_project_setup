import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:demo/core/utils/validators.dart';

class PasswordField extends HookWidget with Validators {
  final ValueChanged<String>? onChanged;

  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? hintText;
  final VoidCallback? onEditingComplete;
  final bool autofocus;

  const PasswordField({
    Key? key,
    this.onChanged,
    this.controller,
    this.autofocus = false,
    this.hintText,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);
    void toggleShowPassword() => showPassword.value = !showPassword.value;
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      obscureText: !showPassword.value,
      onChanged: onChanged,
      validator: validator ?? validatePassword,
      autofillHints: const [AutofillHints.password],
      inputFormatters: [FilteringTextInputFormatter.deny(' ')],
      textInputAction: textInputAction,
      keyboardType: TextInputType.text,
      obscuringCharacter: '*',
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: IconButton(
          icon: showPassword.value
              ? const Icon(Icons.visibility_off_outlined, size: 20)
              : const Icon(Icons.visibility_outlined, size: 20),
          onPressed: toggleShowPassword,
        ),
      ),
    );
  }
}
