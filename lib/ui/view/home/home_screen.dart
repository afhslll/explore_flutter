import 'package:explore_flutter/ui/shared/style/theme_color.dart';
import 'package:explore_flutter/ui/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/core/router/router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      body: Column(
        children: [
          getAppBar(
            title: 'Explore Flutter',
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.animatedFooRoute),
                      child: Text('AnimatedFoo')),
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.tweenAnimationRoute),
                      child: Text('Tween Animation')),
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.toggleRoute),
                      child: Text('Toggle')),
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.providerExampleRoute),
                      child: Text('Provider Example')),
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.clipRoute),
                      child: Text('Clip')),
                  RaisedButton(
                      onPressed: () => _navigationService
                          .navigateTo(NavigationRouter.painterRoute),
                      child: Text('Painter')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
