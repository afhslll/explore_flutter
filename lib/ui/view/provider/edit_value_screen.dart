import 'package:explore_flutter/core/argument/edit_value_screen_argument.dart';
import 'package:explore_flutter/core/viewmodel/edit_value_view_model.dart';
import 'package:flutter/material.dart';
import '../base_view.dart';
import 'edit_value_text.dart';

class EditValueScreen extends StatelessWidget {
  final EditValueScreenArgument arguments;

  const EditValueScreen({@required this.arguments, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EditValueViewModel>(
      onModelReady: (viewModel) {
        viewModel.addMinusVM = arguments.addMinusVM;
        viewModel.initCount();
      },
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Value'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () => viewModel.toMinus(),
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              EditValueText(),
              RaisedButton(
                onPressed: () => viewModel.toAdd(),
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
