import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFAppBar extends AppBar {
  SFAppBar({
    String? title,
    TextStyle? textStyle,
    VoidCallback? onPressedBack,
    StringCase? stringCase,
    bool? centerTitle ,
    EdgeInsets? paddingLeading,
    Color? backgroundColor,
    required BuildContext context,
    Key? key,
  }) : super(
          backgroundColor: backgroundColor ?? AppColors.transparent,
          shadowColor: backgroundColor,
          centerTitle: centerTitle ?? false,
          automaticallyImplyLeading: false,
          leadingWidth: 48,
          elevation: 0,
          leading:  const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SFBackButton(),
          ),
          // centerTitle: true,
          title: SFText(
            keyText: title ?? "",
            style: textStyle,
            stringCase: stringCase,
          ),
          key: key,
        );
}
