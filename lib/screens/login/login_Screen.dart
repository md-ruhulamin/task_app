import 'package:flutter/material.dart';
import 'package:task_app/screens/login/widgets/header_info.dart';
import 'package:task_app/screens/login/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(flex: 2, child: HeaderInfo()),
            Expanded(
              flex: 3,
              child: LoginForm(
                usernameController: _usernameController,
                passwordController: _passwordController,
                obscurePassword: _obscurePassword,
                onPasswordToggle: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}