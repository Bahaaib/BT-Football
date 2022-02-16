import 'package:flutter/material.dart';

class BaseTeam extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget squad;
  final Widget teamInfo;

  const BaseTeam(
      {Key? key,
        required this.squad,
        required this.teamInfo,
        this.margin,
        this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container();
}
