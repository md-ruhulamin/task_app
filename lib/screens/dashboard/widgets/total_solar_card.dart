import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/widgets/card_data_row.dart';
import 'package:task_app/screens/dashboard/widgets/card_header.dart';

class TotalSolarCard extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  final String status;
  final Color statusColor;
  final String data1;
  final String data2;
  final Color backgroundColor;
  final Color indicatorColor;

  const TotalSolarCard({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.data1,
    required this.data2,
    required this.backgroundColor,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Image.asset(icon, height: 40, width: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardHeader(
                    title: title,
                    status: status,
                    statusColor: statusColor,
                    indicatorColor: indicatorColor,
                  ),
                  SizedBox(height: 5),
                  CardDataRow(label: 'Live Power', value: '$data1 kW'),
                  CardDataRow(label: 'Today Energy', value: '$data2 kWh'),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 24),
          ],
        ),
      ),
    );
  }
}