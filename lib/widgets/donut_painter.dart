import 'dart:math' as math;
import 'package:flutter/material.dart';

class DonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 20;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 25
      ..strokeCap = StrokeCap.round;

    paint.color = Colors.grey.shade100;
    canvas.drawCircle(center, radius, paint);

    paint.color = const Color(0xFFFF6B2C);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 0.9,
      false,
      paint,
    );

    paint.color = const Color(0xFFFFC107);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + math.pi * 0.9,
      math.pi * 0.7,
      false,
      paint,
    );

    paint.color = const Color(0xFF9C27B0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2 + math.pi * 1.6,
      math.pi * 0.4,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
