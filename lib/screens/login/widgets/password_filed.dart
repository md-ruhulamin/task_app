import 'package:flutter/material.dart';
import 'package:task_app/screens/login/widgets/text_field.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback onToggle;

  const PasswordField({
    required this.controller,
    required this.obscurePassword,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InputTextField(
      controller: controller,
      hintText: 'Password',
      isPassword: true,
      obscureText: obscurePassword,
      onTogglePassword: onToggle,
    );
  }
}