import 'package:explore_flutter/core/constant/measurements_constant.dart';
import 'package:explore_flutter/ui/shared/style/theme_color.dart';
import 'package:flutter/material.dart';

class ToggleComponent extends StatefulWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final Function(bool) onToggled;

  const ToggleComponent({
    this.isActive = true,
    this.activeColor = ThemeColor.black,
    this.inactiveColor = ThemeColor.lightgrey,
    this.onToggled,
  });

  @override
  _ToggleComponentState createState() => _ToggleComponentState();
}

class _ToggleComponentState extends State<ToggleComponent> {
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onToggled != null) {
          widget.onToggled(!_isActive);
        }
        setState(() {
          _isActive = !_isActive;
        });
      },
      child: Container(
        height: ConstantMeasurements.toggleHeight,
        width: ConstantMeasurements.toggleWidth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: ConstantMeasurements.toggleWidth,
                height: ConstantMeasurements.toggleBarHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(
                      ConstantMeasurements.toggleBarHeight / 2)),
                  color: _isActive ? widget.activeColor : widget.inactiveColor,
                ),
              ),
            ),
            AnimatedAlign(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment:
                  _isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                  width: ConstantMeasurements.toggleHeight,
                  height: ConstantMeasurements.toggleHeight,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ThemeColor.shadow.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                    color: ThemeColor.white,
                  ),
                  child: Center(
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 400),
                      width: _isActive
                          ? (ConstantMeasurements.toggleCircleBorder * 2)
                          : ConstantMeasurements.toggleBarHeight,
                      height: ConstantMeasurements.toggleBarHeight,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isActive
                              ? widget.activeColor
                              : widget.inactiveColor,
                          width: ConstantMeasurements.toggleCircleBorder,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            ConstantMeasurements.toggleBarHeight / 2)),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
