import 'package:flutter/material.dart';
import 'package:task_app/screens/empty_screen.dart';
import 'package:task_app/core/utils/app_style.dart';

class BottomCard extends StatelessWidget {
  final String icon;
  final String title;
  final BuildContext context;

  const BottomCard({
    required this.icon,
    required this.title,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmptyScreen()),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: [
            Image.asset(icon, height: 30, width: 30),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: AppStyle.textStyle14.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}