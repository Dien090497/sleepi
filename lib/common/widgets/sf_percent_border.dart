import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFPercentBorder extends StatelessWidget {
  const SFPercentBorder({
    Key? key,
    required this.valueActive,
    required this.totalValue,
    this.backgroundColor,
    this.titleActive,
    this.linearGradient,
    this.progressColor,
  }) : super(key: key);

  final double valueActive;
  final Color? backgroundColor;
  final Color? progressColor;
  final String? titleActive;
  final double totalValue;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: valueActive / totalValue,
      lineHeight: 6.0,
      linearGradient: linearGradient ?? AppColors.gradientBluePurple,
      barRadius: const Radius.circular(3),
      backgroundColor: backgroundColor ?? AppColors.darkColor1,
      progressColor: linearGradient != null ? null : progressColor,
    );
  }
}
