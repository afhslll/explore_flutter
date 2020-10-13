import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    // Method to convert degree to radians
    num degToRad(num deg) => deg * (math.pi / 180.0);

    final Path path = Path();
    path.moveTo(150, 150);
    path.arcTo(
        Rect.fromLTWH(0, 0, 100, 100), degToRad(90), degToRad(270), false);
    path.addRect(Rect.fromLTWH(size.width / 2, 0, 100, 100));
    path.addOval(Rect.fromLTWH(size.width / 2, 150, 100, 100));
    path.addArc(Rect.fromLTWH(0, 150, 100, 100), degToRad(0), degToRad(270));
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 300, 100, 100), Radius.circular(16)));
    final Path path2 = Path();
    path2.addPolygon([
      Offset(120, 150),
      Offset(size.width / 2, size.height),
      Offset(size.width, 500)
    ], true);
    path.addPath(path2, Offset.zero);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter2 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter2 oldDelegate) => false;
}
