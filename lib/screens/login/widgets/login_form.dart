import 'package:flutter/material.dart';
import 'package:task_app/screens/login/widgets/forgot_password.dart';
import 'package:task_app/screens/login/widgets/login_button.dart';
import 'package:task_app/screens/login/widgets/password_filed.dart';
import 'package:task_app/screens/login/widgets/registration_link.dart';
import 'package:task_app/screens/login/widgets/user_name.dart';
import 'package:task_app/core/utils/app_style.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final bool obscurePassword;
  final VoidCallback onPasswordToggle;

  const LoginForm({
    required this.usernameController,
    required this.passwordController,
    required this.obscurePassword,
    required this.onPasswordToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Login',
            style: AppStyle.textStyle22.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 12),
          UsernameField(controller: usernameController),
          const SizedBox(height: 12),
          PasswordField(
            controller: passwordController,
            obscurePassword: obscurePassword,
            onToggle: onPasswordToggle,
          ),
          const SizedBox(height: 10),
          ForgotPasswordButton(),
          const SizedBox(height: 16),
          LoginButton(),
          const SizedBox(height: 8),
          RegisterLink(),
        ],
      ),
    );
  }
}