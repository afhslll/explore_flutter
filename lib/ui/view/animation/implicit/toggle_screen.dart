import 'package:explore_flutter/ui/widget/toggle.dart';
import 'package:flutter/material.dart';

class ToggleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Component'),
      ),
      body: Center(
        child: ToggleComponent(
          onToggled: (value) {
            print('onToggled $value');
          },
        ),
      ),
    );
  }
}
