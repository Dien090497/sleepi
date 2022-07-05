

import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String msg,
  MessageType type = MessageType.error,
}) {
  showTopSnackBar(
    context,
    padding: EdgeInsets.zero,
    animationDuration: const Duration(milliseconds: 600),
    displayDuration: const Duration(seconds: 5),
    TopWarningSnackBar(msg, messageType: type),
  );
}

class TopWarningSnackBar extends StatelessWidget {
  const TopWarningSnackBar(this.msg,
      {Key? key, this.styles, this.colors, required this.messageType})
      : super(key: key);

  final String msg;
  final TextStyle? styles;
  final Color? colors;
  final MessageType messageType;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: messageType == MessageType.error
              ? AppColors.red
              : AppColors.white,
        ),
        padding: const EdgeInsets.all(24),
        child: Text(
          msg,
          style: messageType == MessageType.error
              ? Theme.of(context).textTheme.bodyText2?.merge(TextStyles.white16)
              : Theme.of(context)
              .textTheme
              .bodyText2
              ?.merge(TextStyles.lightGrey16500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
