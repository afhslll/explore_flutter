import 'package:explore_flutter/core/viewmodel/edit_value_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditValueText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _editValueVM = Provider.of<EditValueViewModel>(context, listen: true);
    return Text(
      // _editValueVM.count.toString(),
      context.watch<EditValueViewModel>().count.toString(),
      style: TextStyle(fontSize: 50),
    );
  }
}
