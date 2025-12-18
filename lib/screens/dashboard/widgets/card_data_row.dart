import 'package:flutter/material.dart';

class CardDataRow extends StatelessWidget {
  final String label;
  final String value;

  const CardDataRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label    : ',
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color(0xff04063E),
          ),
        ),
      ],
    );
  }
}