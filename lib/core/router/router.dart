import 'package:explore_flutter/ui/view/animation/implicit/toggle_screen.dart';
import 'package:explore_flutter/ui/view/calendar/calendar_screen.dart';
import 'package:explore_flutter/ui/view/clip/clip_screen.dart';
import 'package:explore_flutter/ui/view/home/home_screen.dart';
import 'package:explore_flutter/ui/view/animation/implicit/animated_foo_example.dart';
import 'package:explore_flutter/ui/view/animation/implicit/tween_example.dart';
import 'package:explore_flutter/ui/view/live_location/live_location_screen.dart';
import 'package:explore_flutter/ui/view/provider/example_screen.dart';
import 'package:explore_flutter/ui/view/provider/to_add_minus_screen.dart';
import 'package:explore_flutter/ui/view/provider/edit_value_screen.dart';
import 'package:explore_flutter/ui/view/painter/painter_screen.dart';
import 'package:explore_flutter/ui/view/shimmer/loading_screen.dart';
import 'package:explore_flutter/ui/widget/custom_webview.dart';
import 'package:flutter/material.dart';

class NavigationRouter {
  static const String homeRoute = 'homeRoute';
  static const String animatedFooRoute = 'animatedFooRoute';
  static const String toggleRoute = 'toggleRoute';
  static const String tweenAnimationRoute = 'tweenAnimationRoute';
  static const String providerExampleRoute = 'providerExampleRoute';
  static const String toAddMinusRoute = 'toAddMinusRoute';
  static const String editValueRoute = 'editValueRoute';
  static const String clipRoute = 'clipRoute';
  static const String painterRoute = 'painterRoute';
  static const String loadingRoute = 'loadingRoute';
  static const String calendarRoute = 'calendarRoute';
  static const String webviewRoute = 'webviewRoute';
  static const String pusherRoute = 'pusherRoute';
  static const String liveLocationRoute = 'liveLocationRoute';

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
      case providerExampleRoute:
        return _pageRoute(ProviderExampleScreen());
      case toAddMinusRoute:
        return _pageRoute(ToAddMinusScreen(
          arguments: settings.arguments,
        ));
      case editValueRoute:
        return _pageRoute(EditValueScreen(
          arguments: settings.arguments,
        ));
      case clipRoute:
        return _pageRoute(ClipScreen());
      case painterRoute:
        return _pageRoute(PainterScreen());
      case loadingRoute:
        return _pageRoute(LoadingScreen());
      case calendarRoute:
        return _pageRoute(CalendarScreen());
      case webviewRoute:
        return _pageRoute(CustomWebview(
          argument: settings.arguments,
        ));
      case liveLocationRoute:
        return _pageRoute(LiveLocationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: Text('No route defined for ${settings?.name}'),
                )));
    }
  }
}
