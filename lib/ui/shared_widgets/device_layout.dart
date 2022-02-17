import 'package:flutter/material.dart';
import 'package:bt_football/resources/dimens.dart';

class DeviceLayout extends StatelessWidget {
  final Widget onTablet;
  final Widget onMobile;
  final double mobileMinThreshold;

  const DeviceLayout(
      {Key? key,
      required this.onTablet,
      required this.onMobile,
      this.mobileMinThreshold = AppDimens.mobileWidthThreshold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_isTablet()) {
      return onTablet;
    }
    return onMobile;
  }

  bool _isTablet() {
    final MediaQueryData data =
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide > mobileMinThreshold;
  }
}
