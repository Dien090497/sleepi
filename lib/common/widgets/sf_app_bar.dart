import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFAppBar extends AppBar {
  SFAppBar({
    String? title,
    TextStyle? textStyle,
    VoidCallback? onPressedBack,
    bool toUpperCase = false,
    Color? backgroundColor,
    required BuildContext context,
    Key? key,
  }) : super(
    backgroundColor: backgroundColor ?? AppColors.greyBottomNavBar,
    shadowColor: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(color: AppColors.black, width: 1),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_circle_left_outlined,
        color: AppColors.black,
        size: 40,
      ),
      onPressed: onPressedBack ?? () => Navigator.maybePop(context),
    ),
    centerTitle: true,
    title: SFText(
      keyText: title ?? "",
      style: textStyle,
      toUpperCase: toUpperCase,
    ),
    key: key,
  );
}

