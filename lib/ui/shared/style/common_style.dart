import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:flutter/material.dart';

class CommonStyle {
  CommonStyle._();

  static BoxShadow boxShadow = BoxShadow(
      color: ThemeColor.black.withOpacity(0.15),
      blurRadius: 10.0,
      offset: Offset(0.0, 5.0));

  static BoxShadow boxShadow2 = BoxShadow(
      color: ThemeColor.black.withOpacity(0.03),
      blurRadius: 10.0,
      offset: Offset(0.0, 2.0));
}
