import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_colors.dart';
import 'package:task_app/screens/dashboard.dart';
import '../utils/theme/text_theme/app_style.dart';

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
            Expanded(flex: 2, child: _headerInfo()),
            Expanded(flex: 3, child: _buildLoginForm()),
          ],
        ),
      ),
    );
  }

  Widget _headerInfo() {
    return SizedBox(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 98,
            width: 98,
          ),
          SizedBox(height: 10),
          Text(
            "SCUBE",
            style: AppStyle.textStyle22.copyWith(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
          ),
          Text(
            " Control & Monitoring System",
            style: AppStyle.textStyle22.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
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
            style: AppStyle.textStyle22.copyWith(fontWeight: FontWeight.bold,fontSize: 26),
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _usernameController,
            hintText: 'Username',
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _passwordController,
            hintText: 'Password',
            isPassword: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Forget password?',

                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF666666),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLoginButton(),
          const SizedBox(height: 8),
          _buildRegisterLink(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE0E0D0)),
      ),
      child: TextField(
        controller: controller,
        enabled: false,
        obscureText: isPassword && _obscurePassword,
        style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF999999)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF999999),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0099FF), Color(0xFF0077CC)],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have any account? ",
          style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Register Now',

            style: AppStyle.textStyle12.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
