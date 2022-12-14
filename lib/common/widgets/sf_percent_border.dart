import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFPercentBorderGradient extends StatelessWidget {
  const SFPercentBorderGradient({
    Key? key,
    required this.valueActive,
    required this.totalValue,
    this.backgroundColor,
    this.titleActive,
    this.linearGradient,
    this.progressColor,
    this.lineHeight = 6.0,
    this.barRadius = 3,
    this.gradient = true,
  }) : super(key: key);

  final double valueActive;
  final Color? backgroundColor;
  final Color? progressColor;
  final String? titleActive;
  final double totalValue;
  final double lineHeight;
  final double barRadius;
  final LinearGradient? linearGradient;
  final bool gradient;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: totalValue != 0 ? valueActive / totalValue : 0,
      lineHeight: lineHeight,
      linearGradient:
          gradient ? linearGradient ?? AppColors.gradientBluePurple : null,
      barRadius: Radius.circular(barRadius),
      backgroundColor: backgroundColor ?? AppColors.darkColor1,
      progressColor: linearGradient != null ? null : progressColor,
    );
  }
}
