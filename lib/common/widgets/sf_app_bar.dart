import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFAppBar extends AppBar {
  SFAppBar({
    String? title,
    TextStyle? textStyle,
    bool disableLeading = false,
    StringCase? stringCase,
    bool? centerTitle,
    EdgeInsets? paddingLeading,
    Color? backgroundColor,
    VoidCallback? onBack,
    required BuildContext context,
    Key? key,
  }) : super(
          backgroundColor: backgroundColor ?? AppColors.transparent,
          shadowColor: backgroundColor,
          centerTitle: centerTitle ?? false,
          automaticallyImplyLeading: false,
          leadingWidth: 48,
          elevation: 0,
          leading: disableLeading
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SFBackButton(onBack: onBack ?? onBack ?? () => Navigator.pop(context),)
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
