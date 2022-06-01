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
    EdgeInsets? paddingLeading,
    Color? backgroundColor,
    required BuildContext context,
    Key? key,
  }) : super(
          backgroundColor: backgroundColor ?? AppColors.transparent,
          shadowColor: backgroundColor,
          automaticallyImplyLeading: false,
          leadingWidth: 32,
          elevation: 0,
          leading:  const SFBackButton(),
          // centerTitle: true,
          title: SFText(
            keyText: title ?? "",
            style: textStyle,
            stringCase: toUpperCase,
          ),
          key: key,
        );
}
