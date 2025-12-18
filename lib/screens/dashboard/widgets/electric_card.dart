import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/widgets/column_header.dart';
import 'package:task_app/screens/dashboard/widgets/circular_power_display.dart';
import 'package:task_app/screens/dashboard/widgets/data_card_section.dart';
import 'package:task_app/screens/dashboard/widgets/source_load_toggle.dart';
import 'package:task_app/core/utils/app_style.dart';

class ElectricityCard extends StatelessWidget {
  final bool isSourceSelected;
  final Function(bool) onSourceToggle;

  const ElectricityCard({
    required this.isSourceSelected,
    required this.onSourceToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ThreeColumnHeader(),
          Divider(height: 1, color: Colors.grey, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Electricity',
                  style: AppStyle.textStyle20.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                SizedBox(height: 8),
                Divider(height: 1, color: Colors.grey, thickness: 0.5),
                SizedBox(height: 12),
                CircularPowerDisplay(),
                SizedBox(height: 12),
                SourceLoadToggle(
                  isSourceSelected: isSourceSelected,
                  onSourceToggle: onSourceToggle,
                ),
                SizedBox(height: 8),
                Divider(height: 2, color: Colors.grey, thickness: 0.5),
                SizedBox(height: 8),
                DataCardsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
