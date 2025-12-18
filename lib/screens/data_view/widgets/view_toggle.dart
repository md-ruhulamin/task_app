import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  final String selectedView;
  final Function(String) onViewChanged;

  const ViewToggle({
    required this.selectedView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          _toggleButton("Data View", selectedView == "Data View"),
          _toggleButton("Revenue View", selectedView == "Revenue View"),
        ],
      ),
    );
  }

  Widget _toggleButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onViewChanged(text),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.blue,
            ),
            const SizedBox(width: 6),
            Text(text),
          ],
        ),
      ),
    );
  }
}