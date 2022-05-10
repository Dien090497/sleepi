import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class LoginBox extends StatelessWidget {
  const LoginBox({required this.child, this.padding, Key? key})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyBottomNavBar,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.black),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      child: child,
    );
  }
}
