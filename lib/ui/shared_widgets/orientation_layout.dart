import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget onPortrait;
  final Widget onLandscape;

  const OrientationLayout(
      {Key? key, required this.onPortrait, required this.onLandscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.portrait) {
        return onPortrait;
      }
      return onLandscape;
    });
  }
}
