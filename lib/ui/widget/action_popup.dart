import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:flutter/material.dart';

void showActionDialog({
  BuildContext context,
  String titleText,
  String descriptionText,
  String positiveText,
  String negativeText,
  Function onTapPositive,
  Function onTapNegative,
}) {
  showDialog(
    useSafeArea: false,
    context: context,
    builder: (context) => Container(
      margin: MediaQuery.of(context).viewInsets,
      color: ThemeColor.black.withOpacity(0.5),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ConstantMeasurements.smallBorderRadius),
              ),
              color: ThemeColor.white,
            ),
            child: Material(
              color: ThemeColor.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titleText ?? '',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    descriptionText ?? '',
                    style: TextStyle(color: ThemeColor.grey),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: onTapNegative,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ConstantMeasurements.smallBorderRadius),
                                color: ThemeColor.red,
                              ),
                              child: Center(
                                child: Text(
                                  negativeText ?? 'Cancel',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: onTapPositive,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ConstantMeasurements.smallBorderRadius),
                                color: ThemeColor.black,
                              ),
                              child: Center(
                                child: Text(
                                  positiveText ?? 'Yes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
