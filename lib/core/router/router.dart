import 'package:flutter/material.dart';
import 'package:explore_flutter/ui/view/home/home_screen.dart';
import 'package:explore_flutter/ui/view/animation/implicit/animated_foo_example.dart';

class NavigationRouter {
  static const String homeRoute = 'homeRoute';
  static const String animatedFooRoute = 'animatedFooRoute';

  static MaterialPageRoute _pageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return _pageRoute(HomeScreen());
      case animatedFooRoute:
        return _pageRoute(AnimatedFooExample());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings?.name}'),
                )));
    }
  }
}
