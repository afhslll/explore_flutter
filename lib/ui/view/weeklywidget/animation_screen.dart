import 'package:explore_flutter/core/constant/path_constant.dart';
import 'package:explore_flutter/ui/view/weeklywidget/widget/fading_car.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key key}) : super(key: key);

  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  Alignment _alignment = Alignment.centerLeft;
  double _carOpacity = 1.0;
  final Future<String> _futureData =
      Future<String>.delayed(const Duration(seconds: 2), () => 'Data loaded');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _animatedContainerExample(),
          _opacityExample(),
          FadingCar(),
        ],
      ),
    );
  }

  Widget _animatedContainerExample() {
    return Container(
      height: 50,
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  _alignment = Alignment.centerLeft;
                });
              },
              child: Container(width: 50, color: Colors.orange)),
          Expanded(
            child: AnimatedContainer(
                color: _alignment == Alignment.centerLeft
                    ? Colors.yellow
                    : Colors.green,
                alignment: _alignment,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Text('Expanded')),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  _alignment = Alignment.centerRight;
                });
              },
              child: Container(width: 50, color: Colors.orange)),
        ],
      ),
    );
  }

  Widget _opacityExample() {
    return Row(
      children: [
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            ConstantAssetsString.carIcon,
            height: 80,
          ),
        ),
        AnimatedOpacity(
          opacity: _carOpacity,
          duration: const Duration(seconds: 2),
          child: Image.asset(
            ConstantAssetsString.carIcon,
            height: 80,
          ),
        ),
        Slider(
          value: _carOpacity,
          min: 0,
          max: 1,
          divisions: 5,
          label: _carOpacity.round().toString(),
          onChanged: (double value) {
            setState(() {
              _carOpacity = value;
            });
          },
        ),
      ],
    );
  }
}
