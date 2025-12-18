import 'package:flutter/material.dart';
import 'package:task_app/screens/login/widgets/text_field.dart';

class UsernameField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return InputTextField(
      controller: controller,
      hintText: 'Username',
      isPassword: false,
    );
  }
}
