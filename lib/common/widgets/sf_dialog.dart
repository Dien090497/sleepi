import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFDialog extends StatelessWidget {
  const SFDialog(
      {required this.children, Key? key, this.backgroundColor, this.padding})
      : super(key: key);

  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor ?? AppColors.greyBottomNavBar,
        ),
        padding: padding ?? const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
