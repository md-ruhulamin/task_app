import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final Color indicatorColor;

  const CardHeader({
    required this.title,
    required this.status,
    required this.statusColor,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: indicatorColor,
          ),
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '($status)',
          style: TextStyle(
            fontSize: 12,
            color: statusColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}