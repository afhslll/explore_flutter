import 'package:explore_flutter/core/constant/strings_constant.dart';
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
      appBar: AppBar(
        title: Text(ConstantStrings.appName),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () => _navigationService
                .navigateTo(NavigationRouter.animatedFooRoute),
            child: Text('Animation')),
      ),
    );
  }
}
