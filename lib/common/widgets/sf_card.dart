import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFCard extends StatelessWidget {
  const SFCard(
      {this.padding,
        this.margin,
        this.height,
        this.width,
        this.child,
        this.onTap,
        this.border,
        this.radius = 16,
        Key? key})
      : super(key: key);

  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double radius;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.0),
        margin: margin ?? const EdgeInsets.only(top: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: AppColors.white.withOpacity(0.05),
          border: border
        ),
        child: child,
      ),
    );
  }
}
