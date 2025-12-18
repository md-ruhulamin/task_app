import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final String selectedOption;
  final Function(String) onOptionChanged;

  const DateSelector({
    required this.selectedOption,
    required this.onOptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _dateOption("Today Data", selectedOption == "Today Data"),
        const SizedBox(width: 20),
        _dateOption(
          "Custom Date Data",
          selectedOption == "Custom Date Data",
        ),
      ],
    );
  }

  Widget _dateOption(String text, bool isSelected) {
    return GestureDetector(
      onTap: () => onOptionChanged(text),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}