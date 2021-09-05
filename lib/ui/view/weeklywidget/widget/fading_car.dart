import 'package:explore_flutter/core/constant/path_constant.dart';
import 'package:flutter/material.dart';

class FadingCar extends StatefulWidget {
  const FadingCar({Key key}) : super(key: key);

  @override
  _FadingCarState createState() => _FadingCarState();
}

class _FadingCarState extends State<FadingCar> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FadeTransition(
          opacity: _animation,
          child: SizedBox(
            width: 200,
            child: Image.asset(
              ConstantAssetsString.carIcon,
              height: 80,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.repeat(reverse: true);
              }
            });
          },
          child: Text(_controller.isAnimating ? 'Stop' : 'Animate'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
