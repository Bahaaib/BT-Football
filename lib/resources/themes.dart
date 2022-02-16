import 'package:flutter/material.dart';
import 'package:bt_football/resources/colors.dart';

class AppThemes {
  static final englishAppTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    iconTheme: iconTheme,
    scaffoldBackgroundColor: AppColors.white,
    primaryIconTheme: iconTheme,
    hintColor: Colors.transparent,
    errorColor: AppColors.errorColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      headline2: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      headline3: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor),
      subtitle2: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor),
      button: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColor),
      bodyText1: TextStyle(fontSize: 14.0, color: AppColors.textColor),
    ),
  );

  static const iconTheme = IconThemeData(color: AppColors.primaryColor);
}
