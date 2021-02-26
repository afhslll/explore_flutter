import 'package:flutter/material.dart';

class ModalBottomSheetItem {
  IconData leadingIconData;
  Color leadingIconColor;
  String titleText;
  Color textColor;
  Color checkmarkIconColor;
  bool isDisabled;
  ModalBottomSheetItem(
      {this.leadingIconData,
      this.leadingIconColor,
      this.titleText,
      this.textColor,
      this.checkmarkIconColor,
      this.isDisabled = false});
}
