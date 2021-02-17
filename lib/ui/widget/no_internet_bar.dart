import 'package:connectivity/connectivity.dart';
import 'package:explore_flutter/core/viewmodel/home_view_model.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternetBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.select<HomeViewModel, ConnectivityResult>(
              (HomeViewModel vm) => vm.connectivityStatus) ==
          ConnectivityResult.none,
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
