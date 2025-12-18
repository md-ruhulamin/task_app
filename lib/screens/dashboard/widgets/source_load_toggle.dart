import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/widgets/toggle_button.dart';

class SourceLoadToggle extends StatelessWidget {
  final bool isSourceSelected;
  final Function(bool) onSourceToggle;

  const SourceLoadToggle({
    required this.isSourceSelected,
    required this.onSourceToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EFF5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleButton(
              label: 'Source',
              isSelected: isSourceSelected,
              onTap: () => onSourceToggle(true),
            ),
          ),
          Expanded(
            child: ToggleButton(
              label: 'Load',
              isSelected: !isSourceSelected,
              onTap: () => onSourceToggle(false),
            ),
          ),
        ],
      ),
    );
  }
}
