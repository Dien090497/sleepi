import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

final ThemeData darkTheme = ThemeData.dark();
final ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme()
      .apply(bodyColor: AppColors.textColor, displayColor: AppColors.textColor),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.textColor,
  ),
);
