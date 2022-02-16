import 'package:flutter/material.dart';
import 'package:bt_football/resources/strings.dart';

class PlayerUtils {
  static String getPositionInitials(String position) {
    switch (position) {
      case CodeStrings.goalkeeperPosition:
        return AppStrings.gkInitials;
      case CodeStrings.defenderPosition:
        return AppStrings.defInitials;
      case CodeStrings.midfielderPosition:
        return AppStrings.mdfInitials;
      case CodeStrings.attackerPosition:
        return AppStrings.fwdInitials;
      default:
        return AppStrings.notApplicable;
    }
  }

  static Color getPositionColor(String position) {
    switch (position) {
      case CodeStrings.goalkeeperPosition:
        return Colors.green;
      case CodeStrings.defenderPosition:
        return Colors.brown;
      case CodeStrings.midfielderPosition:
        return Colors.blue;
      case CodeStrings.attackerPosition:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
