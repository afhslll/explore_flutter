import 'package:explore_flutter/core/argument/edit_value_screen_argument.dart';
import 'package:explore_flutter/core/argument/to_add_minus_screen_argument.dart';
import 'package:explore_flutter/core/router/router.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/core/viewmodel/add_minus_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToAddMinusScreen extends StatelessWidget {
  final ToAddMinusScreenArgument arguments;
  ToAddMinusScreen({@required this.arguments, Key key}) : super(key: key);

  final NavigationService _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    final addMinusVM = arguments.addMinusVM;
    print('build ToAddMinusScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text('To Add'),
      ),
      body: Center(
        child: ChangeNotifierProvider.value(
          value: addMinusVM,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<AddMinusViewModel, int>(
                  selector: (context, viewModel) => viewModel.totalCount,
                  builder: (context, count, child) {
                    print('build ToAddMinusScreen totalText');
                    return Text(
                      count.toString(),
                      style: TextStyle(fontSize: 30),
                    );
                  }),
              Selector<AddMinusViewModel, int>(
                  selector: (context, viewModel) => viewModel.valueCount,
                  builder: (context, count, child) {
                    print('build ToAddMinusScreen countText');
                    return Text(
                      count.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  }),
              RaisedButton(
                onPressed: () {
                  _navigationService.navigateTo(NavigationRouter.editValueRoute,
                      arguments:
                          EditValueScreenArgument(addMinusVM: addMinusVM));
                },
                child: Text('Update'),
              ),
              RaisedButton(
                onPressed: () {
                  addMinusVM.addTotalCount();
                },
                child: Text('Add'),
              ),
              RaisedButton(
                onPressed: () {
                  addMinusVM.minusTotalCount();
                },
                child: Text('Minus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
