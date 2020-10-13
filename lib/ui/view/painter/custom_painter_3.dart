import 'package:flutter/material.dart';

class MyCustomPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final Path path = Path();
    path.moveTo(150, 0);
    path.relativeLineTo(-100, 200);
    path.relativeQuadraticBezierTo(-50, 200, 100, 300);
    path.relativeConicTo(100, -100, 0, -200, 0.7);
    path.relativeCubicTo(100, -100, 0, -150, 100, -200);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter3 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter3 oldDelegate) => false;
}
