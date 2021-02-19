import 'package:flutter/material.dart';

class ShimmerSkeleton extends StatefulWidget {
  final Widget child;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;

  const ShimmerSkeleton(
      {@required this.child,
      this.shimmerColor = const Color.fromRGBO(255, 255, 255, 0),
      this.gradientColor = const Color.fromRGBO(255, 255, 255, 0.3),
      this.curve = Curves.fastOutSlowIn,
      Key key})
      : super(key: key);

  @override
  _ShimmerSkeletonState createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<ShimmerSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned.fill(
            child: ClipRect(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FractionallySizedBox(
                widthFactor: .3,
                alignment: AlignmentGeometryTween(
                  begin: const Alignment(-1.0 - .3 * 3, .0),
                  end: const Alignment(1.0 + .3 * 3, .0),
                ).chain(CurveTween(curve: widget.curve)).evaluate(_controller),
                child: child,
              );
            },
            child: DecoratedBox(
                decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                widget.shimmerColor,
                widget.gradientColor,
                widget.shimmerColor,
              ]),
            )),
          ),
        ))
      ],
    );
  }
}
