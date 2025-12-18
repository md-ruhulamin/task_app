import 'package:flutter/material.dart';
import 'package:task_app/screens/data_view/widgets/circular_progress_indicator.dart';

class EnergyGauge extends StatelessWidget {
  final String value;
  final String unit;

  const EnergyGauge({
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: CircularProgress(
              progress: 0.65,
              activeColor: const Color(0xFF4DA3FF),
              inactiveColor: const Color(0xFFD6E9FF),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A2332),
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1A2332),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}