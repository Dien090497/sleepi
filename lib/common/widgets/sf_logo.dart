import 'package:flutter/material.dart';

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
      child: Image.asset("assets/images/logo.png", width: 112.14, height: 50,),
    );
  }
}
