import 'package:flutter/material.dart';
import 'package:bt_football/ui/team/base_team.dart';

class MobilePortraitTeam extends BaseTeam {
  const MobilePortraitTeam(
      {Key? key,
      required Widget squad,
      required Widget teamInfo,
      EdgeInsets? margin,
      EdgeInsets? padding})
      : super(
            key: key,
            squad: squad,
            teamInfo: teamInfo,
            margin: margin,
            padding: padding);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        children: [teamInfo, Flexible(child: squad)],
      ),
    );
  }
}
