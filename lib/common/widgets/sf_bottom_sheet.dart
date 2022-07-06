import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFModalBottomSheet {
  static void show(context, [double? height, Widget? child, EdgeInsets? padding]) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        context: context,
        barrierColor: AppColors.backgroundDialog,
        builder: (BuildContext bc) {
          return Container(
            height: size.height * (height ?? 1),
            padding: padding,
            decoration: const BoxDecoration(
              color: AppColors.lightDark,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
              ),
            ),
            child: child,
          );
        });
  }
}
