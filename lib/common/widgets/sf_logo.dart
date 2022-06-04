import 'package:flutter/material.dart';
import 'package:slee_fi/resources/resources.dart';

class SFLogo extends StatelessWidget {
  const SFLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // height: 190.h,
      // margin: const EdgeInsets.symmetric(horizontal: 80),
      // decoration: const BoxDecoration(
      //   color: AppColors.greyBottomNavBar,
      // ),
      // alignment: Alignment.center,
      child: Image.asset(
        Imgs.logo,
        width: 112.14,
        height: 50,
      ),
    );
  }
}
