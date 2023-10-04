import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    required this.color,
    this.diameter = 100,
  });

  final Color color;
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: diameter,
      width: diameter,
      child: CustomPaint(
        painter: _CirclePainter(fillColor: color),
        child: Container(width: double.infinity),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  _CirclePainter({
    this.fillColor = Colors.blue,
  });

  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()..color = fillColor;

    final double radius = size.width / 2;
    final double centerX = radius;
    final double centerY = radius;

    canvas.drawCircle(Offset(centerX, centerY), radius, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
