import 'package:flutter/material.dart';

class MyCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.yellow;

    final Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(0, 0, 0, size.height / 2);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height);
    path.conicTo(
        size.width, size.height / 2, size.width / 2, size.height / 2, 0.5);
    path.lineTo(size.width, size.height / 4);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter1 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyCustomPainter1 oldDelegate) => false;
}
