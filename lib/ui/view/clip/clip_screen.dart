import 'package:flutter/material.dart';

class ClipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clip Screen'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: ClipOval(
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Container(
                    color: Colors.pinkAccent,
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/image/flutter-logo.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.pinkAccent,
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/image/flutter-logo.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
                child: ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                color: Colors.pinkAccent,
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/image/flutter-logo.png',
                ),
              ),
            ))
          ],
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.75, size.height);
    path.lineTo(size.width * 0.25, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
