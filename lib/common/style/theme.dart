import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(bodyText2: TextStyles.lightWhite14).apply(
    bodyColor: AppColors.lightWhite,
    displayColor: AppColors.lightWhite,
  ),
  tabBarTheme: const TabBarTheme(labelColor: AppColors.lightWhite),
);
