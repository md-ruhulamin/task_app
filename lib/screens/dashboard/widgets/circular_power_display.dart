import 'package:flutter/material.dart';
import 'package:task_app/screens/dashboard/widgets/circle_progress.dart';

import 'package:task_app/core/utils/app_style.dart';

class CircularPowerDisplay extends StatelessWidget {
  const CircularPowerDisplay();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: CustomPaint(
        painter: CircularProgressPainter(progress: 1.0, ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Power',
                style: AppStyle.textStyle14.copyWith(
                  color: Color(0xFF64748B),
                ),
              ),
              Text(
                '5.53 kw',
                style: AppStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}