import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:explore_flutter/ui/widget/toggle.dart';
import 'package:flutter/material.dart';

class ToggleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toggle Component'),
      ),
      backgroundColor: ThemeColor.white,
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: 3,
        separatorBuilder: (context, index) => Divider(
          height: 20,
        ),
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Item $index',
            ),
            ToggleComponent(
              onToggled: (value) {
                print('onToggled $value');
              },
            ),
          ],
        ),
      ),
    );
  }
}
