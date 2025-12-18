import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_colors.dart';
import 'package:task_app/core/utils/app_style.dart';

class RegisterLink extends StatelessWidget {
  const RegisterLink();

  @override
  Widget build(BuildContext context) {
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