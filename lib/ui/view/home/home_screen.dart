import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/core/viewmodel/home_view_model.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:explore_flutter/ui/view/base_view.dart';
import 'package:explore_flutter/ui/widget/action_popup.dart';
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
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.setupPage();
      },
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: ThemeColor.white,
        body: Column(
          children: [
            getAppBar(
              title: 'Explore Flutter',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(ConstantMeasurements.screenPadding),
                child: Column(
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
                    RaisedButton(
                        onPressed: () {
                          showActionDialog(
                            context: context,
                            titleText: 'An action is required!',
                            descriptionText:
                                'Malaysia\'s COVID cases has risen. Do you still want to go out?',
                            positiveText: 'No',
                            negativeText: 'Yes',
                            onTapPositive: () => _navigationService.pop(),
                            onTapNegative: () => _navigationService.pop(),
                          );
                        },
                        child: Text('Action Dialog')),
                    RaisedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.loadingRoute),
                        child: Text('Shimmer')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
