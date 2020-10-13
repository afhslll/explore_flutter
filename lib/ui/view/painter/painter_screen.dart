import 'package:flutter/material.dart';
import 'custom_painter_1.dart';
import 'custom_painter_2.dart';
import 'custom_painter_3.dart';

class PainterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Painter Example'),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: MyCustomPainter1(),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey[300],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: MyCustomPainter2(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                painter: MyCustomPainter3(),
              ),
            ),
          ],
        ));
  }
}
