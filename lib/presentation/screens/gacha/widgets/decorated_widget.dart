import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class DecoratedWidget extends StatelessWidget {
  const DecoratedWidget(
      {Key? key, required this.child, this.padding, this.width, this.alignment})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.centerLeft,
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.greyBottomNavBar,
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
