import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
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
          backgroundColor: backgroundColor ?? AppColors.transparent,
          shadowColor: backgroundColor,
          automaticallyImplyLeading: false,
          leadingWidth: 32,
          elevation: 0,
          leading: GestureDetector(
            onTap: onPressedBack ?? () => Navigator.maybePop(context),
            child: const SFBackButton(),
          ),
          // centerTitle: true,
          title: SFText(
            keyText: title ?? "",
            style: textStyle,
            toUpperCase: toUpperCase,
          ),
          key: key,
        );
}
