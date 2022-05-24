import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFCard extends StatelessWidget {
  const SFCard({this.padding, this.margin, this.child, Key? key}) : super(key: key);

  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12.0),
        margin:  margin ?? const EdgeInsets.only(top: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.white.withOpacity(0.05),
        ),
      child: child,
    );
  }
}
