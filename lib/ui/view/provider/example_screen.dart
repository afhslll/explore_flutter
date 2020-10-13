import 'package:explore_flutter/core/argument/to_add_minus_screen_argument.dart';
import 'package:explore_flutter/core/router/router.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/core/viewmodel/add_minus_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../base_view.dart';

class ProviderExampleScreen extends StatelessWidget {
  ProviderExampleScreen({Key key}) : super(key: key);
  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    print('build ProviderExampleScreen');
    return BaseView<AddMinusViewModel>(
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Provider Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: Selector<AddMinusViewModel, int>(
                    selector: (context, viewModel) => viewModel.totalCount,
                    builder: (context, count, child) {
                      print('build ProviderExampleScreen totalText');
                      return Text(
                        viewModel.totalCount.toString(),
                        style: TextStyle(fontSize: 50),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Selector<AddMinusViewModel, int>(
                      selector: (context, viewModel) => viewModel.valueCount,
                      builder: (context, count, child) {
                        print('build ProviderExampleScreen valueCountText');
                        return Text(
                            'Operation number ${viewModel.valueCount.toString()}');
                      }),
                  RaisedButton(
                    onPressed: () {
                      viewModel.isToAdd = true;
                      _navigationService.navigateTo(
                          NavigationRouter.toAddMinusRoute,
                          arguments:
                              ToAddMinusScreenArgument(addMinusVM: viewModel));
                    },
                    child: Text('Edit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
