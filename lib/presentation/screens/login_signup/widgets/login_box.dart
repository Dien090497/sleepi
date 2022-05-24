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
        // gradient: LinearGradient(
        //   begin: const Alignment(0.0,0.0),
        //   end: const Alignment(0.282, 0.959),
        //   colors: [AppColors.white.withOpacity(0), AppColors.white.withOpacity(0)],
        //   stops: [0.0566]
        //
        // ),
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white.withOpacity(0.07),),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
      child: child,
    );
  }
}
