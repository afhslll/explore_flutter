import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/core/service/locator/locator.dart';
import 'package:explore_flutter/core/service/navigator/navigation_service.dart';
import 'package:explore_flutter/ui/shared/theme_color.dart';
import 'package:explore_flutter/ui/widget/shimmer_skeleton.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => _navigationService.pop(),
          icon: Icon(Icons.navigate_before, color: ThemeColor.black),
        ),
        title:
            Text('Shimmer Example', style: TextStyle(color: ThemeColor.black)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: ConstantMeasurements.screenPadding,
            vertical: ConstantMeasurements.screenPadding / 2),
        children: List.generate(20, (index) => _buildItemRow()).toList(),
      ),
    );
  }

  Widget _buildItemRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ShimmerSkeleton(
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: ThemeColor.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(
                    ConstantMeasurements.smallBorderRadius),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShimmerSkeleton(
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        color: ThemeColor.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(
                            ConstantMeasurements.smallBorderRadius),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ShimmerSkeleton(
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        color: ThemeColor.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(
                            ConstantMeasurements.smallBorderRadius),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
