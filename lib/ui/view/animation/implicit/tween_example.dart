import 'dart:math' as math;
import 'package:flutter/material.dart';

class TweenExample extends StatefulWidget {
  @override
  _TweenExampleState createState() => _TweenExampleState();
}

class _TweenExampleState extends State<TweenExample> {
  double _sliderValue = 0;
  Color _newColor = Colors.white;
  final Tween<double> _rotationTween =
      Tween<double>(begin: 0, end: 2 * math.pi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TweenAnimationBuilder(
                tween: _rotationTween,
                duration: Duration(seconds: 5),
                builder: (_, double angle, Widget child) {
                  return Transform.rotate(angle: angle, child: child);
                },
                child: Container(height: 100, width: 100, color: Colors.yellow),
              ),
              TweenAnimationBuilder(
                  tween: ColorTween(begin: Colors.red, end: _newColor),
                  duration: Duration(seconds: 1),
                  builder: (_, Color color, Widget child) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        color,
                        BlendMode.modulate,
                      ),
                      child: child,
                    );
                  },
                  child:
                      Container(height: 200, width: 200, color: Colors.yellow)),
              Slider.adaptive(
                value: _sliderValue,
                onChanged: (double value) {
                  setState(() {
                    _sliderValue = value;
                    _newColor =
                        Color.lerp(Colors.white, Colors.red, _sliderValue);
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
