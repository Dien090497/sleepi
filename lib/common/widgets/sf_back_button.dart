import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFBackButton extends StatelessWidget {
  const SFBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greyBottomNavBar,
          border: Border.all(color: AppColors.black),
        ),
        padding: const EdgeInsets.all(2),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
