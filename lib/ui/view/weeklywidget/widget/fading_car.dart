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
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        ConstantAssetsString.carIcon,
        height: 80,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
