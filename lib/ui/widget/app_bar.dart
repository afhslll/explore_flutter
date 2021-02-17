import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/ui/shared/style/common_style.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:explore_flutter/ui/widget/no_internet_bar.dart';
import 'package:flutter/material.dart';

Widget getAppBar({
  Color backgroundColor,
  Function onPop,
  String title,
}) {
  return Container(
    color: backgroundColor ?? ThemeColor.white,
    child: SafeArea(
      bottom: false,
      child: Column(
        children: [
          NoInternetBar(),
          Container(
            height: 55,
            padding: EdgeInsets.symmetric(
                horizontal: ConstantMeasurements.screenPadding),
            decoration: BoxDecoration(
                color: backgroundColor ?? ThemeColor.white,
                boxShadow: [CommonStyle.boxShadow2]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onPop,
                  child: SizedBox(
                    width: 60,
                    height: double.infinity,
                    child: Visibility(
                      visible: onPop != null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.navigate_before,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
