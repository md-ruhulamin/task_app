
import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color activeColor;
  final Color inactiveColor;

  CircularProgressPainter({
    required this.progress,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 30;
    const strokeWidth = 20.0;

    final rect = Rect.fromCircle(center: center, radius: radius);


    final double startAngle = degToRad(-215);
    final double totalSweep = degToRad(250);
    final double progressSweep = totalSweep * progress;

    final inactivePaint = Paint()
      ..color = inactiveColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      totalSweep,
      false,
      inactivePaint,
    );


    final activePaint = Paint()
      ..color = activeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      progressSweep,
      false,
      activePaint,
    );


    final gapPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      rect,
      degToRad(-40),
      degToRad(80),
      false,
      gapPaint,
    );
  }

  double degToRad(double deg) => deg * math.pi / 180;

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
