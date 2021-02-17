import 'package:explore_flutter/ui/shared/style/theme_color.dart';
import 'package:flutter/material.dart';

class NoInternetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        color: ThemeColor.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No internet connection',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
