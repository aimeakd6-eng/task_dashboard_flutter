import 'package:flutter/material.dart';

class DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = 30.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Completed (Orange) - 50%
    paint.color = Colors.orange;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      -1.57,
      3.14,
      false,
      paint,
    );

    // In Progress (Yellow) - 30%
    paint.color = Colors.yellow.shade700;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      1.57,
      1.88,
      false,
      paint,
    );

    // Not Started (Purple) - 20%
    paint.color = Colors.purple;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      3.45,
      1.26,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
