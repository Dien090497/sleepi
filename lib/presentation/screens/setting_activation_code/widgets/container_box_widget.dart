import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class ContainerBoxWidget extends StatelessWidget {
  const ContainerBoxWidget(
      {Key? key, required this.child, this.margin, this.padding, this.width, this.height, this.alignment})
      : super(key: key);

  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.centerLeft,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow:  [
            BoxShadow(
              color: AppColors.white.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(2, 4), // Shadow position
            ),
          ],
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
