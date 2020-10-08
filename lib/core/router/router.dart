import 'package:explore_flutter/ui/view/animation/implicit/toggle_screen.dart';
import 'package:explore_flutter/ui/view/home/home_screen.dart';
import 'package:explore_flutter/ui/view/animation/implicit/animated_foo_example.dart';
import 'package:explore_flutter/ui/view/animation/implicit/tween_example.dart';
import 'package:flutter/material.dart';

class NavigationRouter {
  static const String homeRoute = 'homeRoute';
  static const String animatedFooRoute = 'animatedFooRoute';
  static const String toggleRoute = 'toggleRoute';
  static const String tweenAnimationRoute = 'tweenAnimationRoute';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _pageRoute(HomeScreen());
      case animatedFooRoute:
        return _pageRoute(AnimatedFooExample());
      case toggleRoute:
        return _pageRoute(ToggleScreen());
      case tweenAnimationRoute:
        return _pageRoute(TweenExample());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings?.name}'),
                )));
    }
  }
}
