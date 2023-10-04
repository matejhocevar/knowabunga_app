import 'dart:math';

import 'package:flutter/material.dart';

class Semicircle extends StatelessWidget {
  const Semicircle({
    super.key,
    required this.color,
    required this.width,
  });

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: width / 2,
      child: CustomPaint(
        painter: _SemicirclePainter(fillColor: color),
        child: Container(
          width: double.infinity,
        ),
      ),
    );
  }
}

class _SemicirclePainter extends CustomPainter {
  _SemicirclePainter({
    this.fillColor = Colors.blue,
  });

  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()..color = fillColor;

    final double radius = size.width / 2;
    final double centerX = radius;
    const double centerY = 0;

    final Rect rect = Rect.fromCircle(
      center: Offset(centerX, centerY),
      radius: radius,
    );
    const double startAngle = 0;
    const double endAngle = pi;

    canvas.drawArc(rect, startAngle, endAngle, true, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
