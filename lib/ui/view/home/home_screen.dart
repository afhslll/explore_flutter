import 'package:explore_flutter/core/argument/webview_argument.dart';
import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/core/model/modal_bottom_sheet_item.dart';
import 'package:explore_flutter/core/router/router.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/core/viewmodel/home_view_model.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:explore_flutter/ui/view/base_view.dart';
import 'package:explore_flutter/ui/widget/action_popup.dart';
import 'package:explore_flutter/ui/widget/app_bar.dart';
import 'package:explore_flutter/ui/widget/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

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
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.animatedFooRoute),
                        child: Text('AnimatedFoo')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.tweenAnimationRoute),
                        child: Text('Tween Animation')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.toggleRoute),
                        child: Text('Toggle')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.providerExampleRoute),
                        child: Text('Provider Example')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.clipRoute),
                        child: Text('Clip')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.painterRoute),
                        child: Text('Painter')),
                    ElevatedButton(
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
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.loadingRoute),
                        child: Text('Shimmer')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.calendarRoute),
                        child: Text('Calendar')),
                    ElevatedButton(
                      onPressed: () => showCustomModalBottomSheet(
                          context: context,
                          headerText: 'Custom Modal Bottom Sheet',
                          onSelect: (index) {
                            print('$index selected');
                          },
                          showCloseButton: true,
                          items: List.generate(
                                  3,
                                  (index) => ModalBottomSheetItem(
                                      leadingIconData: Icons.speed,
                                      leadingIconColor: ThemeColor.grey,
                                      titleText: 'Item $index',
                                      isDisabled: false,
                                      checkmarkIconColor: ThemeColor.grey))
                              .toList()),
                      child: Text('Modal Bottom Sheet'),
                    ),
                    ElevatedButton(
                        onPressed: () => _navigationService.navigateTo(
                            NavigationRouter.webviewRoute,
                            arguments:
                                WebviewArgument(url: 'https://www.google.com')),
                        child: Text('Webview')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.liveLocationRoute),
                        child: Text('Live Location')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.listRoute),
                        child: Text('Mapping Data')),
                    ElevatedButton(
                        onPressed: () => _navigationService
                            .navigateTo(NavigationRouter.weeklyWidgetRoute),
                        child: Text('Weekly Widget')),
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
