import 'package:explore_flutter/core/constant/strings_constant.dart';
import 'package:explore_flutter/core/router/router.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/ui/shared/theme_data.dart';
import 'package:explore_flutter/ui/view/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultThemeData,
      title: ConstantStrings.appName,
      onGenerateRoute: NavigationRouter.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      home: HomeScreen(),
    );
  }
}
