import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFLogo extends StatelessWidget {
  const SFLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      alignment: Alignment.center,
      child: SFText(keyText: 'Sleefi logo'),
    );
  }
}
